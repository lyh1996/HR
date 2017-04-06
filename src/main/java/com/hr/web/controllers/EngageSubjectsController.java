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
import com.hr.bean.ConfigFileSecondKind;
import com.hr.bean.ConfigQuestionFirstKind;
import com.hr.bean.ConfigQuestionSecondKind;
import com.hr.bean.EngageSubjects;
import com.hr.bean.SalaryGrantDetail;
import com.hr.biz.ConfigQuestionFirstKindBiz;
import com.hr.biz.ConfigQuestionSecondKindBiz;
import com.hr.biz.EngageSubjectsBiz;
import com.hr.web.utils.Page;

@Controller
public class EngageSubjectsController {
	private static final Log logger = LogFactory.getLog(EngageSubjectsController.class);
	private ConfigQuestionFirstKindBiz configQuestionFirstKindBiz;
	private ConfigQuestionSecondKindBiz configQuestionSecondKindBiz;
	private EngageSubjectsBiz engageSubjectsBiz;
	 
	@Resource(name = "configQuestionSecondKindBizImpl")
	public void setConfigQuestionSecondKindBiz(ConfigQuestionSecondKindBiz configQuestionSecondKindBiz) {
		this.configQuestionSecondKindBiz = configQuestionSecondKindBiz;
	}
	@Resource(name = "configQuestionFirstKindBizImpl")
	public void setConfigQuestionFirstKindBiz(ConfigQuestionFirstKindBiz configQuestionFirstKindBiz) {
		this.configQuestionFirstKindBiz = configQuestionFirstKindBiz;
	}
	@Resource(name = "engageSubjectsBizImpl")
	public void setEngageSubjectsBiz(EngageSubjectsBiz engageSubjectsBiz) {
		this.engageSubjectsBiz = engageSubjectsBiz;
	}

 

	// 档案设置
	@RequestMapping(value = "/engagesubjects.do")
	public String getengagesubjects(Model model, HttpServletRequest request, EngageSubjects eSubjects) { 
		String opreate = request.getParameter("operate");
		String param = request.getParameter("param");
		String pageNow=request.getParameter("pageNow");
		if("toAdd".equals(opreate)){
			logger.info("getengagesubjects......");
			List<ConfigQuestionFirstKind> list=this.configQuestionFirstKindBiz.getAlls();
			model.addAttribute("list", list);
			return "engage/subjects/register";
		}else if("doAdd".equals(opreate)){
			getinfo(eSubjects);
			this.engageSubjectsBiz.saveInfo(eSubjects);
			return "engage/subjects/register_ok";
		}else if("locate".equals(opreate)){
			if("query".equals(param)){
				List<ConfigQuestionFirstKind> list=this.configQuestionFirstKindBiz.getAlls();
				model.addAttribute("list", list);
				return "engage/subjects/filter";
			}
		}else if("toquerylist".equals(opreate)){
			getinfo(eSubjects);
			List<EngageSubjects> list=this.engageSubjectsBiz.getInfoByCondition(eSubjects);
			model.addAttribute("list", list);
			return "engage/subjects/list";
		}else if("toDetail".equals(opreate)){
			Integer sub_id = Integer.parseInt("" + request.getParameter("id"));
			EngageSubjects subjects=this.engageSubjectsBiz.getInfoById(sub_id);
			model.addAttribute("list", subjects );
			return "engage/subjects/details";
		}else if("toDelete".equals(opreate)){
			String  sub_id =request.getParameter("id");
			model.addAttribute("sub_id", sub_id);
			return "engage/subjects/subjects_delete";
		}else if("doDelete".equals(opreate)){
			Integer  sub_id =Integer.parseInt(request.getParameter("id"));
		 EngageSubjects engageSubjects=new EngageSubjects();
		 engageSubjects.setSub_id(sub_id);
		 this.engageSubjectsBiz.delInfo(engageSubjects);
			 return "engage/subjects/delete_success";
		}else if("toEdit".equals(opreate)){
			Integer  sub_id =Integer.parseInt(request.getParameter("id"));
			EngageSubjects subjects=this.engageSubjectsBiz.getInfoById(sub_id);
			model.addAttribute("list", subjects );
			return "engage/subjects/change";
		}else if("doEdit".equals(opreate)){
			this.engageSubjectsBiz.updateInfo(eSubjects);
			return "engage/subjects/change_ok";
		}
		return null;
	}
	
	
	// 获取二级试题
		@RequestMapping(value = "/findInfoByFirstKindQuestion/{id}/{name}", produces = "text/html;charset=UTF-8")
		// @ResponseBody 指的是返回的内容 string代表的是响应中的协议的实体部分
		public @ResponseBody String findInfoByFirstKindQuestion(Model model, @PathVariable Integer id, HttpServletRequest request) {
				logger.info("findInfoByFirstKind called.....");
				ConfigQuestionSecondKind configQuestionSecondKind=new ConfigQuestionSecondKind();
				configQuestionSecondKind.setFirst_kind_id(id);
				List<ConfigQuestionSecondKind> lists = this.configQuestionSecondKindBiz.getInfoById(configQuestionSecondKind);
				Gson gson = new Gson();
				return gson.toJson(lists);
		}
		
		public void getinfo(EngageSubjects eSubjects){
			// 拆分一级试题
						String first_kind_name = eSubjects.getFirst_kind_name();
						Integer first_kind_id = Integer
								.parseInt(first_kind_name.substring(0, first_kind_name.lastIndexOf("/")));
						first_kind_name = first_kind_name.substring(first_kind_name.lastIndexOf("/") + 1);
						eSubjects.setFirst_kind_id(first_kind_id);
						eSubjects.setFirst_kind_name(first_kind_name);
						// 拆分二级试题
						String second_kind_name = eSubjects.getSecond_kind_name();
						Integer second_kind_id = Integer.parseInt(second_kind_name.substring(0, second_kind_name.lastIndexOf("/")));
						second_kind_name = second_kind_name.substring(second_kind_name.lastIndexOf("/") + 1);
						eSubjects.setSecond_kind_id(second_kind_id);
						eSubjects.setSecond_kind_name(second_kind_name);
		}
}
