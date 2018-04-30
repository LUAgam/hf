package com.hfuu.edu.common;

import com.hfuu.edu.entity.ComplainRecord;

public class ComplainRecordVo extends ComplainRecord{

	private String ptjobname;
	private String businessname;
	private String ptusername;
	private String ptusertel;
	public ComplainRecordVo(String ptjobname, String businessname,
			String ptusername, String ptusertel) {
		super();
		this.ptjobname = ptjobname;
		this.businessname = businessname;
		this.ptusername = ptusername;
		this.ptusertel = ptusertel;
	}
	public ComplainRecordVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getPtjobname() {
		return ptjobname;
	}
	public void setPtjobname(String ptjobname) {
		this.ptjobname = ptjobname;
	}
	public String getBusinessname() {
		return businessname;
	}
	public void setBusinessname(String businessname) {
		this.businessname = businessname;
	}
	public String getPtusername() {
		return ptusername;
	}
	public void setPtusername(String ptusername) {
		this.ptusername = ptusername;
	}
	public String getPtusertel() {
		return ptusertel;
	}
	public void setPtusertel(String ptusertel) {
		this.ptusertel = ptusertel;
	}
	
	
	
}
