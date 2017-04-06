package com.hr.biz;

import java.util.List;

import com.hr.bean.EngageExam;
import com.hr.bean.EngageExamDetails;
import com.hr.bean.EngageSubjects;
import com.hr.bean.MajorChange;
import com.hr.bean.SalaryGrant;
import com.hr.bean.Training;

public  interface EngageExamDetailsBiz {
	 
	 void saveInfo(EngageExamDetails engageExamDetails);
	 //根据试卷编号查找
	 List<EngageExamDetails> getInfoById(String exam_number);
			
}
