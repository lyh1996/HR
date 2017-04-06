package com.hr.bean;

import java.io.Serializable;

import com.hr.web.utils.Page;

public class Training implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1276214388025167428L;
	private Integer tra_id ;
	private Integer major_kind_id ;
	private String major_kind_name;
	private Integer major_id ;
	private String major_name ;
	private Integer human_id ;
	private String human_name ;
	private String training_item ;
	private String training_time ;
	private Double  training_hour;
	private String training_degree ;
	private String register;
	private String checker ;
	private String regist_time ;
	private String check_time ;
	private Integer checkstatus;
	private String remark ;
	private Page page;
	public Integer getTra_id() {
		return tra_id;
	}
	public void setTra_id(Integer tra_id) {
		this.tra_id = tra_id;
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
	public Integer getHuman_id() {
		return human_id;
	}
	public void setHuman_id(Integer human_id) {
		this.human_id = human_id;
	}
	public String getHuman_name() {
		return human_name;
	}
	public void setHuman_name(String human_name) {
		this.human_name = human_name;
	}
	public String getTraining_item() {
		return training_item;
	}
	public void setTraining_item(String training_item) {
		this.training_item = training_item;
	}
	public String getTraining_time() {
		return training_time;
	}
	public void setTraining_time(String training_time) {
		this.training_time = training_time;
	}
	public Double getTraining_hour() {
		return training_hour;
	}
	public void setTraining_hour(Double training_hour) {
		this.training_hour = training_hour;
	}
	public String getTraining_degree() {
		return training_degree;
	}
	public void setTraining_degree(String training_degree) {
		this.training_degree = training_degree;
	}
	public String getRegister() {
		return register;
	}
	public void setRegister(String register) {
		this.register = register;
	}
	public String getChecker() {
		return checker;
	}
	public void setChecker(String checker) {
		this.checker = checker;
	}
	public String getRegist_time() {
		return regist_time;
	}
	public void setRegist_time(String regist_time) {
		this.regist_time = regist_time;
	}
	public String getCheck_time() {
		return check_time;
	}
	public void setCheck_time(String check_time) {
		this.check_time = check_time;
	}
	public Integer getCheckstatus() {
		return checkstatus;
	}
	public void setCheckstatus(Integer checkstatus) {
		this.checkstatus = checkstatus;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	@Override
	public String toString() {
		return "Training [tra_id=" + tra_id + ", major_kind_id=" + major_kind_id + ", major_kind_name="
				+ major_kind_name + ", major_id=" + major_id + ", major_name=" + major_name + ", human_id=" + human_id
				+ ", human_name=" + human_name + ", training_item=" + training_item + ", training_time=" + training_time
				+ ", training_hour=" + training_hour + ", training_degree=" + training_degree + ", register=" + register
				+ ", checker=" + checker + ", regist_time=" + regist_time + ", check_time=" + check_time
				+ ", checkstatus=" + checkstatus + ", remark=" + remark + ", page=" + page + "]";
	}
	
	

}
