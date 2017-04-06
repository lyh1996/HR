package com.hr.biz;

import java.util.List;

import com.hr.bean.ConfigFileSecondKind;
import com.hr.bean.ConfigFileThirdKind;
import com.hr.bean.ConfigPrimaryKey;
import com.hr.bean.ConfigQuestionSecondKind;
import com.hr.bean.HumanFile;

public  interface HumanFileBiz {
	 List<HumanFile> getAll();//获得所有职位
	 //根据身份证号码查找
	 HumanFile getInfoByIdCard(String human_id_card);
	 //插入信息
	 public void  saveInfo(HumanFile humanFile);
	 
	 /*取得记录条数信息*/
	 int getCount();
	 int getDelCount();
	 List<HumanFile> getAllPage(HumanFile humanFile);//获得所有
	 List<HumanFile> getInfoByCondition(HumanFile humanFile);//获得所有按条件
	 List<HumanFile> getInfoByName(HumanFile humanFile);//获得所有按条件
	 List<HumanFile> getInfoToSalaryGrant();//获得所有按条件
	 List<HumanFile> getInfoToSalaryGrant2();//获得所有按条件
	 List<HumanFile> getInfoToSalaryGrant3();//获得所有按条件
	 
	//根据ID来查找
	 HumanFile getInfoByHumanId(Integer id);//根據ID查找
	 HumanFile getInfoByHumanIds(Integer id);//根據ID查找
	 
	//更新
			public void updateInfo(HumanFile humanFile);
			public void updateInfoByChange(HumanFile humanFile);
			public void updateInfoToMajorChange(HumanFile humanFile);
			public void updateInfoToTraining(HumanFile humanFile);
			public void updateInfoToBonus(HumanFile humanFile);
			
			public void updateInfoToDelete(HumanFile humanFile);
			public void updateInfoToRecovery(HumanFile humanFile);
			public void updateInfoToSalary(HumanFile humanFile);
			//删除
			public void delInfo(HumanFile humanFile);
			
			
			
}
