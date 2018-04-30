package com.hfuu.edu.service.impl;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hfuu.edu.db.dao.TopJobRecordDao;
import com.hfuu.edu.entity.TopJobRecord;
import com.hfuu.edu.service.TopJobRecordService;

@Service
public class TopJobRecordServiceImpl implements TopJobRecordService {

	@Autowired
	private TopJobRecordDao topJobRecordDao;

	@Override
	public Map<String, String> payForTopJob(String paymoney,Integer ptjobid, String starttime,
			String endtime, Integer businessid) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		TopJobRecord topJobRecord = new TopJobRecord();
		topJobRecord.setCurrentdate(new Date());
		try {
			topJobRecord.setStartdate(sdf.parse(starttime));
			topJobRecord.setEnddate(sdf.parse(endtime));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Map<String, String> map = topJobRecordDao.payForTopJob(Double.valueOf(paymoney), ptjobid, topJobRecord, businessid);
		return map;
	}

	@Override
	public void ModifyTopJobMsg() {
		topJobRecordDao.ModifyTopJobMsg();
	}
	
	
	
}
