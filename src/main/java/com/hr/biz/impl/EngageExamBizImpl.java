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
import com.hr.biz.EngageExamBiz;
import com.hr.biz.EngageSubjectsBiz;
import com.hr.biz.HumanFileBiz;
import com.hr.biz.MajorChangeBiz;
import com.hr.biz.TrainingBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class EngageExamBizImpl implements EngageExamBiz {

	private BaseDao baseDao;

	@Resource(name = "baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
 

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveInfo(EngageExam exam) {
		this.baseDao.add(exam, "saveInfo");
		
	}


	@Override
	public int getCount() {
		return this.baseDao.findFunc(new EngageExam(), "getCount");
	}


	@Override
	public List<EngageExam> toExamList() {
	 List<EngageExam> list=this.baseDao.findAll(new EngageExam(), "toExamList");
		return list;
	}


	@Override
	public EngageExam getInfoRand(EngageExam exam) {
		List<EngageExam>list=this.baseDao.findAll(exam, "getInfoRand");
		 return list != null && list.size() > 0 ? list.get(0) : null;
	}

 
}
