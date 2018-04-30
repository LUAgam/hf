package com.hfuu.edu.common;

public class ChectList {
	
	private Integer id;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	private Integer userid;
	private String name;
	private String age;
	private String sex;
	private String applytime;
	private String school;
	private Integer ptuserid;
	private String imgurl;
	
	
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public Integer getPtuserid() {
		return ptuserid;
	}
	public void setPtuserid(Integer ptuserid) {
		this.ptuserid = ptuserid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getApplytime() {
		return applytime;
	}
	public void setApplytime(String applytime) {
		this.applytime = applytime;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	@Override
	public String toString() {
		return "ChectList [id=" + id + ", name=" + name + ", age=" + age
				+ ", sex=" + sex + ", applytime=" + applytime + ", school="
				+ school + "]";
	}

}
