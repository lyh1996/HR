package com.hr.biz;

import java.util.List;

import com.hr.bean.EngageAnswerDetails;
import com.hr.bean.EngageExamDetails;
 
public  interface EngageAnswerDetailsBiz {
	 
	 void saveInfo(EngageAnswerDetails details);
	 
	//根据试卷编号查找
		 List<EngageAnswerDetails> getInfoById(String answer_number);
	 
			
}
