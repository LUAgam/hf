package com.hfuu.edu.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hfuu.edu.common.ManagerPtjobBean;
import com.hfuu.edu.common.PageBean;
import com.hfuu.edu.common.PtJobPage;
import com.hfuu.edu.common.QueryInfo;
import com.hfuu.edu.common.QueryResult;
import com.hfuu.edu.db.dao.PtJobDao;
import com.hfuu.edu.entity.Ptjob;
import com.hfuu.edu.entity.TopJobRecord;
import com.hfuu.edu.service.PtJobService;
import com.hfuu.edu.utils.DistanceTime;

@Service
public class PtJobServiceImpl implements PtJobService{

	@Autowired
	private PtJobDao ptJobDao;
	
	@Autowired
	private DistanceTime distanceTime;
	
	@Override
	public List<Ptjob> getAllPtJob(Ptjob ptjob) {
		
		List<Ptjob> p =ptJobDao.getAllPtJob(ptjob);
		return p;
	}

	@Override
	public PageBean pageQuery(QueryInfo info, String jbadress, String jbtype,
			String jbkind, String condition,String searchtxt) {
		
		QueryResult qr = ptJobDao.getPageAll(info.getStartindex(), info.getPagesize(), jbadress, jbtype, jbkind, condition,searchtxt);
		PageBean bean = new PageBean();
		bean.setCurrentpage(info.getCurrentpage());
		
		List<Ptjob> pts = qr.getList();
		List<PtJobPage> list = new ArrayList<PtJobPage>();
		SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日");
		  for(int i=0;i<pts.size();i++){
				PtJobPage pgp = new PtJobPage();
				pgp.setId(pts.get(i).getId());;
				pgp.setJbname(pts.get(i).getJbname());
				pgp.setJbadress(pts.get(i).getJbadress());
				pgp.setImgurl(pts.get(i).getImgurl());
				pgp.setJbtype(pts.get(i).getJbtype());
				pgp.setJbkind(pts.get(i).getJbkind());
				pgp.setWorktime(pts.get(i).getWorktime());
				pgp.setRecnum(pts.get(i).getRecnum());
				//pgp.setJbdetails(pts.get(i).getJbdetails());
				pgp.setDistance(pts.get(i).getDistance());
				pgp.setSalary(pts.get(i).getSalary());
				
				pgp.setStartdate(sdf.format(pts.get(i).getStartdate()));
				pgp.setEnddate(sdf.format(pts.get(i).getEnddate()));
				pgp.setReleasetime(pts.get(i).getReleasetime());
				Date nowtime = new Date();
				Date reltime = pts.get(i).getReleasetime();
				String timedistance = distanceTime.disTime(nowtime, reltime);
				
		        pgp.setTimedistance(timedistance);
				
				pgp.setQuantity(String.valueOf(pts.get(i).getQuantity()));
				
				if(null != pts.get(i).getTopJobRecord()){
					TopJobRecord topJobRecord = pts.get(i).getTopJobRecord();
					Date date = new Date();
					if((topJobRecord.getStartdate().getTime()<date.getTime()) && (topJobRecord.getEnddate().getTime()>date.getTime()))
						pgp.setTopjobstate("1");
					
				}
				list.add(pgp);
		  }
		
		bean.setList(list);
		bean.setPagesize(info.getPagesize());
		bean.setTotalrecord(qr.getTotalrecord());
		return bean;
	}
	
	@Override
	public List<Ptjob> getRecommendPtJob(int startindex, int pagesize,
			String jbadress, String jbtype, String jbkind, String condition) {
		
		List<Ptjob> pts = ptJobDao.getRecommendPtJob(startindex, pagesize, jbadress, jbtype, jbkind, condition);
		
		/*List<PtJobPage> list = new ArrayList<PtJobPage>();
		  for(int i=0;i<pts.size();i++){
				PtJobPage pgp = new PtJobPage();
				pgp.setId(pts.get(i).getId());;
				pgp.setJbname(pts.get(i).getJbname());
				pgp.setJbadress(pts.get(i).getJbadress());
				pgp.setImgurl(pts.get(i).getImgurl());
				pgp.setJbtype(pts.get(i).getJbtype());
				pgp.setJbkind(pts.get(i).getJbkind());
				pgp.setWorktime(pts.get(i).getWorktime());
				pgp.setRecnum(pts.get(i).getRecnum());
				pgp.setJbdetails(pts.get(i).getJbdetails());
				pgp.setSalary(pts.get(i).getSalary());
				pgp.setReleasetime(pts.get(i).getReleasetime());
				Date nowtime = new Date();
				Date reltime = pts.get(i).getReleasetime();
				String timedistance = distanceTime.disTime(nowtime, reltime);
				
		        pgp.setTimedistance(timedistance);
				
				pgp.setQuantity(String.valueOf(pts.get(i).getQuantity()));
				list.add(pgp);
		  }*/
		
		
		return pts;
	}
	
	
	
	

