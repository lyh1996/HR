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
import com.hr.bean.ConfigMajor;
import com.hr.bean.ConfigMajorKind;
import com.hr.bean.ConfigPublicChar;
import com.hr.bean.ConfigQuestionFirstKind;
import com.hr.bean.ConfigQuestionSecondKind;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileSecondKindBiz;
import com.hr.biz.ConfigFileThirdKindBiz;
import com.hr.biz.ConfigMajorBiz;
import com.hr.biz.ConfigMajorKindBiz;
import com.hr.biz.ConfigQuestionFirstKindBiz;
import com.hr.biz.ConfigQuestionSecondKindBiz;
import com.hr.web.utils.Page;

@Controller
public class ConfigQuestionSecondKindController {
	private static final Log logger = LogFactory.getLog(ConfigQuestionSecondKindController.class);
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
 
	// 职位设置
	@RequestMapping(value = "/configquestionsecondkind.do")
	public String getconfigMajors(Model model, HttpServletRequest request,
			ConfigQuestionSecondKind configQuestionSecondKind) {
		String opreate = request.getParameter("operate");
		String pageNow = request.getParameter("pageNow");
		if ("list".equals(opreate)) {// 进入主页面
			logger.info("getconfigMajorKinds called....");
			Page page = null;// new 对象在下面
			int totalCount = this.configQuestionSecondKindBiz.getCount();// 获取当前用户总记录条数
			if (pageNow != null && pageNow != "") {// 防止出现空指针异常
				int pageNow1 = Integer.parseInt(pageNow);
				page = new Page(totalCount, pageNow1);// 这样写的好处，判断完成外面可以继续调用
			}
			page.setPageSize(10);
			configQuestionSecondKind.setPage(page);
			List<ConfigQuestionSecondKind> ConfigQuestionSecondKind = this.configQuestionSecondKindBiz.getAll(configQuestionSecondKind);
			model.addAttribute("list", ConfigQuestionSecondKind);
			model.addAttribute("page",page);
			return "config/exam/second_question_kind";
		}   else if ("toAdd".equals(opreate)) {// 进入添加页面
			List<ConfigQuestionFirstKind> configQuestionFirstKinds=this.configQuestionFirstKindBiz.getAlls();
			model.addAttribute("list", configQuestionFirstKinds);
			return "config/exam/second_question_kind_register";
		}    else if ("doAdd".equals(opreate)) {// 完成添加操作
			String Name = configQuestionSecondKind.getSecond_kind_name();
			String first_kind_name=configQuestionSecondKind.getFirst_kind_name();
			Integer first_kind_id=Integer.parseInt(first_kind_name.substring(0, first_kind_name.lastIndexOf("/")));
			first_kind_name=first_kind_name.substring(first_kind_name.lastIndexOf("/")+1);
			ConfigQuestionSecondKind c = this.configQuestionSecondKindBiz.getInfoByName(Name, first_kind_name);
			if (c == null) {
				configQuestionSecondKind.setFirst_kind_id(first_kind_id);
				configQuestionSecondKind.setFirst_kind_name(first_kind_name);
				List<ConfigQuestionSecondKind> list=this.configQuestionSecondKindBiz.getInfoById(configQuestionSecondKind);
				
				Integer second_id=1;
				 if(list.size()>0){
					 second_id=list.get(0).getSecond_kind_id()+1;
				 }
				configQuestionSecondKind.setSecond_kind_id(second_id);
				  this.configQuestionSecondKindBiz.saveInfo(configQuestionSecondKind);
				return "config/exam/second_question_kind_register_success";
			} else {
				return "config/exam/second_question_kind_register_failure";
			}
		}else if ("toDelete".equals(opreate)) {//删除
			Integer id = Integer.parseInt("" + request.getParameter("id"));
			configQuestionSecondKind.setQsk_id(id);
			this.configQuestionSecondKindBiz.delInfo(configQuestionSecondKind);
			Page page=new Page(this.configQuestionSecondKindBiz.getCount(), 1);
			configQuestionSecondKind.setPage(page);
			List<ConfigQuestionSecondKind> ConfigQuestionSecondKinds = this.configQuestionSecondKindBiz.getAll(configQuestionSecondKind);
			model.addAttribute("list", ConfigQuestionSecondKinds);
			model.addAttribute("page",page);
			return "config/exam/second_question_kind";
		}
		return null;
	}
}
