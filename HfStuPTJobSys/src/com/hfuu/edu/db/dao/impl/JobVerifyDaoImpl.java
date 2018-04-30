package com.hfuu.edu.db.dao.impl;

import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hfuu.edu.common.PtjobAndStateNum;
import com.hfuu.edu.db.dao.JobVerifyDao;
import com.hfuu.edu.entity.Ptjob;

@Repository
public class JobVerifyDaoImpl implements JobVerifyDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Map<String, String> getJobStatenum(Integer businessid) {
		return null;
	}

	@Override
	public PtjobAndStateNum getJobStatenum(Integer businessid, String state) {
		
		PtjobAndStateNum ptjobandandstatenum = new PtjobAndStateNum();
 		
		Session session =  sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		String hql = "from Ptjob where business_id = "+businessid+" and state = "+state+"";
		
		String hql1 = "select count(*) from Ptjob where business_id = "+businessid+" and state = "+state+"";
		
		List<Ptjob> ptjobs = session.createQuery(hql).list();
		
		if(ptjobs.size() > 0){
			for(Ptjob ptjob : ptjobs){
				ptjob.getJobverify();
				if(state.equals("2")){
					ptjob.getJobverify();
				}
			}
		}
		Number num =  (Number)(session.createQuery(hql1.toString()).uniqueResult());
		ptjobandandstatenum.setNum(num.intValue());
		ptjobandandstatenum.setPtjobs(ptjobs);
		
		tr.commit();
		session.close();
		return ptjobandandstatenum;
	}
	
	
	
	

}
