package com.hfuu.edu.db.dao.impl;


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hfuu.edu.common.MyCollect;
import com.hfuu.edu.db.dao.CollectDao;
import com.hfuu.edu.entity.JobCollection;
import com.hfuu.edu.entity.Ptjob;
import com.hfuu.edu.entity.Ptuser;
import com.hfuu.edu.entity.User;

@Repository
public class CollectDaoImpl implements CollectDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Set<JobCollection> getUserCollectByUserId(Integer userid) {
		
		Set<JobCollection> collects = new HashSet<JobCollection>();
		
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		User user = (User) session.get(User.class, userid);
		if(null != user){
			collects = user.getPtuser().getJobCollections();
			if(collects.size()>0){
				for(JobCollection jc : collects){
					
					jc.getPtjob();
				}
			}
		}
		
		
		tr.commit();
		session.close();
		
		return collects;
	}

	@Override
	public void saveOneCollect(Integer ptjobid, Integer ptuserid) {
		
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
			JobCollection jc = new JobCollection();
			Ptjob ptjob = (Ptjob) session.get(Ptjob.class, ptjobid);
			Ptuser ptuser = (Ptuser) session.get(Ptuser.class,ptuserid);
			jc.setColttime(new Date());
			jc.setPtjob(ptjob);
			jc.setPtuser(ptuser);
			session.save(jc);
		
		tr.commit();
		session.close();
		
	}

	@Override
	public void deleteOneCollect(Integer mycollectid) {
		
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		JobCollection  jc =	(JobCollection) session.get(JobCollection.class, mycollectid);
		session.delete(jc);

		tr.commit();
		session.close();
		
	}

}
