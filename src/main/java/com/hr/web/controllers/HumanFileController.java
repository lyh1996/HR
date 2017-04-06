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
import com.google.gson.Gson;
import com.hr.bean.ConfigFileFirstKind;
import com.hr.bean.ConfigFileSecondKind;
import com.hr.bean.ConfigFileThirdKind;
import com.hr.bean.ConfigMajor;
import com.hr.bean.ConfigMajorKind;
import com.hr.bean.ConfigPublicChar;
import com.hr.bean.ConfigQuestionSecondKind;
import com.hr.bean.HumanFile;
import com.hr.bean.SalaryStandard;
import com.hr.biz.ConfigFileFirstKindBiz;
import com.hr.biz.ConfigFileSecondKindBiz;
import com.hr.biz.ConfigFileThirdKindBiz;
import com.hr.biz.ConfigMajorBiz;
import com.hr.biz.ConfigMajorKindBiz;
import com.hr.biz.ConfigPublicCharBiz;
import com.hr.biz.HumanFileBiz;
import com.hr.biz.SalaryStandardBiz;
import com.hr.web.utils.Page;
import com.hr.web.utils.UploadFileUtil;
import com.hr.web.utils.UploadFileUtil.UploadFile;

@Controller
public class HumanFileController {
	private static final Log logger = LogFactory.getLog(HumanFileController.class);
	private String pdfRootName = "uploads";
	private HumanFile humanFile;
	private HumanFile humanFileCheck;
	private ConfigFileSecondKindBiz configFileSecondKindBiz;
	private ConfigFileFirstKindBiz configFileFirstKindBiz;
	private ConfigFileThirdKindBiz configFileThirdKindBiz;
	private ConfigMajorBiz configMajorBiz;
	private ConfigMajorKindBiz configMajorKindBiz;
	private ConfigPublicCharBiz configPublicCharBiz;
	private HumanFileBiz humanFileBiz;
	private  SalaryStandardBiz salaryStandardBiz;

	@Resource(name = "salaryStandardBizImpl")
	public void setsalaryStandardBiz(SalaryStandardBiz salaryStandardBiz) {
		this.salaryStandardBiz = salaryStandardBiz;
	}
	@Resource(name = "humanFileBizImpl")
	public void setHumanFileBiz(HumanFileBiz humanFileBiz) {
		this.humanFileBiz = humanFileBiz;
	}

	@Resource(name = "configPublicCharBizImpl")
	public void setConfigPublicCharBiz(ConfigPublicCharBiz configPublicCharBiz) {
		this.configPublicCharBiz = configPublicCharBiz;
	}

	@Resource(name = "configMajorKindBizImpl")
	public void setConfigMajorKindBiz(ConfigMajorKindBiz configMajorKindBiz) {
		this.configMajorKindBiz = configMajorKindBiz;
	}

	@Resource(name = "configMajorBizImpl")
	public void setConfigMajorBiz(ConfigMajorBiz configMajorBiz) {
		this.configMajorBiz = configMajorBiz;
	}

	@Resource(name = "configFileThirdKindBizImpl")
	public void setConfigFileThirdKindBiz(ConfigFileThirdKindBiz configFileThirdKindBiz) {
		this.configFileThirdKindBiz = configFileThirdKindBiz;
	}

	@Resource(name = "configFileFirstKindBizImpl")
	public void setConfigFileFirstKindBiz(ConfigFileFirstKindBiz configFileFirstKindBiz) {
		this.configFileFirstKindBiz = configFileFirstKindBiz;
	}

	@Resource(name = "configFileSecondKindBizImpl")
	public void setConfigFileSecondKindBiz(ConfigFileSecondKindBiz configFileSecondKindBiz) {
		this.configFileSecondKindBiz = configFileSecondKindBiz;
	}

