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
import com.hr.bean.SalaryStandard;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileSecondKindBiz;
import com.hr.biz.ConfigFileThirdKindBiz;
import com.hr.biz.ConfigMajorBiz;
import com.hr.biz.ConfigMajorKindBiz;
import com.hr.biz.ConfigPublicCharBiz;
import com.hr.biz.HumanFileBiz;
import com.hr.biz.MajorChangeBiz;
import com.hr.biz.SalaryStandardBiz;
import com.hr.web.utils.Page;
import com.hr.web.utils.UploadFileUtil;
import com.hr.web.utils.UploadFileUtil.UploadFile;

@Controller
public class MajorChangeController {
	private static final Log logger = LogFactory.getLog(MajorChangeController.class);
	private ConfigFileFirstKindBiz configFileFirstKindBiz;
	private ConfigMajorKindBiz configMajorKindBiz;
	private HumanFileBiz humanFileBiz;
	private MajorChangeBiz majorChangeBiz;
	private  SalaryStandardBiz salaryStandardBiz;

	@Resource(name = "salaryStandardBizImpl")
	public void setsalaryStandardBiz(SalaryStandardBiz salaryStandardBiz) {
		this.salaryStandardBiz = salaryStandardBiz;
	}

	@Resource(name = "majorChangeBizImpl")
	public void setmajorChangeBiz(MajorChangeBiz majorChangeBiz) {
		this.majorChangeBiz = majorChangeBiz;
	}
	@Resource(name = "humanFileBizImpl")
	public void setHumanFileBiz(HumanFileBiz humanFileBiz) {
		this.humanFileBiz = humanFileBiz;
	}

	@Resource(name = "configMajorKindBizImpl")
	public void setConfigMajorKindBiz(ConfigMajorKindBiz configMajorKindBiz) {
		this.configMajorKindBiz = configMajorKindBiz;
	}

	@Resource(name = "configFileFirstKindBizImpl")
	public void setConfigFileFirstKindBiz(ConfigFileFirstKindBiz configFileFirstKindBiz) {
		this.configFileFirstKindBiz = configFileFirstKindBiz;
	}
 

