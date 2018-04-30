package com.hfuu.edu.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class ComplainRecord {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String complain;//投诉内容
	private String complaintime; //投诉时间
	private Integer ptjobid;
	private Integer ptuserid;
	private String state;//处理状态 0未处理  1已处理
	private String handletime;//处理时间
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getComplain() {
		return complain;
	}
	public void setComplain(String complain) {
		this.complain = complain;
	}
	public Integer getPtjobid() {
		return ptjobid;
	}
	public String getComplaintime() {
		return complaintime;
	}
	public void setComplaintime(String complaintime) {
		this.complaintime = complaintime;
	}
	public String getHandletime() {
		return handletime;
	}
	public void setHandletime(String handletime) {
		this.handletime = handletime;
	}
	public void setPtjobid(Integer ptjobid) {
		this.ptjobid = ptjobid;
	}
	public Integer getPtuserid() {
		return ptuserid;
	}
	public void setPtuserid(Integer ptuserid) {
		this.ptuserid = ptuserid;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
	
}
