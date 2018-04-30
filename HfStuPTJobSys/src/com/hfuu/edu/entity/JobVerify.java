package com.hfuu.edu.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
/**
 * 职位工作下架详情  招聘人数
 * @author chengzige
 *
 */
@Entity
public class JobVerify implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String employeenum;
	private String undercarriagemsg;
	
	@OneToOne
	@JoinColumn(name="ptjob_id")
	private Ptjob ptjob;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEmployeenum() {
		return employeenum;
	}

	public void setEmployeenum(String employeenum) {
		this.employeenum = employeenum;
	}

	public String getUndercarriagemsg() {
		return undercarriagemsg;
	}

	public void setUndercarriagemsg(String undercarriagemsg) {
		this.undercarriagemsg = undercarriagemsg;
	}

	public Ptjob getPtjob() {
		return ptjob;
	}

	public void setPtjob(Ptjob ptjob) {
		this.ptjob = ptjob;
	}
	
	
	
	
	
}
