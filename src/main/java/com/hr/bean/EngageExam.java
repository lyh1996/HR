package com.hr.bean;

import java.io.Serializable;

public class EngageExam implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -853574555623923309L;

	private Integer exa_id ;
	private String exam_number ;
	private Integer  major_kind_id ;
	private String major_kind_name ;
	private Integer major_id ;
	private String major_name ;
	private String register;
	private String regist_time;
	private Integer limite_time ;
	private Integer totalCount ;
	 
	
	 
	 
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	public Integer getExa_id() {
		return exa_id;
	}
	public void setExa_id(Integer exa_id) {
		this.exa_id = exa_id;
	}
	public String getExam_number() {
		return exam_number;
	}
	public void setExam_number(String exam_number) {
		this.exam_number = exam_number;
	}
	public Integer getMajor_kind_id() {
		return major_kind_id;
	}
	public void setMajor_kind_id(Integer major_kind_id) {
		this.major_kind_id = major_kind_id;
	}
	public String getMajor_kind_name() {
		return major_kind_name;
	}
	public void setMajor_kind_name(String major_kind_name) {
		this.major_kind_name = major_kind_name;
	}
	public Integer getMajor_id() {
		return major_id;
	}
	public void setMajor_id(Integer major_id) {
		this.major_id = major_id;
	}
	public String getMajor_name() {
		return major_name;
	}
	public void setMajor_name(String major_name) {
		this.major_name = major_name;
	}
	public String getRegister() {
		return register;
	}
	public void setRegister(String register) {
		this.register = register;
	}
	public String getRegist_time() {
		return regist_time;
	}
	public void setRegist_time(String regist_time) {
		this.regist_time = regist_time;
	}
	public Integer getLimite_time() {
		return limite_time;
	}
	public void setLimite_time(Integer limite_time) {
		this.limite_time = limite_time;
	}
	@Override
	public String toString() {
		return "EngageExam [exa_id=" + exa_id + ", exam_number=" + exam_number + ", major_kind_id=" + major_kind_id
				+ ", major_kind_name=" + major_kind_name + ", major_id=" + major_id + ", major_name=" + major_name
				+ ", register=" + register + ", regist_time=" + regist_time + ", limite_time=" + limite_time
				+ ", totalCount=" + totalCount + "]";
	}
	 
	
	
	
}
