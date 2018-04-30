package com.hfuu.edu.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class Message implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String messsage;//发送内容
	private Integer fromUserid;//发送人id
	private Integer toUserid;//收信人id
	private String sendtime;//发送时间
	private String state;//0为未读，1为已读
	private Integer ptjobid;
	
	public Integer getPtjobid() {
		return ptjobid;
	}
	public void setPtjobid(Integer ptjobid) {
		this.ptjobid = ptjobid;
	}
	public String getSendtime() {
		return sendtime;
	}
	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMesssage() {
		return messsage;
	}
	public void setMesssage(String messsage) {
		this.messsage = messsage;
	}
	public Integer getFromUserid() {
		return fromUserid;
	}
	public void setFromUserid(Integer fromUserid) {
		this.fromUserid = fromUserid;
	}
	public Integer getToUserid() {
		return toUserid;
	}
	public void setToUserid(Integer toUserid) {
		this.toUserid = toUserid;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
	
}
