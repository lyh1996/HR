package com.hr.biz;

import java.util.List;

import com.hr.bean.ConfigFileThirdKind;

public  interface ConfigFileThirdKindBiz {
	/*取得记录条数信息*/
	 int getThirdKindCount();
	 List<ConfigFileThirdKind> getAll(ConfigFileThirdKind configFileThirdKind);//获得所有
	 List<ConfigFileThirdKind> getAllInfo();//获得所有
		//插入
		public void  saveConfigFileThirdKind(ConfigFileThirdKind configFileThirdKind);
	 
		ConfigFileThirdKind getConfigFileThirdKindByName(ConfigFileThirdKind configFileThirdKind);//根據名查找
		//根据ID来查找
		ConfigFileThirdKind getConfigFileThirdKindById(Integer id);//根據ID查找
		//更新机构
		public void updateConfigFileThirdKind(ConfigFileThirdKind configFileThirdKind);
		
		//删除
		public void delConfigFileThirdKind(ConfigFileThirdKind configFileThirdKind);
		
		//根据二级机构差查找
		ConfigFileThirdKind getConfigFileThirdKindBySecondId(Integer id);//根據ID查找
		
		List<ConfigFileThirdKind> getInfoBySFId(Integer FirstId,Integer SecondId);//根據ID查找
}
