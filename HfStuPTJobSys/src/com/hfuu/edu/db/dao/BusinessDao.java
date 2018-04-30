package com.hfuu.edu.db.dao;

import java.util.List;
import java.util.Set;

import com.hfuu.edu.entity.Business;
import com.hfuu.edu.entity.Ptjob;

public interface BusinessDao {
	
	
	public void addBusiness(Business business);
	
	public Set<Ptjob> getOneBusiness(Integer id);
	
	public Set<Ptjob> getCurrentBusinessJob(Integer businessid);
	
	public Business getBusinessById(Integer businessid);
	
	public void changeBusinessMoneyById(Integer businessid,Double money);

	void modifyBusinessMsg(Business business, Integer businessid, String newfilename);

}
