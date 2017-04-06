package com.hr.biz;

import java.util.List;

import com.hr.bean.SalaryStandard;

public interface SalaryStandardBiz {
	//插入
	public void  saveSalaryStandard(SalaryStandard salaryStandard);
	
	//查詢所有
	List<SalaryStandard> getAllSalaryStandard();//查找所有
	
	SalaryStandard getSalaryStandardById(String id);//根據Standard_id查找
	
	List<SalaryStandard> getAllNeedCheckSalaryStandard(int check_status); //查找所有需要复核的数据
	
	public void updateSalaryStandard(SalaryStandard salaryStandard); //更新复核
	
	public void updateChangeSalaryStandard(SalaryStandard salaryStandard); //更新变更

	 List<SalaryStandard> getInfoByCondition(SalaryStandard salaryStandard);//获得所有按条件
	 
	 List<SalaryStandard> getInfoByCheckStatus(SalaryStandard salaryStandard);
	//删除
		public void delInfo(SalaryStandard salaryStandard);
}
