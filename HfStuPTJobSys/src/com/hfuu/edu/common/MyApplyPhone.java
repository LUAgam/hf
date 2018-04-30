package com.hfuu.edu.common;

public class MyApplyPhone {
	
	private Integer ptjobid;
	private String ptjobname;
	private String jobaddress;
	private String timedistance;
	private String imgurl;//职位类型对应的图片
	private String state; //申请状态 :0为已取消申请         1为已报名      2为已通过
	
	
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public String getPtjobname() {
		return ptjobname;
	}
	public void setPtjobname(String ptjobname) {
		this.ptjobname = ptjobname;
	}
	public Integer getPtjobid() {
		return ptjobid;
	}
	public void setPtjobid(Integer ptjobid) {
		this.ptjobid = ptjobid;
	}
	public String getJobaddress() {
		return jobaddress;
	}
	public void setJobaddress(String jobaddress) {
		this.jobaddress = jobaddress;
	}
	public String getTimedistance() {
		return timedistance;
	}
	public void setTimedistance(String timedistance) {
		this.timedistance = timedistance;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	

}
