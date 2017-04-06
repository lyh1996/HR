package com.hr.biz.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hr.bean.ConfigFileFirstKind;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class ConfigFileFirstKindBizImpl implements ConfigFileFirstKindBiz {

	private BaseDao baseDao;
	
	
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	@Override
	public List<ConfigFileFirstKind> getAllConfigFileFirstKinds() {
		 List<ConfigFileFirstKind> list=this.baseDao.findAll(new ConfigFileFirstKind(), "getAllConfigFileFirstKinds");
			return list;
	}

	@Override
	public ConfigFileFirstKind getConfigFileFirstKindByName(ConfigFileFirstKind configFileFirstKind) {
		 List<ConfigFileFirstKind>list=this.baseDao.findAll(configFileFirstKind, "getConfigFileFirstKindByName");
		 return list !=null&&list.size()>0 ? list.get(0) : null ;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveConfigFileFirstKind(ConfigFileFirstKind configFileFirstKind) {
		 this.baseDao.add(configFileFirstKind, "saveConfigFileFirstKind");
	}

	@Override
	public ConfigFileFirstKind getConfigFileFirstKindById(Integer id) {
		ConfigFileFirstKind configFileFirstKind=new ConfigFileFirstKind();
		configFileFirstKind.setFirstKindId(id);
		 List<ConfigFileFirstKind>list=this.baseDao.findAll(configFileFirstKind, "getConfigFileFirstKindById");
		 return list !=null&&list.size()>0 ? list.get(0) : null ;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateConfigFileFirstKind(ConfigFileFirstKind configFileFirstKind) {
		this.baseDao.update(configFileFirstKind, "updateConfigFileFirstKind");
		
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delConfigFileFirstKind(ConfigFileFirstKind configFileFirstKind) {
		 this.baseDao.delete(configFileFirstKind, "delConfigFileFirstKind");
		
	}

}
