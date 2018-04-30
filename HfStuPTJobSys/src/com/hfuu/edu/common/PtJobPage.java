package com.hfuu.edu.common;

import java.util.Date;

public class PtJobPage {
	
	private Integer id;
	private String jbname;  //职位标题
	private String imgurl;  //图片路径
	private String startdate; //工作开始日期
	private String enddate;	//工作结束日期	
	private Date releasetime; //发布时间
	private String jbadress; //工作地点
	private String jbtype;//工作类型
	private String jbkind; //工作种类
	private String worktime;//上班时间
	private String jbdetails;//工作详情
	private String recnum;//招聘人数
	private String salary;//工资待遇
	private String quantity;//访问量
	private String timedistance;//发布时间距离当前时间
	private String businessname;
	private String businessphone;
	private String suggest;//职位工作的具体位置
	private String topjobstate;//若为置顶职位则标记为1   否则不赋值
	private String distance;
	
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}
	public String getTopjobstate() {
		return topjobstate;
	}
	public void setTopjobstate(String topjobstate) {
		this.topjobstate = topjobstate;
	}
	public String getSuggest() {
		return suggest;
	}
	public void setSuggest(String suggest) {
		this.suggest = suggest;
	}
	public String getBusinessphone() {
		return businessphone;
	}
	public void setBusinessphone(String businessphone) {
		this.businessphone = businessphone;
	}
	public String getBusinessname() {
		return businessname;
	}
	public void setBusinessname(String businessname) {
		this.businessname = businessname;
	}
	public String getTimedistance() {
		return timedistance;
	}
	public void setTimedistance(String timedistance) {
		this.timedistance = timedistance;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getJbname() {
		return jbname;
	}
	public void setJbname(String jbname) {
		this.jbname = jbname;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public Date getReleasetime() {
		return releasetime;
	}
	public void setReleasetime(Date releasetime) {
		this.releasetime = releasetime;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getJbadress() {
		return jbadress;
	}
	public void setJbadress(String jbadress) {
		this.jbadress = jbadress;
	}
	public String getJbtype() {
		return jbtype;
	}
	public void setJbtype(String jbtype) {
		this.jbtype = jbtype;
	}
	public String getJbkind() {
		return jbkind;
	}
	public void setJbkind(String jbkind) {
		this.jbkind = jbkind;
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
	public String getRecnum() {
		return recnum;
	}
	public void setRecnum(String recnum) {
		this.recnum = recnum;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "PtJobPage [id=" + id + ", jbname=" + jbname + ", imgurl="
				+ imgurl + ", startdate=" + startdate + ", enddate=" + enddate
				+ ", releasetime=" + releasetime + ", jbadress=" + jbadress
				+ ", jbtype=" + jbtype + ", jbkind=" + jbkind + ", worktime="
				+ worktime + ", jbdetails=" + jbdetails + ", recnum=" + recnum
				+ ", salary=" + salary + ", quantity=" + quantity
				+ ", timedistance=" + timedistance + "]";
	}
	
	

}
