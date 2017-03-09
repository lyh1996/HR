package com.hr.biz;

import java.util.List;

import com.hr.bean.ConfigFileFirstKind;
import com.hr.bean.ConfigFileSecondKind;
import com.hr.bean.ConfigMajor;
import com.hr.bean.ConfigQuestionFirstKind;
import com.hr.bean.ConfigQuestionSecondKind;

public  interface ConfigQuestionSecondKindBiz {
			 /*取得记录条数信息*/
			 int getCount();
		//根据ID来查找
			 List<ConfigQuestionSecondKind> getInfoById(ConfigQuestionSecondKind configQuestionSecondKind);//根據ID查找
			 List<ConfigQuestionSecondKind> getAll(ConfigQuestionSecondKind configQuestionSecondKind);//获得所有
			 ConfigQuestionSecondKind  getInfoByName(String  Name,String first_kind_name);//根據名查找
			//插入
				public void  saveInfo(ConfigQuestionSecondKind configQuestionSecondKind);
				
				//删除
				public void delInfo(ConfigQuestionSecondKind configQuestionSecondKind);
}
