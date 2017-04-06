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
import com.hr.bean.Bonus;
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
import com.hr.biz.BonusBiz;
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
public class BonusController {
	private static final Log logger = LogFactory.getLog(BonusController.class);
	private HumanFileBiz humanFileBiz;
	private ConfigPublicCharBiz configPublicCharBiz;
	private BonusBiz bonusBiz;

	@Resource(name = "bonusBizImpl")
	public void setBonusBiz(BonusBiz bonusBiz) {
		this.bonusBiz = bonusBiz;
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
	@RequestMapping(value = "/bonus.do")
	public String gethumanfiles(Model model, HttpServletRequest request, Bonus bonus) { 
		String opreate = request.getParameter("operate");
		String pageNow=request.getParameter("pageNow");
		if("query".equals(opreate)){
			return "bonus/query_keywords";
		}else if ("doSearch".equals(opreate)) {
			Integer id = bonus.getHuman_id();
			HumanFile hFile = new HumanFile();
			if (id == 1) {
				hFile.setHuman_id(null);
				hFile.setHuman_name(bonus.getHuman_name());

			} else {
				if(bonus.getHuman_name()!=null&&!"".equals(bonus.getHuman_name())){
				hFile.setHuman_id(Integer.parseInt(bonus.getHuman_name()));
				}else{ hFile.setHuman_id(0);}
				hFile.setHuman_name(null);
			}
			List<HumanFile> list = this.humanFileBiz.getInfoByName(hFile);
			model.addAttribute("list", list);
			return "bonus/query_list";
		} else if("tobonus".equals(opreate)){//前往登记
			Integer humanid = Integer.parseInt("" + request.getParameter("id"));
			Bonus bonus2=this.bonusBiz.getInfoByHumanId(humanid);
			if(bonus2==null){
			HumanFile hFile=this.humanFileBiz.getInfoByHumanIds(humanid);
			model.addAttribute("list", hFile);
			List<ConfigPublicChar> list1=this.configPublicCharBiz.getAll("奖励等级");
			model.addAttribute("list1", list1);
			List<ConfigPublicChar> list2=this.configPublicCharBiz.getAll("奖励项目");
			model.addAttribute("list2", list2);
			return "bonus/register";
			}else {
				return "bonus/bonus_failure";
			}
		}else if("doAdd".equals(opreate)){//登记
			bonus.setCheck_status(0);
			System.out.println(bonus);
			 this.bonusBiz.saveInfo(bonus);
			return "bonus/register_success";
		}else if("check".equals(opreate)){//复核
			Page page = null;// new 对象在下面
			int totalCount = this.bonusBiz.getCount();// 获取当前用户总记录条数
			if (pageNow != null && pageNow != "") {// 防止出现空指针异常
				int pageNow1 = Integer.parseInt(pageNow);
				page = new Page(totalCount, pageNow1);// 这样写的好处，判断完成外面可以继续调用
			}
			page.setPageSize(5);
			bonus.setPage(page);
			bonus.setCheck_status(0);
			List<Bonus> list=this.bonusBiz.getAllPage(bonus);
			model.addAttribute("list", list);
			model.addAttribute("page", page);
			return "bonus/check_list";
		}else if("toCheck".equals(opreate)){
			Integer humanid = Integer.parseInt("" + request.getParameter("id"));
			 HumanFile hFile=new HumanFile();
			 HumanFile hFile2=this.humanFileBiz.getInfoByHumanIds(humanid);
			 hFile.setTraining_amount(hFile2.getBonus_amount()+1);
			 hFile.setHuman_id(humanid);
			 //this.humanFileBiz.updateInfoToBonus(hFile);
			 bonus.setHuman_id(humanid);
			 bonus.setCheck_status(1);
			 //this.bonusBiz.updateInfo(bonus);
			 System.out.println(bonus);
			return "bonus/check_success";
		}else if("queryAll".equals(opreate)){
			Page page = null;// new 对象在下面
			int totalCount = this.bonusBiz.getBonusCount();// 获取当前用户总记录条数
			if (pageNow != null && pageNow != "") {// 防止出现空指针异常
				int pageNow1 = Integer.parseInt(pageNow);
				page = new Page(totalCount, pageNow1);// 这样写的好处，判断完成外面可以继续调用
			}
			page.setPageSize(5);
			bonus.setPage(page);
			List<Bonus>bonuss = this.bonusBiz.getAllBonusPage(bonus);
			model.addAttribute("list", bonuss);
			model.addAttribute("page", page);
			return "bonus/query_all_list";
		}else if("toQueryAll".equals(opreate)){
			Integer tra_id = Integer.parseInt("" + request.getParameter("id"));
			Bonus list=this.bonusBiz.getInfoById(tra_id);
			model.addAttribute("list", list);
			return "bonus/query_all";
		}else if("toDelete".equals(opreate)){
			Integer bon_id = Integer.parseInt("" + request.getParameter("id"));
			model.addAttribute("bon_id", bon_id);
			return "bonus/bonus_delete";
		}else if("doDelete".equals(opreate)){
			Integer bon_id = Integer.parseInt("" + request.getParameter("id"));
			bonus.setBon_id(bon_id);
			this.bonusBiz.delInfo(bonus);
			 return "bonus/delete_success";
		}
		return null;
	}
}
