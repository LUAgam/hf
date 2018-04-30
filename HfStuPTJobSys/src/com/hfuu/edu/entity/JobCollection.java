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
 * 已收藏的工作
 * @author Administrator
 *
 */
@Entity
public class JobCollection implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private Date colttime;//收藏时间
	
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


	public Date getColttime() {
		return colttime;
	}


	public void setColttime(Date colttime) {
		this.colttime = colttime;
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


