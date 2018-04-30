package com.hfuu.edu.service.impl;

import java.text.ParseException;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hfuu.edu.common.PtuserJson;
import com.hfuu.edu.db.dao.PtuserDao;
import com.hfuu.edu.entity.Ptuser;
import com.hfuu.edu.service.PtuserService;
import com.hfuu.edu.utils.DistanceTime;

@Service
public class PtuserServiceImpl implements PtuserService {
	
	@Autowired
	private PtuserDao ptuserDao;
	@Autowired
	private DistanceTime distanceTime;
	
	@Override
	public void addPtuser(Ptuser ptuser) {
		
		ptuserDao.addPtuser(ptuser);

	}

	@Override
	public void modifyPtuserMsg(Ptuser ptuser, Integer ptuserid) {
		// TODO Auto-generated method stub
		ptuserDao.modifyPtuserMsg(ptuser, ptuserid);
	}

	@Override
	public Ptuser getPtuserByid(Integer userid) {
		return ptuserDao.getPtuserByid(userid);
	}

	@Override
	public PtuserJson getPtuserByidReturnJson(Integer ptuserid) {
		
		Ptuser ptuer = ptuserDao.getPtuserByptuserid(ptuserid);
		
		PtuserJson ptuserjson = new PtuserJson();
		ptuserjson.setId(ptuer.getId());
		ptuserjson.setName(ptuer.getName());
		try {
			if(null != ptuer.getBirthday()){
				ptuserjson.setAge(distanceTime.getAge(ptuer.getBirthday()));
			}else{
				ptuserjson.setAge("0");
			}
		} catch (Exception e) {
			ptuserjson.setAge(distanceTime.getAge(new Date()));
			e.printStackTrace();
		}
		ptuserjson.setUserid(ptuer.getUser().getId());
		ptuserjson.setCity(ptuer.getCity());
		ptuserjson.setHeight(ptuer.getHeight());
		ptuserjson.setSchool(ptuer.getSchool());
		ptuserjson.setEamil(ptuer.getEamil());
		ptuserjson.setPhone(ptuer.getPhone());
		ptuserjson.setResume(ptuer.getResume());
		ptuserjson.setExperience(ptuer.getExperience());
		ptuserjson.setImgurl(ptuer.getImgurl());
		ptuserjson.setFujian(ptuer.getFujian());
		return ptuserjson;
	}

	@Override
	public String getPtuserImg(Integer ptuserid) {
		return ptuserDao.getPtuserImg(ptuserid);
	}

	@Override
	public Ptuser findEntityById(Integer id) {
		return ptuserDao.getPtuserByptuserid(id);
	}

}
