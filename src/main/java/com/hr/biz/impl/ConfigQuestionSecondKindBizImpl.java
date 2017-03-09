package com.hr.biz.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hr.bean.ConfigFileFirstKind;
import com.hr.bean.ConfigFileSecondKind;
import com.hr.bean.ConfigMajor;
import com.hr.bean.ConfigPublicChar;
import com.hr.bean.ConfigQuestionSecondKind;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileSecondKindBiz;
import com.hr.biz.ConfigQuestionSecondKindBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class ConfigQuestionSecondKindBizImpl implements ConfigQuestionSecondKindBiz {

	private BaseDao baseDao;
	
	
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
 

	@Override
	public List<ConfigQuestionSecondKind>getInfoById(ConfigQuestionSecondKind configQuestionSecondKind ) {
		 List<ConfigQuestionSecondKind>list=this.baseDao.findAll(configQuestionSecondKind, "getInfoById");
		 return list  ;
	}

 

	@Override
	public int getCount() {
		return  this.baseDao.findFunc(new ConfigQuestionSecondKind(), "getCount");
	}


	@Override
	public List<ConfigQuestionSecondKind> getAll(ConfigQuestionSecondKind configQuestionSecondKind) {
		List<ConfigQuestionSecondKind> list = this.baseDao.findAll(configQuestionSecondKind, "getAll");
		return list;
	}


	@Override
	public ConfigQuestionSecondKind getInfoByName(String Name, String first_kind_name) {
		ConfigQuestionSecondKind c = new ConfigQuestionSecondKind();
		c.setFirst_kind_name(first_kind_name);
		c.setSecond_kind_name(Name);
		List<ConfigQuestionSecondKind> list = this.baseDao.findAll(c, "getInfoByName");
		return list != null && list.size() > 0 ? list.get(0) : null;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveInfo(ConfigQuestionSecondKind configQuestionSecondKind) {
		this.baseDao.add(configQuestionSecondKind, "saveInfo");
		
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delInfo(ConfigQuestionSecondKind configQuestionSecondKind) {
		 this.baseDao.delete(configQuestionSecondKind, "delInfo");
		
	}

 
	 
}
