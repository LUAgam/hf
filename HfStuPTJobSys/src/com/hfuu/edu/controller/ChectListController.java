package com.hfuu.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hfuu.edu.common.ChectList;
import com.hfuu.edu.common.PageBean;
import com.hfuu.edu.common.PtuserJson;
import com.hfuu.edu.common.QueryInfo;
import com.hfuu.edu.service.ApplyService;
import com.hfuu.edu.service.PtuserService;

/**
 * 商检查看该职位已报名名单
 * @author chengzige
 *
 */

@Controller
@RequestMapping("/chectlist")
public class ChectListController {
	
	@Autowired
	private ApplyService applyService;
	@Autowired
	private PtuserService ptuserService;
	
	@RequestMapping("/getchectlist")
	@ResponseBody
	public PageBean getAllPtUserList(QueryInfo info,Integer ptjobid){
		return applyService.getCheckList(ptjobid, "1", info);
	}
	
	
	@RequestMapping("/passapply")
	@ResponseBody
	public Map<String, String> ModifyPtUserList(Integer jobappplyid){
		 Map<String, String> map = new HashMap<String, String>();
		 applyService.modifyState(jobappplyid);
		 map.put("msg", "1");
		 return map;
	}
	
	@RequestMapping("/getptusermsg")
	@ResponseBody
	public PtuserJson getPtUserMsg(Integer ptuserid){
		 return ptuserService.getPtuserByidReturnJson(ptuserid);
	}

}
