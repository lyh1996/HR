package com.hr.bean;

import java.io.Serializable;

public class ConfigQuestionFirstKind implements Serializable {//试题一级分类
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7505496261324382996L;
	private Integer qfk_id ;
	private Integer first_kind_id;
	private String first_kind_name ;
	 private Page page;
	public Integer getQfk_id() {
		return qfk_id;
	}
	public void setQfk_id(Integer qfk_id) {
		this.qfk_id = qfk_id;
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
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	@Override
	public String toString() {
		return "ConfigQuestionFirstKind [qfk_id=" + qfk_id + ", first_kind_id=" + first_kind_id + ", first_kind_name="
				+ first_kind_name + ", page=" + page + "]";
	}
	 
	 
}
