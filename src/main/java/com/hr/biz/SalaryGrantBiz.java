package com.hr.biz;

import java.util.List;

import com.hr.bean.ConfigQuestionSecondKind;
import com.hr.bean.HumanFile;
import com.hr.bean.MajorChange;
import com.hr.bean.SalaryGrant;
import com.hr.bean.SalaryGrantDetail;
import com.hr.bean.Training;

public  interface SalaryGrantBiz {
	 
	 
	 int getCount();//获得编号
	 public void  saveInfo(SalaryGrant sg);//存入数据
	 List<SalaryGrant> getInfoTochecklist();//获得所有未复核的人数
	 List<SalaryGrant> getSalaryGrantById(String id);//获得所有未复核的人数
	 public void updateInfo(SalaryGrant sg);//复核通过
	 List<SalaryGrant> getInfoByCondition(SalaryGrant sg);
	 
		//删除
		public void delInfo(SalaryGrant sg);
	 
}
