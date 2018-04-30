package com.hfuu.edu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hfuu.edu.db.dao.UserDao;
import com.hfuu.edu.entity.ManagerUser;
import com.hfuu.edu.entity.User;
import com.hfuu.edu.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;

	@Override
	public void addUser(User user) {
		
		userDao.addUser(user);
		
	}

	@Override
	public User getUser(String username) {
		
		return userDao.getUser(username);
	}

	@Override
	public List<User> getLoginUser(String username, String state) {
		
		return userDao.getLoginUser(username, state);
	}

	@Override
	public void modifyUserPasswordById(Integer userId, String newPassword) {
		// TODO Auto-generated method stub
		userDao.modifyUserPasswordById(userId, newPassword);
	}

	@Override
	public ManagerUser loginForManger(String username) {
		return userDao.loginForManger(username);
	}


}
