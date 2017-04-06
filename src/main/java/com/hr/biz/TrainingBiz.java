package com.hr.biz;

import java.util.List;

import com.hr.bean.MajorChange;
import com.hr.bean.Training;

public  interface TrainingBiz {
	 
	 //插入信息
	 public void  saveInfo(Training  training);
	 Training getInfoByHumanId(Integer id);//根據ID查找
	 int getCount();//复核数量
	 int getTrainingCount();//所有数量
	 List<Training> getAllPage(Training  training);//获得所有复核
	 List<Training> getAllTrainingPage(Training  training);//获得所有
	 
	 public void updateInfo(Training  training);//复核通过
	 
	 Training getInfoById(Integer id);//根據ID查找
	 
	//删除
			public void delInfo(Training  training);
		 
	 
			
}
