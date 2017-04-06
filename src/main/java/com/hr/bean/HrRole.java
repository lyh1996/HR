package com.hr.bean;

import java.util.HashSet;
import java.util.Set;
 
public class HrRole implements java.io.Serializable {

	// Fields
		
	/**
	 * 
	 */
	private static final long serialVersionUID = 3416229553352872319L;
	private Integer RId;
	private String RName;
	private String RDesc;
	private Integer RFlag;
	
	//角色表与用户表一对多
	private Set<HrUser> users = new HashSet<HrUser>();
	
	//角色表与权限表是 多对多---第三方表role_right
	private Set<HrRight> Rights=new HashSet<HrRight>();

	// Constructorss

	public Set<HrRight> getRights() {
		return Rights;
	}

	public void setRights(Set<HrRight> rights) {
		Rights = rights;
	}

	public Set<HrUser> getUsers() {
		return users;
	}

	public void setUsers(Set<HrUser> sysUsers) {
		this.users = sysUsers;
	}

	/** default constructor */
	public HrRole() {
	}

	/** minimal constructor */
	public HrRole(String RName) {
		this.RName = RName;
	}

	/** full constructor */
	public HrRole(String RName, String RDesc, Integer RFlag) {
		this.RName = RName;
		this.RDesc = RDesc;
		this.RFlag = RFlag;
	}

	// Property accessors

	public Integer getRId() {
		return this.RId;
	}

	public void setRId(Integer RId) {
		this.RId = RId;
	}

	public String getRName() {
		return this.RName;
	}

	public void setRName(String RName) {
		this.RName = RName;
	}

	public String getRDesc() {
		return this.RDesc;
	}

	public void setRDesc(String RDesc) {
		this.RDesc = RDesc;
	}

	public Integer getRFlag() {
		return this.RFlag;
	}

	public void setRFlag(Integer RFlag) {
		this.RFlag = RFlag;
	}

	@Override
	public String toString() {
		return "HrRole [RId=" + RId + ", RName=" + RName + ", RDesc=" + RDesc + ", RFlag=" + RFlag + ", users=" + users
				+ ", Rights=" + Rights + "]";
	}
	
	

}