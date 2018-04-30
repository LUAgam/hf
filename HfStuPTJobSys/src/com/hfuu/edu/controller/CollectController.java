package com.hfuu.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hfuu.edu.common.MyCollect;
import com.hfuu.edu.entity.JobCollection;
import com.hfuu.edu.entity.User;
import com.hfuu.edu.service.CollectService;

@Controller
@RequestMapping("/collect")
public class CollectController {
	
	@Autowired
	private CollectService collectService;
	
	@RequestMapping("/mycollect")
	@ResponseBody
	public List<MyCollect> getAllCollectByUserId(Integer userid){
		return collectService.getUserCollectByUserId(userid);
	}
	
	@RequestMapping("/addmycollect")
	@ResponseBody
	public Map<String, String> addOneMyCollect(Integer ptjobid,HttpServletRequest request){
		
		Map<String, String> map = new HashMap<String, String>();
		User u = (User) request.getSession().getAttribute("user");
		
		
		if((null != u) && (null != u.getPtuser())){
			System.out.println(u.getPtuser().getName());
			collectService.saveOneCollect(ptjobid, u.getPtuser().getId());
			map.put("msg", "1");//1为收藏成功
			return map;
		}
		
		map.put("msg", "2");//2为收藏失败  失败代表还未登录后跳转到登录界面
		return map;

	}
	
	
	
	@RequestMapping("/deletemycollect")
	@ResponseBody
	public Map<String, String> deleteMyCollect(Integer mycollectid){
		
		Map<String, String> map = new HashMap<String, String>();
		
		collectService.deleteOneCollect(mycollectid);
		
		map.put("msg", "删除成功!");
		return map;

	}
	
	
	

}
