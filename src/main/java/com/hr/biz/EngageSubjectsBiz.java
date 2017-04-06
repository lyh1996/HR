package com.hr.biz;

import java.util.List;

import com.hr.bean.EngageSubjects;
import com.hr.bean.MajorChange;
import com.hr.bean.SalaryGrant;
import com.hr.bean.Training;

public  interface EngageSubjectsBiz {
	 
	 //插入信息
	 public void  saveInfo(EngageSubjects  eSubjects);
	 
	 
	 List<EngageSubjects> getInfoByCondition(EngageSubjects eSubjects);
	 
	 EngageSubjects getInfoById(Integer id);//根據ID查找
	 
	//删除
			public void delInfo(EngageSubjects eSubjects);
			
			 public void updateInfo(EngageSubjects eSubjects);//变更
			 
			 int getExamCount(EngageSubjects eSubjects);
	 
			 //随机取题
			 List<EngageSubjects> getInfoRand(EngageSubjects eSubjects);
		 
	 
			
}
