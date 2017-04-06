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
import com.hr.bean.EngageAnswer;
import com.hr.bean.EngageExam;
import com.hr.bean.EngageSubjects;
import com.hr.bean.HumanFile;
import com.hr.bean.MajorChange;
import com.hr.bean.SalaryGrant;
import com.hr.bean.Training;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileThirdKindBiz;
import com.hr.biz.ConfigMajorKindBiz;
import com.hr.biz.ConfigPublicCharBiz;
import com.hr.biz.EngageAnswerBiz;
import com.hr.biz.EngageExamBiz;
import com.hr.biz.EngageSubjectsBiz;
import com.hr.biz.HumanFileBiz;
import com.hr.biz.MajorChangeBiz;
import com.hr.biz.TrainingBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class EngageAnswerBizImpl implements EngageAnswerBiz {

	private BaseDao baseDao;

	@Resource(name = "baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
 

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveInfo(EngageAnswer eAnswer) {
		this.baseDao.add(eAnswer, "saveInfo");
		
	}


	@Override
	public int getCount() {
		return this.baseDao.findFunc(new EngageAnswer(), "getCount");
	}


	@Override
	public List<EngageAnswer> getInfoByCondition(EngageAnswer eAnswer) {
		List<EngageAnswer> list=this.baseDao.findAll(eAnswer, "getInfoByCondition");
		return list;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateInfo(EngageAnswer eAnswer) {
					this.baseDao.update(eAnswer, "updateInfo");
					
		
	}


	@Override
	public List<EngageAnswer> getInfoByFilter(EngageAnswer eAnswer) {
		List<EngageAnswer> list=this.baseDao.findAll(eAnswer, "getInfoByFilter");
		return list;
	}


	@Override
	public EngageAnswer getInfoById(String id) {
	 EngageAnswer eAnswer =new EngageAnswer();
	 eAnswer.setAnswer_number(id);
	 List<EngageAnswer> list=this.baseDao.findAll(eAnswer, "getInfoById");
	 return list != null && list.size() > 0 ? list.get(0) : null;
	}


	@Override
	public List<EngageAnswer > getInfoByResumeId(Integer id) {
		 EngageAnswer eAnswer =new EngageAnswer();
		 eAnswer.setResume_id(id);
		 List<EngageAnswer> list=this.baseDao.findAll(eAnswer, "getInfoByResumeId");
		return list;
	}

 
}