	// 档案设置
	@RequestMapping(value = "/humanfile.do")
	public String gethumanfiles(Model model, HttpServletRequest request, HumanFile hFile) {
		String opreate = request.getParameter("operate");
		String pageNow = request.getParameter("pageNow");
		String Method = request.getParameter("method");
		if ("toAdd".equals(opreate)) {// 进入添加页面
			List<ConfigFileFirstKind> lists = this.configFileFirstKindBiz.getAllConfigFileFirstKinds();
			List<ConfigMajorKind> list2 = this.configMajorKindBiz.getAll();
			List<SalaryStandard> standards=this.salaryStandardBiz.getAllNeedCheckSalaryStandard(1);
			List<ConfigPublicChar> ConfigPublicChars = this.configPublicCharBiz.getAll("职称");
			List<ConfigPublicChar> countrys = this.configPublicCharBiz.getAll("国籍");
			List<ConfigPublicChar> races = this.configPublicCharBiz.getAll("民族");
			List<ConfigPublicChar> religions = this.configPublicCharBiz.getAll("宗教信仰");
			List<ConfigPublicChar> partys = this.configPublicCharBiz.getAll("政治面貌");
			List<ConfigPublicChar> degrees = this.configPublicCharBiz.getAll("学历");
			List<ConfigPublicChar> educatedyears = this.configPublicCharBiz.getAll("教育年限");
			List<ConfigPublicChar> educatedmajors = this.configPublicCharBiz.getAll("专业");
			List<ConfigPublicChar> specialitys = this.configPublicCharBiz.getAll("特长");
			List<ConfigPublicChar> hobbys = this.configPublicCharBiz.getAll("爱好");
			model.addAttribute("list12", hobbys);
			model.addAttribute("list11", specialitys);
			model.addAttribute("list10", educatedmajors);
			model.addAttribute("list9", educatedyears);
			model.addAttribute("list8", degrees);
			model.addAttribute("list7", partys);
			model.addAttribute("list6", religions);
			model.addAttribute("list5", races);
			model.addAttribute("list3", ConfigPublicChars);
			model.addAttribute("list4", countrys);
			model.addAttribute("list", lists);
			model.addAttribute("list2", list2);
			model.addAttribute("standards", standards);
			return "human_file/register";
		} else if ("".equals(opreate) || opreate == null) {// 基本信息完成
			getInfo(hFile);
			// 拆分薪酬
			String salary_standard_name = hFile.getSalary_standard_name();
			String salary_standard_id = salary_standard_name.substring(0, salary_standard_name.lastIndexOf("/"));
			salary_standard_name = salary_standard_name.substring(salary_standard_name.lastIndexOf("/") + 1);
			hFile.setSalary_standard_name(salary_standard_name);
			hFile.setSalary_standard_id(salary_standard_id);
			SalaryStandard salaryStandard= this.salaryStandardBiz.getSalaryStandardById(salary_standard_id);
			hFile.setSalary_sum(salaryStandard.getSalary_sum());
			humanFile = hFile;
			System.out.println(hFile);
			return "human_file/register_base_success";

		} else if ("CheckPhoto".equals(opreate)) {

			humanFileCheck = hFile;
			return "human_file/check_base_success";

		} else if ("ChangePhoto".equals(opreate)) {
			humanFileCheck = hFile;
			return "human_file/change_base_success";
		} else if ("toUpLoadPhoto".equals(opreate)) {
			if ("register".equals(Method)) {
				return "human_file/register_choose_picture";
			} else if ("check".equals(Method)) {

				return "human_file/check_choose_picture";

			} else if ("change".equals(Method)) {
				return "human_file/change_choose_picture";
			}
		} else if ("doUpLoadPhoto".equals(opreate)) {
			String imgstr = "";
			// 上传
			Map<String, UploadFile> map = UploadFileUtil.uploadFile(request, hFile.getImgUrl(), pdfRootName);
			for (Entry<String, UploadFile> entry : map.entrySet()) {
				UploadFile uploadFile = entry.getValue();
				imgstr = uploadFile.getNewFileUrl();
			}
			hFile.setHuman_picture(imgstr);
			if ("register".equals(Method)) {
				humanFile.setHuman_picture(hFile.getHuman_picture());
				// System.out.println(hFile.getHuman_picture());
				return "human_file/register_choose_attachment";
			} else if ("check".equals(Method)) {
				System.out.println(humanFileCheck);
				humanFileCheck.setHuman_picture(hFile.getHuman_picture());
				return "human_file/check_choose_attachment";
			} else if ("change".equals(Method)) {
			}
			humanFileCheck.setHuman_picture(hFile.getHuman_picture());
			return "human_file/change_choose_attachment";
		} else if ("toUpLoadAttach".equals(opreate)) {
			if ("register".equals(Method)) {
				return "human_file/register_choose_attachment";
			} else if ("check".equals(Method)) {
				return "human_file/check_choose_attachment";
			} else if ("change".equals(Method)) {
				return "human_file/change_choose_attachment";
			}
		} else if ("doUpLoadAttach".equals(opreate)) {

			// System.out.println(attachment_name);
			String pdfstr = "";
			// 上传
			Map<String, UploadFile> map = UploadFileUtil.uploadFile(request, hFile.getPdfUrl(), pdfRootName);
			for (Entry<String, UploadFile> entry : map.entrySet()) {
				UploadFile uploadFile = entry.getValue();
				pdfstr = uploadFile.getNewFileUrl();
			}
			hFile.setAttachment_name(pdfstr);
			if ("register".equals(Method)) {
				humanFile.setAttachment_name(hFile.getAttachment_name());
				System.out.println(humanFile);
				return "human_file/register_finish";
			} else if ("check".equals(Method)) {
				humanFileCheck.setAttachment_name(hFile.getAttachment_name());
				System.out.println(humanFileCheck);
				return "human_file/check_finish";
			} else if ("change".equals(Method)) {
				humanFileCheck.setAttachment_name(hFile.getAttachment_name());
				System.out.println(humanFileCheck);
				return "human_file/change_finish";
			}

		} else if ("doAdd".equals(opreate)) {
			String human_id_card = humanFile.getHuman_id_card();
			HumanFile list = this.humanFileBiz.getInfoByIdCard(human_id_card);
			if (list == null) {
				Integer human_id = 1;
				List<HumanFile> list2 = this.humanFileBiz.getAll();
				if (list2.size() > 0) {
					human_id = list2.get(0).getHuman_id() + 1;
					humanFile.setHuman_id(human_id);
					humanFile.setHuman_file_status(1);
					humanFile.setCheck_status(0);
					this.humanFileBiz.saveInfo(humanFile);
					return "human_file/register_success";
				}
			} else {
				return "human_file/register_failure";
			}

		} else if ("list".equals(opreate)) {
			if ("query".equals(Method)) {
				getInfo(hFile);
				System.out.println(hFile);
				List<HumanFile> list = this.humanFileBiz.getInfoByCondition(hFile);
				model.addAttribute("list", list);
				return "human_file/query_list";
			} else if ("change".equals(Method)) {
				getInfo(hFile);
				List<HumanFile> list = this.humanFileBiz.getInfoByCondition(hFile);
				model.addAttribute("list", list);
				return "human_file/change_list";
			} else if ("delete".equals(Method)) {
				getInfo(hFile);
				List<HumanFile> list = this.humanFileBiz.getInfoByCondition(hFile);
				model.addAttribute("list", list);
				return "human_file/delete/delete_list";
			}else if("recovery".equals(Method)){
				getInfo(hFile);
				hFile.setDelete_time("2017-2-3");
				List<HumanFile> list = this.humanFileBiz.getInfoByCondition(hFile);
				model.addAttribute("list", list);
				return "human_file/delete/recovery_list";
			} else if("delforever".equals(Method)){
				logger.info("getList called....");
				Page page = null;// new 对象在下面
				int totalCount = this.humanFileBiz.getDelCount();// 获取当前用户总记录条数
				if (pageNow != null && pageNow != "") {// 防止出现空指针异常
					int pageNow1 = Integer.parseInt(pageNow);
					page = new Page(totalCount, pageNow1);// 这样写的好处，判断完成外面可以继续调用
				}
				page.setPageSize(5);
				hFile.setPage(page);
				hFile.setHuman_file_status(0);
				hFile.setCheck_status(1);
				List<HumanFile> humanFiles = this.humanFileBiz.getAllPage(hFile);
				model.addAttribute("list", humanFiles);
				model.addAttribute("page", page);
				return "human_file/delete/delete_forever_list";
			}else {
				logger.info("getList called....");
				Page page = null;// new 对象在下面
				int totalCount = this.humanFileBiz.getCount();// 获取当前用户总记录条数
				if (pageNow != null && pageNow != "") {// 防止出现空指针异常
					int pageNow1 = Integer.parseInt(pageNow);
					page = new Page(totalCount, pageNow1);// 这样写的好处，判断完成外面可以继续调用
				}
				page.setPageSize(5);
				hFile.setPage(page);
				hFile.setHuman_file_status(1);
				hFile.setCheck_status(0);
				List<HumanFile> humanFiles = this.humanFileBiz.getAllPage(hFile);
				model.addAttribute("list", humanFiles);
				model.addAttribute("page", page);
				return "human_file/check_list";
			}

		} else if ("toCheck".equals(opreate)) {
			toChange(model, request);
			return "human_file/check";
		} else if ("doCheck".equals(opreate)) {
			// 拆分薪酬
			String salary_standard_name = humanFileCheck.getSalary_standard_name();
			String salary_standard_id = salary_standard_name.substring(0, salary_standard_name.lastIndexOf("/"));
			salary_standard_name = salary_standard_name.substring(salary_standard_name.lastIndexOf("/") + 1);
			humanFileCheck.setSalary_standard_name(salary_standard_name);
			humanFileCheck.setSalary_standard_id(salary_standard_id);
			SalaryStandard salaryStandard= this.salaryStandardBiz.getSalaryStandardById(salary_standard_id);
			humanFileCheck.setSalary_sum(salaryStandard.getSalary_sum());
			humanFileCheck.setCheck_status(1);
			humanFileCheck.setHuman_file_status(0);
		//	System.out.println(humanFileCheck.getAttachment_name());
			//System.out.println(humanFileCheck.getHuman_picture());
			this.humanFileBiz.updateInfo(humanFileCheck);
			return "human_file/check_success";
		} else if ("toLocate".equals(opreate)) {
			List<ConfigFileFirstKind> list_first = this.configFileFirstKindBiz.getAllConfigFileFirstKinds();
			model.addAttribute("list_first", list_first);
			List<ConfigFileSecondKind> list_second = this.configFileSecondKindBiz.getAll();
			model.addAttribute("list_second", list_second);
			List<ConfigFileThirdKind> list_third = this.configFileThirdKindBiz.getAllInfo();
			model.addAttribute("list_third", list_third);
			// System.out.println(list_first);
			List<ConfigMajorKind> list_major_kind = this.configMajorKindBiz.getAll();
			model.addAttribute("list_major_kind", list_major_kind);
			List<ConfigMajor> list_major = this.configMajorBiz.getAll();
			model.addAttribute("list_major", list_major);
			if ("query".equals(Method)) {
				return "human_file/query_locate";
			} else if ("change".equals(Method)) {
				return "human_file/change_locate";
			} else if ("delete".equals(Method)) {
				return "human_file/delete/delete_locate";
			} else if ("recovery".equals(Method)) {
				return "human_file/delete/recovery_locate";
			}
		} else if ("toEdit".equals(opreate)) {
			toChange(model, request);
			return "human_file/change";
		} else if ("doEdit".equals(opreate)) {
			// 拆分薪酬
			String salary_standard_name = humanFileCheck.getSalary_standard_name();
			String salary_standard_id = salary_standard_name.substring(0, salary_standard_name.lastIndexOf("/"));
			salary_standard_name = salary_standard_name.substring(salary_standard_name.lastIndexOf("/") + 1);
			humanFileCheck.setSalary_standard_name(salary_standard_name);
			humanFileCheck.setSalary_standard_id(salary_standard_id);
			humanFileCheck.setCheck_status(0);
			humanFileCheck.setHuman_file_status(1);
			humanFileCheck.setLastly_change_time(humanFileCheck.getChange_time());
			 HumanFile hFile2=this.humanFileBiz.getInfoByHumanId(humanFileCheck.getHuf_id());
			Integer changeCount = hFile2.getFile_chang_amount()+ 1;
			humanFileCheck.setFile_chang_amount(changeCount);
			System.out.println(humanFileCheck);
			this.humanFileBiz.updateInfoByChange(humanFileCheck);
			return "human_file/change_success";

		} else if ("toDelete".equals(opreate)) {//前往删除
			Integer humanid = Integer.parseInt("" + request.getParameter("id"));
			model.addAttribute("humanid", humanid);
			return "human_file/delete/delete";
		} else if ("doDelete".equals(opreate)) {
			Integer humanid = Integer.parseInt("" + request.getParameter("id"));
			Date date = new Date();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
			hFile.setHuman_id(humanid);
			hFile.setDelete_time(df.format(date));
			this.humanFileBiz.updateInfoToDelete(hFile);
			return "human_file/delete/delete_success";

		}else if("toRecover".equals(opreate)){
			Integer humanid = Integer.parseInt("" + request.getParameter("id"));
			model.addAttribute("humanid", humanid);
			return "human_file/delete/recovery";
		} else if("doRecover".equals(opreate)){
			Integer humanid = Integer.parseInt("" + request.getParameter("id"));
			hFile.setHuman_id(humanid);
			hFile.setDelete_time(null);
			hFile.setCheck_status(0);
			hFile.setHuman_file_status(1);
			this.humanFileBiz.updateInfoToRecovery(hFile);
			return "human_file/delete/recovery_success";
		}else if("toDelForever".equals(opreate)){
			Integer humanid = Integer.parseInt("" + request.getParameter("id"));
			model.addAttribute("humanid", humanid);
			return "human_file/delete/delete_forever";
		}else if("doDelForever".equals(opreate)){
			Integer humanid = Integer.parseInt("" + request.getParameter("id"));
			hFile.setHuman_id(humanid);
			this.humanFileBiz.delInfo(hFile);
			return "human_file/delete/delete_forever_success";
		}else if ("query".equals(opreate)) {
			Integer id = Integer.parseInt("" + request.getParameter("id"));
			HumanFile humanFile = this.humanFileBiz.getInfoByHumanId(id);
			model.addAttribute("list", humanFile);
			return "human_file/query";
		}else if("toSearch".equals(opreate)){
			if("query".equals(Method)){
				return "human_file/query_keywords";
			}else if("change".equals(Method)){
				return "human_file/change_keywords";
			}else if("delete".equals(Method)){
				return "human_file/delete/delete_keywords";
			}
		}else if("doSearch".equals(opreate)){
			 Integer id=hFile.getHuman_id();
			 if(id==1){
				 hFile.setHuman_id(null);
				 
			 }else {
				 hFile.setHuman_id(Integer.parseInt(hFile.getHuman_name()));
				 hFile.setHuman_name(null);
			 }
			List<HumanFile>list= this.humanFileBiz.getInfoByName(hFile);
			 model.addAttribute("list", list);
			if("query".equals(Method)){
				return "human_file/query_list";
			}else if("change".equals(Method)){
				return "human_file/change_list";
			}else if("delete".equals(Method)){
				return "human_file/delete/delete_list";
			}
		}
		return null;
	}

