package com.hr.biz;

import java.util.List;

import com.hr.bean.Bonus;
import com.hr.bean.MajorChange;
import com.hr.bean.Training;

public  interface BonusBiz {
	 
	 //插入信息
	 public void  saveInfo(Bonus  bonus);
	 Bonus getInfoByHumanId(Integer id);//根據ID查找
	 int getCount();//复核数量
	 int getBonusCount();//所有数量
	 List<Bonus> getAllPage(Bonus  bonus);//获得所有复核
	 List<Bonus> getAllBonusPage(Bonus  bonus);//获得所有
	 
	 public void updateInfo(Bonus  bonus);//复核通过
	 
	 Bonus getInfoById(Integer id);//根據ID查找
	 
	//删除
			public void delInfo(Bonus  bonus);
		 
	 
			
}
