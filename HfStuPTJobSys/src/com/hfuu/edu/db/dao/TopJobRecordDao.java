package com.hfuu.edu.db.dao;

import java.util.Map;

import com.hfuu.edu.entity.TopJobRecord;

public interface TopJobRecordDao {
	
	public Map<String, String> payForTopJob(Double paymoney,Integer ptjobid,TopJobRecord topJobRecord, Integer businessid);
	
	public void ModifyTopJobMsg();
	
}
