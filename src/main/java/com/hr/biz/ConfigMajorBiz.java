package com.hr.biz;

import java.util.List;

import com.hr.bean.ConfigMajor;
import com.hr.bean.ConfigMajorKind;
public  interface ConfigMajorBiz {
	 List<ConfigMajor> getAll(ConfigMajor configMajor);//获得所有职位
	 /*取得记录条数信息*/
	 int getMajorCount();
	 
	 ConfigMajor  getMajorByName(String  Name,String major_kind_name);//根據名查找
	 
		//插入
		public void  saveConfigMajor(ConfigMajor configMajor);
		 List<ConfigMajor>  getMajorByKindName(String  Name);//根據类型名查找
			//删除
			public void delMajor(ConfigMajor configMajor);
			
			ConfigMajor  getMajorByKindId(Integer  ID);//根據职称类ID查找
}
