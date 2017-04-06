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
import com.hr.bean.HumanFile;
import com.hr.bean.MajorChange;
import com.hr.bean.Training;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileThirdKindBiz;
import com.hr.biz.ConfigMajorKindBiz;
import com.hr.biz.ConfigPublicCharBiz;
import com.hr.biz.HrRoleBiz;
import com.hr.biz.HrRoleRightBiz;
import com.hr.biz.HumanFileBiz;
import com.hr.biz.MajorChangeBiz;
import com.hr.biz.TrainingBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class HrRoleRightBizImpl implements HrRoleRightBiz {

	private BaseDao baseDao;

	@Resource(name = "baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
 
 


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveInfo(HrRoleRight hrRoleRight) {
		this.baseDao.add(hrRoleRight, "saveInfo");
	}



	@Override
	public List<HrRoleRight> getRoleRightByID(Integer id) {
		HrRoleRight hrRole=new HrRoleRight();
		 hrRole.setRId(id);
		 List<HrRoleRight> list=this.baseDao.findAll(hrRole, "getRoleRightByID");
		 return list;
	}




	@Override
	public void delInfoByID(Integer id) {
		HrRoleRight hrRole=new HrRoleRight();
		 hrRole.setRId(id);
		 this.baseDao.delete(hrRole, "delInfoByID");
		
	}

 
}
