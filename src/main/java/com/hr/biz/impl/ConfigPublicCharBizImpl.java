package com.hr.biz.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hr.bean.ConfigFileFirstKind;
import com.hr.bean.ConfigFileThirdKind;
import com.hr.bean.ConfigPublicChar;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileThirdKindBiz;
import com.hr.biz.ConfigPublicCharBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class ConfigPublicCharBizImpl implements ConfigPublicCharBiz {

	private BaseDao baseDao;
	
	
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}


	@Override
	public List<ConfigPublicChar> getAll(String Name) {
		ConfigPublicChar char1=new ConfigPublicChar();
		char1.setAttribute_kind(Name);
		 List<ConfigPublicChar> list=this.baseDao.findAll(char1, "getAllProfessions");
		return list;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveProfession(ConfigPublicChar configPublicChar) {
		 this.baseDao.add(configPublicChar, "saveProfession");
		
	}


	@Override
	public ConfigPublicChar getProfessionByName(ConfigPublicChar configPublicChar) {
		List<ConfigPublicChar>list=this.baseDao.findAll(configPublicChar, "getProfessionByName");
		 return list !=null&&list.size()>0 ? list.get(0) : null ;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delProfession(ConfigPublicChar configPublicChar) {
	 this.baseDao.delete(configPublicChar, "delProfession");
		
	}


	@Override
	public List<ConfigPublicChar> getAllChars(ConfigPublicChar configPublicChar) {
		 List<ConfigPublicChar> list=this.baseDao.findAll(configPublicChar, "getAllChars");
			return list;
	}
	@Override
	public int getCharCount() {
		return  this.baseDao.findFunc(new ConfigPublicChar(), "getCharCount");
	}
 
}
