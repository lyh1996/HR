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
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileThirdKindBiz;
import com.hr.biz.ConfigMajorKindBiz;
import com.hr.biz.ConfigPublicCharBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class ConfigMajorKindBizImpl implements ConfigMajorKindBiz {

	private BaseDao baseDao;

	@Resource(name = "baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public List<ConfigMajorKind> getAll(ConfigMajorKind configMajorKind) {
		List<ConfigMajorKind> list = this.baseDao.findAll(configMajorKind, "getAllMajorsPage");
		return list;
	}

	@Override
	public ConfigMajorKind getMajorKindByName(String Name) {
		ConfigMajorKind configMajorKind = new ConfigMajorKind();
		configMajorKind.setMajor_kind_name(Name);
		List<ConfigMajorKind> list = this.baseDao.findAll(configMajorKind, "getConfigMajorKindByName");
		return list != null && list.size() > 0 ? list.get(0) : null;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveConfigMajorKind(ConfigMajorKind configMajorKind) {
		this.baseDao.add(configMajorKind, "saveConfigMajorKind");

	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delMajorKind(ConfigMajorKind ConfigMajorKind) {
		this.baseDao.delete(ConfigMajorKind, "delMajorKind");

	}
 

	@Override
	public int getMajorCount() {
		return  this.baseDao.findFunc(new ConfigMajorKind(), "getMajorCount");
	}

	@Override
	public List<ConfigMajorKind> getAll() {
		List<ConfigMajorKind> list = this.baseDao.findAll(new ConfigMajorKind(), "getAllMajors");
		return list;
	}

}
