package com.hfuu.edu.common;

import java.util.Date;

public class MyCollect {
	
	private Integer id;
	private String colttime;//收藏时间
	private String jobname;
	private String address;
	private String urlImg;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	
	
	
	public String getColttime() {
		return colttime;
	}
	public void setColttime(String colttime) {
		this.colttime = colttime;
	}
	public String getJobname() {
		return jobname;
	}
	public void setJobname(String jobname) {
		this.jobname = jobname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "MyCollect [id=" + id + ", colttime=" + colttime + ", jobname="
				+ jobname + ", address=" + address + "]";
	}
	public String getUrlImg() {
		return urlImg;
	}
	public void setUrlImg(String urlImg) {
		this.urlImg = urlImg;
	}
	
	
}
