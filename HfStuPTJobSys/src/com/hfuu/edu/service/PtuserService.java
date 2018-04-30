package com.hfuu.edu.service;

import com.hfuu.edu.common.PtuserJson;
import com.hfuu.edu.entity.Ptuser;


public interface PtuserService {
	
	public void addPtuser(Ptuser ptuser);
	
	public void modifyPtuserMsg(Ptuser ptuser,Integer ptuserid);
	
	public String getPtuserImg(Integer ptuserid);
	
	public Ptuser getPtuserByid(Integer userid);
	
	public PtuserJson getPtuserByidReturnJson(Integer ptuserid);

	public Ptuser findEntityById(Integer id);

}
