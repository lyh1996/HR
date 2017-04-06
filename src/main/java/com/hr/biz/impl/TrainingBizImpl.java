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
import com.hr.bean.Training;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileThirdKindBiz;
import com.hr.biz.ConfigMajorKindBiz;
import com.hr.biz.ConfigPublicCharBiz;
import com.hr.biz.HumanFileBiz;
import com.hr.biz.MajorChangeBiz;
import com.hr.biz.TrainingBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class TrainingBizImpl implements TrainingBiz {

	private BaseDao baseDao;

	@Resource(name = "baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
 

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveInfo(Training training) {
		this.baseDao.add(training, "saveInfo");
		
	}


	@Override
	public Training getInfoByHumanId(Integer id) {
		Training training=new Training();
		training.setHuman_id(id);
		 List<Training>list=this.baseDao.findAll(training, "getInfoByHumanId");
		 return list != null && list.size() > 0 ? list.get(0) : null;
	}


	@Override
	public int getCount() {
		return  this.baseDao.findFunc(new Training(), "getCount");
	}


	@Override
	public List<Training> getAllPage(Training training) {
		List<Training> list = this.baseDao.findAll(training, "getAllPage");
		return list;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateInfo(Training training) {
		this.baseDao.update(training, "updateInfo");
		
	}


	@Override
	public int getTrainingCount() {
		return  this.baseDao.findFunc(new Training(), "getTrainingCount");
	}


	@Override
	public List<Training> getAllTrainingPage(Training training) {
		List<Training> list = this.baseDao.findAll(training, "getAllTrainingPage");
		return list;
	}


	@Override
	public Training getInfoById(Integer id) {
		Training training=new Training();
		training.setTra_id(id);
		 List<Training>list=this.baseDao.findAll(training, "getInfoById");
		 return list != null && list.size() > 0 ? list.get(0) : null;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delInfo(Training training) {
		 this.baseDao.delete(training, "delInfo");
		
	}

 
}
