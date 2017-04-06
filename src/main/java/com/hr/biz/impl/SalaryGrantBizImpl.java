package com.hr.biz.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hr.bean.ConfigFileFirstKind;
import com.hr.bean.ConfigFileSecondKind;
import com.hr.bean.ConfigFileThirdKind;
import com.hr.bean.ConfigMajorKind;
import com.hr.bean.ConfigPublicChar;
import com.hr.bean.ConfigQuestionSecondKind;
import com.hr.bean.HumanFile;
import com.hr.bean.MajorChange;
import com.hr.bean.SalaryGrant;
import com.hr.bean.SalaryGrantDetail;
import com.hr.bean.Training;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileThirdKindBiz;
import com.hr.biz.ConfigMajorKindBiz;
import com.hr.biz.ConfigPublicCharBiz;
import com.hr.biz.HumanFileBiz;
import com.hr.biz.MajorChangeBiz;
import com.hr.biz.SalaryGrantBiz;
import com.hr.biz.TrainingBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class SalaryGrantBizImpl implements SalaryGrantBiz {

	private BaseDao baseDao;

	@Resource(name = "baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
  
	@Override
	public int getCount() {
		return  this.baseDao.findFunc(new SalaryGrant(), "getCount");
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveInfo(SalaryGrant sGrant) {
		this.baseDao.add(sGrant, "saveInfo");
		
	}

	@Override
	public List<SalaryGrant> getInfoTochecklist() {
		List<SalaryGrant> list = this.baseDao.findAll(new SalaryGrant(), "getInfoTochecklist");
		return list;
	}

	@Override
	public List<SalaryGrant> getSalaryGrantById(String id) {
	 SalaryGrant salaryGrant=new SalaryGrant();
	 salaryGrant.setSalary_grant_id(id);
	 List<SalaryGrant> list=this.baseDao.findAll(salaryGrant, "getSalaryGrantById");
		return list;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateInfo(SalaryGrant sg) {
				this.baseDao.update(sg, "updateInfo");
				
			
	}

	@Override
	public List<SalaryGrant> getInfoByCondition(SalaryGrant sg) {
		List<SalaryGrant> list = this.baseDao.findAll(sg, "getInfoByCondition");
		return list;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delInfo(SalaryGrant sg) {
				 this.baseDao.delete(sg, "delInfo");
	}

 
}
