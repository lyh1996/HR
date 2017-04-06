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
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileThirdKindBiz;
import com.hr.biz.ConfigMajorKindBiz;
import com.hr.biz.ConfigPublicCharBiz;
import com.hr.biz.HumanFileBiz;
import com.hr.biz.MajorChangeBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class MajorChangeBizImpl implements MajorChangeBiz {

	private BaseDao baseDao;

	@Resource(name = "baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
 

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveInfo(MajorChange mChange) {
		this.baseDao.add(mChange, "saveInfo");
		
	}


	@Override
	public int getCount() {
		return  this.baseDao.findFunc(new MajorChange(), "getCount");
	}


	@Override
	public List<MajorChange> getAllPage(MajorChange mchange) {
		List<MajorChange> list = this.baseDao.findAll(mchange, "getAllPage");
		return list;
	}


	@Override
	public MajorChange getInfoById(Integer id) {
		MajorChange mChange=new MajorChange();
		mChange.setMch_id(id);
		 List<MajorChange>list=this.baseDao.findAll(mChange, "getInfoById");
		 return list != null && list.size() > 0 ? list.get(0) : null;
	}


	@Override
	public MajorChange getInfoByHumanId(Integer id) {
		MajorChange mChange=new MajorChange();
		mChange.setHuman_id(id);
		 List<MajorChange>list=this.baseDao.findAll(mChange, "getInfoByHumanId");
		 return list != null && list.size() > 0 ? list.get(0) : null;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateInfo(MajorChange mchange) {
		this.baseDao.update(mchange, "updateInfo");
		
	}


	@Override
	public int getChangeCount() {
		return  this.baseDao.findFunc(new MajorChange(), "getChangeCount");
	}


	@Override
	public List<MajorChange> getAllChangePage(MajorChange mchange) {
		List<MajorChange> list = this.baseDao.findAll(mchange, "getAllChangePage");
		return list;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delInfo(MajorChange mchange) {
		 this.baseDao.delete(mchange, "delInfo");
		
	}
 
 
}
