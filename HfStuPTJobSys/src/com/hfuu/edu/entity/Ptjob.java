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
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Transient;
/**
 * 职位工作
 * @author Administrator
 *
 */

@Entity
public class Ptjob implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String jbname;  //职位标题
	private String imgurl;  //图片路径
	private Date startdate; //工作开始日期
	private Date enddate;	//工作结束日期	
	private Date releasetime; //发布时间
	private String jbadress; //工作地点
	private String suggest;//suggest  工作具体地址
	private String jbtype;//工作类型
	private String jbkind; //工作种类
	private String worktime;//上班时间
	private String state; //0等待审核    1 正在招聘      2截止报名
	private Double lng;//经度
	private Double lat;//纬度
	@Transient
	private String distance;
	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}

	public Double getLng() {
		return lng;
	}

	public void setLng(Double lng) {
		this.lng = lng;
	}

	public Double getLat() {
		return lat;
	}

	public void setLat(Double lat) {
		this.lat = lat;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Lob 
	@Column(columnDefinition="TEXT", length = 65535) 
	private String jbdetails;//工作详情
	private String recnum;//招聘人数
	private String salary;//工资待遇
	private Integer quantity;//访问量
	
	@ManyToOne
	@JoinColumn(name="business_id")
	private Business business;
	
	
	@ManyToMany(mappedBy="ptjobs")
	private Set<Ptuser> ptusers = new HashSet<Ptuser>();
	

	@OneToMany(mappedBy="ptjob")
	private Set<Comments> comments = new HashSet<Comments>();
	
	@OneToMany(mappedBy="ptjob")
	private Set<JobCollection> jobCollections = new HashSet<JobCollection>();
	
	@OneToMany(mappedBy="ptjob")
	private Set<JobApply> jobApplies = new HashSet<JobApply>();
	
	@OneToOne(mappedBy="ptjob")
	private JobVerify jobverify;
	
	@OneToOne(mappedBy="ptjob")
	private TopJobRecord topJobRecord;
	
	public TopJobRecord getTopJobRecord() {
		return topJobRecord;
	}

	public void setTopJobRecord(TopJobRecord topJobRecord) {
		this.topJobRecord = topJobRecord;
	}

	public JobVerify getJobverify() {
		return jobverify;
	}

	public void setJobverify(JobVerify jobverify) {
		this.jobverify = jobverify;
	}

	public Set<JobApply> getJobApplies() {
		return jobApplies;
	}

	public String getSuggest() {
		return suggest;
	}

	public void setSuggest(String suggest) {
		this.suggest = suggest;
	}

	public void setJobApplies(Set<JobApply> jobApplies) {
		this.jobApplies = jobApplies;
	}

	public Set<Ptuser> getPtusers() {
		return ptusers;
	}

	public void setPtusers(Set<Ptuser> ptusers) {
		this.ptusers = ptusers;
	}


	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getJbkind() {
		return jbkind;
	}

	public void setJbkind(String jbkind) {
		this.jbkind = jbkind;
	}

	public String getJbname() {
		return jbname;
	}


	public void setJbname(String jbname) {
		this.jbname = jbname;
	}


	public Date getStartdate() {
		return startdate;
	}


	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}


	public Date getEnddate() {
		return enddate;
	}


	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}


	public String getJbadress() {
		return jbadress;
	}


	public void setJbadress(String jbadress) {
		this.jbadress = jbadress;
	}


	public String getWorktime() {
		return worktime;
	}


	public void setWorktime(String worktime) {
		this.worktime = worktime;
	}




	public String getJbdetails() {
		return jbdetails;
	}

	public void setJbdetails(String jbdetails) {
		this.jbdetails = jbdetails;
	}


	public Business getBusiness() {
		return business;
	}


	public void setBusiness(Business business) {
		this.business = business;
	}

	public Set<Comments> getComments() {
		return comments;
	}

	public void setComments(Set<Comments> comments) {
		this.comments = comments;
	}

	public Date getReleasetime() {
		return releasetime;
	}

	public void setReleasetime(Date releasetime) {
		this.releasetime = releasetime;
	}

	public String getJbtype() {
		return jbtype;
	}

	public void setJbtype(String jbtype) {
		this.jbtype = jbtype;
	}



	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public Set<JobCollection> getJobCollections() {
		return jobCollections;
	}

	public void setJobCollections(Set<JobCollection> jobCollections) {
		this.jobCollections = jobCollections;
	}

	public String getRecnum() {
		return recnum;
	}

	public void setRecnum(String recnum) {
		this.recnum = recnum;
	}


	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "Ptjob [id=" + id + ", jbname=" + jbname + ", imgurl=" + imgurl
				+ ", startdate=" + startdate + ", enddate=" + enddate
				+ ", releasetime=" + releasetime + ", jbadress=" + jbadress
				+ ", jbtype=" + jbtype + ", jbkind=" + jbkind + ", worktime="
				+ worktime + ", jbdetails=" + jbdetails + ", recnum=" + recnum
				+ ", salary=" + salary + ", quantity=" + quantity + "]";
	}


	
	

}
