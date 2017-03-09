package com.hr.web.controllers;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.hr.bean.ConfigMajor;
import com.hr.bean.ConfigMajorKind;
import com.hr.bean.Page;
import com.hr.biz.ConfigMajorBiz;
import com.hr.biz.ConfigMajorKindBiz;

@Controller
public class ConfigMajorController {
	private static final Log logger = LogFactory.getLog(ConfigMajorController.class);
	private ConfigMajorBiz configMajorBiz;
	private ConfigMajorKindBiz configMajorKindBiz;

	@Resource(name = "configMajorKindBizImpl")
	public void setConfigMajorKindBiz(ConfigMajorKindBiz configMajorKindBiz) {
		this.configMajorKindBiz = configMajorKindBiz;
	}

	@Resource(name = "configMajorBizImpl")
	public void setConfigMajorBiz(ConfigMajorBiz configMajorBiz) {
		this.configMajorBiz = configMajorBiz;
	}
 
	// 职位设置
	@RequestMapping(value = "/configmajor.do")
	public String getconfigMajors(Model model, HttpServletRequest request,
			ConfigMajor configMajor) {
		String opreate = request.getParameter("operate");
		String pageNow = request.getParameter("pageNow");
		if ("list".equals(opreate)) {// 进入主页面
			logger.info("getconfigMajorKinds called....");
			Page page = null;// new 对象在下面
			int totalCount = this.configMajorBiz.getMajorCount();// 获取当前用户总记录条数
			if (pageNow != null && pageNow != "") {// 防止出现空指针异常
				int pageNow1 = Integer.parseInt(pageNow);
				page = new Page(totalCount, pageNow1);// 这样写的好处，判断完成外面可以继续调用
			}
			page.setPageSize(10);
			configMajor.setPage(page);
			List<ConfigMajor> ConfigMajors = this.configMajorBiz.getAll(configMajor);
			model.addAttribute("list", ConfigMajors);
			model.addAttribute("page",page);
			return "config/file/major";
		}   else if ("toAdd".equals(opreate)) {// 进入添加页面
			List<ConfigMajorKind> configMajorKinds=this.configMajorKindBiz.getAll();
			model.addAttribute("list", configMajorKinds);
			return "config/file/major_register";
		}   else if ("doAdd".equals(opreate)) {// 完成添加操作
			String Name = configMajor.getMajor_name();
			String major_kind_name=configMajor.getMajor_kind_name();
			Integer major_kind_id=Integer.parseInt(major_kind_name.substring(0, major_kind_name.lastIndexOf("/")));
			major_kind_name=major_kind_name.substring(major_kind_name.lastIndexOf("/")+1);
			ConfigMajor configMajor2 = this.configMajorBiz.getMajorByName(Name,major_kind_name);
			if (configMajor2 == null) {
				Integer major_id= this.configMajorBiz.getMajorByKindName(major_kind_name).size()+1;
				 configMajor.setMajor_kind_id(major_kind_id);
				 configMajor.setMajor_kind_name(major_kind_name);
				 configMajor.setMajor_id(major_id);
				 System.out.println(configMajor);
			 this.configMajorBiz.saveConfigMajor(configMajor);
				return "config/file/major_register_success";
			} else {
				return "config/file/major_register_failure";
			}
		} else if ("toDelete".equals(opreate)) {
			Integer id = Integer.parseInt("" + request.getParameter("id"));
			model.addAttribute("majorId", id);
			return "config/file/major_delete";
		}   else if ("doDelete".equals(opreate)) {
			Integer id = Integer.parseInt("" + request.getParameter("id"));
			configMajor.setMak_id(id);
			this.configMajorBiz.delMajor(configMajor);
			Page page=new Page(this.configMajorBiz.getMajorCount(), 1);
			configMajor.setPage(page);
			List<ConfigMajor> ConfigMajors = this.configMajorBiz.getAll(configMajor);
			model.addAttribute("list", ConfigMajors);
			model.addAttribute("page",page);
			return "config/file/major";
		}
		return null;
	}
}
