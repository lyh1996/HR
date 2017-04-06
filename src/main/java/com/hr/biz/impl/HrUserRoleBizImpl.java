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
import com.hr.bean.HrRoleRight;
import com.hr.bean.HrUserRole;
import com.hr.bean.HumanFile;
import com.hr.bean.MajorChange;
import com.hr.bean.Training;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileThirdKindBiz;
import com.hr.biz.ConfigMajorKindBiz;
import com.hr.biz.ConfigPublicCharBiz;
import com.hr.biz.HrRoleBiz;
import com.hr.biz.HrUserRoleBiz;
import com.hr.biz.HumanFileBiz;
import com.hr.biz.MajorChangeBiz;
import com.hr.biz.TrainingBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class HrUserRoleBizImpl implements HrUserRoleBiz {

	private BaseDao baseDao;

	@Resource(name = "baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
  
	@Override
	public HrUserRole getRoleByUserID(Integer id) {
		HrUserRole hrUserRole=new HrUserRole();
		hrUserRole.setUId(id);
		List<HrUserRole> list=this.baseDao.findAll(hrUserRole, "getRoleByUserID");
		 return list != null && list.size() > 0 ? list.get(0) : null;
	}
	

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveInfo(HrUserRole hUserRole) {
		this.baseDao.add(hUserRole, "saveInfo");
	}
  
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delInfoByID(Integer id) {
		HrUserRole hrUserRole=new HrUserRole();
		hrUserRole.setUId(id);
		 this.baseDao.delete(hrUserRole, "delInfoByID");
		
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateUsersRole(HrUserRole hUserRole) {
	   this.baseDao.update(hUserRole, "updateUsersRole");
		
	}


 
}
