package com.hfuu.edu.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hfuu.edu.common.PtJobPage;
import com.hfuu.edu.db.dao.BusinessDao;
import com.hfuu.edu.entity.Business;
import com.hfuu.edu.entity.Ptjob;
import com.hfuu.edu.service.BusinessService;
import com.hfuu.edu.utils.DistanceTime;


@Service
public class BusinessServiceImpl implements BusinessService {
	
	@Autowired
	private BusinessDao businessDao;
	@Autowired
	private DistanceTime  distanceTime;
	
	@Override
	public void addBusiness(Business business) {
		
		businessDao.addBusiness(business);
		

	}

	@Override
	public List<PtJobPage> getBusinessPtjob(Integer id) {
		
		Set<Ptjob> pts = businessDao.getOneBusiness(id);
		List<PtJobPage> pjps = new ArrayList<PtJobPage>();
		if(pts.size() > 0){
			for(Ptjob pj : pts){
				PtJobPage pgp = new PtJobPage();
				pgp.setId(pj.getId());;
				pgp.setJbname(pj.getJbname());
				pgp.setJbadress(pj.getJbadress());
				pgp.setImgurl(pj.getImgurl());
				pgp.setJbtype(pj.getJbtype());
				pgp.setJbkind(pj.getJbkind());
				pgp.setWorktime(pj.getWorktime());
				pgp.setRecnum(pj.getRecnum());
				pgp.setJbdetails(pj.getJbdetails());
				pgp.setSalary(pj.getSalary());
				pgp.setReleasetime(pj.getReleasetime());
				Date nowtime = new Date();
				Date reltime = pj.getReleasetime();
				String timedistance = distanceTime.disTime(nowtime, reltime);
				
				pgp.setTimedistance(timedistance);
				
				pgp.setQuantity(String.valueOf(pj.getQuantity()));
				pjps.add(pgp);
			}
		}
		return pjps;
	}

	@Override
	public Business getBusinessById(Integer businessid) {
		
		return businessDao.getBusinessById(businessid);
		
	}

	@Override
	public void changeBusinessMoneyById(Integer businessid,Double money) {
		
		businessDao.changeBusinessMoneyById(businessid, money);
		
	}

	@Override
	public List<PtJobPage> getCurrentBusinessPtjob(Integer businessid) {
		Set<Ptjob> pts = businessDao.getCurrentBusinessJob(businessid);
		List<PtJobPage> pjps = new ArrayList<PtJobPage>();
		if(pts.size() > 0){
			for(Ptjob pj : pts){
				PtJobPage pgp = new PtJobPage();
				pgp.setId(pj.getId());;
				pgp.setJbname(pj.getJbname());
				pgp.setJbadress(pj.getJbadress());
				pgp.setImgurl(pj.getImgurl());
				pgp.setJbtype(pj.getJbtype());
				pgp.setJbkind(pj.getJbkind());
				pgp.setWorktime(pj.getWorktime());
				pgp.setRecnum(pj.getRecnum());
				pgp.setJbdetails(pj.getJbdetails());
				pgp.setSalary(pj.getSalary());
				pgp.setReleasetime(pj.getReleasetime());
				Date nowtime = new Date();
				Date reltime = pj.getReleasetime();
				String timedistance = distanceTime.disTime(nowtime, reltime);
				
				pgp.setTimedistance(timedistance);
				
				pgp.setQuantity(String.valueOf(pj.getQuantity()));
				pjps.add(pgp);
			}
		}
		return pjps;
	}

	@Override
	public void modifyBusinessMsg(Business business, Integer businessid,String newFileName) {
		// TODO Auto-generated method stub
		businessDao.modifyBusinessMsg(business, businessid,newFileName);
	}

}
