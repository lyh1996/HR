package com.hr.bean;

import java.io.Serializable;

public class HrUserRole implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6688210604914662795L;

	private Integer UId;
	private Integer RId ;
	public Integer getUId() {
		return UId;
	}
	public void setUId(Integer uId) {
		UId = uId;
	}
	public Integer getRId() {
		return RId;
	}
	public void setRId(Integer rId) {
		RId = rId;
	}
	@Override
	public String toString() {
		return "HrUserRole [UId=" + UId + ", RId=" + RId + "]";
	}
	
	
}
