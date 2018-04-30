package com.hfuu.edu.db.dao;

import java.util.List;

import com.hfuu.edu.common.QueryResult;
import com.hfuu.edu.entity.JobApply;

public interface ApplyDao {
	
	public void addOneMyApply(Integer ptjobid,Integer ptuserid);
	
	public Boolean selectOneJobApplyByState(Integer ptjobid,Integer ptuserid);
	
	public void cancelMyApply(Integer myapplyid);
	
	public void passApply(Integer ptjobid,Integer ptuserid);
	
	public List<JobApply> selectAllApplyById(Integer ptuserid);
	
	public QueryResult getCheckList(Integer ptjobid,String state,int startindex, int pagesize);
	
	public void modifyState(Integer jobappplyid);  

}