	// 获取二级机构
	@RequestMapping(value = "/findInfoByFirstKind/{id}/{name}", produces = "text/html;charset=UTF-8")
	// @ResponseBody 指的是返回的内容 string代表的是响应中的协议的实体部分
	public @ResponseBody String findInfoByFirstKind(Model model, @PathVariable Integer id, HttpServletRequest request) {
		String SecondName = request.getParameter("SecondName");
		// System.out.println(SecondName);
		if (SecondName == null || "".equals(SecondName)) {
			logger.info("findInfoByFirstKind called.....");
			List<ConfigFileSecondKind> lists = this.configFileSecondKindBiz.getConfigFileSecondKindByFirstId(id);
			Gson gson = new Gson();
			return gson.toJson(lists);
		} else {
			logger.info("findInfoBySecondKind called.....");
			Integer secondId = Integer.parseInt(SecondName.substring(0, SecondName.lastIndexOf("/")));
			List<ConfigFileThirdKind> lists = this.configFileThirdKindBiz.getInfoBySFId(id, secondId);
			Gson gson = new Gson();
			return gson.toJson(lists);
		}
	}

	// 获取职位名称
	@RequestMapping(value = "/findInfoByMajorKind/{id}/{name}", produces = "text/html;charset=UTF-8")
	// @ResponseBody 指的是返回的内容 string代表的是响应中的协议的实体部分
	public @ResponseBody String findInfoByMajorKind(Model model, @PathVariable Integer id) {
		logger.info("findInfoByMajorKind called.....");
		List<ConfigMajor> lists = this.configMajorBiz.getMajorByKindId(id);
		Gson gson = new Gson();
		return gson.toJson(lists);
	}

