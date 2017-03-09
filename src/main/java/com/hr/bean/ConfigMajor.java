package com.hr.bean;

import java.io.Serializable;

public class ConfigMajor implements Serializable {//职位设置

/**
	 * 
	 */
	private static final long serialVersionUID = 2949186682569880358L;
	private Integer mak_id ;
	private Integer major_kind_id ;
	private String major_kind_name ;
	private Integer major_id ;
	private String major_name ;
	private Integer test_amount ;
	private Page page;
	
	public Integer getMak_id() {
		return mak_id;
	}
	public void setMak_id(Integer mak_id) {
		this.mak_id = mak_id;
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
	public Integer getTest_amount() {
		return test_amount;
	}
	public void setTest_amount(Integer test_amount) {
		this.test_amount = test_amount;
	}
	
	
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	@Override
	public String toString() {
		return "ConfigMajor [mak_id=" + mak_id + ", major_kind_id=" + major_kind_id + ", major_kind_name="
				+ major_kind_name + ", major_id=" + major_id + ", major_name=" + major_name + ", test_amount="
				+ test_amount + ", page=" + page + "]";
	}
	 
	
	
}
