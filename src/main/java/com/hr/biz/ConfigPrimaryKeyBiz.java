package com.hr.biz;

import java.util.List;
import java.util.Map;

import com.hr.bean.ConfigMajorKind;
import com.hr.bean.ConfigPrimaryKey;
import com.hr.bean.ConfigPublicChar;
import com.hr.bean.HumanFile;

public  interface ConfigPrimaryKeyBiz {
	 List<ConfigPrimaryKey> getAll(ConfigPrimaryKey cKey);//获得所有关键字
	 List<ConfigPrimaryKey> getAllInfo(ConfigPrimaryKey cKey);//获得所有关键字
	 List<Map<String,Object>> getInfo(ConfigPrimaryKey cKey);
	 
	  void updateInfo(ConfigPrimaryKey cKey);//进行更改
	void resetInfo(ConfigPrimaryKey cKey);//进行重置
	 
}
