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
import com.hr.bean.EngageSubjects;
import com.hr.bean.HumanFile;
import com.hr.bean.MajorChange;
import com.hr.bean.SalaryGrant;
import com.hr.bean.Training;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileThirdKindBiz;
import com.hr.biz.ConfigMajorKindBiz;
import com.hr.biz.ConfigPublicCharBiz;
import com.hr.biz.EngageSubjectsBiz;
import com.hr.biz.HumanFileBiz;
import com.hr.biz.MajorChangeBiz;
import com.hr.biz.TrainingBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class EngageSubjectsBizImpl implements EngageSubjectsBiz {

	private BaseDao baseDao;

	@Resource(name = "baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
 

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveInfo(EngageSubjects eSubjects) {
		this.baseDao.add(eSubjects, "saveInfo");
		
	}



	@Override
	public List<EngageSubjects> getInfoByCondition(EngageSubjects eSubjects) {
		List<EngageSubjects> list = this.baseDao.findAll(eSubjects, "getInfoByCondition");
		return list;
	}


	@Override
	public EngageSubjects getInfoById(Integer id) {
		EngageSubjects eSubjects=new EngageSubjects();
		eSubjects.setSub_id(id);
		 List<EngageSubjects>list=this.baseDao.findAll(eSubjects, "getInfoById");
		 return list != null && list.size() > 0 ? list.get(0) : null;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delInfo(EngageSubjects eSubjects) {
				 this.baseDao.delete(eSubjects, "delInfo");
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateInfo(EngageSubjects eSubjects) {
				this.baseDao.update(eSubjects, "updateInfo");
				
	}
 

	@Override
	public int getExamCount(EngageSubjects eSubjects) {
		return this.baseDao.findFunc(eSubjects, "getExamCount");
	}


	@Override
	public List<EngageSubjects> getInfoRand(EngageSubjects eSubjects) {
		List<EngageSubjects> list=this.baseDao.findAll(eSubjects, "getInfoRand");
		return list;
	}
 
}
