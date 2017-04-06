package com.hr.web.controllers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.css.ElementCSSInlineStyle;

import com.google.gson.Gson;
import com.hr.bean.ConfigFileFirstKind;
import com.hr.bean.ConfigFileSecondKind;
import com.hr.bean.ConfigFileThirdKind;
import com.hr.bean.ConfigMajor;
import com.hr.bean.ConfigMajorKind;
import com.hr.bean.ConfigPublicChar;
import com.hr.bean.ConfigQuestionSecondKind;
import com.hr.bean.HumanFile;
import com.hr.bean.MajorChange;
import com.hr.bean.Training;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileSecondKindBiz;
import com.hr.biz.ConfigFileThirdKindBiz;
import com.hr.biz.ConfigMajorBiz;
import com.hr.biz.ConfigMajorKindBiz;
import com.hr.biz.ConfigPublicCharBiz;
import com.hr.biz.HumanFileBiz;
import com.hr.biz.MajorChangeBiz;
import com.hr.biz.TrainingBiz;
import com.hr.web.utils.Page;
import com.hr.web.utils.UploadFileUtil;
import com.hr.web.utils.UploadFileUtil.UploadFile;

@Controller
public class TrainingController {
	private static final Log logger = LogFactory.getLog(TrainingController.class);
	private HumanFileBiz humanFileBiz;
	private ConfigPublicCharBiz configPublicCharBiz;
	private TrainingBiz trainingBiz;

	@Resource(name = "trainingBizImpl")
	public void setTrainingBiz(TrainingBiz trainingBiz) {
		this.trainingBiz = trainingBiz;
	}
	@Resource(name = "humanFileBizImpl")
	public void setHumanFileBiz(HumanFileBiz humanFileBiz) {
		this.humanFileBiz = humanFileBiz;
	}
	@Resource(name = "configPublicCharBizImpl")
	public void setConfigPublicCharBiz(ConfigPublicCharBiz configPublicCharBiz) {
		this.configPublicCharBiz = configPublicCharBiz;
	}

 

	// 档案设置
	@RequestMapping(value = "/training.do")
	public String gethumanfiles(Model model, HttpServletRequest request, Training training) {
		String opreate = request.getParameter("operate");
		String pageNow=request.getParameter("pageNow");
		if ("list".equals(opreate)) {//显示登记列表
			HumanFile hFile=new HumanFile();
			Page page = null;// new 对象在下面
			int totalCount = this.humanFileBiz.getDelCount();// 获取当前用户总记录条数
			if (pageNow != null && pageNow != "") {// 防止出现空指针异常
				int pageNow1 = Integer.parseInt(pageNow);
				page = new Page(totalCount, pageNow1);// 这样写的好处，判断完成外面可以继续调用
			}
			page.setPageSize(5);
			hFile.setPage(page);
			hFile.setCheck_status(1);
			hFile.setHuman_file_status(0);
			List<HumanFile> list=this.humanFileBiz.getAllPage(hFile);
			model.addAttribute("list", list);
			model.addAttribute("page", page);
			return "training/register_list";
		} else if("toTraining".equals(opreate)){//前往登记
			Integer humanid = Integer.parseInt("" + request.getParameter("id"));
			Training training2=this.trainingBiz.getInfoByHumanId(humanid);
			if(training2==null){
			HumanFile hFile=this.humanFileBiz.getInfoByHumanIds(humanid);
			model.addAttribute("list", hFile);
			List<ConfigPublicChar> list1=this.configPublicCharBiz.getAll("培训成绩");
			model.addAttribute("list1", list1);
			List<ConfigPublicChar> list2=this.configPublicCharBiz.getAll("培训项目");
			model.addAttribute("list2", list2);
			return "training/register";
			}else {
				return "training/Training_failure";
			}
		}else if("doAdd".equals(opreate)){//登记
			training.setCheckstatus(0);
			 this.trainingBiz.saveInfo(training);
			return "training/register_success";
		}else if("check".equals(opreate)){//复核
			Page page = null;// new 对象在下面
			int totalCount = this.trainingBiz.getCount();// 获取当前用户总记录条数
			if (pageNow != null && pageNow != "") {// 防止出现空指针异常
				int pageNow1 = Integer.parseInt(pageNow);
				page = new Page(totalCount, pageNow1);// 这样写的好处，判断完成外面可以继续调用
			}
			page.setPageSize(5);
			training.setPage(page);
			training.setCheckstatus(0);
			List<Training> list=this.trainingBiz.getAllPage(training);
			model.addAttribute("list", list);
			model.addAttribute("page", page);
			return "training/check_list";
		}else if("toCheck".equals(opreate)){
			Integer humanid = Integer.parseInt("" + request.getParameter("id"));
			 HumanFile hFile=new HumanFile();
			 HumanFile hFile2=this.humanFileBiz.getInfoByHumanIds(humanid);
			 hFile.setTraining_amount(hFile2.getTraining_amount()+1);
			 hFile.setHuman_id(humanid);
			 this.humanFileBiz.updateInfoToTraining(hFile);
			 training.setHuman_id(humanid);
			 training.setCheckstatus(1);
			 this.trainingBiz.updateInfo(training);
			return "training/check_success";
		}else if("queryAll".equals(opreate)){
			Page page = null;// new 对象在下面
			int totalCount = this.trainingBiz.getTrainingCount();// 获取当前用户总记录条数
			if (pageNow != null && pageNow != "") {// 防止出现空指针异常
				int pageNow1 = Integer.parseInt(pageNow);
				page = new Page(totalCount, pageNow1);// 这样写的好处，判断完成外面可以继续调用
			}
			page.setPageSize(5);
			training.setPage(page);
			List<Training>trainings = this.trainingBiz.getAllTrainingPage(training);
			model.addAttribute("list", trainings);
			model.addAttribute("page", page);
			return "training/query_all_list";
		}else if("toQueryAll".equals(opreate)){
			Integer tra_id = Integer.parseInt("" + request.getParameter("id"));
			Training list=this.trainingBiz.getInfoById(tra_id);
			model.addAttribute("list", list);
			return "training/query_all";
		}else if("toDelete".equals(opreate)){
			Integer tra_id = Integer.parseInt("" + request.getParameter("id"));
			model.addAttribute("tra_id", tra_id);
			return "training/training_delete";
		}else if("doDelete".equals(opreate)){
			Integer tra_id = Integer.parseInt("" + request.getParameter("id"));
			training.setTra_id(tra_id);
			this.trainingBiz.delInfo(training);
			 return "training/delete_success";
		}
		return null;
	}
}
