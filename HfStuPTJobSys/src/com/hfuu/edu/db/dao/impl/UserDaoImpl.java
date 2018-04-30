package com.hfuu.edu.db.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hfuu.edu.db.dao.UserDao;
import com.hfuu.edu.entity.ManagerUser;
import com.hfuu.edu.entity.User;

@Repository
public class UserDaoImpl implements UserDao{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addUser(User user) {
		
		Session session =  sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		session.save(user);
		
		tr.commit();
		session.close();
		
		
	}

	@Override
	public User getUser(String username) {
		
		User u = new User();
		Session session =  sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		String hql = "from User where username = "+username+"";
		
		List<User> users = session.createQuery(hql).list();
		
		if(users.size() > 0){
			for(User user : users){
				u = user;
			}
		}
		
		tr.commit();
		session.close();
		
		return u;
	}

	@Override
	public List<User> getLoginUser(String username, String state) {
		
		Session session =  sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		String hql = "from User where username = '"+username+"' and state = '"+state+"'";
		Query query = session.createQuery(hql);
		
		List<User> users = query.list();
		
		if(users.size() > 0){
			for(User u : users){
				u.getBusiness();
				u.getPtuser();
			}
		}
		
		tr.commit();
		session.close();
		
		System.out.println("-----------"+users.size());
		
		return users;
	}
	
	public User getUserMsg(User u){
		User user = new User();
		Session session =  sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		if(null != u){
			user = (User) session.get(User.class,u.getId());
		}
		
		tr.commit();
		session.close();
		return user;
		
	}


	@Override
	public void modifyUserPasswordById(Integer userId, String newPassword) {
		// TODO Auto-generated method stub
		Session session =  sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
			
		User user = (User) session.get(User.class, userId);
		user.setPassword(newPassword);
		
		
		tr.commit();
		session.close();
	}

	@Override
	public ManagerUser loginForManger(String username) {
		
		Session session =  sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		ManagerUser managerUser = new ManagerUser();	
		String hql = "from ManagerUser where username='"+username+"'";
		List<ManagerUser> list = session.createQuery(hql).list();
		if(null != list){
			for(ManagerUser mu : list){
				managerUser = mu;
			}
		}
		
		tr.commit();
		session.close();
		return managerUser;
	}
	


}
