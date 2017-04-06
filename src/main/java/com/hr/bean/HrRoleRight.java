package com.hr.bean;

import java.io.Serializable;

public class HrRoleRight implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -976322277624638064L;
	
	private Integer RId ;
	private String rightCode ;
	public Integer getRId() {
		return RId;
	}
	public void setRId(Integer rId) {
		RId = rId;
	}
	public String getRightCode() {
		return rightCode;
	}
	public void setRightCode(String rightCode) {
		this.rightCode = rightCode;
	}
	@Override
	public String toString() {
		return "HrRoleRight [RId=" + RId + ", rightCode=" + rightCode + "]";
	}
	
	

}
