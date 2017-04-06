package com.hr.web.controllers;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hr.bean.ConfigPublicChar;
import com.hr.bean.HrRight;
import com.hr.bean.HrRole;
import com.hr.bean.HrRoleRight;
import com.hr.bean.HrUser;
import com.hr.bean.HrUserRole;
import com.hr.bean.HumanFile;
import com.hr.biz.HrRightBiz;
import com.hr.biz.HrRoleBiz;
import com.hr.biz.HrRoleRightBiz;
import com.hr.biz.HrUserRoleBiz;
import com.hr.biz.HumanFileBiz;
import com.hr.biz.UsersBiz;
import com.hr.web.utils.Page;

@Controller
public class RightController {
	private static final Log logger = LogFactory.getLog(RightController.class);
	
	private HrRoleBiz hrRoleBiz;
	@Resource(name = "hrRoleBizImpl")
	public void setHrRoleBizBiz(HrRoleBiz hrRoleBiz) {
		this.hrRoleBiz = hrRoleBiz;
	}
	private HrRightBiz hrRightBiz;
	@Resource(name = "hrRightBizImpl")
	public void setHrRightBizBiz(HrRightBiz hrRightBiz) {
		this.hrRightBiz = hrRightBiz;
	}
	private HrRoleRightBiz hrRoleRightBiz;
	@Resource(name = "hrRoleRightBizImpl")
	public void setHrRoleRightBiz(HrRoleRightBiz hrRoleRightBiz) {
		this.hrRoleRightBiz = hrRoleRightBiz;
	}
	private UsersBiz usersBiz;
		
		@Resource(name = "usersBizImpl")
		public void setUsersBiz(UsersBiz usersBiz) {
			this.usersBiz=usersBiz;
		}
private HrUserRoleBiz hrUserRoleBiz;
		
		@Resource(name = "hrUserRoleBizImpl")
		public void setHrUserRoleBiz(HrUserRoleBiz hrUserRoleBiz) {
			this.hrUserRoleBiz=hrUserRoleBiz;
		}
		private HumanFileBiz humanFileBiz;
		@Resource(name = "humanFileBizImpl")
		public void setHumanFileBiz(HumanFileBiz humanFileBiz) {
			this.humanFileBiz = humanFileBiz;
		}
 
