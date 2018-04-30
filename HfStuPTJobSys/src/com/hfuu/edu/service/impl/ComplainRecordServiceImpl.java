package com.hfuu.edu.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hfuu.edu.common.ComplainRecordVo;
import com.hfuu.edu.db.dao.ComplainRecordDao;
import com.hfuu.edu.entity.ComplainRecord;
import com.hfuu.edu.service.ComplainRecordService;

@Service
public class ComplainRecordServiceImpl implements ComplainRecordService{

	@Autowired
	private ComplainRecordDao complainRecordDao;
	
	@Override
	public void addOneComplain(ComplainRecord complainRecord) {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		complainRecord.setComplaintime(sdf.format(new Date()));
		complainRecordDao.addOneComplain(complainRecord);
		
	}

	@Override
	public void ModifyComplainState(Integer complainid) {
		// TODO Auto-generated method stub
		complainRecordDao.ModifyComplainState(complainid);
	}


	@Override
	public int getComplainTrueOrFalseAlready(Integer ptuserid, Integer ptjobid) {
		// TODO Auto-generated method stub
		return complainRecordDao.getComplainTrueOrFalseAlready(ptuserid, ptjobid);
	}

	@Override
	public Integer getCountByState(String State) {
		// TODO Auto-generated method stub
		return complainRecordDao.getCountByState(State);
	}

	@Override
	public void changeComplainRecordState(Integer complainid, String state) {
		// TODO Auto-generated method stub
		complainRecordDao.changeComplainRecordState(complainid, state);
	}

	@Override
	public List<ComplainRecordVo> getAllComplainRecord(String State) {
		// TODO Auto-generated method stub
		return complainRecordDao.getAllComplainRecord(State);
	}

}
