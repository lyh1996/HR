package com.hr.biz;

import java.util.List;

import com.hr.bean.ConfigMajorKind;
import com.hr.bean.ConfigPublicChar;

public  interface ConfigMajorKindBiz {
	 List<ConfigMajorKind> getAll(ConfigMajorKind configMajorKind);//获得所有职位---用于分页
	 List<ConfigMajorKind> getAll();//获得所有职位
	 
	 ConfigMajorKind getMajorKindByName(String  Name);//根據名查找
	 
		//插入
		public void  saveConfigMajorKind(ConfigMajorKind configMajorKind);
	 
		//删除
		public void delMajorKind(ConfigMajorKind ConfigMajorKind);
		
		 /*取得记录条数信息*/
		 int getMajorCount();
	 
}
