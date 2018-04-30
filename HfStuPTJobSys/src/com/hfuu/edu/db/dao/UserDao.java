package com.hfuu.edu.db.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hfuu.edu.entity.ManagerUser;
import com.hfuu.edu.entity.User;

public interface UserDao {
	
	public void addUser(User user);
	
	public User getUser(String username);
	
	public User getUserMsg(User u);
	
	public List<User> getLoginUser(String username,String state);
	

	public void modifyUserPasswordById(Integer userId, String newPassword);
	
	public ManagerUser loginForManger(String username);

}
