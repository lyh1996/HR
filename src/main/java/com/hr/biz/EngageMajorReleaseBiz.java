package com.hr.biz;

import java.util.List;

import com.hr.bean.EngageMajorRelease;

public interface EngageMajorReleaseBiz {
	
	 List<EngageMajorRelease> getAll();//获得所有
	 List<EngageMajorRelease> getAll(EngageMajorRelease release);
	 
	 //根据ID获取发布信息
	EngageMajorRelease getInfoByID(EngageMajorRelease release);
	 
	 /*取得记录条数信息*/
	 int getCount();
	 	 
	 void saveInfo(EngageMajorRelease release);
	 
	 void updateInfo(EngageMajorRelease release);
	 
	 void delInfo(EngageMajorRelease release);
	 
}
