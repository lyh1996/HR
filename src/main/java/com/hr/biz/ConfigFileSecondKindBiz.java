package com.hr.biz;

import java.util.List;

import com.hr.bean.ConfigFileFirstKind;
import com.hr.bean.ConfigFileSecondKind;

public  interface ConfigFileSecondKindBiz {
			 /*取得记录条数信息*/
			 int getSecondKindCount();
	 List<ConfigFileSecondKind> getAll(ConfigFileSecondKind configFileSecondKind);//获得所有
	 List<ConfigFileSecondKind> getAll();//获得所有
	 
		//插入
		public void  saveConfigFileSecondKind(ConfigFileSecondKind configFileSecondKind);
	 
		ConfigFileSecondKind getConfigFileSecondKindByName(ConfigFileSecondKind configFileSecondKind);//根據名查找
		//根据ID来查找
		ConfigFileSecondKind getConfigFileSecondKindById(Integer id);//根據ID查找
		//更新机构
		public void updateConfigFileSecondKind(ConfigFileSecondKind configFileSecondKind);
		
		//删除
		public void delConfigFileSecondKind(ConfigFileSecondKind configFileSecondKind);
		
		//根据一级机构查找
		List<ConfigFileSecondKind> getConfigFileSecondKindByFirstId(Integer id);//根據ID查找
}
