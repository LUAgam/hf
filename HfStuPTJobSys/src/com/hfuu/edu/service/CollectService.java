package com.hfuu.edu.service;

import java.util.List;
import java.util.Set;

import com.hfuu.edu.common.MyCollect;
import com.hfuu.edu.entity.JobCollection;

public interface CollectService {

	public List<MyCollect> getUserCollectByUserId(Integer userid);
	
	public void saveOneCollect(Integer ptjobid,Integer ptuserid);
	
	public void deleteOneCollect(Integer mycollectid);
	
}
