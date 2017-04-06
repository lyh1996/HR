package com.hr.bean;

import java.io.Serializable;

import com.hr.web.utils.Page;

public class EngageMajorRelease implements Serializable {
	
	private static final long serialVersionUID = -5855163977245493907L;
	
	private Integer mre_id;
     private Integer first_kind_id;
     private String first_kind_name;
     private Integer second_kind_id;
     private String second_kind_name;
     private Integer third_kind_id;
     private String third_kind_name;
     private Integer major_kind_id;
     private String major_kind_name;
     private Integer major_id;
     private String major_name;
     private Integer human_amount;
     private String engage_type;
     private String deadline;
     private String register;
     private String changer;
     private String regist_time;
     private String change_time;
     private String major_describe;
     private String engage_required;
     private Page page;
     
	public Integer getMre_id() {
		return mre_id;
	}
	public void setMre_id(Integer mre_id) {
		this.mre_id = mre_id;
	}
	public Integer getFirst_kind_id() {
		return first_kind_id;
	}
	public void setFirst_kind_id(Integer first_kind_id) {
		this.first_kind_id = first_kind_id;
	}
	public String getFirst_kind_name() {
		return first_kind_name;
	}
	public void setFirst_kind_name(String first_kind_name) {
		this.first_kind_name = first_kind_name;
	}
	public Integer getSecond_kind_id() {
		return second_kind_id;
	}
	public void setSecond_kind_id(Integer second_kind_id) {
		this.second_kind_id = second_kind_id;
	}
	public String getSecond_kind_name() {
		return second_kind_name;
	}
	public void setSecond_kind_name(String second_kind_name) {
		this.second_kind_name = second_kind_name;
	}
	public Integer getThird_kind_id() {
		return third_kind_id;
	}
	public void setThird_kind_id(Integer third_kind_id) {
		this.third_kind_id = third_kind_id;
	}
	public String getThird_kind_name() {
		return third_kind_name;
	}
	public void setThird_kind_name(String third_kind_name) {
		this.third_kind_name = third_kind_name;
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
	public Integer getHuman_amount() {
		return human_amount;
	}
	public void setHuman_amount(Integer human_amount) {
		this.human_amount = human_amount;
	}
	public String getEngage_type() {
		return engage_type;
	}
	public void setEngage_type(String engage_type) {
		this.engage_type = engage_type;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public String getRegister() {
		return register;
	}
	public void setRegister(String register) {
		this.register = register;
	}
	public String getChanger() {
		return changer;
	}
	public void setChanger(String changer) {
		this.changer = changer;
	}
	public String getRegist_time() {
		return regist_time;
	}
	public void setRegist_time(String regist_time) {
		this.regist_time = regist_time;
	}
	public String getChange_time() {
		return change_time;
	}
	public void setChange_time(String change_time) {
		this.change_time = change_time;
	}
	public String getMajor_describe() {
		return major_describe;
	}
	public void setMajor_describe(String major_describe) {
		this.major_describe = major_describe;
	}
	public String getEngage_required() {
		return engage_required;
	}
	public void setEngage_required(String engage_required) {
		this.engage_required = engage_required;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	@Override
	public String toString() {
		return "EngageMajorRelease [mre_id=" + mre_id + ", first_kind_id=" + first_kind_id + ", first_kind_name="
				+ first_kind_name + ", second_kind_id=" + second_kind_id + ", second_kind_name=" + second_kind_name
				+ ", third_kind_id=" + third_kind_id + ", third_kind_name=" + third_kind_name + ", major_kind_id="
				+ major_kind_id + ", major_kind_name=" + major_kind_name + ", major_id=" + major_id + ", major_name="
				+ major_name + ", human_amount=" + human_amount + ", engage_type=" + engage_type + ", deadline="
				+ deadline + ", register=" + register + ", changer=" + changer + ", regist_time=" + regist_time
				+ ", change_time=" + change_time + ", major_describe=" + major_describe + ", engage_required="
				+ engage_required + ", page=" + page + "]";
	}
     
}
