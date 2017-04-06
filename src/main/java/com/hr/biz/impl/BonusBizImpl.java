package com.hr.biz.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hr.bean.Bonus;
import com.hr.bean.ConfigFileFirstKind;
import com.hr.bean.ConfigFileSecondKind;
import com.hr.bean.ConfigFileThirdKind;
import com.hr.bean.ConfigMajorKind;
import com.hr.bean.ConfigPublicChar;
import com.hr.bean.ConfigQuestionSecondKind;
import com.hr.bean.HumanFile;
import com.hr.bean.MajorChange;
import com.hr.bean.Training;
import com.hr.biz.BonusBiz;
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
public class BonusBizImpl implements BonusBiz {

	private BaseDao baseDao;

	@Resource(name = "baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
 

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveInfo(Bonus bonus ) {
		this.baseDao.add(bonus, "saveInfo");
		
	}


	@Override
	public Bonus getInfoByHumanId(Integer id) {
		Bonus bonus=new Bonus();
		bonus.setHuman_id(id);
		 List<Bonus>list=this.baseDao.findAll(bonus, "getInfoByHumanId");
		 return list != null && list.size() > 0 ? list.get(0) : null;
	}


	@Override
	public int getCount() {
		return  this.baseDao.findFunc(new Bonus(), "getCount");
	}


	@Override
	public List<Bonus> getAllPage(Bonus bonus) {
		List<Bonus> list = this.baseDao.findAll(bonus, "getAllPage");
		return list;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateInfo(Bonus bonus) {
		this.baseDao.update(bonus, "updateInfo");
		
	}


	@Override
	public int getBonusCount() {
		return  this.baseDao.findFunc(new Bonus(), "getBonusCount");
	}


	@Override
	public List<Bonus> getAllBonusPage(Bonus bonus) {
		List<Bonus > list = this.baseDao.findAll(bonus, "getAllBonusPage");
		return list;
	}


	@Override
	public Bonus  getInfoById(Integer id) {
		Bonus  bonus=new Bonus();
		bonus.setBon_id(id);
		 List<Bonus >list=this.baseDao.findAll(bonus, "getInfoById");
		 return list != null && list.size() > 0 ? list.get(0) : null;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delInfo(Bonus bonus) {
		 this.baseDao.delete(bonus, "delInfo");
		
	}

 
}
