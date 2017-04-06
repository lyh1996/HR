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
import com.hr.bean.HrRight;
import com.hr.bean.HrRole;
import com.hr.bean.HumanFile;
import com.hr.bean.MajorChange;
import com.hr.bean.Training;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileThirdKindBiz;
import com.hr.biz.ConfigMajorKindBiz;
import com.hr.biz.ConfigPublicCharBiz;
import com.hr.biz.HrRightBiz;
import com.hr.biz.HrRoleBiz;
import com.hr.biz.HumanFileBiz;
import com.hr.biz.MajorChangeBiz;
import com.hr.biz.TrainingBiz;
import com.hr.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class HrRightBizImpl implements HrRightBiz {

	private BaseDao baseDao;

	@Resource(name = "baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
 
 
 
	@Override
	public List<HrRight> getAllRight() {
		List<HrRight> list = this.baseDao.findAll(new HrRight(), "getAllRight");
		return list;
	}



	@Override
	public int getRightCount() {
		return  this.baseDao.findFunc(new HrRight(), "getRightCount");
	}



	@Override
	public List<HrRight> getAllRightToPage(HrRight hrRight) {
		List<HrRight> list=this.baseDao.findAll(hrRight, "getAllRightToPage");
		return list;
	}



	@Override
	public  HrRight  getINfoByRightCode(String rightCode) {
		HrRight hrRight=new HrRight();
		hrRight.setRightCode(rightCode);
		List<HrRight> list=this.baseDao.findAll(hrRight, "getINfoByRightCode");
		 return list != null && list.size() > 0 ? list.get(0) : null;
	}



	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateInfo(HrRight hrRight) {
	   this.baseDao.update(hrRight, "updataInfo");
		
	}


 
}
