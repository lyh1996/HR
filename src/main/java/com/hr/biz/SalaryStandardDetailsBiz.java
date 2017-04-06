package com.hr.biz;

import java.util.List;


import com.hr.bean.SalaryStandardDetails;

public interface SalaryStandardDetailsBiz {
	public void  saveSalaryStandardDetails(SalaryStandardDetails salaryStandardDetails);
	
	public List<SalaryStandardDetails> getSalaryStandardDetailsById(String id);
	
	public void updateSalaryStandardDetails(SalaryStandardDetails  salaryStandardDetails);
	
	public void updateChangeSalaryStandardDetails(SalaryStandardDetails salaryStandardDetails); //更新变更
	
	//删除
	public void delInfo(SalaryStandardDetails salaryStandardDetails);
}
