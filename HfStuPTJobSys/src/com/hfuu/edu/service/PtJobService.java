package com.hfuu.edu.service;

import java.util.Date;
import java.util.List;

import com.hfuu.edu.common.ManagerPtjobBean;
import com.hfuu.edu.common.PageBean;
import com.hfuu.edu.common.PtJobPage;
import com.hfuu.edu.common.QueryInfo;
import com.hfuu.edu.entity.Ptjob;

public interface PtJobService {
	
	public List<Ptjob> getAllPtJob(Ptjob ptjob);
	
	public PageBean pageQuery(QueryInfo info,String jbadress,String jbtype,String jbkind,
			String condition,String searchtxt);
	
	public List<Ptjob> getRecommendPtJob(int startindex, int pagesize,String jbadress,String jbtype,String jbkind,
			String condition);
	
	public void addPtjob(Ptjob ptjob);
	
	public Ptjob getPtjobById(Integer id);
	
	public PtJobPage getPtjobByIdPhone(Integer id);
	
	public void addPtjob(Ptjob ptjob,String inpstart,String inpend,String starttime,String endtime,Integer businessid) throws Exception;
	
	public void addOneQuantity(Integer ptjobid);
	
	public boolean payForTopJob(Integer ptjobid,String starttime,String endtime,Integer businessid);
	
	public Integer getPtjobfCountByState(String state);

	public List<ManagerPtjobBean> getPtjobfByState(Integer startindex, Integer pagesize, String state);
	
	public void changePtjobfByState(Integer ptjobid,String state,String jobverifyMsg);
	
	
	
}
