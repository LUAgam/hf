package com.hfuu.edu.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hfuu.edu.common.ChectList;
import com.hfuu.edu.common.MyApplyPhone;
import com.hfuu.edu.common.PageBean;
import com.hfuu.edu.common.PtJobPage;
import com.hfuu.edu.common.QueryInfo;
import com.hfuu.edu.common.QueryResult;
import com.hfuu.edu.db.dao.ApplyDao;
import com.hfuu.edu.entity.JobApply;
import com.hfuu.edu.entity.Ptjob;
import com.hfuu.edu.service.ApplyService;
import com.hfuu.edu.utils.DistanceTime;

@Service
public class ApplyServiceImpl implements ApplyService {
	
	@Autowired
	private ApplyDao applyDao;
	
	@Autowired
	private DistanceTime distanceTime;

	@Override
	public void addOneMyApply(Integer ptjobid, Integer ptuserid) {
		// TODO Auto-generated method stub
		applyDao.addOneMyApply(ptjobid, ptuserid);

	}

	@Override
	public Boolean selectOneJobApplyByState(Integer ptjobid, Integer ptuserid) {
		// TODO Auto-generated method stub
		return applyDao.selectOneJobApplyByState(ptjobid, ptuserid);
	}

	@Override
	public void cancelMyApply(Integer myapplyid) {
		applyDao.cancelMyApply(myapplyid);

	}

	@Override
	public void passApply(Integer ptjobid, Integer ptuserid) {
		// TODO Auto-generated method stub
		applyDao.passApply(ptjobid, ptuserid);
	}

	@Override
	public List<JobApply> selectAllApplyById(Integer ptuserid) {
		// TODO Auto-generated method stub
		return applyDao.selectAllApplyById(ptuserid);
	}
	
	@Override
	public List<MyApplyPhone> selectAllJobApplyPhoneByPtjobId(Integer ptuserid) {
		// TODO Auto-generated method stub
		List<JobApply> Applyjobs= applyDao.selectAllApplyById(ptuserid);
		List<MyApplyPhone> myapplyphones = new ArrayList<MyApplyPhone>();
		for(JobApply aj : Applyjobs){
			MyApplyPhone maply = new MyApplyPhone();
			maply.setPtjobid(aj.getPtjob().getId());
			maply.setPtjobname(aj.getPtjob().getJbname());
			maply.setJobaddress(aj.getPtjob().getJbadress());
			maply.setTimedistance(distanceTime.disTime(new Date(), aj.getApplytime()));
			String state = aj.getState();
			maply.setState(state);
			maply.setImgurl(aj.getPtjob().getImgurl());
			/*if(state.equals("0")){
				maply.setState("已取消");
			}else if(state.equals("1")){
				maply.setState("已报名");
			}else{
				maply.setState("已通过");
			}*/
			
			myapplyphones.add(maply);
		}
		
		
		return myapplyphones;
	}
	
	@Override
	public PageBean getCheckList(Integer ptjobid, String state, QueryInfo info) {
		
		
		
		QueryResult qr = applyDao.getCheckList(ptjobid, state, info.getStartindex(), info.getPagesize());
		PageBean bean = new PageBean();
		bean.setCurrentpage(info.getCurrentpage());
		
		List<JobApply> pts = qr.getList();
		List<ChectList> chectlists = new ArrayList<ChectList>();
		
		  for(JobApply jobapply : pts){
			  
			  ChectList chectlist = new ChectList();
			  
			  try {
				  if(null != jobapply.getPtuser().getBirthday()){
					  chectlist.setAge(distanceTime.getAge(jobapply.getPtuser().getBirthday()));
				  }else{
					  chectlist.setAge("0");
				  }
			} catch (ParseException e) {
				chectlist.setAge(distanceTime.getAge(new Date()));
				e.printStackTrace();
			}
			  chectlist.setUserid(jobapply.getPtuser().getUser().getId());
			  chectlist.setApplytime(distanceTime.disTime(new Date(), jobapply.getApplytime()));
			  chectlist.setName(jobapply.getPtuser().getName());
			  chectlist.setSex(jobapply.getPtuser().getSex());
			  chectlist.setSchool(jobapply.getPtuser().getSchool());
			  chectlist.setId(jobapply.getId());
			  chectlist.setPtuserid(jobapply.getPtuser().getId());
			  chectlist.setImgurl(jobapply.getPtuser().getImgurl());
			  chectlists.add(chectlist);
			  
			  System.out.println("----------"+chectlist.toString());
		  }
		
		bean.setList(chectlists);
		bean.setPagesize(info.getPagesize());
		bean.setTotalrecord(qr.getTotalrecord());
		return bean;
	}

	@Override
	public void modifyState(Integer jobappplyid) {
		// TODO Auto-generated method stub
		applyDao.modifyState(jobappplyid);
		
	}


}
