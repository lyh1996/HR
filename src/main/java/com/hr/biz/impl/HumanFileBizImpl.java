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
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileThirdKindBiz;
import com.hr.biz.ConfigMajorKindBiz;
import com.hr.biz.ConfigPublicCharBiz;
import com.hr.biz.HumanFileBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class HumanFileBizImpl implements HumanFileBiz {

	private BaseDao baseDao;

	@Resource(name = "baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}


	@Override
	public List<HumanFile> getAll() {
		List<HumanFile> list = this.baseDao.findAll(new HumanFile(), "getAll");
		return list;
	}


	@Override
	public HumanFile getInfoByIdCard(String human_id_card) {
	 HumanFile hFile=new HumanFile();
	 hFile.setHuman_id_card(human_id_card);
	 List<HumanFile>list=this.baseDao.findAll(hFile, "getInfoById");
	 return list != null && list.size() > 0 ? list.get(0) : null;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveInfo(HumanFile humanFile) {
		this.baseDao.add(humanFile, "saveInfo");
		
	}


	@Override
	public int getCount() {
		return  this.baseDao.findFunc(new HumanFile(), "getCount");
	}


	@Override
	public List<HumanFile> getAllPage(HumanFile humanFile) {
		List<HumanFile> list = this.baseDao.findAll(humanFile, "getAllPage");
		return list;
	}


	@Override
	public HumanFile getInfoByHumanId(Integer id) {
		HumanFile humanFile=new HumanFile();
		humanFile.setHuf_id(id);
		 List<HumanFile>list=this.baseDao.findAll(humanFile, "getInfoByHumanId");
		 return list !=null&&list.size()>0 ? list.get(0) : null ;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateInfo(HumanFile humanFile) {
		this.baseDao.update(humanFile, "updateInfo");
		
	}


	@Override
	public List<HumanFile> getInfoByCondition(HumanFile humanFile) {
		List<HumanFile> list = this.baseDao.findAll(humanFile, "getInfoByCondition");
		return list;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateInfoByChange(HumanFile humanFile) {
		this.baseDao.update(humanFile, "updateInfoByChange");
		
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateInfoToDelete(HumanFile humanFile) {
		this.baseDao.update(humanFile, "updateInfoToDelete");
		
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateInfoToRecovery(HumanFile humanFile) {
		this.baseDao.update(humanFile, "updateInfoToRecovery");
		
	}


	@Override
	public int getDelCount() {
		return  this.baseDao.findFunc(new HumanFile(), "getDelCount");
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delInfo(HumanFile humanFile) {
		 this.baseDao.delete(humanFile, "delInfo");
		
	}


	@Override
	public List<HumanFile> getInfoByName(HumanFile humanFile) {
		List<HumanFile> list = this.baseDao.findAll(humanFile, "getInfoByName");
		return list;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateInfoToMajorChange(HumanFile humanFile) {
		this.baseDao.update(humanFile, "updateInfoToMajorChange");
		
	}


	@Override
	public HumanFile getInfoByHumanIds(Integer id) {
		HumanFile humanFile=new HumanFile();
		humanFile.setHuman_id(id);
		 List<HumanFile>list=this.baseDao.findAll(humanFile, "getInfoByHumanIds");
		 return list !=null&&list.size()>0 ? list.get(0) : null ;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateInfoToTraining(HumanFile humanFile) {
		this.baseDao.update(humanFile, "updateInfoToTraining");
		
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateInfoToBonus(HumanFile humanFile) {
		this.baseDao.update(humanFile, "updateInfoToBonus");
		
	}


	@Override
	public List<HumanFile> getInfoToSalaryGrant( ) {
		 List<HumanFile>list=this.baseDao.findAll(new HumanFile(), "getInfoToSalaryGrant");
		 return list ;
	}


	@Override
	public List<HumanFile> getInfoToSalaryGrant2() {
		 List<HumanFile>list=this.baseDao.findAll(new HumanFile(), "getInfoToSalaryGrant2");
		 return list ;
	}


	@Override
	public List<HumanFile> getInfoToSalaryGrant3() {
		 List<HumanFile>list=this.baseDao.findAll(new HumanFile(), "getInfoToSalaryGrant3");
		 return list ;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateInfoToSalary(HumanFile humanFile) {
			this.baseDao.update(humanFile, "updateInfoToSalary");
	}


	 
}
