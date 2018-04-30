package com.hfuu.edu.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
/**
 * 职位用户信息
 * @author Administrator
 *
 */
@Entity
public class Ptuser implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String name;
	private String birthday;
	private String phone;//手机号
	private String height;//身高
	private String school;//学校
	private String imgurl;
	private String sex;
	private String eamil;
	private String qq;//qq
	private String city;
	@Column(length=1000000000)
	private String experience;//经验
	@Column(length=1000000000)
	private String resume;//简历
	
	private String fujian;
	@OneToOne
	@JoinColumn(name="user_id")
	private User user;
	
	
	@OneToMany(mappedBy="ptuser")
	private Set<Comments> Comments = new HashSet<Comments>();
	
	@ManyToMany
	@JoinTable(
			name="ptuser_ptjob",
			joinColumns={@JoinColumn(name="ptuser_id")},
			inverseJoinColumns={@JoinColumn(name="ptjob_id")}
		)
	private Set<Ptjob> ptjobs = new HashSet<Ptjob>();
	
	@OneToMany(mappedBy="ptuser")
	private Set<JobCollection> jobCollections = new HashSet<JobCollection>();
	
	@OneToMany(mappedBy="ptuser")
	private Set<JobApply> jobApplies = new HashSet<JobApply>();
	
	
	public Set<JobApply> getJobApplies() {
		return jobApplies;
	}
	public void setJobApplies(Set<JobApply> jobApplies) {
		this.jobApplies = jobApplies;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<Ptjob> getPtjobs() {
		return ptjobs;
	}
	public void setPtjobs(Set<Ptjob> ptjobs) {
		this.ptjobs = ptjobs;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	
	
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEamil() {
		return eamil;
	}
	public void setEamil(String eamil) {
		this.eamil = eamil;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
	
	public Set<Comments> getComments() {
		return Comments;
	}
	public void setComments(Set<Comments> comments) {
		Comments = comments;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public Set<JobCollection> getJobCollections() {
		return jobCollections;
	}
	public void setJobCollections(Set<JobCollection> jobCollections) {
		this.jobCollections = jobCollections;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	/**
	 * @return the fujian
	 */
	public String getFujian() {
		return fujian;
	}
	/**
	 * @param fujian the fujian to set
	 */
	public void setFujian(String fujian) {
		this.fujian = fujian;
	}
	
}
