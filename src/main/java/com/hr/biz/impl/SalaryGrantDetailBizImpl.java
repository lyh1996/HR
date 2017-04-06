package com.hr.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hr.bean.HumanFile;
import com.hr.bean.MajorChange;
import com.hr.bean.SalaryGrant;
import com.hr.bean.SalaryGrantDetail;
import com.hr.bean.SalaryStandard;
import com.hr.bean.SalaryStandardDetails;
import com.hr.bean.Training;
import com.hr.biz.SalaryGrantDetailBiz;
import com.hr.biz.SalaryStandardDetailsBiz;
import com.hr.dao.BaseDao;

@Service
public class SalaryGrantDetailBizImpl implements SalaryGrantDetailBiz{
	private BaseDao baseDao;
	
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	 
	@Override
	public List<SalaryGrantDetail> getSalaryGrantDetailById(String id) {
		SalaryGrantDetail sGrantDetail=new SalaryGrantDetail();
		 sGrantDetail.setSalary_grant_id(id);
		 List<SalaryGrantDetail>list=this.baseDao.findAll(sGrantDetail, "getSalaryGrantDetailById");
		 return list;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveInfo(SalaryGrantDetail sDetail) {
		this.baseDao.add(sDetail, "saveInfo");
		
	}


	@Override
	public SalaryGrantDetail getSalaryGrantDetail(SalaryGrantDetail sDetail) {
		 List<SalaryGrantDetail>list=this.baseDao.findAll(sDetail, "getSalaryGrantDetail");
		 return list != null && list.size() > 0 ? list.get(0) : null;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateInfo(SalaryGrantDetail sDetail) {
			this.baseDao.update(sDetail, "updateInfo");
			
		
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delInfo(SalaryGrantDetail sDetail) {
			 this.baseDao.delete(sDetail, "delInfo");
			
	}

}
