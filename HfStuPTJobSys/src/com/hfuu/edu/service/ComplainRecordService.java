package com.hfuu.edu.service;

import java.util.List;

import com.hfuu.edu.common.ComplainRecordVo;
import com.hfuu.edu.entity.ComplainRecord;

public interface ComplainRecordService {

	public void addOneComplain(ComplainRecord complainRecord);
	
	public void ModifyComplainState(Integer complainid);
	
	public int getComplainTrueOrFalseAlready(Integer ptuserid,Integer ptjobid);
	
	public List<ComplainRecordVo> getAllComplainRecord(String State);
	
	public Integer getCountByState(String State);
	
	public void changeComplainRecordState(Integer complainid,String state);
	
	
}
