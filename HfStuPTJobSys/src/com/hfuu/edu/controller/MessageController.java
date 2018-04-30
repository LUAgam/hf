package com.hfuu.edu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hfuu.edu.common.MessageVo;
import com.hfuu.edu.common.MyApplyPhone;
import com.hfuu.edu.entity.Message;
import com.hfuu.edu.entity.User;
import com.hfuu.edu.service.MessageService;


@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	@RequestMapping("/addonemessage")
	@ResponseBody
	public Map<String, String> AddOneMsg(Message message,HttpServletRequest request,HttpServletResponse response){
		response.addHeader("Access-Control-Allow-Origin", "*");
		Map<String, String> map = new HashMap<String, String>();
		
		User u = (User) request.getSession().getAttribute("user");
		if((null != u)){
			message.setFromUserid(u.getId());
			messageService.addoneMessage(message);
			map.put("msg", "1");
		}else{
			map.put("msg", "2");
		}
		
		return map;
	}
	
	@RequestMapping("/getallmessage")
	@ResponseBody
	public List<MessageVo> getAllMessageById(HttpServletRequest request,HttpServletResponse response){
		response.addHeader("Access-Control-Allow-Origin", "*");
		List<MessageVo> messagevos =new ArrayList<MessageVo>();
		User u = (User) request.getSession().getAttribute("user");
		if((null != u)){
			messagevos = messageService.getAllmsg(u.getId());
		}
		
		return messagevos;
	}
	
	@RequestMapping("/modifystate")
	@ResponseBody
	public Map<String, String> ModifyMsgState(Integer messageid,HttpServletRequest request,HttpServletResponse response){
		response.addHeader("Access-Control-Allow-Origin", "*");
		Map<String, String> map = new HashMap<String, String>();
		
		User u = (User) request.getSession().getAttribute("user");
		if((null != u)){
			messageService.ModifyMassageState(messageid);
			map.put("msg", "1");
		}else{
			map.put("msg", "2");
		}
		
		return map;
	}
	
	@RequestMapping("/getnotreadmsg")
	@ResponseBody
	public Map<String, String> getNotReadMsgCount(HttpServletRequest request,HttpServletResponse response){
		response.addHeader("Access-Control-Allow-Origin", "*");
		Map<String, String> map = new HashMap<String, String>();
		User u = (User) request.getSession().getAttribute("user");
		if((null != u)){
			map.put("count", String.valueOf(messageService.getNotReadMsgCount(u.getId())));
		}
		return map;
	}
	

}
