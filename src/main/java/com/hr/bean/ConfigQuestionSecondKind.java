package com.hr.bean;

import java.io.Serializable;

public class ConfigQuestionSecondKind implements Serializable {//试题二级分类

	/**
	 * 
	 */
	private static final long serialVersionUID = -5720594173952980133L;
	
	private Integer qsk_id ;
	private Integer first_kind_id;
	private String first_kind_name;
	private Integer second_kind_id;
	private String second_kind_name ;
	private Page page
	
	;
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public Integer getQsk_id() {
		return qsk_id;
	}
	public void setQsk_id(Integer qsk_id) {
		this.qsk_id = qsk_id;
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
	@Override
	public String toString() {
		return "ConfigQuestionSecondKind [qsk_id=" + qsk_id + ", first_kind_id=" + first_kind_id + ", first_kind_name="
				+ first_kind_name + ", second_kind_id=" + second_kind_id + ", second_kind_name=" + second_kind_name
				+ "]";
	}
	
	

}
