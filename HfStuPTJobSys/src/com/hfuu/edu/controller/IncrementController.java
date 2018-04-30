package com.hfuu.edu.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hfuu.edu.entity.Ptjob;
import com.hfuu.edu.entity.User;
import com.hfuu.edu.service.PtJobService;
import com.hfuu.edu.service.TopJobRecordService;

@Controller
@RequestMapping("increment")
public class IncrementController {
	
	@Autowired
	private PtJobService ptJobService;
	@Autowired
	private TopJobRecordService topJobRecordService;
	
	@RequestMapping("increment")
	public String gotoIncrement(){
		return "increment";
	}
	
	@RequestMapping("getjobtime")
	@ResponseBody
	public Map<String, String> getJobStartAndEndDate(Integer ptjobid){
		Map<String, String> map = new HashMap<String, String>();
		
		Ptjob ptjob = ptJobService.getPtjobById(ptjobid);
		if(null != ptjob){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date startdate = ptjob.getStartdate();
			Date enddate = ptjob.getEnddate();
			map.put("startdate", sdf.format(startdate));
			map.put("enddate", sdf.format(enddate));
		}
		return map;
	}
	
	@RequestMapping("payforjobtop")
	@ResponseBody
	public Map<String, String> payForJobTop(String paymoney,Integer ptjobid,String starttime,String endtime,HttpServletRequest request){
		Map<String, String> map = new HashMap<String, String>();
		User user = (User) request.getSession().getAttribute("user");
		
		if((null != user) && (null != user.getBusiness())){
			/**
			 * 返回值1 2 3  1置顶成功  2余额不足   3您已经置顶了
			 */
			Map<String, String> payForTopJobmap = topJobRecordService.payForTopJob(paymoney, ptjobid, starttime, endtime, user.getBusiness().getId());
			return payForTopJobmap;
		}
		return map;
	}
	
	

}
