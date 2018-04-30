package com.hfuu.edu.service;

import java.util.List;

import com.hfuu.edu.entity.ManagerUser;
import com.hfuu.edu.entity.User;

public interface UserService {
	
	public void addUser(User user);
	
	public User getUser(String username);
	
	public List<User> getLoginUser(String username,String state);
	
	public void modifyUserPasswordById(Integer userId,String newPassword);

	public ManagerUser loginForManger(String username);
	
}