	// 档案设置
	@RequestMapping(value = "/majorchange.do")
	public String gethumanfiles(Model model, HttpServletRequest request, MajorChange mChange) {
		String opreate = request.getParameter("operate");
		if ("query".equals(opreate)) {
			return "major_change/query_keywords";
		} else if ("doSearch".equals(opreate)) {
			Integer id = mChange.getHuman_id();
			HumanFile hFile = new HumanFile();
			if (id == 1) {
				hFile.setHuman_id(null);
				hFile.setHuman_name(mChange.getHuman_name());

			} else {
				if(mChange.getHuman_name()!=null&&!"".equals(mChange.getHuman_name())){
					hFile.setHuman_id(Integer.parseInt(mChange.getHuman_name()));
					}else {hFile.setHuman_id(0);}
				hFile.setHuman_name(null);
			}
			List<HumanFile> list = this.humanFileBiz.getInfoByName(hFile);
			model.addAttribute("list", list);
			return "major_change/query_list";
		} else if ("tochange".equals(opreate)) {
			Integer huf_id = Integer.parseInt("" + request.getParameter("id"));
			
			HumanFile hFile = new HumanFile();
			hFile = this.humanFileBiz.getInfoByHumanId(huf_id);
			Integer human_id=hFile.getHuman_id();
			MajorChange mChange2=this.majorChangeBiz.getInfoByHumanId(human_id);
			if(mChange2==null){
			
			model.addAttribute("list", hFile);
			List<ConfigFileFirstKind> lists = this.configFileFirstKindBiz.getAllConfigFileFirstKinds();
			List<ConfigMajorKind> list2 = this.configMajorKindBiz.getAll();
			model.addAttribute("list_first", lists);
			model.addAttribute("list2", list2);
			List<SalaryStandard> standards=this.salaryStandardBiz.getAllNeedCheckSalaryStandard(1);
			model.addAttribute("standards", standards);
			return "major_change/register";
			}else {
				return "major_change/change_failure";
			}

		} else if ("".equals(opreate)||opreate==null) {
			getInfo(mChange);
			 mChange.setCheck_status(0);
			 this.majorChangeBiz.saveInfo(mChange);
			return "major_change/change_success";
		}else if("check".equals(opreate)){
			String pageNow = request.getParameter("pageNow");
			Page page = null;// new 对象在下面
			int totalCount = this.majorChangeBiz.getCount();// 获取当前用户总记录条数
			System.out.println(totalCount);
			if (pageNow != null && pageNow != "") {// 防止出现空指针异常
				int pageNow1 = Integer.parseInt(pageNow);
				page = new Page(totalCount, pageNow1);// 这样写的好处，判断完成外面可以继续调用
			}
			page.setPageSize(5);
			mChange.setPage(page);
			mChange.setCheck_status(0);
			List<MajorChange>MajorChanges = this.majorChangeBiz.getAllPage(mChange);
			model.addAttribute("list", MajorChanges);
			model.addAttribute("page", page);
			return "major_change/check_list";
		}else if("toCheck".equals(opreate)){
			Integer id = Integer.parseInt("" + request.getParameter("id"));
			MajorChange list=this.majorChangeBiz.getInfoById(id);
			model.addAttribute("list", list);
			return "major_change/check";
		}else if("doEdit".equals(opreate)){
			Integer id=mChange.getCheck_status();
			if(id==0){
				return "major_change/check_failure";
			}else if(id==1){
				mChange.setCheck_status(1);
				 MajorChange mChange2=this.majorChangeBiz.getInfoByHumanId(mChange.getHuman_id());
				 HumanFile hFile=new HumanFile();
				 HumanFile hFile2=this.humanFileBiz.getInfoByHumanIds(mChange2.getHuman_id());
				 hFile.setMajor_change_amount(hFile2.getMajor_change_amount()+1);
				 hFile.setHuman_id(mChange2.getHuman_id());
				 //一级
				 hFile.setFirst_kind_id(mChange2.getNew_first_kind_id());
				 hFile.setFirst_kind_name(mChange2.getNew_first_kind_name());
				 //二级
				 hFile.setSecond_kind_id(mChange2.getNew_second_kind_id());
				 hFile.setSecond_kind_name(mChange2.getNew_second_kind_name());
				 //三级
				 hFile.setThird_kind_id(mChange2.getNew_third_kind_id());
				 hFile.setThird_kind_name(mChange2.getNew_third_kind_name());
				 //职位分类
				 hFile.setHuman_major_kind_id(mChange2.getNew_major_kind_id());
				 hFile.setHuman_major_kind_name(mChange2.getNew_major_kind_name());
				 //职位
				 hFile.setHuman_major_id(mChange2.getNew_major_id());
				 hFile.setHuman_major_name(mChange2.getNew_major_name());
				 //薪酬
				 hFile.setSalary_standard_id(mChange2.getNew_salary_standard_id());
				 hFile.setSalary_standard_name(mChange2.getNew_salary_standard_name());
				 this.majorChangeBiz.updateInfo(mChange);
				 this.humanFileBiz.updateInfoToMajorChange(hFile);
				 return "major_change/check_success";
				 
			}
			
		}else if("queryAll".equals(opreate)){
			String pageNow = request.getParameter("pageNow");
			Page page = null;// new 对象在下面
			int totalCount = this.majorChangeBiz.getChangeCount();// 获取当前用户总记录条数
			if (pageNow != null && pageNow != "") {// 防止出现空指针异常
				int pageNow1 = Integer.parseInt(pageNow);
				page = new Page(totalCount, pageNow1);// 这样写的好处，判断完成外面可以继续调用
			}
			page.setPageSize(5);
			mChange.setPage(page);
			List<MajorChange>MajorChanges = this.majorChangeBiz.getAllChangePage(mChange);
			model.addAttribute("list", MajorChanges);
			model.addAttribute("page", page);
			return "major_change/query_all_list";
		}else if("toQueryAll".equals(opreate)){
			Integer mch_id = Integer.parseInt("" + request.getParameter("id"));
			MajorChange list=this.majorChangeBiz.getInfoById(mch_id);
			model.addAttribute("list", list);
			return "major_change/query_all";
		}else if("toDelete".equals(opreate)){
			Integer mch_id = Integer.parseInt("" + request.getParameter("id"));
			model.addAttribute("mch_id", mch_id);
			return "major_change/major_change_delete";
		}else if("doDelete".equals(opreate)){
			Integer mch_id = Integer.parseInt("" + request.getParameter("id"));
			mChange.setMch_id(mch_id);
			this.majorChangeBiz.delInfo(mChange);
			 return "major_change/delete_success";
		}

		return null;

	}

