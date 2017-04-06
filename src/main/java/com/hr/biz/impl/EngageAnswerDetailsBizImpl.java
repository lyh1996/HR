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
import com.hr.bean.EngageAnswerDetails;
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
import com.hr.biz.EngageAnswerDetailsBiz;
import com.hr.biz.EngageExamBiz;
import com.hr.biz.EngageExamDetailsBiz;
import com.hr.biz.EngageSubjectsBiz;
import com.hr.biz.HumanFileBiz;
import com.hr.biz.MajorChangeBiz;
import com.hr.biz.TrainingBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class EngageAnswerDetailsBizImpl implements EngageAnswerDetailsBiz {

	private BaseDao baseDao;

	@Resource(name = "baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
 

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveInfo(EngageAnswerDetails details) {
		this.baseDao.add(details, "saveInfo");
		
	}


	@Override
	public List<EngageAnswerDetails> getInfoById(String answer_number) {
		EngageAnswerDetails eDetails=new EngageAnswerDetails();
		eDetails.setAnswer_number(answer_number);
		 List<EngageAnswerDetails>list=this.baseDao.findAll(eDetails, "getInfoById");
		 return list;
	}

 
 
}