	// 权限设置
	@RequestMapping(value = "/right.do")
	public String gethumanfiles(Model model, HttpServletRequest request,HrRole hRole,HrRight hrRight,HrUserRole hur ,HrUser huser ,@RequestParam(name = "rightCode", required = false) String[] rightCode) { 
		String operate=request.getParameter("operate");
		String pageNow=request.getParameter("pageNow");
				if("toRight".equals(operate)){//前往权限列表
					Page page = null;//new 对象在下面
			        int totalCount = this.hrRightBiz.getRightCount();//获取当前用户总记录条数
			        if(pageNow != null && pageNow != "") {//防止出现空指针异常
			            int pageNow1 = Integer.parseInt(pageNow);
			            page = new Page(totalCount, pageNow1);//这样写的好处，判断完成外面可以继续调用
			        }
			        hrRight.setPage(page);
			        List<HrRight> list = this.hrRightBiz.getAllRightToPage(hrRight);//取得当前用户的所有操作记录
			        model.addAttribute("page",page);
					model.addAttribute("list", list);
					List<HrRight> list2=this.hrRightBiz.getAllRight();
					model.addAttribute("list2", list2);
					return "right/right/list";
				}else if("toRole".equals(operate)){//前往角色列表
					List<HrRole> list=this.hrRoleBiz.getAllRole();
					//System.out.println(list);
					model.addAttribute("list", list);
					return "right/role/list";
				}else if("toUser".equals(operate)){//前往用户列表
					List<HrUser> list=this.usersBiz.getAllUsers(huser);
					for(HrUser u:list){
						HrUserRole hrUserRole=this.hrUserRoleBiz.getRoleByUserID(u.getUId());
						if(hrUserRole!=null){
						 HrRole h=this.hrRoleBiz.getRoleByID(hrUserRole.getRId());
						 u.setHrRole(h);
						}else{
							u.setHrRole(null);
						}
					}
					model.addAttribute("list", list);
					return "right/user/list";
				}else if("toAdd".equals(operate)){//角色添加
					return "right/role/add";
				}else if("doAdd".equals(operate)){//角色保存
					this.hrRoleBiz.saveInfo(hRole);
					List<HrRole> list=this.hrRoleBiz.getAllRole();
					model.addAttribute("list", list);
					return "right/role/list";
				}else if("toDispact".equals(operate)){//角色分配权限
					Integer Rid=Integer.parseInt(request.getParameter("RId"));
					HrRole hrRole=this.hrRoleBiz.getRoleByID(Rid);
					List<HrRight> list= this.hrRightBiz.getAllRight();
					model.addAttribute("roles", hrRole);
					model.addAttribute("list", list);
					return   "right/role/text";
				}else if("doDispact".equals(operate)){//角色分配权限保存
					Integer rid=Integer.parseInt(request.getParameter("id"));
					 
					List<HrRoleRight> hrRoleRight=this.hrRoleRightBiz.getRoleRightByID(rid);
					if(hrRoleRight!=null&&!"".equals(hrRoleRight)){
						 this.hrRoleRightBiz.delInfoByID(rid);
					 }
					for(int i=0;i<rightCode.length;i++){
						HrRoleRight hrRoleRight2=new HrRoleRight();
						hrRoleRight2.setRId(rid);
						hrRoleRight2.setRightCode(rightCode[i]);
						 this.hrRoleRightBiz.saveInfo(hrRoleRight2);
					}
					List<HrRole> list=this.hrRoleBiz.getAllRole();
					model.addAttribute("list", list);
					return "right/role/list";
				}else if("toUserDispact".equals(operate)){//用户权限分配
					Integer UId=Integer.parseInt(request.getParameter("UId"));
					
					HrUser list=this.usersBiz.getInfoByUserID(UId);
					List<HrRole> list2=this.hrRoleBiz.getAllRole();
					model.addAttribute("list",list);
					model.addAttribute("list2",list2);
					return "right/user/dispatch";
				}else if("doAdduserRole".equals(operate)){//用户权限保存
					 HrUserRole hUserRole=this.hrUserRoleBiz.getRoleByUserID(hur.getUId());
					 if(hUserRole!=null){
						 this.hrUserRoleBiz.delInfoByID(hur.getUId());
					 }
					 this.hrUserRoleBiz.saveInfo(hur);
					 HrUser hUser2=new HrUser();
					List<HrUser> list=this.usersBiz.getAllUsers(hUser2);
					for(HrUser u:list){
						HrUserRole hrUserRole=this.hrUserRoleBiz.getRoleByUserID(u.getUId());
						if(hrUserRole!=null){
						 HrRole h=this.hrRoleBiz.getRoleByID(hrUserRole.getRId());
						 u.setHrRole(h);
						}else{
							u.setHrRole(null);
						}
					}
					model.addAttribute("list", list);
					return "right/user/list";
				}else if("toAddUser".equals(operate)){//前往添加用户
					HumanFile hFile=new HumanFile();
					List<HumanFile> humanFiles=this.humanFileBiz.getInfoByCondition(hFile);
					List<HrRole> hrRoles=this.hrRoleBiz.getAllRoleByFlag(1);
					model.addAttribute("hrRolesList", hrRoles);
					model.addAttribute("humanList", humanFiles);
					return "right/user/add";
				}else if("doAddUser".equals(operate)){
					//拆分用户真实名得到huFid
					String uTrueName=huser.getUTrueName();
					Integer hufId = Integer.parseInt(uTrueName.substring(0, uTrueName.lastIndexOf("/")));
					uTrueName = uTrueName.substring(uTrueName.lastIndexOf("/") + 1);
					huser.setHufId(hufId);
					huser.setUTrueName(uTrueName);
					HrUser hUser2=this.usersBiz.getUsersByU_name(huser.getUName(),null);
					if(hUser2!=null){
						
						return "home/register_failure";
					}else{
					
						this.usersBiz.saveUsers(huser);
						hur.setUId(huser.getUId());
						this.hrUserRoleBiz.saveInfo(hur);
						//System.out.println(huser);
						//System.out.println(hur);
					//返回用户列表
						 HrUser hUser3=new HrUser();
					List<HrUser> list=this.usersBiz.getAllUsers(hUser3);
					for(HrUser u:list){
						HrUserRole hrUserRole=this.hrUserRoleBiz.getRoleByUserID(u.getUId());
						if(hrUserRole!=null){
						 HrRole h=this.hrRoleBiz.getRoleByID(hrUserRole.getRId());
						 u.setHrRole(h);
						}else{
							u.setHrRole(null);
						}
					}
						model.addAttribute("list", list);
						return "right/user/list";
					}
				}else if("toUserEdit".equals(operate)){//前往编辑用户
					Integer UId=Integer.parseInt(request.getParameter("UId"));
					HrUser hUser2=this.usersBiz.getInfoByUserID(UId);
					List<HrRole> hrRoles=this.hrRoleBiz.getAllRoleByFlag(1);
					model.addAttribute("hrRolesList", hrRoles);
					model.addAttribute("huser", hUser2);
					  return "right/user/edit";
				}else if("doUserEdit".equals(operate)){//保存编辑
					
					this.hrUserRoleBiz.updateUsersRole(hur);
					//返回用户列表
					HrUser hUser4=new HrUser();
					List<HrUser> list=this.usersBiz.getAllUsers(hUser4);
					for(HrUser u:list){
						HrUserRole hrUserRole=this.hrUserRoleBiz.getRoleByUserID(u.getUId());
						if(hrUserRole!=null){
						 HrRole h=this.hrRoleBiz.getRoleByID(hrUserRole.getRId());
						 u.setHrRole(h);
						}else{
							u.setHrRole(null);
						}
					}
						model.addAttribute("list", list);
						return "right/user/list";
				}else if("toUserDel".equals(operate)){//删除用户
					Integer UId=Integer.parseInt(request.getParameter("UId"));
					this.hrUserRoleBiz.delInfoByID(UId);//删除用户角色
					this.usersBiz.delInfoByID(UId);
					//返回用户列表
					HrUser hUser4=new HrUser();
					List<HrUser> list=this.usersBiz.getAllUsers(hUser4);
					for(HrUser u:list){
						HrUserRole hrUserRole=this.hrUserRoleBiz.getRoleByUserID(u.getUId());
						if(hrUserRole!=null){
						 HrRole h=this.hrRoleBiz.getRoleByID(hrUserRole.getRId());
						 u.setHrRole(h);
						}else{
							u.setHrRole(null);
						}
					}
						model.addAttribute("list", list);
						return "right/user/list";
				}else if("toRightEdit".equals(operate)){//去往权限编辑
					String rightCode1=request.getParameter("id");
					HrRight h= this.hrRightBiz.getINfoByRightCode(rightCode1);
					
					model.addAttribute("list", h);
					return "right/right/edit";
				}else if("doRightEdit".equals(operate)){
					this.hrRightBiz.updateInfo(hrRight);
					//System.out.println(hrRight);
					//返回列表
					HrRight hrRight2=new HrRight();
					Page page = null;//new 对象在下面
			        int totalCount = this.hrRightBiz.getRightCount();//获取当前用户总记录条数
			        if(pageNow != null && pageNow != "") {//防止出现空指针异常
			            int pageNow1 = Integer.parseInt(pageNow);
			            page = new Page(totalCount, pageNow1);//这样写的好处，判断完成外面可以继续调用
			        }
			        hrRight2.setPage(page);
			        List<HrRight> list = this.hrRightBiz.getAllRightToPage(hrRight2);//取得当前用户的所有操作记录
			        model.addAttribute("page",page);
					model.addAttribute("list", list);
					List<HrRight> list2=this.hrRightBiz.getAllRight();
					model.addAttribute("list2", list2);
					return "right/right/list";
				}else if("toEditRole".equals(operate)){
					Integer Rid=Integer.parseInt(request.getParameter("RId"));
					HrRole list=this.hrRoleBiz.getRoleByID(Rid);
					model.addAttribute("list", list);
					return "right/role/edit";
				}else if("doRoleEdit".equals(operate)){
					this.hrRoleBiz.updateRole(hRole);
					//返回界面
					List<HrRole> list=this.hrRoleBiz.getAllRole();
					//System.out.println(list);
					model.addAttribute("list", list);
					return "right/role/list";
				}
		return  null;
	}
}
