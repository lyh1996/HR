package com.hr.bean;

import java.io.Serializable;

import com.hr.web.utils.Page;

public class EngageSubjects implements Serializable{

	/**
	 * 试题登记表
	 */
	private static final long serialVersionUID = 6575648579488227029L;
	
	private Integer  sub_id;
	private Integer  first_kind_id ;
	private String first_kind_name;
	private Integer second_kind_id ;
	private String second_kind_name;
	private String register ;
	private String regist_time ;
	private String derivation ;
	private String content ;
	private String key_a ;
	private String key_b ;
	private String key_c;
	private String key_d;
	private String key_e ;
	private String correct_key ;
	private String changer ;
	private String change_time ;
	
	private String start_time;
	private String end_time;
	
	private Integer subjectCount;
	
	
	
	private  Page page;
	
	
	
	
	
	
	public Integer getSubjectCount() {
		return subjectCount;
	}
	public void setSubjectCount(Integer subjectCount) {
		this.subjectCount = subjectCount;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public Integer getSub_id() {
		return sub_id;
	}
	public void setSub_id(Integer sub_id) {
		this.sub_id = sub_id;
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
	public String getDerivation() {
		return derivation;
	}
	public void setDerivation(String derivation) {
		this.derivation = derivation;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getKey_a() {
		return key_a;
	}
	public void setKey_a(String key_a) {
		this.key_a = key_a;
	}
	public String getKey_b() {
		return key_b;
	}
	public void setKey_b(String key_b) {
		this.key_b = key_b;
	}
	public String getKey_c() {
		return key_c;
	}
	public void setKey_c(String key_c) {
		this.key_c = key_c;
	}
	public String getKey_d() {
		return key_d;
	}
	public void setKey_d(String key_d) {
		this.key_d = key_d;
	}
	public String getKey_e() {
		return key_e;
	}
	public void setKey_e(String key_e) {
		this.key_e = key_e;
	}
	public String getCorrect_key() {
		return correct_key;
	}
	public void setCorrect_key(String correct_key) {
		this.correct_key = correct_key;
	}
	public String getChanger() {
		return changer;
	}
	public void setChanger(String changer) {
		this.changer = changer;
	}
	public String getChange_time() {
		return change_time;
	}
	public void setChange_time(String change_time) {
		this.change_time = change_time;
	}
	@Override
	public String toString() {
		return "EngageSubjects [sub_id=" + sub_id + ", first_kind_id=" + first_kind_id + ", first_kind_name="
				+ first_kind_name + ", second_kind_id=" + second_kind_id + ", second_kind_name=" + second_kind_name
				+ ", register=" + register + ", regist_time=" + regist_time + ", derivation=" + derivation
				+ ", content=" + content + ", key_a=" + key_a + ", key_b=" + key_b + ", key_c=" + key_c + ", key_d="
				+ key_d + ", key_e=" + key_e + ", correct_key=" + correct_key + ", changer=" + changer
				+ ", change_time=" + change_time + ", start_time=" + start_time + ", end_time=" + end_time
				+ ", subjectCount=" + subjectCount + ", page=" + page + "]";
	}
 
 
	

}
