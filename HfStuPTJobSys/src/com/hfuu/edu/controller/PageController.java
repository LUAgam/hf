package com.hfuu.edu.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hfuu.edu.db.dao.PtJobDao;
import com.hfuu.edu.entity.Business;
import com.hfuu.edu.entity.Ptuser;
import com.hfuu.edu.entity.User;
import com.hfuu.edu.service.BusinessService;
import com.hfuu.edu.service.PtuserService;
import com.hfuu.edu.service.TopJobRecordService;

@Controller
@RequestMapping("/page")
public class PageController {
	
	@Autowired
	private PtuserService ptuserService;
	
	@Autowired
	private BusinessService businessService;
	
	@Autowired
	private TopJobRecordService topJobRecordService;
//	@Autowired
//	private PtJobDao ptJobDao;
//	
//	@RequestMapping("/test")
//	public void test() {
//		ptJobDao.modifyPtjobState();
//	}
	@RequestMapping("/managerlogin")
	public String ManagerLogin() {
		return "managerlogin";
	}
	
	
	@RequestMapping("/manager")
	public String Manager() {
		return "index";
	}
	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	@RequestMapping("/complain")
	public String complain() {
		return "complain";
	}
	
	@RequestMapping("/testzidong1")
	public String gototopjob() {
		topJobRecordService.ModifyTopJobMsg();
		return "aaaa";
	}
	
	@RequestMapping("/baidumap")
	public String baidumap() {
		return "baidumap";
	}
	@RequestMapping("/mymessage")
	public String myMessage() {
		return "mymessage";
	}
	@RequestMapping("/messagelayer")
	public String myMessageLayer() {
		return "messagelayer";
	}
	
	@RequestMapping("/webpage")
	public String gotoWebpage() {
		return "webpage";
	}
	@RequestMapping("/register")
	public String gotoRegister(){
		return "register";
	}
	@RequestMapping("/login")
	public String gotoLogin(){
		
		return "login";
	}
	@RequestMapping("/mycollect")
	public String gotoMycollect(){
		
		return "mycollect";
	}
	@RequestMapping("/myrelease")
	public String gotoMyrelease(){
		
		return "myrelease";
	}
	
	@RequestMapping("/ueditor")
	public String ueditor(){
		
		return "ueditor";
	}
	
	@RequestMapping("/checklist")
	public ModelAndView gotoChecklist(Integer pyjobid){
		ModelAndView mav = new ModelAndView();
		System.out.println("pagecontroller--checklist---------------------传过来的ptjobid,"+pyjobid);
		
		mav.addObject("pyjobid", pyjobid);
		mav.setViewName("checklist");
		return mav;
	}
	
	@RequestMapping("/jobrelease")
	public ModelAndView gotoJobrelease(HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		
		User u = (User) request.getSession().getAttribute("user");
		if((null != u) && (null != u.getBusiness())){
			
			mav.addObject("business", businessService.getBusinessById(u.getBusiness().getId()));
			mav.setViewName("jobrelease");
			
		}else{
			mav.setViewName("login");
		}
		
		return mav;
		
	}
	@RequestMapping("/myapply")
	public String gotoMyapply(){
		
		return "myapply";
	}
	@RequestMapping("/editorptuser")
	public ModelAndView gotoEditorptuser(HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		
		User u = (User) request.getSession().getAttribute("user");
		if((null != u) && (null != u.getPtuser())){
			Ptuser ptuser = ptuserService.getPtuserByid(u.getId());
			mav.addObject("ptuser",ptuser );
			
		}
		
		mav.setViewName("editorptuser");
		
		
		
		return mav;
	}
	
	@RequestMapping("/editorbusiness")
	public ModelAndView gotoEditorbusiness(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		
		User u = (User) request.getSession().getAttribute("user");
		if((null != u) && (null != u.getBusiness())){
			Business business = businessService.getBusinessById(u.getBusiness().getId());
			
			mav.addObject("business",business);
			
		}
		
		mav.setViewName("editorbusiness");
		return mav;
	}
	

}
