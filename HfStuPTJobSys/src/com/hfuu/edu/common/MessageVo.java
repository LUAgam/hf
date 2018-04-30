package com.hfuu.edu.common;

import com.hfuu.edu.entity.Message;

public class MessageVo extends Message{
	
	private Integer ptjobid;
	private String ptjobname;
	private Integer businessid;
	private String businessname;
	private String businesscontact;
	private String businesstel;
	private String worktime;
	
	public String getWorktime() {
		return worktime;
	}
	public void setWorktime(String worktime) {
		this.worktime = worktime;
	}
	public Integer getPtjobid() {
		return ptjobid;
	}
	public void setPtjobid(Integer ptjobid) {
		this.ptjobid = ptjobid;
	}
	public String getPtjobname() {
		return ptjobname;
	}
	public void setPtjobname(String ptjobname) {
		this.ptjobname = ptjobname;
	}
	public Integer getBusinessid() {
		return businessid;
	}
	public void setBusinessid(Integer businessid) {
		this.businessid = businessid;
	}
	public String getBusinessname() {
		return businessname;
	}
	public void setBusinessname(String businessname) {
		this.businessname = businessname;
	}
	public String getBusinesscontact() {
		return businesscontact;
	}
	public void setBusinesscontact(String businesscontact) {
		this.businesscontact = businesscontact;
	}
	public String getBusinesstel() {
		return businesstel;
	}
	public void setBusinesstel(String businesstel) {
		this.businesstel = businesstel;
	}
	
	
	

}
