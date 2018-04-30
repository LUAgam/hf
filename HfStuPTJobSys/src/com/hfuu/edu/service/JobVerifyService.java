package com.hfuu.edu.service;

import java.util.Map;

import com.hfuu.edu.common.PtjobAndStateNum;

public interface JobVerifyService {
	
	public Map<String, String> getJobStatenum(Integer businessid);
	
	public PtjobAndStateNum getJobStatenum(Integer businessid,String state);

}
