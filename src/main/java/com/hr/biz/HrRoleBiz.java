package com.hr.biz;

import java.util.List;

import com.hr.bean.HrRole;
import com.hr.bean.HrUserRole;

public  interface HrRoleBiz {
	 
	 
	 
	 List<HrRole> getAllRole();//获得所有
	 void saveInfo(HrRole hRole) ;
	 
	 HrRole getRoleByID(Integer id);
	 List<HrRole> getAllRoleByFlag(Integer id);
	 
	 void updateRole(HrRole hRole);
	  
}
