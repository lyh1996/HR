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

import com.hr.bean.ConfigPrimaryKey;
import com.hr.biz.ConfigMajorKindBiz;
import com.hr.biz.ConfigPrimaryKeyBiz;

@Controller
public class ConfigPrimaryKeyController {
	private static final Log logger = LogFactory.getLog(ConfigPrimaryKeyController.class);
	 private ConfigPrimaryKeyBiz configPrimaryKeyBiz;
	 
	 @Resource(name = "configPrimaryKeyBizImpl")
		public void setconfigPrimaryKeyBiz(ConfigPrimaryKeyBiz configPrimaryKeyBiz) {
			this.configPrimaryKeyBiz = configPrimaryKeyBiz;
		}
	
	 
 
	// 获得二级机构
	@RequestMapping(value = "/configprimarykey.do")
	public String getconfigprimarykey(Model model, HttpServletRequest request,
			ConfigPrimaryKey cKey,@RequestParam(name = "prk_id", required = false) String[] prk_id) {
		String opreate = request.getParameter("operate");
		if ("locate".equals(opreate)) {// 进入主页面
			logger.info("getconfigprimarykey called....");
			 return "config/other/primary_key";
		}  else if("list".equals(opreate)){
			List<ConfigPrimaryKey> list=this.configPrimaryKeyBiz.getAllInfo(cKey);
			System.out.println(list);
			model.addAttribute("tableName", list.get(0).getPrimary_key_table());
			model.addAttribute("list", list);
			return "config/other/primary_key_register";
		}else if("doRegister".equals(opreate)){
			
			for(int i=0;i<prk_id.length;i++){
				cKey.setPrk_id(Integer.parseInt(prk_id[i]));
				this.configPrimaryKeyBiz.updateInfo(cKey);
			}
			return "config/other/register_success";
			
		}else if("reset".equals(opreate)){
			this.configPrimaryKeyBiz.resetInfo(cKey);
			return "config/other/primary_key";
		}
		return null;
	}
}
