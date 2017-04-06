package com.hr.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hr.bean.EngageInterview;
import com.hr.biz.EngageInterviewBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class EngageInterviewBizImpl implements EngageInterviewBiz{
	
	private BaseDao baseDao;

	@Resource(name = "baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public List<EngageInterview> getAll() {
		List<EngageInterview> list = this.baseDao.findAll(new EngageInterview(), "getAll");
		return list;
	}

	@Override
	public List<EngageInterview> getAll(EngageInterview interview) {
		List<EngageInterview> list = this.baseDao.findAll(interview, "getAllInfo");
		return list;
	}

	@Override
	public EngageInterview getInfoById(EngageInterview interview) {
		List<EngageInterview> list = this.baseDao.findAll(interview, "getInterviewById");
		return list !=null&&list.size()>0 ? list.get(0) : null ;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveInfo(EngageInterview interview) {
		this.baseDao.add(interview, "saveInfo");
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateInfo(EngageInterview interview) {
		this.baseDao.update(interview, "updateInfo");
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delInfo(EngageInterview interview) {
		this.baseDao.delete(interview, "delete");
	}

	@Override
	public int getCount() {
		return this.baseDao.findFunc(new EngageInterview(), "getCount");
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateInfoTest(EngageInterview interview) {
		this.baseDao.update(interview, "updateInfoTest");
		
	}

}
