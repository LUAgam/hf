package com.hfuu.edu.db.dao.impl;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hfuu.edu.db.dao.PtuserDao;
import com.hfuu.edu.entity.Ptuser;

@Repository
public class PtuserDaoImpl implements PtuserDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addPtuser(Ptuser ptuser) {
		
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		session.save(ptuser);
		
		tr.commit();
		session.close();

	}

	@Override
	public void modifyPtuserMsg(Ptuser ptuser, Integer ptuserid) {
		
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		Ptuser ptu = (Ptuser) session.get(Ptuser.class, ptuserid);
		
		if((null != ptuser.getBirthday()) && (!"".equals(ptuser.getBirthday().trim())))
			ptu.setBirthday(ptuser.getBirthday());
		if((null != ptuser.getCity()) && (!"".equals(ptuser.getCity().trim())))
			ptu.setCity(ptuser.getCity());
		if((null != ptuser.getEamil()) && (!"".equals(ptuser.getEamil().trim())))
			ptu.setEamil(ptuser.getEamil());
		if((null != ptuser.getExperience()) && (!"".equals(ptuser.getExperience().trim())))
			ptu.setExperience(ptuser.getExperience());
		if((null != ptuser.getHeight()) && (!"".equals(ptuser.getHeight().trim())))
			ptu.setHeight(ptuser.getHeight());
		if((null != ptuser.getName()) && (!"".equals(ptuser.getName().trim())))
			ptu.setName(ptuser.getName());
		if((null != ptuser.getPhone()) && (!"".equals(ptuser.getPhone().trim())))
			ptu.setPhone(ptuser.getPhone());
		if((null != ptuser.getQq()) && (!"".equals(ptuser.getQq().trim())))
			ptu.setQq(ptuser.getQq());
		if((null != ptuser.getResume()) && (!"".equals(ptuser.getResume().trim())))
			ptu.setResume(ptuser.getResume());
		if((null != ptuser.getSchool()) && (!"".equals(ptuser.getSchool().trim())))
			ptu.setSchool(ptuser.getSchool());
		if((null != ptuser.getSex()) && (!"".equals(ptuser.getSex().trim())))
			ptu.setSex(ptuser.getSex());
		if((null != ptuser.getImgurl()) && (!"".equals(ptuser.getImgurl().trim())))
			ptu.setImgurl(ptuser.getImgurl());
		if((null != ptuser.getFujian()) && (!"".equals(ptuser.getFujian().trim())))
			ptu.setFujian(ptuser.getFujian());
		
		session.save(ptu);
		tr.commit();
		session.close();
		
		
		
		
	}

	@Override
	public Ptuser getPtuserByid(Integer userid) {
		
		Ptuser ptuser = new Ptuser();
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
			String hql = "from Ptuser where user_id = "+userid+"";
			
			List<Ptuser> list = session.createQuery(hql).list();
			
			for(Ptuser p : list){
				ptuser = p;
			}
			
		
		tr.commit();
		session.close();
		return ptuser;
	}
	
	public Ptuser getPtuserByptuserid(Integer userid) {
		
		Ptuser ptuser = new Ptuser();
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
			String hql = "from Ptuser where id = "+userid+"";
			
			List<Ptuser> list = session.createQuery(hql).list();
			
			for(Ptuser p : list){
				ptuser = p;
			}
			
		
		tr.commit();
		session.close();
		return ptuser;
	}

	@Override
	public String getPtuserImg(Integer ptuserid) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
			Ptuser ptuser = (Ptuser)session.get(Ptuser.class, ptuserid);
		String imgUrl = ptuser.getImgurl();
		tr.commit();
		session.close();
		return imgUrl;
	}

	

}
