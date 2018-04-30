package com.hfuu.edu.db.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hfuu.edu.common.ChectList;
import com.hfuu.edu.common.QueryResult;
import com.hfuu.edu.db.dao.ApplyDao;
import com.hfuu.edu.entity.JobApply;
import com.hfuu.edu.entity.JobVerify;
import com.hfuu.edu.entity.Ptjob;
import com.hfuu.edu.entity.Ptuser;

@Repository
public class ApplyDaoImpl implements ApplyDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Boolean selectOneJobApplyByState(Integer ptjobid, Integer ptuserid) {
		Boolean flag = false;
		
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
			

		String hql = "from JobApply where ptjob_id= "+ptjobid+" and ptuser_id = "+ptuserid+" and state = '1'";
		
		Query query = session.createQuery(hql);
		
		List<JobApply> jobapplys = query.list();
		
		if((null != jobapplys) && (jobapplys.size()>0))
			flag = true;
		
		tr.commit();
		session.close();
		
		return flag;
	}
	
	
	@Override
	public void addOneMyApply(Integer ptjobid, Integer ptuserid) {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		JobApply jobapply = new JobApply();
		Ptjob ptjob = (Ptjob) session.get(Ptjob.class, ptjobid);
		Ptuser ptuser = (Ptuser) session.get(Ptuser.class, ptuserid);
		jobapply.setApplytime(new Date());
		jobapply.setPtjob(ptjob);
		jobapply.setPtuser(ptuser);
		jobapply.setState("1");//1为已报名 但还未通过
		session.save(jobapply);
		
		tr.commit();
		session.close();

	}
	
	
	

	@Override
	public void cancelMyApply(Integer myapplyid) {
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		JobApply jobapply =	(JobApply) session.get(JobApply.class, myapplyid);
		jobapply.setState("0");//0为取消报名
		session.save(jobapply);
		
		tr.commit();
		session.close();
		
	}

	@Override
	public void passApply(Integer ptjobid, Integer ptuserid) {
		
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		String hql = "from JobApply where ptjob_id= "+ptjobid+" and ptuser_id = "+ptuserid+" and state = '1'";
		Query query = session.createQuery(hql);
		
		List<JobApply> jobapplys = query.list();
		for(JobApply jobapply : jobapplys){
			
			jobapply.setState("2");//2为已通过 
			session.save(jobapply);
		}
		
		
		tr.commit();
		session.close();
		
	}


	@Override
	public List<JobApply> selectAllApplyById(Integer ptuserid) {
		
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		
		String hql = "from JobApply where ptuser_id = "+ptuserid+" order by applytime desc";
		
		Query query = session.createQuery(hql);
		
		List<JobApply> jobapplys = query.list();
		
		
		
		for(JobApply jobapply : jobapplys){
			
			jobapply.getPtjob();
			System.out.println(jobapply.getPtjob().getJbname());
		}
		
		tr.commit();
		session.close();
		
		return jobapplys;
	}


	@Override
	public QueryResult getCheckList(Integer ptjobid, String state,int startindex,
			int pagesize) {
		
		QueryResult qr = new QueryResult();
		Session session = sessionFactory.openSession();
		
		StringBuffer hql = new StringBuffer();
		hql.append("from JobApply where ptjob_id = "+ptjobid+" and state = "+state+"");
		StringBuffer hql1 = new StringBuffer();
		 hql1.append("select count(*) from JobApply where ptjob_id = "+ptjobid+" and state = "+state+"");
		 
		 
		Query query = session.createQuery(hql.toString());
		query.setFirstResult(startindex);
		query.setMaxResults(pagesize);
		List<JobApply> list = query.list();
		qr.setList(list);
		if(list.size() > 0){
			for(JobApply jobapply:list){
				
				jobapply.getPtuser();
				
				
			}
			
		}
		
		
		Number num =  (Number)(session.createQuery(hql1.toString()).uniqueResult());
		qr.setTotalrecord(num.intValue());
		session.close();
		return qr;
		
		
	}


	@Override
	public void modifyState(Integer jobappplyid) {
		
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		JobApply jobapply =	(JobApply) session.get(JobApply.class, jobappplyid);
		jobapply.setState("2");//2为报名通过
		Integer ptjobid = jobapply.getPtjob().getId();
		String hql1 = "from JobVerify where ptjob_id= "+ptjobid+"";
		List<JobVerify> jobverifys = session.createQuery(hql1).list();
		for(JobVerify jv : jobverifys){
			int newnum = Integer.parseInt(jv.getEmployeenum())+1;
			jv.setEmployeenum(String.valueOf(newnum));
		}
		session.save(jobapply);
		
		tr.commit();
		session.close();
		
	}




	
	

}
