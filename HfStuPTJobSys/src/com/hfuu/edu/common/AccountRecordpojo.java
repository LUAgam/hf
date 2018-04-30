package com.hfuu.edu.common;

import java.util.Date;

public class AccountRecordpojo {
	
	private Integer id;
	private String serialnumber;//流水号
	private String changetime;//账户余额变化时间
	private String changemoney;//存入或支出金钱
	private String moneymsg;//金钱来源或去向
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getChangetime() {
		return changetime;
	}
	public void setChangetime(String changetime) {
		this.changetime = changetime;
	}
	public String getChangemoney() {
		return changemoney;
	}
	public void setChangemoney(String changemoney) {
		this.changemoney = changemoney;
	}
	public String getMoneymsg() {
		return moneymsg;
	}
	public String getSerialnumber() {
		return serialnumber;
	}
	public void setSerialnumber(String serialnumber) {
		this.serialnumber = serialnumber;
	}
	public void setMoneymsg(String moneymsg) {
		this.moneymsg = moneymsg;
	}

}
