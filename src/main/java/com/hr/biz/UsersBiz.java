package com.hr.biz;



import java.util.List;

import com.hr.bean.HrUser;
import com.hr.bean.HrUserRole;

public interface UsersBiz {	


	HrUser getUsersByU_name(String name,String  pwd);  //查找用户名
	List<HrUser> getAllUsers(HrUser users);  //查找所有用户信息
	public void  saveUsers(HrUser users);  //添加用户
	public void updateUsers(HrUser users); //变更密码
	
	HrUser getInfoByUserID(Integer id);
	
	void delInfoByID(Integer id);
}
