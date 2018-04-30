package com.hfuu.edu.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
/**
 * 已申请的工作
 * @author Administrator
 *
 */
@Entity
public class JobApply implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private Date applytime;//申请时间
	private String state;//申请状态 :0为已取消申请         1为已报名      2为已通过
	@ManyToOne
	@JoinColumn(name="ptjob_id")
	private Ptjob ptjob;
	@ManyToOne
	@JoinColumn(name="ptuser_id")	
	private Ptuser ptuser;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getApplytime() {
		return applytime;
	}
	public void setApplytime(Date applytime) {
		this.applytime = applytime;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Ptjob getPtjob() {
		return ptjob;
	}
	public void setPtjob(Ptjob ptjob) {
		this.ptjob = ptjob;
	}
	public Ptuser getPtuser() {
		return ptuser;
	}
	public void setPtuser(Ptuser ptuser) {
		this.ptuser = ptuser;
	}

}
