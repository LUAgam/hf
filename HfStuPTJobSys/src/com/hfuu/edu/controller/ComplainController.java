package com.hfuu.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hfuu.edu.common.ComplainRecordVo;
import com.hfuu.edu.entity.ComplainRecord;
import com.hfuu.edu.entity.User;
import com.hfuu.edu.service.ComplainRecordService;

@Controller
@RequestMapping("complain")
public class ComplainController {

	@Autowired
	private ComplainRecordService complainRecordService;
	
	@RequestMapping("addonecomplain")
	@ResponseBody
	public Map<String, String> addoneComplain(ComplainRecord complainRecord,HttpServletRequest request){
		Map<String, String> map = new HashMap<String, String>();
		User u = (User) request.getSession().getAttribute("user");
			if((null != u) && (null != u.getPtuser())){
			
				complainRecord.setPtuserid(u.getPtuser().getId());
				complainRecordService.addOneComplain(complainRecord);
				map.put("msg", "1");
				
		}else{
			map.put("msg", "2");
		}
		return map;
		
	}
	/**
	 * 根据state获取相应的申诉  0未处理列表   1已处理列表
	 * @param state
	 * @return
	 */
	@RequestMapping("getallcomplain")
	@ResponseBody
	public List<ComplainRecordVo> getallcomplainByState(String state){
		return complainRecordService.getAllComplainRecord(state);
	}
	/**
	 * 判断当前用户是否已经申诉过该职位
	 * @param complainid
	 * @param ptjobid
	 * @return 
	 */
	@RequestMapping("getcomplainselect")
	@ResponseBody
	public Map<String, String> getComplainTrueOrFalseAlready(Integer ptjobid,HttpServletRequest request){
		Map<String, String> map = new HashMap<String, String>();
		int complain = 0;
		User u = (User) request.getSession().getAttribute("user");
		if((null != u) && (null != u.getPtuser())){
		
			complain = complainRecordService.getComplainTrueOrFalseAlready(u.getPtuser().getId(), ptjobid);
			
		}else{
			map.put("msg", "3");// 还未登陆
		}
		if(complain == 1){
			map.put("msg", "1");//代表已经申诉
		}else{
			map.put("msg", "2");//还未申诉
		}
		return map;
		}
	
	/**
	 * 获取总数量   分页需要
	 * @param state
	 * @return
	 */
	
	@RequestMapping("getcountcomplain")
	@ResponseBody
	public Map<String, Object> getCountComplain(String state){
		Map<String, Object> map = new HashMap<String, Object>();
		Integer countByState = complainRecordService.getCountByState(state);
		map.put("count", countByState);
		return map;
	}
	
	@RequestMapping("changecomplainstate")
	@ResponseBody
	public Map<String, Object> changeComplainState(Integer complainid,String state){
		Map<String, Object> map = new HashMap<String, Object>();
		complainRecordService.changeComplainRecordState(complainid, state);
		map.put("msg", "1");
		return map;
	}
	
	
}
