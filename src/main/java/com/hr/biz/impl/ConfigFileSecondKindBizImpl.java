package com.hr.biz.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hr.bean.ConfigFileFirstKind;
import com.hr.bean.ConfigFileSecondKind;
import com.hr.bean.ConfigPublicChar;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileSecondKindBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class ConfigFileSecondKindBizImpl implements ConfigFileSecondKindBiz {

	private BaseDao baseDao;
	
	
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}


	@Override
	public List<ConfigFileSecondKind> getAll(ConfigFileSecondKind configFileSecondKind) {
		 List<ConfigFileSecondKind> list=this.baseDao.findAll(configFileSecondKind, "getAllConfigFileSecondKindsPage");
		return list;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveConfigFileSecondKind(ConfigFileSecondKind configFileSecondKind) {
		 this.baseDao.add(configFileSecondKind, "saveConfigFileSecondKind");
		
	}


	@Override
	public ConfigFileSecondKind getConfigFileSecondKindByName(ConfigFileSecondKind configFileSecondKind) {
		 List<ConfigFileSecondKind>list=this.baseDao.findAll(configFileSecondKind, "getConfigFileSecondKindByName");
		 return list !=null&&list.size()>0 ? list.get(0) : null ;
	}


	@Override
	public ConfigFileSecondKind getConfigFileSecondKindById(Integer id) {
		ConfigFileSecondKind configFileSecondKind=new ConfigFileSecondKind();
		configFileSecondKind.setfsk_id(id);
		 List<ConfigFileSecondKind>list=this.baseDao.findAll(configFileSecondKind, "getConfigFileSecondKindById");
		 return list !=null&&list.size()>0 ? list.get(0) : null ;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateConfigFileSecondKind(ConfigFileSecondKind configFileSecondKind) {
		this.baseDao.update(configFileSecondKind, "updateConfigFileSecondKind");
		
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delConfigFileSecondKind(ConfigFileSecondKind configFileSecondKind) {
		 this.baseDao.delete(configFileSecondKind, "delConfigFileSecondKind");
		
	}


	@Override
	public List<ConfigFileSecondKind> getConfigFileSecondKindByFirstId(Integer id) {
		ConfigFileSecondKind configFileSecondKind=new ConfigFileSecondKind();
		configFileSecondKind.setfirst_kind_id(id);
		 List<ConfigFileSecondKind>list=this.baseDao.findAll(configFileSecondKind, "getConfigFileSecondKindByFirstId");
		 return list;
	}


	@Override
	public int getSecondKindCount() {
		return  this.baseDao.findFunc(new ConfigFileSecondKind(), "getSecondKindCount");
	}


	@Override
	public List<ConfigFileSecondKind> getAll() {
		 List<ConfigFileSecondKind> list=this.baseDao.findAll(new ConfigFileSecondKind(), "getAllConfigFileSecondKinds");
			return list;
	}
	
	 
}
