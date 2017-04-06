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
import com.hr.bean.ConfigQuestionSecondKind;
import com.hr.bean.HrRole;
import com.hr.bean.HrUserRole;
import com.hr.bean.HumanFile;
import com.hr.bean.MajorChange;
import com.hr.bean.Training;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileThirdKindBiz;
import com.hr.biz.ConfigMajorKindBiz;
import com.hr.biz.ConfigPublicCharBiz;
import com.hr.biz.HrRoleBiz;
import com.hr.biz.HumanFileBiz;
import com.hr.biz.MajorChangeBiz;
import com.hr.biz.TrainingBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class HrRoleBizImpl implements HrRoleBiz {

	private BaseDao baseDao;

	@Resource(name = "baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
 
 
 
	@Override
	public List<HrRole> getAllRole() {
		List<HrRole> list = this.baseDao.findAll(new HrRole(), "getAllRole");
		return list;
	}



	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveInfo(HrRole hrRole) {
		this.baseDao.add(hrRole, "saveInfo");
	}



	@Override
	public HrRole getRoleByID(Integer id) {
		 HrRole hrRole=new HrRole();
		 hrRole.setRId(id);
		 List<HrRole> list=this.baseDao.findAll(hrRole, "getRoleByID");
		 return list != null && list.size() > 0 ? list.get(0) : null;
	}



	@Override
	public List<HrRole> getAllRoleByFlag(Integer id) {
		 HrRole hrRole=new HrRole();
		 hrRole.setRFlag(id);
		 List<HrRole> list=this.baseDao.findAll(hrRole, "getAllRoleByFlag");
		return list;
	}



	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateRole(HrRole hRole) {
		this.baseDao.update(hRole, "updateRole");
		
	}
 
 
}
