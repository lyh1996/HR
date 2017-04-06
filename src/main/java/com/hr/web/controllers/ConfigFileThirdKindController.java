package com.hr.web.controllers;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.hr.bean.ConfigFileFirstKind;
import com.hr.bean.ConfigFileSecondKind;
import com.hr.bean.ConfigFileThirdKind;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileSecondKindBiz;
import com.hr.biz.ConfigFileThirdKindBiz;
import com.hr.web.utils.Page;

@Controller
public class ConfigFileThirdKindController {
	private static final Log logger = LogFactory.getLog(ConfigFileThirdKindController.class);
	private ConfigFileSecondKindBiz configFileSecondKindBiz;
	private ConfigFileFirstKindBiz configFileFirstKindBiz;
	private ConfigFileThirdKindBiz configFileThirdKindBiz;

	@Resource(name = "configFileThirdKindBizImpl")
	public void setConfigFileThirdKindBiz(ConfigFileThirdKindBiz configFileThirdKindBiz) {
		this.configFileThirdKindBiz = configFileThirdKindBiz;
	}

	@Resource(name = "configFileFirstKindBizImpl")
	public void setConfigFileFirstKindBiz(ConfigFileFirstKindBiz configFileFirstKindBiz) {
		this.configFileFirstKindBiz = configFileFirstKindBiz;
	}

	@Resource(name = "configFileSecondKindBizImpl")
	public void setConfigFileSecondKindBiz(ConfigFileSecondKindBiz configFileSecondKindBiz) {
		this.configFileSecondKindBiz = configFileSecondKindBiz;
	}

	// 获得三级机构
	@RequestMapping(value = "/configfilethirdkind.do")
	public String getConfigFileThirdKinds(Model model, HttpServletRequest request,
			ConfigFileThirdKind configFileThirdKind) {
		String opreate = request.getParameter("operate");
		String pageNow = request.getParameter("pageNow");
		if ("list".equals(opreate)) {// 进入主页面
			logger.info("getConfigFileThirdKinds called....");
			Page page = null;// new 对象在下面

			int totalCount = this.configFileSecondKindBiz.getSecondKindCount();// 获取当前用户总记录条数
			if (pageNow != null && pageNow != "") {// 防止出现空指针异常
				int pageNow1 = Integer.parseInt(pageNow);
				page = new Page(totalCount, pageNow1);// 这样写的好处，判断完成外面可以继续调用
			}
			page.setPageSize(10);
			configFileThirdKind.setPage(page);
			List<ConfigFileThirdKind> ConfigFileThirdKinds = this.configFileThirdKindBiz.getAll(configFileThirdKind);
			model.addAttribute("list", ConfigFileThirdKinds);
			model.addAttribute("page",page);
			return "config/file/third_kind";
		} else if ("toAdd".equals(opreate)) {// 添加操作
			List<ConfigFileFirstKind> configFileFirstKinds = this.configFileFirstKindBiz.getAllConfigFileFirstKinds();
			model.addAttribute("list", configFileFirstKinds);
			return "config/file/third_kind_register";
		} else if ("doAdd".equals(opreate)) {// 确认添加
			String first_kind_name=configFileThirdKind.getFirst_kind_name();
			Integer first_kind_id=Integer.parseInt(first_kind_name.substring(0, first_kind_name.lastIndexOf("/")));
			first_kind_name=first_kind_name.substring(first_kind_name.lastIndexOf("/")+1);
			String second_kind_name=configFileThirdKind.getSecond_kind_name();
			Integer second_kind_id=Integer.parseInt(second_kind_name.substring(0, second_kind_name.lastIndexOf("/")));
			second_kind_name=second_kind_name.substring(second_kind_name.lastIndexOf("/")+1);
			configFileThirdKind.setFirst_kind_id(first_kind_id);
			configFileThirdKind.setFirst_kind_name(first_kind_name);
			configFileThirdKind.setSecond_kind_id(second_kind_id);
			configFileThirdKind.setSecond_kind_name(second_kind_name);
			ConfigFileThirdKind configFileThirdKind2 = this.configFileThirdKindBiz.getConfigFileThirdKindByName(configFileThirdKind);
			if (configFileThirdKind2 == null) {
				configFileThirdKind.setThird_kind_id(this.configFileThirdKindBiz.getInfoBySFId(first_kind_id, second_kind_id).size()+1);
				this.configFileThirdKindBiz.saveConfigFileThirdKind(configFileThirdKind);
				// System.out.println(configFileThirdKind);
				return "config/file/third_kind_register_success";
			} else {
				return "config/file/third_kind_register_failure";
			}
		} else if ("toEdit".equals(opreate)) {// 编辑
			Integer id = Integer.parseInt("" + request.getParameter("id"));
			configFileThirdKind = this.configFileThirdKindBiz.getConfigFileThirdKindById(id);
			model.addAttribute("list", configFileThirdKind);
			return "config/file/third_kind_change";
		} else if ("doEdit".equals(opreate)) {// 提交编辑
			Integer id = Integer.parseInt("" + request.getParameter("id"));
			configFileThirdKind.setFtk_id(id);
			this.configFileThirdKindBiz.updateConfigFileThirdKind(configFileThirdKind);
			Page page=new Page(this.configFileThirdKindBiz.getThirdKindCount(), 1);
			configFileThirdKind.setPage(page);
			List<ConfigFileThirdKind> ConfigFileThirdKinds = this.configFileThirdKindBiz.getAll(configFileThirdKind);
			model.addAttribute("list", ConfigFileThirdKinds);
			model.addAttribute("page",page);
			return "config/file/third_kind";
		} else if ("toDelete".equals(opreate)) {
			Integer id = Integer.parseInt("" + request.getParameter("id"));
			configFileThirdKind.setFtk_id(id);
			this.configFileThirdKindBiz.delConfigFileThirdKind(configFileThirdKind);
			Page page=new Page(this.configFileThirdKindBiz.getThirdKindCount(), 1);
			configFileThirdKind.setPage(page);
			List<ConfigFileThirdKind> ConfigFileThirdKinds = this.configFileThirdKindBiz.getAll(configFileThirdKind);
			model.addAttribute("list", ConfigFileThirdKinds);
			model.addAttribute("page",page);
			return "config/file/third_kind";
		}
		return null;
	}
	
 
}
