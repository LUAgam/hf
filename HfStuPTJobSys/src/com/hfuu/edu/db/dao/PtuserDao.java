package com.hfuu.edu.db.dao;

import com.hfuu.edu.entity.Ptuser;

public interface PtuserDao {
	
	public void addPtuser(Ptuser ptuser);
	
	public void modifyPtuserMsg(Ptuser ptuser,Integer ptuserid);
	
	public String getPtuserImg(Integer ptuserid);

	public Ptuser getPtuserByid(Integer userid);
	
	public Ptuser getPtuserByptuserid(Integer userid);
	
	
}
