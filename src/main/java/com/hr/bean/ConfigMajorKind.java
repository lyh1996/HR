package com.hr.bean;

import java.io.Serializable;

public class ConfigMajorKind implements Serializable{//职位种类

	/**
	 * 
	 */
	private static final long serialVersionUID = -2108933349722153500L;
	
	private Integer mfk_id;
	private Integer major_kind_id ;
	private String major_kind_name;
	private Page page;
	
	public Integer getMfk_id() {
		return mfk_id;
	}
	public void setMfk_id(Integer mfk_id) {
		this.mfk_id = mfk_id;
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
	
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	@Override
	public String toString() {
		return "ConfigMajorKind [mfk_id=" + mfk_id + ", major_kind_id=" + major_kind_id + ", major_kind_name="
				+ major_kind_name + "]";
	}
	
	

}
