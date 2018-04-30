package com.hfuu.edu.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hfuu.edu.entity.User;
import com.hfuu.edu.service.JobVerifyService;


@Controller
@RequestMapping("/jobverify")
public class JobVerifyController {

	@Autowired
	private JobVerifyService jobVerifyService;
	
	@RequestMapping("/myrelease")
	public ModelAndView returnMyrelease(HttpServletRequest request){
		
	 	User u = (User) request.getSession().getAttribute("user");
		
	 	
		ModelAndView mav = new ModelAndView();
		
		if((null != u) && (null != u.getBusiness())){
			mav.addObject("state0", jobVerifyService.getJobStatenum(u.getBusiness().getId(), "0"));
			mav.addObject("state1", jobVerifyService.getJobStatenum(u.getBusiness().getId(), "1"));
			mav.addObject("state2", jobVerifyService.getJobStatenum(u.getBusiness().getId(), "2"));
		}
		mav.setViewName("myrelease");
		return mav;
	}
	
	
}