	public void getInfo(HumanFile hFile) {
		// 拆分一级
		String first_kind_name = hFile.getFirst_kind_name();
		Integer first_kind_id = Integer.parseInt(first_kind_name.substring(0, first_kind_name.lastIndexOf("/")));
		first_kind_name = first_kind_name.substring(first_kind_name.lastIndexOf("/") + 1);
		hFile.setFirst_kind_id(first_kind_id);
		hFile.setFirst_kind_name(first_kind_name);
		// 拆分二级
		String second_kind_name = hFile.getSecond_kind_name();
		Integer second_kind_id = Integer.parseInt(second_kind_name.substring(0, second_kind_name.lastIndexOf("/")));
		second_kind_name = second_kind_name.substring(second_kind_name.lastIndexOf("/") + 1);
		hFile.setSecond_kind_id(second_kind_id);
		hFile.setSecond_kind_name(second_kind_name);
		// 拆分III级
		String third_kind_name = hFile.getThird_kind_name();
		System.out.println(third_kind_name);
		Integer third_kind_id = Integer.parseInt(third_kind_name.substring(0, third_kind_name.lastIndexOf("/")));
		third_kind_name = third_kind_name.substring(third_kind_name.lastIndexOf("/") + 1);
		hFile.setThird_kind_id(third_kind_id);
		hFile.setThird_kind_name(third_kind_name);
		// 拆分职位类别
		String human_major_kind_name = hFile.getHuman_major_kind_name();
		Integer human_major_kind_id = Integer
				.parseInt(human_major_kind_name.substring(0, human_major_kind_name.lastIndexOf("/")));
		human_major_kind_name = human_major_kind_name.substring(human_major_kind_name.lastIndexOf("/") + 1);
		hFile.setHuman_major_kind_id(human_major_kind_id);
		hFile.setHuman_major_kind_name(human_major_kind_name);
		// 拆分职位名称
		String human_major__name = hFile.getHuman_major_name();
		Integer human_major_id = Integer.parseInt(human_major__name.substring(0, human_major__name.lastIndexOf("/")));
		human_major__name = human_major__name.substring(human_major__name.lastIndexOf("/") + 1);
		hFile.setHuman_major_id(human_major_id);
		hFile.setHuman_major_name(human_major__name);
	}

