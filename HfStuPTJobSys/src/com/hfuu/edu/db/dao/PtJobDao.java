package com.hfuu.edu.db.dao;

import java.util.Date;
import java.util.List;

import com.hfuu.edu.common.QueryResult;
import com.hfuu.edu.entity.Ptjob;

public interface PtJobDao {

	public List<Ptjob> getAllPtJob(Ptjob ptjob);
	
	public QueryResult getPageAll(int startindex, int pagesize,String jbadress,String jbtype,String jbkind,
			String condition,String searchtxt);
	
	public void addPtjob(Ptjob ptjob);
	
	public Ptjob getPtjobById(Integer id);
	
	public List<Ptjob>  getRecommendPtJob(int startindex, int pagesize,String jbadress,String jbtype,String jbkind,
			String condition);
	
	public void addPtjob(Ptjob ptjob,Integer businessid);
	
	public void addOneQuantity(Integer ptjobid);
	
	public void modifyPtjobState();//定时器自动更改职位的State为2
	
	public Integer getPtjobfCountByState(String state);

	public List<Ptjob> getPtjobfByState(Integer startindex, Integer pagesize, String state);
	
	public void changePtjobfByState(Integer ptjobid,String state,String jobverifyMsg);
}
