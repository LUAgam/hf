package com.hfuu.edu.service;

import java.util.List;

import com.hfuu.edu.common.PtJobPage;
import com.hfuu.edu.entity.Business;
import com.hfuu.edu.entity.Ptuser;

public interface BusinessService {
	
	public void addBusiness(Business business);
	
	public List<PtJobPage> getBusinessPtjob(Integer id);
	
	public List<PtJobPage> getCurrentBusinessPtjob(Integer businessid);
	
	public Business getBusinessById(Integer businessid);
	
	public void changeBusinessMoneyById(Integer businessid,Double money);
	
	public void modifyBusinessMsg(Business business,Integer businessid,String newfilename);
	
}
