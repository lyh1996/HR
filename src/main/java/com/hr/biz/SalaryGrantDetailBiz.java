package com.hr.biz;

import java.util.List;

import com.hr.bean.SalaryGrant;
import com.hr.bean.SalaryGrantDetail;
import com.hr.bean.Training;

public interface SalaryGrantDetailBiz {
	 
	List<SalaryGrantDetail> getSalaryGrantDetailById(String id);//根據Standard_id查找
	 public void  saveInfo(SalaryGrantDetail sDetail);//存入数据
	 
	 SalaryGrantDetail getSalaryGrantDetail(SalaryGrantDetail sDetail);
	 public void updateInfo(SalaryGrantDetail sDetail);//复核通过
	 
	 public void delInfo(SalaryGrantDetail sDetail);
}
