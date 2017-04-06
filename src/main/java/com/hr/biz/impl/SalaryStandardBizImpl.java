package com.hr.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hr.bean.SalaryStandard;
import com.hr.biz.SalaryStandardBiz;
import com.hr.dao.BaseDao;

@Service
public class SalaryStandardBizImpl implements SalaryStandardBiz {
	private BaseDao baseDao;
	
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public void saveSalaryStandard(SalaryStandard salaryStandard) {
			 this.baseDao.add(salaryStandard, "saveSalaryStandard");			
	}

	@Override
	public List<SalaryStandard> getAllSalaryStandard() {
		List<SalaryStandard> list=this.baseDao.findAll(new SalaryStandard(), "getAllSalaryStandard");
		return list;
	}

	@Override
	public SalaryStandard getSalaryStandardById(String id) {
		SalaryStandard salaryStandard=new SalaryStandard();
		salaryStandard.setStandard_id(id);
		 List<SalaryStandard>list=this.baseDao.findAll(salaryStandard, "getSalaryStandardById");
		 return list !=null&&list.size()>0 ? list.get(0) : null ;
	}

	@Override
	public void updateSalaryStandard(SalaryStandard salaryStandard) {
		this.baseDao.update(salaryStandard, "updateSalaryStandard");
	}


	@Override
	public List<SalaryStandard> getAllNeedCheckSalaryStandard(int check_status) {
		SalaryStandard salaryStandard=new SalaryStandard();
		salaryStandard.setCheck_status(check_status);
		List<SalaryStandard> list=this.baseDao.findAll(salaryStandard, "getAllNeedCheckSalaryStandard");
		return list;
	}
	
	@Override
	public List<SalaryStandard> getInfoByCondition(SalaryStandard salaryStandard) {
		List<SalaryStandard> list = this.baseDao.findAll(salaryStandard, "getInfoByCondition");
		return list;
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delInfo(SalaryStandard salaryStandard) {
		 this.baseDao.delete(salaryStandard, "delInfo");
		
	}

	@Override
	public List<SalaryStandard> getInfoByCheckStatus(SalaryStandard salaryStandard) {
		List<SalaryStandard> list=this.baseDao.findAll(salaryStandard, "getInfoByCheckStatus");
		return list;
	}

	@Override
	public void updateChangeSalaryStandard(SalaryStandard salaryStandard) {
		this.baseDao.update(salaryStandard, "updateChangeSalaryStandard");
	}

}
