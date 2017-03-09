package com.hr.web.controllers;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.hr.bean.ConfigPublicChar;
import com.hr.bean.Page;
import com.hr.biz.ConfigPublicCharBiz;

@Controller
public class ConfigPublicCharController {
	private static final Log logger = LogFactory.getLog(ConfigPublicCharController.class);

	private ConfigPublicCharBiz configPublicCharBiz;

	@Resource(name = "configPublicCharBizImpl")
	public void setConfigPublicCharBiz(ConfigPublicCharBiz configPublicCharBiz) {
		this.configPublicCharBiz = configPublicCharBiz;
	}

	// 职称设置
	@RequestMapping(value = "/configprofessiondesign.do")
	public String getConfigPublicChars(Model model, HttpServletRequest request, ConfigPublicChar configPublicChar) {
		String opreate = request.getParameter("operate");
		if ("list".equals(opreate)) {// 进入主页面
			logger.info("getConfigPublicChars called....");
			List<ConfigPublicChar> ConfigPublicChars = this.configPublicCharBiz.getAll("职称");
			model.addAttribute("list", ConfigPublicChars);
			return "config/file/profession_design";
		} else if ("toAdd".equals(opreate)) {// 进入添加页面
			return "config/file/profession_design_register";
		} else if ("doAdd".equals(opreate)) {// 完成添加操作
			configPublicChar.setAttribute_kind("职称");
			ConfigPublicChar char1 = this.configPublicCharBiz.getProfessionByName(configPublicChar);
			if (char1 == null) {
				this.configPublicCharBiz.saveProfession(configPublicChar);
				return "config/file/profession_design_register_success";
			} else {
				return "config/file/profession_design_register_failure";
			}
		} else if ("toDelete".equals(opreate)) {
			Integer id = Integer.parseInt("" + request.getParameter("id"));
			model.addAttribute("pubId", id);
			return "config/file/profession_design_delete";
		} else if ("doDelete".equals(opreate)) {
			Integer id = Integer.parseInt("" + request.getParameter("id"));
			configPublicChar.setPbc_id(id);
			this.configPublicCharBiz.delProfession(configPublicChar);
			return "config/file/profession_design_delete_success";
		}
		return null;
	}

	// 公共属性设置
	@RequestMapping(value = "/configpublicchar.do")
	public String getAllConfigPublicChars(Model model, HttpServletRequest request, ConfigPublicChar configPublicChar) {
		String opreate = request.getParameter("operate");
		String pageNow=request.getParameter("pageNow");
		if ("list".equals(opreate)) {// 进入主页面
			logger.info("getAllConfigPublicChars called....");
			Page page = null;//new 对象在下面
	        int totalCount = this.configPublicCharBiz.getCharCount();//获取当前用户总记录条数
	        if(pageNow != null && pageNow != "") {//防止出现空指针异常
	            int pageNow1 = Integer.parseInt(pageNow);
	            page = new Page(totalCount, pageNow1);//这样写的好处，判断完成外面可以继续调用
	        }
	        configPublicChar.setPage(page);
	        List<ConfigPublicChar> ConfigPublicChars = this.configPublicCharBiz.getAllChars(configPublicChar);//取得当前用户的所有操作记录
	        model.addAttribute("page",page);
			model.addAttribute("list", ConfigPublicChars);
			return "config/file/public_char";
		} else if ("toAdd".equals(opreate)) {// 进入添加页面
			return "config/file/public_char_register";
		} else if ("doAdd".equals(opreate)) {// 完成添加操作
			ConfigPublicChar char1 = this.configPublicCharBiz.getProfessionByName(configPublicChar);
			if (char1 == null) {
				this.configPublicCharBiz.saveProfession(configPublicChar);
				return "config/file/public_char_register_success";
			} else {
				return "config/file/public_char_register_failure";
			}
		}else if ("toDelete".equals(opreate)) {
			Integer id = Integer.parseInt("" + request.getParameter("id"));
			model.addAttribute("pubId", id);
			return "config/file/public_char_delete";
		} else if ("doDelete".equals(opreate)) {
			Integer id = Integer.parseInt("" + request.getParameter("id"));
			configPublicChar.setPbc_id(id);
			this.configPublicCharBiz.delProfession(configPublicChar);
			return "config/file/public_char_delete_success";
		}
		return null;
	}
}
