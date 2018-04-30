package com.hfuu.edu.service;

import java.util.Map;

public interface TopJobRecordService {
	
	public Map<String, String> payForTopJob(String paymoney,Integer ptjobid, String starttime, String endtime,
			Integer businessid);

	public void ModifyTopJobMsg();
	
}
