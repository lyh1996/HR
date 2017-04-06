package com.hr.biz.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hr.bean.ConfigFileFirstKind;
import com.hr.bean.ConfigFileSecondKind;
import com.hr.bean.ConfigFileThirdKind;
import com.hr.bean.ConfigMajor;
import com.hr.bean.ConfigMajorKind;
import com.hr.bean.ConfigPublicChar;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileThirdKindBiz;
import com.hr.biz.ConfigMajorBiz;
import com.hr.biz.ConfigMajorKindBiz;
import com.hr.biz.ConfigPublicCharBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class ConfigMajorBizImpl implements ConfigMajorBiz {

	private BaseDao baseDao;

	@Resource(name = "baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public List<ConfigMajor> getAll(ConfigMajor configMajor) {
		List<ConfigMajor> list = this.baseDao.findAll(configMajor, "getAllMajors");
		return list;
	}

	@Override
	public ConfigMajor getMajorByName(String Name,String major_kind_name) {
		ConfigMajor configMajor = new ConfigMajor();
		configMajor.setMajor_name(Name);
		configMajor.setMajor_kind_name(major_kind_name);
		List<ConfigMajor> list = this.baseDao.findAll(configMajor, "getConfigMajorByName");
		return list != null && list.size() > 0 ? list.get(0) : null;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveConfigMajor(ConfigMajor configMajor) {
		this.baseDao.add(configMajor, "saveConfigMajor");

	}

	@Override
	public List<ConfigMajor> getMajorByKindName(String Name) {
		ConfigMajor configMajor = new ConfigMajor();
		configMajor.setMajor_kind_name(Name);
		List<ConfigMajor> list = this.baseDao.findAll(configMajor, "getConfigMajorByKindName");
		return list;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delMajor(ConfigMajor configMajor) {
		this.baseDao.delete(configMajor, "delMajor");
		
	}

	@Override
	public List<ConfigMajor> getMajorByKindId(Integer ID) {
		ConfigMajor configMajor = new ConfigMajor();
		configMajor.setMajor_kind_id(ID);
		List<ConfigMajor> list = this.baseDao.findAll(configMajor, "getConfigMajorByKindId");
		return list;
	}

	@Override
	public int getMajorCount() {
		return  this.baseDao.findFunc(new ConfigMajor(), "getMajorCount");
	}

	@Override
	public List<ConfigMajor> getAll() {
		List<ConfigMajor> list = this.baseDao.findAll(new ConfigMajor(), "getAllInfo");
		return list;
	}

}
