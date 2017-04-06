package com.hr.biz;

import java.util.List;

import com.hr.bean.EngageInterview;

public interface EngageInterviewBiz {
	List<EngageInterview> getAll();
		
	List<EngageInterview> getAll(EngageInterview interview);
	
	int getCount();
	
	//根据ID查询
	EngageInterview getInfoById(EngageInterview interview);
	
	void saveInfo(EngageInterview interview);
	
	void updateInfo(EngageInterview interview);
	void updateInfoTest(EngageInterview interview);
	
	void delInfo(EngageInterview interview);
}
