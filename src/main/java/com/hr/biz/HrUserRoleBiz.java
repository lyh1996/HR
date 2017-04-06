package com.hr.biz;

import java.util.List;

import com.hr.bean.HrRole;
import com.hr.bean.HrRoleRight;
import com.hr.bean.HrUserRole;

public  interface HrUserRoleBiz {
	 
	 
	 HrUserRole getRoleByUserID(Integer id);
	 
	 void saveInfo(HrUserRole hUserRole) ;//插入信息
	 
	 void delInfoByID(Integer id);
	 
	 void updateUsersRole(HrUserRole hUserRole);
	  
}
