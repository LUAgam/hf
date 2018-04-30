package com.hfuu.edu.common;

import java.util.HashSet;
import java.util.Set;

import com.hfuu.edu.entity.Business;
import com.hfuu.edu.entity.Comments;
import com.hfuu.edu.entity.Ptuser;

public class Commentpojo {
	
	private Integer id;
	private String comment;
	private String bsname;
	private String ptusername;
	private Set<Commentpojo> comments = new HashSet<Commentpojo>();
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
	public String getBsname() {
		return bsname;
	}
	public void setBsname(String bsname) {
		this.bsname = bsname;
	}
	public String getPtusername() {
		return ptusername;
	}
	public void setPtusername(String ptusername) {
		this.ptusername = ptusername;
	}
	public Set<Commentpojo> getComments() {
		return comments;
	}
	public void setComments(Set<Commentpojo> comments) {
		this.comments = comments;
	}
	@Override
	public String toString() {
		return "Commentpojo [id=" + id + ", comment=" + comment + ", bsname="
				+ bsname + ", ptusername=" + ptusername + ", comments="
				+ comments + "]";
	}
	
	
	
	
	
	
	

}
