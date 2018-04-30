package com.hfuu.edu.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
/**
 * 用户表
 * @author Administrator
 *
 */
@Entity
public class User implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String username;
	private String password;
	
	@OneToOne(mappedBy="user")
	private Ptuser ptuser;
	@OneToOne(mappedBy="user")
	private Business business;
	private String state;
	
	
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Ptuser getPtuser() {
		return ptuser;
	}
	public void setPtuser(Ptuser ptuser) {
		this.ptuser = ptuser;
	}
	public Business getBusiness() {
		return business;
	}
	public void setBusiness(Business business) {
		this.business = business;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", ptuser=" + ptuser
				+ ", business=" + business.toString() + "]";
	}
 
	
}
