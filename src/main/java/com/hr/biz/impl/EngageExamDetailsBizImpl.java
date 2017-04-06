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
import com.hr.bean.EngageExamDetails;
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
import com.hr.biz.EngageExamDetailsBiz;
import com.hr.biz.EngageSubjectsBiz;
import com.hr.biz.HumanFileBiz;
import com.hr.biz.MajorChangeBiz;
import com.hr.biz.TrainingBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class EngageExamDetailsBizImpl implements EngageExamDetailsBiz {

	private BaseDao baseDao;

	@Resource(name = "baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
 

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveInfo(EngageExamDetails exam) {
		this.baseDao.add(exam, "saveInfo");
		
	}


	@Override
	public List<EngageExamDetails> getInfoById(String exam_number) {
		EngageExamDetails eDetails=new EngageExamDetails();
		eDetails.setExam_number(exam_number);
		 List<EngageExamDetails>list=this.baseDao.findAll(eDetails, "getInfoById");
		 return list;
	}
 
}
