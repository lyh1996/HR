package com.hr.biz;

import java.util.List;

import com.hr.bean.HrRole;
import com.hr.bean.HrRoleRight;

public  interface HrRoleRightBiz {
	 
	 
	 
	 void saveInfo(HrRoleRight hrRoleRight) ;
	 
	List< HrRoleRight> getRoleRightByID(Integer id);
	 void delInfoByID(Integer id);
	  
}
