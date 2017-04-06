package com.hr.biz;

import java.util.List;

import com.hr.bean.EngageResume;

public interface EngageResumeBiz {
	//获取所有简历信息
	List<EngageResume> getAll();
	
	//综合查询
	List<EngageResume> getAll(EngageResume resume);
	
	//根据ID查询
	EngageResume getInfoById(EngageResume resume);
	
	void saveInfo(EngageResume resume);
	
	void updateInfo(EngageResume resume);
	
	void updateinterview(EngageResume resume);
	
	void updatepass(EngageResume resume);
	
	void updatesubjects(EngageResume resume);
	
	void updatestatus(EngageResume resume);
	
	void updatepassstatus(EngageResume resume);
	
	void updateinterviewTest(EngageResume resume);
	
	void delInfo(EngageResume resume);
	
	int getCount();
	
	//根据条件查询
	List<EngageResume> getInfoByCondition(EngageResume resume);
	List<EngageResume> getPassInfoByCondition(EngageResume resume);
	
	EngageResume searchResume(EngageResume resume);
}
