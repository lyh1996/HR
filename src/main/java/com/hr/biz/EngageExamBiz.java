package com.hr.biz;

import java.util.List;

import com.hr.bean.EngageExam;
import com.hr.bean.EngageSubjects;
import com.hr.bean.MajorChange;
import com.hr.bean.SalaryGrant;
import com.hr.bean.Training;

public  interface EngageExamBiz {
	 int getCount();//获得编号
	 
	 void saveInfo(EngageExam exam);
	 
	 List<EngageExam> toExamList();
	 
	 EngageExam getInfoRand(EngageExam exam);
			
}
