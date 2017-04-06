package com.hr.biz;


import java.util.List;

import com.hr.bean.EngageAnswer;

public  interface EngageAnswerBiz {
	 int getCount();//获得编号
	 
	 void saveInfo(EngageAnswer eAnswer);
	 List<EngageAnswer> getInfoByCondition(EngageAnswer eAnswer);//考试阅卷
	 void updateInfo(EngageAnswer eAnswer);
	/* 成绩筛选*/
	 List<EngageAnswer> getInfoByFilter(EngageAnswer eAnswer);
	 
	 EngageAnswer getInfoById(String id);
	 List<EngageAnswer> getInfoByResumeId(Integer id);
	 
	 
			
}
