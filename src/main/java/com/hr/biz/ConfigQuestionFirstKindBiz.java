package com.hr.biz;

import java.util.List;

import com.hr.bean.ConfigFileFirstKind;
import com.hr.bean.ConfigMajor;
import com.hr.bean.ConfigPublicChar;
import com.hr.bean.ConfigQuestionFirstKind;

public  interface ConfigQuestionFirstKindBiz {
	 /*取得记录条数信息*/
	 int getCount();
	List<ConfigQuestionFirstKind> getAlls();//查找所有
	 //根據名查找
	ConfigQuestionFirstKind getINfoByName(ConfigQuestionFirstKind configQuestionFirstKind);
	//插入
	 public void  save(ConfigQuestionFirstKind configQuestionFirstKind);
	//删除
		public void delInfo(ConfigQuestionFirstKind configQuestionFirstKind);
	 
}
