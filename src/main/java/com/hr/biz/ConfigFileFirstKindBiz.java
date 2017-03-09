package com.hr.biz;

import java.util.List;

import com.hr.bean.ConfigFileFirstKind;

public  interface ConfigFileFirstKindBiz {
	List<ConfigFileFirstKind> getAllConfigFileFirstKinds();//查找所有
	
	ConfigFileFirstKind getConfigFileFirstKindByName(ConfigFileFirstKind configFileFirstKind);//根據名查找
	
	//插入
	public void  saveConfigFileFirstKind(ConfigFileFirstKind configFileFirstKind);
	
	ConfigFileFirstKind getConfigFileFirstKindById(Integer id);//根據ID查找
	//更新机构
	public void updateConfigFileFirstKind(ConfigFileFirstKind configFileFirstKind);
	
	//删除
	public void delConfigFileFirstKind(ConfigFileFirstKind configFileFirstKind);
	 
	
	 
}
