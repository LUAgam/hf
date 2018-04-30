package com.hfuu.edu.utils;

import org.springframework.beans.factory.annotation.Autowired;

import com.hfuu.edu.db.dao.PtJobDao;
import com.hfuu.edu.entity.Ptjob;
import com.hfuu.edu.service.TopJobRecordService;

public class ModifyPtjobState {
	
	@Autowired
	private PtJobDao ptJobDao;
	
	@Autowired
	private TopJobRecordService topJobRecordService;
	
	/**
	 * 自动更改职位的state  过期自动更改为2
	 */
	public void modifyJobState() {
		/**
		 * 过期职位自动更改state 为过期
		 */
		ptJobDao.modifyPtjobState();
		/**
		 * 自动判断当前日期与职位置顶日期比较  根据比较结果做处理
		 */
		topJobRecordService.ModifyTopJobMsg();
//		System.out.println("-------------------------------------------------------------1");
		
		
	}
	

}
