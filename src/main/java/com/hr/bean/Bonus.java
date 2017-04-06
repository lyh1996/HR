package com.hr.bean;

import java.io.Serializable;

import com.hr.web.utils.Page;

public class Bonus implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6443299893147326185L;
	
	private Integer bon_id ;
	private Integer  major_kind_id ;
	private String major_kind_name ;
	private Integer major_id ;
	private String major_name ;
	private Integer human_id ;
	private String human_name ;
	private String bonus_item ;
	private  Double  bonus_worth ;
	private String bonus_degree ;
	private String remark;
	private String register ;
	private String checker ;
	private String regist_time ;
	private String check_time ;
	private Integer check_status ;
	
	private Page page;

	public Integer getBon_id() {
		return bon_id;
	}

	public void setBon_id(Integer bon_id) {
		this.bon_id = bon_id;
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

	public String getBonus_item() {
		return bonus_item;
	}

	public void setBonus_item(String bonus_item) {
		this.bonus_item = bonus_item;
	}

	public Double getBonus_worth() {
		return bonus_worth;
	}

	public void setBonus_worth(Double bonus_worth) {
		this.bonus_worth = bonus_worth;
	}

	public String getBonus_degree() {
		return bonus_degree;
	}

	public void setBonus_degree(String bonus_degree) {
		this.bonus_degree = bonus_degree;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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

	public Integer getCheck_status() {
		return check_status;
	}

	public void setCheck_status(Integer check_status) {
		this.check_status = check_status;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	@Override
	public String toString() {
		return "Bonus [bon_id=" + bon_id + ", major_kind_id=" + major_kind_id + ", major_kind_name=" + major_kind_name
				+ ", major_id=" + major_id + ", major_name=" + major_name + ", human_id=" + human_id + ", human_name="
				+ human_name + ", bonus_item=" + bonus_item + ", bonus_worth=" + bonus_worth + ", bonus_degree="
				+ bonus_degree + ", remark=" + remark + ", register=" + register + ", checker=" + checker
				+ ", regist_time=" + regist_time + ", check_time=" + check_time + ", check_status=" + check_status
				+ ", page=" + page + "]";
	}
	

}
