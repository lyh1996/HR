package com.hr.bean;



/**
 * HrUser entity. @author MyEclipse Persistence Tools
 */

public class HrUser implements java.io.Serializable {

	// Fields
	/**
	 * 
	 */
	private static final long serialVersionUID = 4326133217444412440L;
	private Integer UId;
	private String UName;
	private String UTrueName;
	private String UPassword;
	private Integer hufId;
	
	//用户表与角色表是多对一
	private HrRole hrRole;
	public HrRole getHrRole() {
		return hrRole;
	}

	public void setHrRole(HrRole hrRole) {
		this.hrRole = hrRole;
	}

	private HrUserRole hrUserRole;
  

	 

	public HrUserRole getHrUserRole() {
		return hrUserRole;
	}

	public void setHrUserRole(HrUserRole hrUserRole) {
		this.hrUserRole = hrUserRole;
	}

	/** default constructor */
	public HrUser() {
	}
   
	// Property accessors

	public Integer getUId() {
		return this.UId;
	}

	public void setUId(Integer UId) {
		this.UId = UId;
	}

	public String getUName() {
		return this.UName;
	}

	public void setUName(String UName) {
		this.UName = UName;
	}

	public String getUTrueName() {
		return this.UTrueName;
	}

	public void setUTrueName(String UTrueName) {
		this.UTrueName = UTrueName;
	}

	public String getUPassword() {
		return this.UPassword;
	}

	public void setUPassword(String UPassword) {
		this.UPassword = UPassword;
	}

	public Integer getHufId() {
		return this.hufId;
	}

	public void setHufId(Integer hufId) {
		this.hufId = hufId;
	}

	@Override
	public String toString() {
		return "HrUser [UId=" + UId + ", UName=" + UName + ", UTrueName=" + UTrueName + ", UPassword=" + UPassword
				+ ", hufId=" + hufId + ", hrRole=" + hrRole + ", hrUserRole=" + hrUserRole + "]";
	}

 
	 
  

}