package com.hr.web.controllers;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hr.bean.ConfigFileFirstKind;
import com.hr.bean.ConfigMajorKind;
import com.hr.bean.EngageMajorRelease;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigMajorKindBiz;
import com.hr.biz.EngageMajorReleaseBiz;
import com.hr.web.utils.Page;

@Controller
public class EngageMajorReleaseController {
	private static final Log logger = LogFactory.getLog(EngageMajorReleaseController.class);
	
	private ConfigFileFirstKindBiz configFileFirstKindBiz;
	private ConfigMajorKindBiz configMajorKindBiz;
	private EngageMajorReleaseBiz releaseBiz;
		
	@Resource(name = "configFileFirstKindBizImpl")
	public void setConfigFileFirstKindBiz(ConfigFileFirstKindBiz configFileFirstKindBiz) {
		this.configFileFirstKindBiz = configFileFirstKindBiz;
	}
	@Resource(name = "configMajorKindBizImpl")
	public void setConfigMajorKindBiz(ConfigMajorKindBiz configMajorKindBiz) {
		this.configMajorKindBiz = configMajorKindBiz;
	}
	@Resource(name = "engageMajorReleaseBizImpl")
	public void setReleaseBiz(EngageMajorReleaseBiz releaseBiz) {
		this.releaseBiz = releaseBiz;
	}

	@RequestMapping(value = "/engagemajorrelease.do")
	public String getrelease(Model model, HttpServletRequest request,EngageMajorRelease release){
		String operate = request.getParameter("operate");
		String pageNow = request.getParameter("pageNow");
		if("toAdd".equals(operate)){
			List<ConfigFileFirstKind> lists = this.configFileFirstKindBiz.getAllConfigFileFirstKinds();
			List<ConfigMajorKind> list2 = this.configMajorKindBiz.getAll();
			model.addAttribute("list", lists);
			model.addAttribute("list2", list2);
			return "engage/major_release/register";
		}else if("toSubmit".equals(operate)){
			//拆分字段  a/b  -> a  b
			String first_kind_name = release.getFirst_kind_name();
			Integer first_kind_id = Integer.parseInt(first_kind_name.substring(0, first_kind_name.lastIndexOf("/")));
			first_kind_name = first_kind_name.substring(first_kind_name.lastIndexOf("/")+1);
			
			String second_kind_name = release.getSecond_kind_name();
			Integer second_kind_id = Integer.parseInt(second_kind_name.substring(0, second_kind_name.lastIndexOf("/")));
			second_kind_name = second_kind_name.substring(second_kind_name.lastIndexOf("/")+1);
			
			String third_kind_name = release.getThird_kind_name();
			Integer third_kind_id = Integer.parseInt(third_kind_name.substring(0, third_kind_name.lastIndexOf("/")));
			third_kind_name = third_kind_name.substring(third_kind_name.lastIndexOf("/")+1);
			
			String major_kind_name = release.getMajor_kind_name();
			Integer major_kind_id = Integer.parseInt(major_kind_name.substring(0, major_kind_name.lastIndexOf("/")));
			major_kind_name = major_kind_name.substring(major_kind_name.lastIndexOf("/")+1);
			
			String major_name = release.getMajor_name();
			Integer major_id = Integer.parseInt(major_name.substring(0, major_name.lastIndexOf("/")));
			major_name = major_name.substring(major_name.lastIndexOf("/")+1);
			
			release.setFirst_kind_id(first_kind_id);
			release.setFirst_kind_name(first_kind_name);
			release.setSecond_kind_id(second_kind_id);
			release.setSecond_kind_name(second_kind_name);
			release.setThird_kind_id(third_kind_id);
			release.setThird_kind_name(third_kind_name);
			release.setMajor_kind_id(major_kind_id);
			release.setMajor_kind_name(major_kind_name);
			release.setMajor_id(major_id);
			release.setMajor_name(major_name);
			
			this.releaseBiz.saveInfo(release);
			
			return "engage/major_release/register_ok_a"; 
		}else if("doEdits".equals(operate)){
			logger.info("getReleases called....");
			
			Page page = null;// new 对象在下面
			int totalCount = this.releaseBiz.getCount();// 获取当前用户总记录条数			
			if (pageNow != null && pageNow != "") {// 防止出现空指针异常
				int pageNow1 = Integer.parseInt(pageNow);
				page = new Page(totalCount, pageNow1);// 这样写的好处，判断完成外面可以继续调用
			}
			page.setPageSize(10);
			release.setPage(page);
			List<EngageMajorRelease> list = this.releaseBiz.getAll(release);
			model.addAttribute("list",list);
			model.addAttribute("page",page);
			return "engage/major_release/change_list"; 
		}else if("toEdit".equals(operate)){
			Integer releaseid = Integer.parseInt("" + request.getParameter("id"));
			release.setMre_id(releaseid);
			release = this.releaseBiz.getInfoByID(release);
			model.addAttribute("list",release);
			return "engage/major_release/change"; 
		}else if("doEdit".equals(operate)){
			Integer releaseid = Integer.parseInt("" + request.getParameter("id"));
			model.addAttribute("releaseid",releaseid);
			release.setMre_id(releaseid);
			this.releaseBiz.updateInfo(release);			
			return "engage/major_release/change_ok_a"; 
		}else if("toDelete".equals(operate)){
			Integer releaseid = Integer.parseInt("" + request.getParameter("id"));
			model.addAttribute("releaseid",releaseid);
			release.setMre_id(releaseid);
			release = this.releaseBiz.getInfoByID(release);
			model.addAttribute("list",release);
			return "engage/major_release/change_delete_reconfirm";
		}else if("doDelete".equals(operate)){
			Integer releaseid = Integer.parseInt("" + request.getParameter("id"));
			model.addAttribute("releaseid",releaseid);
			release.setMre_id(releaseid);
			this.releaseBiz.delInfo(release);
			return "engage/major_release/change_delete_ok_a";
		}else if("list".equals(operate)){		
			List<EngageMajorRelease> list = this.releaseBiz.getAll();
			Page page=new Page(this.releaseBiz.getCount(), 1);
			release.setPage(page);
			System.out.println(page);
			model.addAttribute("list",list);
			model.addAttribute("page",page);
			return "engage/major_release/query_list";
		}else if("toCheck".equals(operate)){
			Integer releaseid = Integer.parseInt("" + request.getParameter("id"));
			release.setMre_id(releaseid);
			release = this.releaseBiz.getInfoByID(release);
			model.addAttribute("list",release);
			return "engage/major_release/query";
		}
		return null;		
	}
	
}
