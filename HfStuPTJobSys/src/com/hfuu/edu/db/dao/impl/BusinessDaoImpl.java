package com.hfuu.edu.db.dao.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hfuu.edu.db.dao.BusinessDao;
import com.hfuu.edu.entity.Business;
import com.hfuu.edu.entity.Ptjob;

@Repository
public class BusinessDaoImpl implements BusinessDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addBusiness(Business business) {
		
		business.setBalance(0.0);
		Session session =  sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		session.save(business);
		
		tr.commit();
		session.close();
	}
	
	

	/**
	 * id：职位id  ptjobid
	 */
	@Override
	public Set<Ptjob> getOneBusiness(Integer id) {
		Set<Ptjob> pjs = new HashSet<Ptjob>();
		Session session =  sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		Ptjob ptjob = (Ptjob) session.get(Ptjob.class, id);
		Business b =  (Business) session.get(Business.class, ptjob.getBusiness().getId());
		
			if(null != b){
				pjs = b.getPtjobs();
				pjs.size();
			}
		tr.commit();
		session.close();
		
		return pjs;
	}

	@Override
	public Business getBusinessById(Integer businessid) {
		
		Session session =  sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		Business business = (Business) session.get(Business.class, businessid);
		
		tr.commit();
		session.close();		
		return business;
	}
	
	@Override
	public void changeBusinessMoneyById(Integer businessid,Double money) {
		
		Session session =  sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		Business business = (Business) session.get(Business.class, businessid);
		Double balance = business.getBalance();
		if(null != balance){
			balance = balance + money;
			business.setBalance(balance);
		}
		tr.commit();
		session.close();		
		
	}



	@Override
	public Set<Ptjob> getCurrentBusinessJob(Integer businessid) {
		Set<Ptjob> pjs = new HashSet<Ptjob>();
		Session session =  sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		Business b =  (Business) session.get(Business.class, businessid);
		String hql = "";
			if(null != b){
				for(Ptjob p : b.getPtjobs()){
					if(p.getState().equals("1")){
						pjs.add(p);
					}
						
				}
			}
		tr.commit();
		session.close();
		
		return pjs;
		
	}



	@Override
	public void modifyBusinessMsg(Business business, Integer businessid,String newfilename) {
		
		Session session =  sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		Business b = (Business)session.get(Business.class, businessid);
		if((null != business.getAddress()) && (!"".equals(business.getAddress())))
			b.setAddress(business.getAddress());
		if((null != business.getCity()) && (!"".equals(business.getCity())))
			b.setCity(business.getCity());
		if((null != business.getContacts()) && (!"".equals(business.getContacts())))
			b.setContacts(business.getContacts());
		if((null != business.getEmail()) && (!"".equals(business.getEmail())))
			b.setEmail(business.getEmail());
		if((null != business.getIndustry()) && (!"".equals(business.getIndustry())))
			b.setIndustry(business.getIndustry());
		if((null != business.getIntroduction()) && (!"".equals(business.getIntroduction())))
			b.setIntroduction(business.getIntroduction());
		if((null != business.getName()) && (!"".equals(business.getName())))
			b.setName(business.getName());
		if((null != business.getNature()) && (!"".equals(business.getNature())))
			b.setNature(business.getNature());
		if((null != business.getPhone()) && (!"".equals(business.getPhone())))
			b.setPhone(business.getPhone());
		if((null != business.getScale()) && (!"".equals(business.getScale())))
			b.setScale(business.getScale());
		if((null != newfilename) && (!"".equals(newfilename)))
			b.setLicense(newfilename);
		tr.commit();
		session.close();
		
		
	}
}
