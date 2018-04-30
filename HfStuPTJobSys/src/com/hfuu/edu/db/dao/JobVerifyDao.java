package com.hfuu.edu.db.dao;

import java.util.Map;

import com.hfuu.edu.common.PtjobAndStateNum;

public interface JobVerifyDao {
	
	 public Map<String, String> getJobStatenum(Integer businessid);
	 
	 public PtjobAndStateNum getJobStatenum(Integer ptjobid,String state);
	

}