	public void toChange(Model model, HttpServletRequest request) {
		Integer humanid = Integer.parseInt("" + request.getParameter("id"));
		System.out.println(humanid);
		HumanFile humanFile = this.humanFileBiz.getInfoByHumanId(humanid);
		model.addAttribute("list", humanFile);
		List<SalaryStandard> standards=this.salaryStandardBiz.getAllNeedCheckSalaryStandard(1);
		List<ConfigPublicChar> ConfigPublicChars = this.configPublicCharBiz.getAll("职称");
		List<ConfigPublicChar> countrys = this.configPublicCharBiz.getAll("国籍");
		List<ConfigPublicChar> races = this.configPublicCharBiz.getAll("民族");
		List<ConfigPublicChar> religions = this.configPublicCharBiz.getAll("宗教信仰");
		List<ConfigPublicChar> partys = this.configPublicCharBiz.getAll("政治面貌");
		List<ConfigPublicChar> degrees = this.configPublicCharBiz.getAll("学历");
		List<ConfigPublicChar> educatedyears = this.configPublicCharBiz.getAll("教育年限");
		List<ConfigPublicChar> educatedmajors = this.configPublicCharBiz.getAll("专业");
		List<ConfigPublicChar> specialitys = this.configPublicCharBiz.getAll("特长");
		List<ConfigPublicChar> hobbys = this.configPublicCharBiz.getAll("爱好");
		model.addAttribute("list12", hobbys);
		model.addAttribute("list11", specialitys);
		model.addAttribute("list10", educatedmajors);
		model.addAttribute("list9", educatedyears);
		model.addAttribute("list8", degrees);
		model.addAttribute("list7", partys);
		model.addAttribute("list6", religions);
		model.addAttribute("list5", races);
		model.addAttribute("list3", ConfigPublicChars);
		model.addAttribute("list4", countrys);
		model.addAttribute("standards", standards);
	}

}
