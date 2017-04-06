package com.hr.biz.impl;




import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hr.bean.HrUser;
import com.hr.bean.HrUserRole;
import com.hr.biz.UsersBiz;
import com.hr.dao.BaseDao;

@Service
public class UsersBizImpl implements UsersBiz {
	private BaseDao baseDao;
	
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}



	@Override
	public HrUser getUsersByU_name(String name,String  pwd) {
		HrUser users=new HrUser();
		users.setUName(name);
		users.setUPassword(pwd);
		 List<HrUser> list=this.baseDao.findAll(users, "getUsersByU_name");
		 return list !=null&&list.size()>0 ? list.get(0) : null ;
	}



	@Override
	public List<HrUser> getAllUsers(HrUser users) {
		List<HrUser> list=this.baseDao.findAll(users, "getAllUsers");
		return list;
	}



	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void saveUsers(HrUser users) {
		this.baseDao.add(users, "saveUsers");
	}



	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateUsers(HrUser users) {
		this.baseDao.update(users, "updateUsers");
		
	}



	@Override
	public HrUser getInfoByUserID(Integer id) {
		HrUser hrUserRole=new HrUser();
		hrUserRole.setUId(id);
		List<HrUser> list=this.baseDao.findAll(hrUserRole, "getInfoByUserID");
		 return list != null && list.size() > 0 ? list.get(0) : null;
	}



	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delInfoByID(Integer id) {
			HrUser hrUser=new HrUser();
			hrUser.setUId(id);
			 this.baseDao.delete(hrUser, "delInfoByID");
			
	}


	


}
