package com.hfuu.edu.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hfuu.edu.entity.Business;
import com.hfuu.edu.entity.ManagerUser;
import com.hfuu.edu.entity.Ptuser;
import com.hfuu.edu.entity.User;
import com.hfuu.edu.service.BusinessService;
import com.hfuu.edu.service.PtuserService;
import com.hfuu.edu.service.UserService;
import com.hfuu.edu.utils.FileUploadUtil;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private BusinessService businessService;
	@Autowired
	private PtuserService ptuserService;
	
	@RequestMapping("/register")
	public String gogo(){
		return "register";
	}
	@RequestMapping("/loginpage")
	public String gogo1(){
		
		return "login";
	}
	@RequestMapping("/gogo2")
	public String gogo2(){
		
		return "success";
	}
	
	
	@RequestMapping("/getusername")
	@ResponseBody
	private Map<String, String> addUser(String username,String state) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		User user = new User();
		if(userService.getLoginUser(username, state).size() > 0){
			map.put("msg", "1");
			return map;
		}
		map.put("msg", "2");
		return map;
		
	}
	
	@RequestMapping("/addptuser")
	@ResponseBody
	private Map<String, String> addptUser(String username,String password,String state){
		User u = new User();
		u.setUsername(username);
		u.setPassword(password);
		u.setState(state);
		userService.addUser(u);
		Ptuser ptuser = new Ptuser();
		ptuser.setImgurl("moren.png");
		ptuser.setUser(u);
		ptuserService.addPtuser(ptuser);
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "注册成功");
		return map;
	}
	
	@RequestMapping("/addBussiness")
	@ResponseBody
	private Map<String, String> addBusiness(String username,String password,String state,String name,
			String city,String email,MultipartHttpServletRequest muRequest,HttpServletRequest request) {
		
		System.out.println(city);
		
		User u = new User();
		u.setUsername(username);
		u.setPassword(password);
		u.setState(state);
		userService.addUser(u);
		Business b = new Business();
		b.setCity(city);
		b.setName(name);
		b.setEmail(email);
		b.setUser(u);
		String headImagePath = FileUploadUtil.getCurrentPath(request) + "/upload/";
		String originalFilename = FileUploadUtil.getOriginalFilename(muRequest);
		String newfilename = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
/*
		File file = new File(headImagePath + newfilename);

		try {
			imgurl_pic.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		FileUploadUtil.upload(headImagePath, newfilename, muRequest);
		b.setLicense(newfilename);
		businessService.addBusiness(b);
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "注册成功");
		return map;
	}
	
	
	@RequestMapping("/login")
	@ResponseBody
	private  Map<String, String> loginVapt(String username,String password,String state,HttpServletRequest request,HttpServletResponse response) {
		System.out.println(username+"---"+password+"--"+state);
		Map<String, String> map = new HashMap<String, String>();
		response.addHeader("Access-Control-Allow-Origin", "*");
		User user = new User();
		if(userService.getLoginUser(username, state).size() > 0){
			List<User> users = userService.getLoginUser(username, state);
			for(User u : users){
				user = u;
			}
			if((null != user) & (user.getPassword().equals(password))){
				
				request.getSession().setAttribute("user", user);
				map.put("msg", "1");
				
				return map;
			}
		}
			map.put("msg", "2");
			return map;
	}
	
	@RequestMapping("/quit")
	public String UserQuitLogin(HttpServletRequest request) {
		
		User user = (User) request.getSession().getAttribute("user");
		if(null != user){
			request.getSession().removeAttribute("user");
		}
		
		return "redirect:/page/webpage";
	}
	
	@RequestMapping("/quitphone")
	@ResponseBody
	public Map<String, String> UserQuitLoginPhone(HttpServletRequest request,HttpServletResponse response) {
		response.addHeader("Access-Control-Allow-Origin", "*");
		Map<String, String> map = new HashMap<String, String>();
		User user = (User) request.getSession().getAttribute("user");
		if(null != user){
			request.getSession().removeAttribute("user");
		}
		map.put("msg", "1");
		return map;
	}
	
	@RequestMapping("/modifypassword")
	@ResponseBody
	public Map<String, String> ModifyPassword(HttpServletRequest request,String oldpassword,String newpassword) {
		
		Map<String, String> map = new HashMap<String, String>();
		User user = (User) request.getSession().getAttribute("user");
		if(null != user){
			if((user.getPassword().equals(oldpassword))){
				userService.modifyUserPasswordById(user.getId(), newpassword);
				user.setPassword(newpassword);
				request.getSession().setAttribute("user", user);
				map.put("msg", "1");
				return map;
			}else{
				map.put("msg", "2");
				return map;
			}
		}
		map.put("msg", "3");
		return map;
	}
	
	@RequestMapping("/managerlogin")
	@ResponseBody
	public Map<String, String> ManagerLogin(String username,String password,HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();
		ManagerUser mangeruser = userService.loginForManger(username);
		if(password.equals(mangeruser.getPassword())){
			session.setAttribute("manageruser", mangeruser);
			map.put("msg", "1");
		}else{
			map.put("msg", "2");
		}
		return map;
	}
	
	@RequestMapping("/managerquit")
	public String ManagerQuit(HttpSession session) {
			session.removeAttribute("manageruser");
		return "managerlogin";
	}
	

}
