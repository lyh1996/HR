package com.hr.web.controllers;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hr.bean.HrRight;
import com.hr.bean.HrRoleRight;
import com.hr.bean.HrUser;
import com.hr.bean.HrUserRole;
import com.hr.biz.HrRightBiz;
import com.hr.biz.HrRoleBiz;
import com.hr.biz.HrRoleRightBiz;
import com.hr.biz.HrUserRoleBiz;
import com.hr.biz.UsersBiz;

@Controller
public class UsersController {
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
	 
		  
	@RequestMapping(value="toLogin")
	public String toLogin(){
		return "home/login";
	}
	 
	@RequestMapping(value = "/users.do")
	public String getUsers(Model model, HttpServletRequest request,HttpServletResponse response,HttpSession session,@RequestParam(required=false) String validateCode){
		String opreate = request.getParameter("operate");
			if("doLogin".equals(opreate)){		
				String u_name=request.getParameter("UName");
				String u_password=request.getParameter("UPassword");
				HrUser users=new HrUser();
				users.setUName(u_name);
				users.setUPassword(u_password);
				users=this.usersBiz.getUsersByU_name(users.getUName(),users.getUPassword());
				String randCode=(String) session.getAttribute("rand");
				if(!validateCode.equals(randCode)){
					session.setAttribute("errmsg", "验证码错误.....");
					return "home/login";
				}
				if(users!=null ){
					HrUserRole hUserRole=this.hrUserRoleBiz.getRoleByUserID(users.getUId());
					System.out.println(hUserRole);
					if(hUserRole==null){
						session.setAttribute("errmsg", "你没有权限访问，请与管理员联系!!!!.");
						return "home/login";
					}else{
						List<HrRight> rights=new ArrayList<HrRight>();
						List<HrRoleRight> hrrList=this.hrRoleRightBiz.getRoleRightByID(hUserRole.getRId());
						if(hrrList.size()<=0){
							session.setAttribute("errmsg", "你没有权限访问，请与管理员联系!!!!.");
							return "home/login";
						}else{
						for(HrRoleRight hrr:hrrList){
							 rights.add(this.hrRightBiz.getINfoByRightCode(hrr.getRightCode()));
						}
					//生成动态菜单
					StringBuffer sb=new StringBuffer();
					//根据登录的用户id得到权限的集合
					for (HrRight hrRight : rights) {
						//在这里拼接
						//System.out.println(hrRight);
						if (hrRight.getRightParentCode().equals("-1")) {
							sb.append(hrRight.getRightCode()+"=theMenu.addEntry("+hrRight.getRightParentCode()+",\""+hrRight.getRightType()+"\",\""+hrRight.getRightText()+"\",\""+hrRight.getRightUrl()+"\",\""+hrRight.getRightTip()+"...\");\r\n");
						}else {
							sb.append(hrRight.getRightCode()+"=theMenu.addChild("+hrRight.getRightParentCode()+",\""+hrRight.getRightType()+"\",\""+hrRight.getRightText()+"\",\""+hrRight.getRightUrl()+"\",\""+hrRight.getRightTip()+"...\");\r\n");
						}
					}
					//System.out.println(sb.toString());
					session.setAttribute("sb", sb.toString());
					session.setAttribute("user", u_name);
					return "redirect:/main";
						}
					}
				}else{
					session.setAttribute("errmsg", "用户名或者密码错误....");
					return "home/login";
				}
			}else if("toLogin".equals(opreate)){
				return "home/login";
			}else if("toAdd".equals(opreate)){
				return "home/register";
			}else if("doAdd".equals(opreate)){
				String u_name=request.getParameter("UName");
				String u_true_name=request.getParameter("UTrueName");
				String u_password=request.getParameter("UPassword");
				String surPwd=request.getParameter("surPwd");
				HrUser hrUser= new HrUser();
				hrUser.setUName(u_name);
				hrUser=this.usersBiz.getUsersByU_name(hrUser.getUName(),null);
				if(surPwd.equals(u_password) && hrUser==null && u_password!=null && u_password!=""){
					HrUser users=new HrUser();
					users.setUName(u_name);
					users.setUPassword(u_password);
					users.setUTrueName(u_true_name);
					users.setHufId(0);
					this.usersBiz.saveUsers(users);
					return "home/register_success";
				}else if(hrUser!=null){
					return "home/register_failure";
				}else{
					return "home/register_failure_password";
				}
			}else if("toEditPwd".equals(opreate)){
				
				return "home/change_password";
			}else if("doEditPwd".equals(opreate)){
				String u_name=request.getParameter("UName");
				String u_password=request.getParameter("UPassword");
				String surPwd=request.getParameter("surPwd");
				String old_u_password=request.getParameter("old_u_password");
				HrUser hrusers=new HrUser();
				hrusers.setUName(u_name);
				hrusers=this.usersBiz.getUsersByU_name(hrusers.getUName(),null);
				if(hrusers==null){
					return "home/change_password_failure_hrusersNULL";
				}else if(!hrusers.getUPassword().equals(old_u_password)){
					return "home/change_password_failure_UNameNOTPassword";
				}else if(u_password.equals(surPwd)){
					HrUser users=new HrUser();
					users.setUName(u_name);
					users.setUPassword(u_password);
					this.usersBiz.updateUsers(users);
					return "home/change_password_success";
				}else {
					return "home/change_password_failure";
				}		
			}
			return null;
	}
	
		//进入主页面
		@RequestMapping(value="/main")
		public String index(){
			return "main/index";
		}
			//进入主页面
			@RequestMapping(value="/index_top")
			public String index_top(){
				return "main/index_top";
			}
			//进入主页面
			@RequestMapping(value="/index_left")
			public String index_left(){
				return "main/index_left";
			}
			//进入主页面
			@RequestMapping(value="/index_right")
			public String index_right(){
				return "main/index_right";
			}
			//进入主页面
			@RequestMapping(value="/index_bottom")
			public String index_bottom(){
				return "main/index_bottom";
			}
			//验证码
			@RequestMapping(value="/image")
			public String image(){
				return "image";
			}
		 
			@RequestMapping(value="/menu")
			public String menu(){
				return "main/menu";
			}
			
			@RequestMapping(value="/tree")
			public String tree(){
				return "main/tree";
			}
		 
}