	@Override
	public void addPtjob(Ptjob ptjob) {

		ptJobDao.addPtjob(ptjob);
		
	}

	@Override
	public Ptjob getPtjobById(Integer id) {
		return ptJobDao.getPtjobById(id);
	}
	
	@Override
	public PtJobPage getPtjobByIdPhone(Integer ptjobid) {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日");
		Ptjob ptjob = ptJobDao.getPtjobById(ptjobid);
		PtJobPage pgp = new PtJobPage();
		pgp.setId(ptjob.getId());;
		pgp.setJbname(ptjob.getJbname());
		pgp.setJbadress(ptjob.getJbadress());
		pgp.setImgurl(ptjob.getImgurl());
		pgp.setJbtype(ptjob.getJbtype());
		pgp.setJbkind(ptjob.getJbkind());
		pgp.setWorktime(ptjob.getWorktime());
		pgp.setRecnum(ptjob.getRecnum());
		pgp.setSuggest(ptjob.getSuggest());
		//pgp.setJbdetails(pts.get(i).getJbdetails());
		pgp.setBusinessphone(ptjob.getBusiness().getPhone());
		pgp.setSalary(ptjob.getSalary());
		
		pgp.setStartdate(sdf.format(ptjob.getStartdate()));
		pgp.setEnddate(sdf.format(ptjob.getEnddate()));
		pgp.setReleasetime(ptjob.getReleasetime());
		pgp.setBusinessname(ptjob.getBusiness().getName());
		Date nowtime = new Date();
		Date reltime = ptjob.getReleasetime();
		String timedistance = distanceTime.disTime(nowtime, reltime);
		
        pgp.setTimedistance(timedistance);
        pgp.setJbdetails(ptjob.getJbdetails());
		pgp.setQuantity(String.valueOf(ptjob.getQuantity()));
		return pgp;
	}

	
	@Override
	public void addPtjob(Ptjob ptjob,String inpstart,String inpend,String starttime,String endtime,Integer businessid)
			throws Exception {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
		ptjob.setStartdate(sdf.parse(inpstart));
		ptjob.setEnddate(sdf.parse(inpend));
		SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm");
		Date start = sdf1.parse(starttime);
		Date end = sdf1.parse(endtime);
		long wordtim = end.getTime() - start.getTime();
		long hour =  (wordtim/(60 * 60 * 1000));
		ptjob.setWorktime(String.valueOf(hour));
		
		
		if(ptjob.getJbkind().equals("其他"))
			ptjob.setImgurl("qita.png");
		if(ptjob.getJbkind().equals("家教"))
			ptjob.setImgurl("jiajiao.png");
		if(ptjob.getJbkind().equals("安保"))
			ptjob.setImgurl("anbao.png");
		if(ptjob.getJbkind().equals("促销"))
			ptjob.setImgurl("cuxiao.png");
		if(ptjob.getJbkind().equals("服务员"))
			ptjob.setImgurl("fuwuyuan.png");
		if(ptjob.getJbkind().equals("送餐员"))
			ptjob.setImgurl("songcanyuan.png");
		if(ptjob.getJbkind().equals("客服"))
			ptjob.setImgurl("kefu.png");
		ptjob.setReleasetime(new Date());
		ptjob.setQuantity(0);
		
		ptJobDao.addPtjob(ptjob, businessid);
	}

	@Override
	public void addOneQuantity(Integer ptjobid) {
		// TODO Auto-generated method stub
		ptJobDao.addOneQuantity(ptjobid);
	}

	@Override
	public boolean payForTopJob(Integer ptjobid, String starttime, String endtime,
			Integer businessid) {
		return false;
	}

	@Override
	public Integer getPtjobfCountByState(String state) {
		
		return ptJobDao.getPtjobfCountByState(state);
	}

	@Override
	public List<ManagerPtjobBean> getPtjobfByState(Integer startindex,
			Integer pagesize, String state) {

		List<Ptjob> ptjobs = ptJobDao.getPtjobfByState(startindex, pagesize, state);
		List<ManagerPtjobBean> managerPtjobBeans = new ArrayList<ManagerPtjobBean>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		for(Ptjob ptjob : ptjobs){
			ManagerPtjobBean managerPtjobBean = new ManagerPtjobBean();
			managerPtjobBean.setApplytime(sdf.format(ptjob.getReleasetime()));
			managerPtjobBean.setBusinessname(ptjob.getBusiness().getName());
			managerPtjobBean.setJbkind(ptjob.getJbkind());
			managerPtjobBean.setJbname(ptjob.getJbname());
			managerPtjobBean.setPtjobid(ptjob.getId());
			managerPtjobBean.setSuggest(ptjob.getSuggest());
			managerPtjobBeans.add(managerPtjobBean);
		}
		return managerPtjobBeans;
	}

	@Override
	public void changePtjobfByState(Integer ptjobid, String state,
			String jobverifyMsg) {
		// TODO Auto-generated method stub
		ptJobDao.changePtjobfByState(ptjobid, state, jobverifyMsg);
		
	}



}
