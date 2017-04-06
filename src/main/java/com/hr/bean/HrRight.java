package com.hr.bean;

import java.util.HashSet;
import java.util.Set;

import com.hr.web.utils.Page;
 

public class HrRight implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7936651766714422770L;
	// Fields

	private String rightCode;
	private String rightParentCode;
	private String rightType;
	private String rightText;
	private String rightUrl;
	private String rightTip;
	
	private Page page;
	
	//权限表和角色表是多对多
	private Set<HrRole> roles=new HashSet<HrRole>();

	// Constructors

	public Set<HrRole> getRoles() {
		return roles;
	}

	public void setRoles(Set<HrRole> roles) {
		this.roles = roles;
	}

	/** default constructor */
	public HrRight() {
	}

	/** full constructor */
	public HrRight(String rightParentCode, String rightType, String rightText,
			String rightUrl, String rightTip) {
		this.rightParentCode = rightParentCode;
		this.rightType = rightType;
		this.rightText = rightText;
		this.rightUrl = rightUrl;
		this.rightTip = rightTip;
	}

	// Property accessors

	public String getRightCode() {
		return this.rightCode;
	}

	public void setRightCode(String rightCode) {
		this.rightCode = rightCode;
	}

	public String getRightParentCode() {
		return this.rightParentCode;
	}

	public void setRightParentCode(String rightParentCode) {
		this.rightParentCode = rightParentCode;
	}

	public String getRightType() {
		return this.rightType;
	}

	public void setRightType(String rightType) {
		this.rightType = rightType;
	}

	public String getRightText() {
		return this.rightText;
	}

	public void setRightText(String rightText) {
		this.rightText = rightText;
	}

	public String getRightUrl() {
		return this.rightUrl;
	}

	public void setRightUrl(String rightUrl) {
		this.rightUrl = rightUrl;
	}

	public String getRightTip() {
		return this.rightTip;
	}

	public void setRightTip(String rightTip) {
		this.rightTip = rightTip;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	@Override
	public String toString() {
		return "HrRight [rightCode=" + rightCode + ", rightParentCode=" + rightParentCode + ", rightType=" + rightType
				+ ", rightText=" + rightText + ", rightUrl=" + rightUrl + ", rightTip=" + rightTip + ", page=" + page
				+ ", roles=" + roles + "]";
	}
	
	

}