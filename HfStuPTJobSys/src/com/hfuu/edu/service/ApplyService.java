package com.hfuu.edu.service;

import java.util.List;

import com.hfuu.edu.common.MyApplyPhone;
import com.hfuu.edu.common.PageBean;
import com.hfuu.edu.common.QueryInfo;
import com.hfuu.edu.common.QueryResult;
import com.hfuu.edu.entity.JobApply;

public interface ApplyService {
	
	public void addOneMyApply(Integer ptjobid,Integer ptuserid);
	
	public Boolean selectOneJobApplyByState(Integer ptjobid,Integer ptuserid);
	
	public void cancelMyApply(Integer myapplyid);
	
	public void passApply(Integer ptjobid,Integer ptuserid);
	
	public List<JobApply> selectAllApplyById(Integer ptuserid);
	
	public List<MyApplyPhone> selectAllJobApplyPhoneByPtjobId(Integer ptuserid);
	
	public PageBean getCheckList(Integer ptjobid,String state,QueryInfo info);
	
	public void modifyState(Integer jobappplyid);  
	
}
