package com.hr.biz;

import java.util.List;

import com.hr.bean.ConfigFileSecondKind;
import com.hr.bean.ConfigFileThirdKind;
import com.hr.bean.ConfigQuestionSecondKind;
import com.hr.bean.HumanFile;
import com.hr.bean.MajorChange;

public  interface MajorChangeBiz {
	 
	 //插入信息
	 public void  saveInfo(MajorChange mchange);
	 
	 int getCount();
	 int getChangeCount();
	 List<MajorChange> getAllPage(MajorChange mchange);//获得所有
	 List<MajorChange> getAllChangePage(MajorChange mchange);//获得所有
	 
	 MajorChange getInfoById(Integer id);//根據ID查找
	 MajorChange getInfoByHumanId(Integer id);//根據ID查找
	 
	 public void updateInfo(MajorChange mchange);
	//删除
		public void delInfo(MajorChange mchange);
	 
 
			
}
