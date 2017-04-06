package com.hr.web.controllers;

import java.util.List;
import javax.annotation.Resource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.hr.bean.ConfigFileFirstKind;
import com.hr.bean.ConfigFileSecondKind;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileSecondKindBiz;

@Controller
public class ConfigFileFirstKindController {
	private static final Log logger = LogFactory.getLog(ConfigFileFirstKindController.class);
	private static Integer num = 0;

	private ConfigFileFirstKindBiz configFileFirstKindBiz;
	private ConfigFileSecondKindBiz configFileSecondKindBiz;
	@Resource(name = "configFileSecondKindBizImpl")
	public void setConfigFileSecondKindBiz(ConfigFileSecondKindBiz configFileSecondKindBiz) {
		this.configFileSecondKindBiz = configFileSecondKindBiz;
	}

	@Resource(name = "configFileFirstKindBizImpl")
	public void setConfigFileFirstKindBiz(ConfigFileFirstKindBiz configFileFirstKindBiz) {
		this.configFileFirstKindBiz = configFileFirstKindBiz;
	}

	// 获得一级机构
	@RequestMapping(value = "/getconfigfilefirstkinds")
	public String getConfigFileFirstKinds(Model model) {
		// model由Spring在dispatcherServlet中创键 request,setAttribute("model",model)
		// 由di方式注入到这个listBook方法中
		logger.info("getConfigFileFirstKinds called....");
		List<ConfigFileFirstKind> configFileFirstKindList = this.configFileFirstKindBiz.getAllConfigFileFirstKinds();
		num = configFileFirstKindList.size();
		model.addAttribute("configFileFirstKindList", configFileFirstKindList);
		System.out.println(configFileFirstKindList);
		return "config/file/first_kind";

	}

	// 进入添加页面
	@RequestMapping(value = "/configfilefirstkind.toadd")
	public String configfilefirstkindtoadd() {
		return "config/file/first_kind_register";
	}

	// 完成添加操作
	@RequestMapping(value = "/configfilefirstkind.doAdd")
	public String configfilefirstkinddoadd(ConfigFileFirstKind configFileFirstKind) {
		System.out.println(configFileFirstKind);
		ConfigFileFirstKind configFileFirstKind2=this.configFileFirstKindBiz.getConfigFileFirstKindByName(configFileFirstKind);
		if (configFileFirstKind2==null) {
			List<ConfigFileFirstKind> list=this.configFileFirstKindBiz.getAllConfigFileFirstKinds();
			Integer first_kind_id=1;
			if(list.size()>0){
				first_kind_id=list.get(0).getFfkId()+1;
			}
			configFileFirstKind.setFirstKindId(first_kind_id);
		//	System.out.println(configFileFirstKind);
			this.configFileFirstKindBiz.saveConfigFileFirstKind(configFileFirstKind);
			
			return "config/file/first_kind_register_success";
		}else{

		return "config/file/first_kind_register_failure";
		}
	}
	
	//更改一级机构信息
	@RequestMapping(value="/EditConfigFileFirstKind/{id}")
	public String ToEditConfigFileFirstKind(Model model ,@PathVariable Integer id){
		logger.info("ToEditConfigFileFirstKind called....");
		//System.out.println(id);
		ConfigFileFirstKind configFileFirstKind=this.configFileFirstKindBiz.getConfigFileFirstKindById(id);
		model.addAttribute("configFileFirstKind",configFileFirstKind);
		System.out.println(configFileFirstKind);
		return "config/file/first_kind_change";
	}
	
	//确定更改信息
	@RequestMapping(value="updateconfigfilefirstkinds")
	public String updateconfigfilefirstkinds(ConfigFileFirstKind configFileFirstKind){
		ConfigFileFirstKind configFileFirstKind2=this.configFileFirstKindBiz.getConfigFileFirstKindByName(configFileFirstKind);
		if(configFileFirstKind2==null){
		this.configFileFirstKindBiz.updateConfigFileFirstKind(configFileFirstKind);
		return "config/file/first_kind_change_success";
		}else{
			return "config/file/first_kind_change_failure";
		}
	}
	//删除页面
	@RequestMapping(value="toDelConfigFileFirstKind/{id}")
	public String  toDelConfigFileFirstKind(Model model,@PathVariable Short id){
		model.addAttribute("id", id);
		return "config/file/first_kind_delete";
	}
	//确认删除
	@RequestMapping(value="dodeleteconfigfilefirstkind/{id}")
	public String  dodeleteconfigfilefirstkind(@PathVariable Integer id){
		System.out.println(id);
		List<ConfigFileSecondKind> c2=this.configFileSecondKindBiz.getConfigFileSecondKindByFirstId(id);
		if(c2.size()==0){
		 ConfigFileFirstKind configFileFirstKind=new ConfigFileFirstKind();
		 configFileFirstKind.setFirstKindId(id);
		 this.configFileFirstKindBiz.delConfigFileFirstKind(configFileFirstKind);
		return "config/file/first_kind_delete_success";
		}else{
			return "config/file/first_kind_delete_failure";
		}
	}

}
