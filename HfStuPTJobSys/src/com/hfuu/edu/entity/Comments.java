package com.hfuu.edu.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

/**
 * 职位相关评论
 * @author Administrator
 *
 */
@Entity
public class Comments implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String comment;
	
	@ManyToOne
	@JoinColumn(name="business_id")
	private Business bussiness;
	
	@ManyToOne
	@JoinColumn(name="ptuser_id")
	private Ptuser ptuser;
	

	@ManyToOne
	@JoinColumn(name="ptjob_id")
	private Ptjob ptjob;
	
	@ManyToOne
	@JoinColumn(name="parent_id")
	private Comments parent;
	
	@OneToMany(mappedBy="parent")
	private Set<Comments> childen = new HashSet<Comments>();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Ptjob getPtjob() {
		return ptjob;
	}

	public void setPtjob(Ptjob ptjob) {
		this.ptjob = ptjob;
	}

	public Comments getParent() {
		return parent;
	}

	public void setParent(Comments parent) {
		this.parent = parent;
	}

	public Set<Comments> getChilden() {
		return childen;
	}

	public void setChilden(Set<Comments> childen) {
		this.childen = childen;
	}
	
	public Business getBussiness() {
		return bussiness;
	}

	public void setBussiness(Business bussiness) {
		this.bussiness = bussiness;
	}

	public Ptuser getPtuser() {
		return ptuser;
	}

	public void setPtuser(Ptuser ptuser) {
		this.ptuser = ptuser;
	}
	
	
	
}
