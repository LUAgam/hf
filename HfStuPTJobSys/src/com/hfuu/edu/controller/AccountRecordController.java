package com.hfuu.edu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hfuu.edu.common.PageBean;
import com.hfuu.edu.common.QueryInfo;
import com.hfuu.edu.entity.Business;
import com.hfuu.edu.entity.User;
import com.hfuu.edu.service.AccountRecordService;
import com.hfuu.edu.service.BusinessService;

@Controller
@RequestMapping("/accountrecord")
public class AccountRecordController {
	
	@Autowired
	private AccountRecordService accountRecordService;
	@Autowired
	private BusinessService businessService;
	
	@RequestMapping("/recharge")
	public ModelAndView Recharge(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		User user = (User) request.getSession().getAttribute("user");
		if((null != user) && (null != user.getBusiness())){
			Business business = businessService.getBusinessById(user.getBusiness().getId());
			mav.addObject("balance", business.getBalance());
		}
		mav.setViewName("recharge");
		return mav;
	}
	
	@RequestMapping("/getbalance")
	@ResponseBody
	public Map<String, Object> getBusinessBalance(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User) request.getSession().getAttribute("user");
		if((null != user) && (null != user.getBusiness())){
			Business business = businessService.getBusinessById(user.getBusiness().getId());
			map.put("balance", business.getBalance());
		}
		return map;
	}
	
	@RequestMapping("/getrecordlist")
	@ResponseBody
	public PageBean getRecordList(QueryInfo info,HttpServletRequest request){
		PageBean pagebean = new PageBean();
		User user = (User) request.getSession().getAttribute("user");
		if((null != user) && (null != user.getBusiness())){
			pagebean = accountRecordService.getAccountRecordByBusinessId(user.getBusiness().getId(), info);
		}
		return pagebean;
	}

}
