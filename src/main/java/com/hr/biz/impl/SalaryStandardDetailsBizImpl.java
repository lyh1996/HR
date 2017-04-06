package com.hr.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hr.bean.SalaryStandard;
import com.hr.bean.SalaryStandardDetails;
import com.hr.biz.SalaryStandardDetailsBiz;
import com.hr.dao.BaseDao;

@Service
public class SalaryStandardDetailsBizImpl implements SalaryStandardDetailsBiz{
	private BaseDao baseDao;
	
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	@Override
	public void saveSalaryStandardDetails(SalaryStandardDetails salaryStandardDetails) {
		 this.baseDao.add(salaryStandardDetails, "saveSalaryStandardDetails");
	}

	@Override
	public List<SalaryStandardDetails> getSalaryStandardDetailsById(String id) {
		SalaryStandardDetails salaryStandardDetails=new SalaryStandardDetails();
		salaryStandardDetails.setStandard_id(id);
		List<SalaryStandardDetails> list=this.baseDao.findAll(salaryStandardDetails,"getSalaryStandardDetailsById");
		return list;
	}

	@Override
	public void updateSalaryStandardDetails(SalaryStandardDetails salaryStandardDetails) {
		this.baseDao.update(salaryStandardDetails, "updateSalaryStandardDetails");
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delInfo(SalaryStandardDetails salaryStandardDetails) {
		 this.baseDao.delete(salaryStandardDetails, "delInfo");
		
	}

	@Override
	public void updateChangeSalaryStandardDetails(SalaryStandardDetails salaryStandardDetails) {
		this.baseDao.update(salaryStandardDetails, "updateChangeSalaryStandardDetails");
	}

}
