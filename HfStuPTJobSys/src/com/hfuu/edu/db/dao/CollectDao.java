package com.hfuu.edu.db.dao;

import java.util.List;
import java.util.Set;

import com.hfuu.edu.entity.JobCollection;

public interface CollectDao {
	
	public Set<JobCollection> getUserCollectByUserId(Integer Userid);
	
	public void saveOneCollect(Integer ptjobid,Integer ptuserid);
	
	public void deleteOneCollect(Integer mycollectid);
	
	
	

}
