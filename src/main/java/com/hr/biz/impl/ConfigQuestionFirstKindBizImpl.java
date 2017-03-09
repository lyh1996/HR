package com.hr.biz.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hr.bean.ConfigFileFirstKind;
import com.hr.bean.ConfigFileSecondKind;
import com.hr.bean.ConfigMajorKind;
import com.hr.bean.ConfigPublicChar;
import com.hr.bean.ConfigQuestionFirstKind;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigQuestionFirstKindBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class ConfigQuestionFirstKindBizImpl implements ConfigQuestionFirstKindBiz {

	private BaseDao baseDao;
	
	
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}


	@Override
	public List<ConfigQuestionFirstKind> getAlls() {
		List<ConfigQuestionFirstKind> list = this.baseDao.findAll(new ConfigQuestionFirstKind(), "getAll");
		return list;
	}


	@Override
	public ConfigQuestionFirstKind getINfoByName(ConfigQuestionFirstKind configQuestionFirstKind) {
		List<ConfigQuestionFirstKind>list=this.baseDao.findAll(configQuestionFirstKind, "getInfoByName");
		 return list !=null&&list.size()>0 ? list.get(0) : null ;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void save(ConfigQuestionFirstKind configQuestionFirstKind) {
		this.baseDao.add(configQuestionFirstKind, "save");
		
	}


	@Override
	public int getCount() {
		return  this.baseDao.findFunc(new ConfigQuestionFirstKind(), "getCount");
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delInfo(ConfigQuestionFirstKind configQuestionFirstKind) {
		 this.baseDao.delete(configQuestionFirstKind, "delInfo");
		
	}
	 
}