	public void getInfo(MajorChange majorChange) {
		// 拆分一级
		String first_kind_name = majorChange.getFirst_kind_name();
		Integer first_kind_id = Integer.parseInt(first_kind_name.substring(0, first_kind_name.lastIndexOf("/")));
		first_kind_name = first_kind_name.substring(first_kind_name.lastIndexOf("/") + 1);
		majorChange.setFirst_kind_id(first_kind_id);
		majorChange.setFirst_kind_name(first_kind_name);
		// 拆分二级
		String second_kind_name = majorChange.getSecond_kind_name();
		Integer second_kind_id = Integer.parseInt(second_kind_name.substring(0, second_kind_name.lastIndexOf("/")));
		second_kind_name = second_kind_name.substring(second_kind_name.lastIndexOf("/") + 1);
		majorChange.setSecond_kind_id(second_kind_id);
		majorChange.setSecond_kind_name(second_kind_name);
		// 拆分III级
		String third_kind_name = majorChange.getThird_kind_name();
		System.out.println(third_kind_name);
		Integer third_kind_id = Integer.parseInt(third_kind_name.substring(0, third_kind_name.lastIndexOf("/")));
		third_kind_name = third_kind_name.substring(third_kind_name.lastIndexOf("/") + 1);
		majorChange.setThird_kind_id(third_kind_id);
		majorChange.setThird_kind_name(third_kind_name);
		// 拆分职位类别
		String human_major_kind_name = majorChange.getMajor_kind_name();
		Integer human_major_kind_id = Integer
				.parseInt(human_major_kind_name.substring(0, human_major_kind_name.lastIndexOf("/")));
		human_major_kind_name = human_major_kind_name.substring(human_major_kind_name.lastIndexOf("/") + 1);
		majorChange.setMajor_kind_id(human_major_kind_id);
		majorChange.setMajor_kind_name(human_major_kind_name);
		// 拆分职位名称
		String human_major__name = majorChange.getMajor_name();
		Integer human_major_id = Integer.parseInt(human_major__name.substring(0, human_major__name.lastIndexOf("/")));
		human_major__name = human_major__name.substring(human_major__name.lastIndexOf("/") + 1);
		majorChange.setMajor_id(human_major_id);
		majorChange.setMajor_name(human_major__name);

		// 拆分薪酬
		String salary_standard_name = majorChange.getSalary_standard_name();
		String salary_standard_id = salary_standard_name.substring(0, salary_standard_name.lastIndexOf("/"));
		salary_standard_name = salary_standard_name.substring(salary_standard_name.lastIndexOf("/") + 1);
		majorChange.setSalary_standard_name(salary_standard_name);
		majorChange.setSalary_standard_id(salary_standard_id);
		SalaryStandard salaryStandard= this.salaryStandardBiz.getSalaryStandardById(salary_standard_id);
		majorChange.setSalary_sum(salaryStandard.getSalary_sum());
		
		// 拆分新一级
				String new_first_kind_name = majorChange.getNew_first_kind_name();
				Integer new_first_kind_id = Integer.parseInt(new_first_kind_name.substring(0, new_first_kind_name.lastIndexOf("/")));
				new_first_kind_name = new_first_kind_name.substring(new_first_kind_name.lastIndexOf("/") + 1);
				majorChange.setNew_first_kind_id(new_first_kind_id);
				majorChange.setNew_first_kind_name(new_first_kind_name);
				// 拆分新二级
				String new_second_kind_name = majorChange.getNew_second_kind_name();
				Integer new_second_kind_id = Integer.parseInt(new_second_kind_name.substring(0, new_second_kind_name.lastIndexOf("/")));
				new_second_kind_name = new_second_kind_name.substring(new_second_kind_name.lastIndexOf("/") + 1);
				majorChange.setNew_second_kind_id(new_second_kind_id);
				majorChange.setNew_second_kind_name(new_second_kind_name);
				// 拆分新III级
				String new_third_kind_name = majorChange.getNew_third_kind_name();
				Integer new_third_kind_id = Integer.parseInt(new_third_kind_name.substring(0, new_third_kind_name.lastIndexOf("/")));
				new_third_kind_name = new_third_kind_name.substring(new_third_kind_name.lastIndexOf("/") + 1);
				majorChange.setNew_third_kind_id(new_third_kind_id);
				majorChange.setNew_third_kind_name(new_third_kind_name);
				// 拆分新职位类别
				String new_major_kind_name = majorChange.getNew_major_kind_name();
				Integer new_major_kind_id = Integer
						.parseInt(new_major_kind_name.substring(0, new_major_kind_name.lastIndexOf("/")));
				new_major_kind_name = new_major_kind_name.substring(new_major_kind_name.lastIndexOf("/") + 1);
				majorChange.setNew_major_kind_id(new_major_kind_id);
				majorChange.setNew_major_kind_name(new_major_kind_name);
				// 拆分新职位名称
				String new_major_name = majorChange.getNew_major_name();
				Integer new_major_id = Integer.parseInt(new_major_name.substring(0, new_major_name.lastIndexOf("/")));
				new_major_name = new_major_name.substring(new_major_name.lastIndexOf("/") + 1);
				majorChange.setNew_major_id(new_major_id);
				majorChange.setNew_major_name(new_major_name);

				// 拆分新薪酬
				String new_salary_standard_name = majorChange.getNew_salary_standard_name();
				String new_salary_standard_id = new_salary_standard_name.substring(0, new_salary_standard_name.lastIndexOf("/"));
				new_salary_standard_name = new_salary_standard_name.substring(new_salary_standard_name.lastIndexOf("/") + 1);
				majorChange.setNew_salary_standard_id(new_salary_standard_id);
				majorChange.setNew_salary_standard_name(new_salary_standard_name);
				SalaryStandard salaryStandard2= this.salaryStandardBiz.getSalaryStandardById(new_salary_standard_id);
				majorChange.setNew_salary_sum(salaryStandard2.getSalary_sum());
	}

}
