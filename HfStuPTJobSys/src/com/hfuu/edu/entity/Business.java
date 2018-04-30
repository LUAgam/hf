package com.hfuu.edu.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

/**
 * 商家信息
 * @author Administrator
 *
 */
@Entity
public class Business implements Serializable{//Business
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String name;//组织名字
	private String nature;//公司性质
	private String industry;//所属行业
	private String scale;//公司规模
	private String email;
	private String contacts;//联系人
	private String phone;//联系电话
	private String city;//所在城市
	private String address;//公司地址
	private String introduction;//公司简介
	private Double balance;//账户余额
	@OneToMany(mappedBy="business")
	private List<AccountRecord> accountRecords;
	
	@OneToOne
	@JoinColumn(name="user_id")
	private User user;
	@OneToMany(mappedBy="business")
	private Set<Ptjob> ptjobs = new HashSet<Ptjob>();
	
	@OneToMany(mappedBy="bussiness")
	private Set<Comments> comments = new HashSet<Comments>();
	
	private String license;
	
	@Transient
	private MultipartFile licenseForm;
	
	public Set<Comments> getComments() {
		return comments;
	}
	public void setComments(Set<Comments> comments) {
		this.comments = comments;
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
	public String getNature() {
		return nature;
	}
	public Double getBalance() {
		return balance;
	}
	public void setBalance(Double balance) {
		this.balance = balance;
	}
	public List<AccountRecord> getAccountRecords() {
		return accountRecords;
	}
	public void setAccountRecords(List<AccountRecord> accountRecords) {
		this.accountRecords = accountRecords;
	}
	public void setNature(String nature) {
		this.nature = nature;
	}
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public String getScale() {
		return scale;
	}
	public void setScale(String scale) {
		this.scale = scale;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContacts() {
		return contacts;
	}
	public void setContacts(String contacts) {
		this.contacts = contacts;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	/**
	 * @return the license
	 */
	public String getLicense() {
		return license;
	}
	/**
	 * @param license the license to set
	 */
	public void setLicense(String license) {
		this.license = license;
	}
	/**
	 * @return the licenseForm
	 */
	public MultipartFile getLicenseForm() {
		return licenseForm;
	}
	/**
	 * @param licenseForm the licenseForm to set
	 */
	public void setLicenseForm(MultipartFile licenseForm) {
		this.licenseForm = licenseForm;
	}
	
	
	
}
