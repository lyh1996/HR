package com.hr.biz.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hr.bean.ConfigFileFirstKind;
import com.hr.bean.ConfigFileSecondKind;
import com.hr.bean.ConfigFileThirdKind;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileThirdKindBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class ConfigFileThirdKindBizImpl implements ConfigFileThirdKindBiz {

	private BaseDao baseDao;
	
	
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}


	@Override
	public List<ConfigFileThirdKind> getAll(ConfigFileThirdKind configFileThirdKind) {
		 List<ConfigFileThirdKind> list=this.baseDao.findAll(configFileThirdKind, "getAllConfigFileThirdKinds");
		return list;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveConfigFileThirdKind(ConfigFileThirdKind configFileThirdKind) {
		 this.baseDao.add(configFileThirdKind, "saveConfigFileThirdKind");
		
	}


	@Override
	public ConfigFileThirdKind getConfigFileThirdKindByName(ConfigFileThirdKind configFileThirdKind) {
		 List<ConfigFileThirdKind>list=this.baseDao.findAll(configFileThirdKind, "getConfigFileThirdKindByName");
		 return list !=null&&list.size()>0 ? list.get(0) : null ;
	}


	@Override
	public ConfigFileThirdKind getConfigFileThirdKindById(Integer id) {
		ConfigFileThirdKind configFileThirdKind=new ConfigFileThirdKind();
		configFileThirdKind.setFtk_id(id);
		 List<ConfigFileThirdKind>list=this.baseDao.findAll(configFileThirdKind, "getConfigFileThirdKindById");
		 return list !=null&&list.size()>0 ? list.get(0) : null ;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateConfigFileThirdKind(ConfigFileThirdKind configFileThirdKind) {
		this.baseDao.update(configFileThirdKind, "updateConfigFileThirdKind");
		
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delConfigFileThirdKind(ConfigFileThirdKind configFileThirdKind) {
		 this.baseDao.delete(configFileThirdKind, "delConfigFileThirdKind");
		
	}


	@Override
	public ConfigFileThirdKind getConfigFileThirdKindBySecondId(Integer id) {
		ConfigFileThirdKind configFileThirdKind=new ConfigFileThirdKind();
		configFileThirdKind.setSecond_kind_id(id);
		 List<ConfigFileThirdKind>list=this.baseDao.findAll(configFileThirdKind, "getConfigFileSecondKindBySecondtId");
		 return list !=null&&list.size()>0 ? list.get(0) : null ;
	}


	@Override
	public int getThirdKindCount() {
		return  this.baseDao.findFunc(new ConfigFileThirdKind(), "getThirdKindCount");
	}


	@Override
	public List<ConfigFileThirdKind> getInfoBySFId(Integer FirstId, Integer SecondId) {
		ConfigFileThirdKind configFileThirdKind=new ConfigFileThirdKind();
		configFileThirdKind.setFirst_kind_id(FirstId);
		configFileThirdKind.setSecond_kind_id(SecondId);
		 List<ConfigFileThirdKind>list=this.baseDao.findAll(configFileThirdKind, "getInfoBySFId");
		 return list ;
	}


	@Override
	public List<ConfigFileThirdKind> getAllInfo() {
		List<ConfigFileThirdKind> list=this.baseDao.findAll(new ConfigFileThirdKind(), "getAllInfo");
		return list;
	}
	
	 
}
