package com.hr.biz.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hr.bean.ConfigFileFirstKind;
import com.hr.bean.ConfigFileSecondKind;
import com.hr.bean.ConfigFileThirdKind;
import com.hr.bean.ConfigMajorKind;
import com.hr.bean.ConfigPrimaryKey;
import com.hr.bean.ConfigPublicChar;
import com.hr.bean.HumanFile;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileThirdKindBiz;
import com.hr.biz.ConfigMajorKindBiz;
import com.hr.biz.ConfigPrimaryKeyBiz;
import com.hr.biz.ConfigPublicCharBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class ConfigPrimaryKeyBizImpl implements ConfigPrimaryKeyBiz {

	private BaseDao baseDao;

	@Resource(name = "baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public List<ConfigPrimaryKey> getAll(ConfigPrimaryKey cKey) {
		List<ConfigPrimaryKey> list = this.baseDao.findAll(cKey, "getAll");
		return list;
	}

	@Override
	public List<Map<String,Object>> getInfo(ConfigPrimaryKey cKey) {
		List<Map<String,Object>> list = this.baseDao.findAll(cKey, "getInfo");
		return list;
	}

	@Override
	public List<ConfigPrimaryKey> getAllInfo(ConfigPrimaryKey cKey) {
		List<ConfigPrimaryKey> list = this.baseDao.findAll(cKey, "getAllInfo");
		return list;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateInfo(ConfigPrimaryKey cKey) {
		this.baseDao.update(cKey, "updateInfo");
		
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void resetInfo(ConfigPrimaryKey cKey) {
		this.baseDao.update(cKey, "resetInfo");
		
	}
 
}
