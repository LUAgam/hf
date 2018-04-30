package com.hfuu.edu.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class AccountRecord implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String serialnumber;//流水号
	private Date changetime;//账户余额变化时间
	private String changemoney;//存入或支出金钱
	private String moneymsg;//金钱来源或去向
	@ManyToOne
	@JoinColumn(name="business_id")
	private Business business;
	public String getSerialnumber() {
		return serialnumber;
	}
	public void setSerialnumber(String serialnumber) {
		this.serialnumber = serialnumber;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getChangetime() {
		return changetime;
	}
	public void setChangetime(Date changetime) {
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
	public void setMoneymsg(String moneymsg) {
		this.moneymsg = moneymsg;
	}
	public Business getBusiness() {
		return business;
	}
	public void setBusiness(Business business) {
		this.business = business;
	}
}
