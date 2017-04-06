package com.hr.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hr.bean.EngageResume;
import com.hr.biz.EngageResumeBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class EngageResumeBizImpl implements EngageResumeBiz{
	
	private BaseDao baseDao;

	@Resource(name = "baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public List<EngageResume> getAll() {
		List<EngageResume> list = this.baseDao.findAll(new EngageResume(), "getAll");
		return list;
	}

	@Override
	public List<EngageResume> getAll(EngageResume resume) {
		List<EngageResume> list = this.baseDao.findAll(resume, "getAll");
		return list;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveInfo(EngageResume resume) {
		this.baseDao.add(resume, "saveInfo");
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateInfo(EngageResume resume) {
		this.baseDao.update(resume, "updateInfo");
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateinterview(EngageResume resume) {
		this.baseDao.update(resume, "updateinterview");
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updatepass(EngageResume resume) {
		this.baseDao.update(resume, "updatepass");
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updatesubjects(EngageResume resume) {
		this.baseDao.update(resume, "updatesubjects");
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updatestatus(EngageResume resume) {
		this.baseDao.update(resume, "updatestatus");
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updatepassstatus(EngageResume resume) {
		this.baseDao.update(resume, "updatepassstatus");
	}

	
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delInfo(EngageResume resume) {
		this.baseDao.delete(resume, "delete");
	}

	@Override
	public int getCount() {
		return this.baseDao.findFunc(new EngageResume(), "getCount");
	}

	@Override
	public EngageResume getInfoById(EngageResume resume) {
		List<EngageResume> list = this.baseDao.findAll(resume, "getResumeById");
		return list !=null&&list.size()>0 ? list.get(0) : null ;
	}

	@Override
	public List<EngageResume> getInfoByCondition(EngageResume resume) {
		List<EngageResume> list = this.baseDao.findAll(resume, "getResumeByCondition");
		return list;
	}
	@Override
	public List<EngageResume> getPassInfoByCondition(EngageResume resume) {
		List<EngageResume> list = this.baseDao.findAll(resume, "getResumeByCondition2");
		return list;
	}

	@Override
	public EngageResume searchResume(EngageResume resume) {
		List<EngageResume> list = this.baseDao.findAll(resume, "searchResume");
		return list !=null&&list.size()>0 ? list.get(0) : null ;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateinterviewTest(EngageResume resume) {
		this.baseDao.update(resume, "updateinterviewTest");
		
	}

}
