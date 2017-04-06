package com.hr.bean;

import java.io.Serializable;

public class SalaryStandardDetails implements Serializable{
	private static final long serialVersionUID = 1L;
	private  Integer sdt_id; 
	private String standard_id;
	private String standard_name;
	private Integer item_id;
	private String item_name;
	private Double salary;
	@Override
	public String toString() {
		return "SalaryStandardDetails [sdt_id=" + sdt_id + ", standard_id=" + standard_id + ", standard_name="
				+ standard_name + ", item_id=" + item_id + ", item_name=" + item_name + ", salary=" + salary + "]";
	}
	public Integer getSdt_id() {
		return sdt_id;
	}
	public void setSdt_id(Integer sdt_id) {
		this.sdt_id = sdt_id;
	}
	public String getStandard_id() {
		return standard_id;
	}
	public void setStandard_id(String standard_id) {
		this.standard_id = standard_id;
	}
	public String getStandard_name() {
		return standard_name;
	}
	public void setStandard_name(String standard_name) {
		this.standard_name = standard_name;
	}
	public Integer getItem_id() {
		return item_id;
	}
	public void setItem_id(Integer item_id) {
		this.item_id = item_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public Double getSalary() {
		return salary;
	}
	public void setSalary(Double salary) {
		this.salary = salary;
	}

}
