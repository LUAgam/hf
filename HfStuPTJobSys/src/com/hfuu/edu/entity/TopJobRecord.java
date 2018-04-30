package com.hfuu.edu.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class TopJobRecord implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private Date startdate;
	private Date enddate;
	private Date currentdate;
	private String State;
	@OneToOne
	@JoinColumn(name="ptjob_id")
	private Ptjob ptjob;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public Date getEnddate() {
		return enddate; 
		
	}
	public Ptjob getPtjob() {
		return ptjob;
	}
	public void setPtjob(Ptjob ptjob) {
		this.ptjob = ptjob;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public Date getCurrentdate() {
		return currentdate;
	}
	public void setCurrentdate(Date currentdate) {
		this.currentdate = currentdate;
	}
	
	
	
	
	
	
	
}
