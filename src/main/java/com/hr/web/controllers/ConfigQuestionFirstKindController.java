package com.hr.web.controllers;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.hr.bean.ConfigQuestionFirstKind;
import com.hr.bean.ConfigQuestionSecondKind;
import com.hr.biz.ConfigQuestionFirstKindBiz;
import com.hr.biz.ConfigQuestionSecondKindBiz;

@Controller
public class ConfigQuestionFirstKindController {
	private static final Log logger = LogFactory.getLog(ConfigQuestionFirstKindController.class);
	private ConfigQuestionFirstKindBiz configQuestionFirstKindBiz;
	private ConfigQuestionSecondKindBiz configQuestionSecondKindBiz;
	 
	@Resource(name = "configQuestionSecondKindBizImpl")
	public void setConfigQuestionSecondKindBiz(ConfigQuestionSecondKindBiz configQuestionSecondKindBiz) {
		this.configQuestionSecondKindBiz = configQuestionSecondKindBiz;
	}
	@Resource(name = "configQuestionFirstKindBizImpl")
	public void setConfigQuestionFirstKindBiz(ConfigQuestionFirstKindBiz configQuestionFirstKindBiz) {
		this.configQuestionFirstKindBiz = configQuestionFirstKindBiz;
	}

	// 获得二级机构
	@RequestMapping(value = "/configquestionfirstkind.do")
	public String getconfigfilesecondkind(Model model, HttpServletRequest request,
			ConfigQuestionFirstKind configQuestionFirstKind) {
		String opreate = request.getParameter("operate");
		if ("list".equals(opreate)) {// 进入主页面
			logger.info("getConfigFileSecondKinds called....");
			List<ConfigQuestionFirstKind> ConfigQuestionFirstKinds = this.configQuestionFirstKindBiz.getAlls();
			model.addAttribute("list", ConfigQuestionFirstKinds);
			return "config/exam/first_question_kind";
		} else if ("toAdd".equals(opreate)) {// 进入添加页面
			return "config/exam/first_question_kind_register";
		} else if ("doAdd".equals(opreate)) {// 完成添加操作
			ConfigQuestionFirstKind c = this.configQuestionFirstKindBiz.getINfoByName(configQuestionFirstKind);
			if (c == null) {
				List<ConfigQuestionFirstKind> list=this.configQuestionFirstKindBiz.getAlls();
				Integer first_kind_id=1;
				if(list.size()>0){
					first_kind_id=list.get(0).getQfk_id()+1;
				}
				configQuestionFirstKind.setFirst_kind_id(first_kind_id);
				this.configQuestionFirstKindBiz.save(configQuestionFirstKind);
				return "config/exam/first_question_kind_register_success";
			} else {
				return "config/exam/first_question_kind_register_failure";
			}
		}   else if ("toDelete".equals(opreate)) {
			Integer id = Integer.parseInt("" + request.getParameter("id"));
			model.addAttribute("Id", id);
			return "config/exam/first_question_kind_delete";
		}  else if ("doDelete".equals(opreate)) {
			Integer id = Integer.parseInt("" + request.getParameter("id"));
			ConfigQuestionSecondKind c=new ConfigQuestionSecondKind();
			c.setFirst_kind_id(id);
			 List<ConfigQuestionSecondKind> list=this.configQuestionSecondKindBiz.getInfoById(c);
			 if(list.size()==0){
				 configQuestionFirstKind.setFirst_kind_id(id);
				 this.configQuestionFirstKindBiz.delInfo(configQuestionFirstKind);
				 return "config/exam/first_question_kind_delete_success";
			 }else{
				 return "config/exam/first_question_kind_delete_failure";
			 }
			 
		} 
		return null;
	}
}
