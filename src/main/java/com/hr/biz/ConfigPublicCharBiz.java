package com.hr.biz;

import java.util.List;

import com.hr.bean.ConfigFileThirdKind;
import com.hr.bean.ConfigPublicChar;

public  interface ConfigPublicCharBiz {
	 List<ConfigPublicChar> getAll(String Name);//获得所有职称
	//插入
	 public void  saveProfession(ConfigPublicChar configPublicChar);
	 
	 ConfigPublicChar getProfessionByName(ConfigPublicChar configPublicChar);//根據名查找
	//删除
			public void delProfession(ConfigPublicChar configPublicChar);
			
			 List<ConfigPublicChar> getAllChars(ConfigPublicChar configPublicChar);//获得所有属性
			 
			 /*取得记录条数信息*/
			 int getCharCount();
}
