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
public class ConfigMajorKindController {
	private static final Log logger = LogFactory.getLog(ConfigMajorKindController.class);
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
 
	// 职位分类设置
	@RequestMapping(value = "/configmajorkind.do")
	public String getconfigMajorKinds(Model model, HttpServletRequest request,
			ConfigMajorKind configMajorKind) {
		String opreate = request.getParameter("operate");
		String pageNow=request.getParameter("pageNow");
		if ("list".equals(opreate)) {// 进入主页面
			logger.info("getconfigMajorKinds called....");
			Page page = null;//new 对象在下面
	        int totalCount = this.configMajorKindBiz.getMajorCount();//获取当前用户总记录条数
	        if(pageNow != null && pageNow != "") {//防止出现空指针异常
	            int pageNow1 = Integer.parseInt(pageNow);
	            page = new Page(totalCount, pageNow1);//这样写的好处，判断完成外面可以继续调用
	        }
	        configMajorKind.setPage(page);
			List<ConfigMajorKind> ConfigMajorKinds = this.configMajorKindBiz.getAll(configMajorKind);
			model.addAttribute("page",page);
			model.addAttribute("list", ConfigMajorKinds);
			return "config/file/major_kind";
		}  else if ("toAdd".equals(opreate)) {// 进入添加页面
			return "config/file/major_kind_register";
		}  else if ("doAdd".equals(opreate)) {// 完成添加操作
			String Name = configMajorKind.getMajor_kind_name();
			ConfigMajorKind configMajorKind2 = this.configMajorKindBiz.getMajorKindByName(Name);
			if (configMajorKind2 == null) {
				configMajorKind.setMajor_kind_id(this.configMajorKindBiz.getMajorCount()+1);
				this.configMajorKindBiz.saveConfigMajorKind(configMajorKind);
				return "config/file/major_kind_register_success";
			} else {
				return "config/file/major_kind_register_failure";
			}
		} else if ("toDelete".equals(opreate)) {
			Integer id = Integer.parseInt("" + request.getParameter("id"));
			model.addAttribute("majorId", id);
			return "config/file/major_kind_delete";
		} else if ("doDelete".equals(opreate)) {
			Integer id = Integer.parseInt("" + request.getParameter("id"));
			ConfigMajor c=this.configMajorBiz.getMajorByKindId(id);
			if(c==null){
			configMajorKind.setMajor_kind_id(id);
			this.configMajorKindBiz.delMajorKind(configMajorKind);
			return "config/file/major_kind_delete_success";
			}else{
				return "config/file/major_kind_delete_failure";
			}
		}
		return null;
	}
}
