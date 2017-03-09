package com.hr.bean;

import java.io.Serializable;

//二级机构实体
public   class ConfigFileThirdKind  implements  Serializable {

     /**
	 * 
	 */
	private static final long serialVersionUID = -5474770258280221458L;
	private Integer ftk_id;
     private Integer first_kind_id;
     private String first_kind_name;
     private Integer second_kind_id;
     private String second_kind_name;
     private Integer third_kind_id;
     private String third_kind_name;
     private String third_kind_sale_id;
     private String third_kind_is_retail;
     private  Page page;
     
	public Integer getFtk_id() {
		return ftk_id;
	}
	public void setFtk_id(Integer ftk_id) {
		this.ftk_id = ftk_id;
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
	public String getThird_kind_sale_id() {
		return third_kind_sale_id;
	}
	public void setThird_kind_sale_id(String third_kind_sale_id) {
		this.third_kind_sale_id = third_kind_sale_id;
	}
	public String getThird_kind_is_retail() {
		return third_kind_is_retail;
	}
	public void setThird_kind_is_retail(String third_kind_is_retail) {
		this.third_kind_is_retail = third_kind_is_retail;
	}
	
	
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	@Override
	public String toString() {
		return "ConfigFileThirdKind [ftk_id=" + ftk_id + ", first_kind_id=" + first_kind_id + ", first_kind_name="
				+ first_kind_name + ", second_kind_id=" + second_kind_id + ", second_kind_name=" + second_kind_name
				+ ", third_kind_id=" + third_kind_id + ", third_kind_name=" + third_kind_name + ", third_kind_sale_id="
				+ third_kind_sale_id + ", third_kind_is_retail=" + third_kind_is_retail + ", page=" + page + "]";
	}

}