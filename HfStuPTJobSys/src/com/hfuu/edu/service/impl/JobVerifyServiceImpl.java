package com.hfuu.edu.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hfuu.edu.common.PtjobAndStateNum;
import com.hfuu.edu.db.dao.JobVerifyDao;
import com.hfuu.edu.service.JobVerifyService;

@Service
public class JobVerifyServiceImpl implements JobVerifyService {
	
	@Autowired
	private JobVerifyDao jobVerifyDao;

	@Override
	public Map<String, String> getJobStatenum(Integer businessid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PtjobAndStateNum getJobStatenum(Integer businessid, String state) {
		// TODO Auto-generated method stub
		return jobVerifyDao.getJobStatenum(businessid, state);
	}

}
