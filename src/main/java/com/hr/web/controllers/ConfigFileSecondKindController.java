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
import com.hr.bean.ConfigFileSecondKind;
import com.hr.bean.ConfigFileThirdKind;
import com.hr.bean.Page;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileSecondKindBiz;
import com.hr.biz.ConfigFileThirdKindBiz;

@Controller
public class ConfigFileSecondKindController {
	private static final Log logger = LogFactory.getLog(ConfigFileSecondKindController.class);
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

	// 获得二级机构
	@RequestMapping(value = "/configfilesecondkind.do")
	public String getconfigfilesecondkind(Model model, HttpServletRequest request,
			ConfigFileSecondKind configFileSecondKind) {
		String opreate = request.getParameter("operate");
		String pageNow=request.getParameter("pageNow");
		if ("list".equals(opreate)) {// 进入主页面
			logger.info("getConfigFileSecondKinds called....");
			Page page = null;//new 对象在下面
			
	        int totalCount = this.configFileSecondKindBiz.getSecondKindCount();//获取当前用户总记录条数
	        if(pageNow != null && pageNow != "") {//防止出现空指针异常
	            int pageNow1 = Integer.parseInt(pageNow);
	            page = new Page(totalCount, pageNow1);//这样写的好处，判断完成外面可以继续调用
	        }
	        page.setPageSize(10);
	        configFileSecondKind.setPage(page);
			List<ConfigFileSecondKind> ConfigFileSecondKinds = this.configFileSecondKindBiz.getAll(configFileSecondKind);
			model.addAttribute("list", ConfigFileSecondKinds);
			  model.addAttribute("page",page);
			return "config/file/second_kind";
		} else if ("toAdd".equals(opreate)) {// 添加操作
			List<ConfigFileFirstKind> configFileFirstKinds = this.configFileFirstKindBiz.getAllConfigFileFirstKinds();
			model.addAttribute("list", configFileFirstKinds);
			return "config/file/second_kind_register";
		} else if ("doAdd".equals(opreate)) {//确认添加
			String first_kind_name=configFileSecondKind.getfirst_kind_name();
			Integer first_kind_id=Integer.parseInt(first_kind_name.substring(0, first_kind_name.lastIndexOf("/")));
			first_kind_name=first_kind_name.substring(first_kind_name.lastIndexOf("/")+1);
			configFileSecondKind.setfirst_kind_id(first_kind_id);
			ConfigFileSecondKind configFileSecondKind2 = this.configFileSecondKindBiz
					.getConfigFileSecondKindByName(configFileSecondKind);
			if (configFileSecondKind2 == null) {
				configFileSecondKind.setfirst_kind_name(first_kind_name);
				configFileSecondKind.setsecond_kind_id(this.configFileSecondKindBiz.getConfigFileSecondKindByFirstId(first_kind_id).size()+1);
				this.configFileSecondKindBiz.saveConfigFileSecondKind(configFileSecondKind);
				// System.out.println(configFileSecondKind);
				return "config/file/second_kind_register_success";
			} else {
				return "config/file/second_kind_register_failure";
			}
		}else if("toEdit".equals(opreate)){//编辑
			Integer id=Integer.parseInt(""+request.getParameter("id"));
			configFileSecondKind =this.configFileSecondKindBiz.getConfigFileSecondKindById(id);
			model.addAttribute("list", configFileSecondKind);
			return "config/file/second_kind_change";
		}else if("doEdit".equals(opreate)){//确认编辑
			Integer id=Integer.parseInt(""+request.getParameter("id"));
			configFileSecondKind.setfsk_id(id);
			this.configFileSecondKindBiz.updateConfigFileSecondKind(configFileSecondKind);
			List<ConfigFileSecondKind> ConfigFileSecondKinds = this.configFileSecondKindBiz.getAll();
			model.addAttribute("list", ConfigFileSecondKinds);
			return "config/file/second_kind";
		}else if("toDelete".equals(opreate)){//删除
			Integer id=Integer.parseInt(""+request.getParameter("id"));
			ConfigFileThirdKind c3=this.configFileThirdKindBiz.getConfigFileThirdKindBySecondId(id);
			if(c3==null){
			configFileSecondKind.setfsk_id(id);
			this.configFileSecondKindBiz.delConfigFileSecondKind(configFileSecondKind);
			List<ConfigFileSecondKind> ConfigFileSecondKinds = this.configFileSecondKindBiz.getAll();
			model.addAttribute("list", ConfigFileSecondKinds);
			return "config/file/second_kind";
			}else {
				return "config/file/second_kind_delete_failure";
			}
		}
		return null;
	}
}
