package com.hr.biz;

import java.util.List;

import com.hr.bean.HrRight;

public  interface HrRightBiz {
	 
	 
	 
	 List<HrRight> getAllRight();//获得所有
	 
	 /*取得记录条数信息*/
	 int getRightCount();
	 
	 List<HrRight> getAllRightToPage(HrRight hrRight);//获得所有
	 HrRight getINfoByRightCode(String  rightCode);//获得所有
	 
	 void updateInfo(HrRight hrRight);
	 
	 
	  
}
