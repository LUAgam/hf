package com.hfuu.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hfuu.edu.common.MyApplyPhone;
import com.hfuu.edu.db.dao.ApplyDao;
import com.hfuu.edu.entity.JobApply;
import com.hfuu.edu.entity.User;
import com.hfuu.edu.service.ApplyService;

@Controller
@RequestMapping("/myapply")
public class ApplyController {
	
	@Autowired
	private ApplyService applyService;
	
	
	@RequestMapping("/selectalljob")
	public ModelAndView selectAllJobApplyByPtjobId(HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		User u = (User) request.getSession().getAttribute("user");
		
		if((null != u) && (null != u.getPtuser())){
			List<JobApply> jobapplys = applyService.selectAllApplyById(u.getPtuser().getId());
			System.out.println(jobapplys.size());
			
			mav.addObject("jobapplys", jobapplys);
		}
		
		mav.setViewName("myapply");
		
		return mav;
	}
	@RequestMapping("/selectalljobPhone")
	@ResponseBody
	public Map<String, Object> selectAllJobApplyPhoneByPtjobId(HttpServletRequest request,HttpServletResponse response){
		response.addHeader("Access-Control-Allow-Origin", "*");
		Map<String, Object> map = new HashMap<String, Object>();
		User u = (User) request.getSession().getAttribute("user");
		if((null != u) && (null != u.getPtuser())){
			List<MyApplyPhone> myapplyphone = applyService.selectAllJobApplyPhoneByPtjobId(u.getPtuser().getId());
			map.put("list", myapplyphone);
			map.put("msg", "1");
		}else{
			map.put("msg", "2");
		}
		return map;
	}
	
	
	
	
	
	
	
	
	@RequestMapping("/selectonejob")
	@ResponseBody
	public Map<String, String> selectOneJobApplyByState(Integer ptjobid,HttpServletRequest request){
		Map<String, String> map = new HashMap<String, String>();
		User u = (User) request.getSession().getAttribute("user");
		if((null != u) && (null != u.getPtuser())){
			System.out.println(u.getPtuser().getName());
			boolean flag = applyService.selectOneJobApplyByState(ptjobid, u.getPtuser().getId());
			if(flag){
				map.put("msg", "1");//1已报名
				return map;
			}else{
				map.put("msg", "0");//0未报名
				return map;
			}
		}
		
		map.put("msg", "2");//2为报名失败  失败代表还未登录后跳转到登录界面
		return map;
	}
	
	
	
	@RequestMapping("/applyjob")
	@ResponseBody
	public Map<String, String> addApplyJob(Integer ptjobid,HttpServletRequest request){

		Map<String, String> map = new HashMap<String, String>();
		
		User u = (User) request.getSession().getAttribute("user");
		if((null != u) && (null != u.getPtuser())){
			System.out.println(u.getPtuser().getName());
			applyService.addOneMyApply(ptjobid, u.getPtuser().getId());
			map.put("msg", "1");//1为报名成功
			return map;
		}
		
		map.put("msg", "2");//2为报名失败  失败代表还未登录后跳转到登录界面
		return map;
		
		
	}
	
	
	@RequestMapping("/cancelapplyjob")
	@ResponseBody
	public Map<String, String> cancelMyApply(Integer myapplyid){

		Map<String, String> map = new HashMap<String, String>();
		
		applyService.cancelMyApply(myapplyid);
		
		map.put("msg", "1");//1为成功
		return map;
		
		
	}
	

}
