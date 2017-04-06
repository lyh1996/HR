package com.hr.web.controllers;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hr.bean.ConfigMajorKind;
import com.hr.bean.ConfigPublicChar;
import com.hr.bean.EngageInterview;
import com.hr.bean.EngageMajorRelease;
import com.hr.bean.EngageResume;
import com.hr.bean.SalaryStandard;
import com.hr.biz.ConfigMajorKindBiz;
import com.hr.biz.ConfigPublicCharBiz;
import com.hr.biz.EngageInterviewBiz;
import com.hr.biz.EngageMajorReleaseBiz;
import com.hr.biz.EngageResumeBiz;
import com.hr.biz.SalaryStandardBiz;
import com.hr.email.SendMail;
import com.hr.web.utils.Page;
import com.hr.web.utils.UploadFileUtil;
import com.hr.web.utils.UploadFileUtil.UploadFile;

@Controller
public class EngageResumeController {
	private static final Log logger = LogFactory.getLog(EngageResumeController.class);
	
	private String imageRootName = "uploadsImages";
	private String pdfRootName = "uploadsPdfs";
	private ConfigMajorKindBiz configMajorKindBiz;
	private ConfigPublicCharBiz configPublicCharBiz;
	private  SalaryStandardBiz salaryStandardBiz;
	private EngageMajorReleaseBiz releaseBiz;
	private EngageResumeBiz resumeBiz;
	private EngageInterviewBiz interviewBiz;
	private EngageMajorRelease release ;
	private EngageResume resumes;
	private EngageInterview interview;
	
	@Resource(name = "configMajorKindBizImpl")
	public void setConfigMajorKindBiz(ConfigMajorKindBiz configMajorKindBiz) {
		this.configMajorKindBiz = configMajorKindBiz;
	}
	@Resource(name = "configPublicCharBizImpl")
	public void setConfigPublicCharBiz(ConfigPublicCharBiz configPublicCharBiz) {
		this.configPublicCharBiz = configPublicCharBiz;
	}
	@Resource(name = "salaryStandardBizImpl")
	public void setSalaryStandardBiz(SalaryStandardBiz salaryStandardBiz) {
		this.salaryStandardBiz = salaryStandardBiz;
	}
	@Resource(name = "engageMajorReleaseBizImpl")
	public void setReleaseBiz(EngageMajorReleaseBiz releaseBiz) {
		this.releaseBiz = releaseBiz;
	}
	@Resource(name = "engageResumeBizImpl")
	public void setResumeBiz(EngageResumeBiz resumeBiz) {
		this.resumeBiz = resumeBiz;
	}
	@Resource(name = "engageInterviewBizImpl")
	public void setInterviewBiz(EngageInterviewBiz interviewBiz) {
		this.interviewBiz = interviewBiz;
	}
	
	//简历管理
	@RequestMapping(value = "/engageresume.do")
	public String getresume(Model model, HttpServletRequest request,EngageResume resume){
		String operate = request.getParameter("operate");
		String pageNow = request.getParameter("pageNow");
		String method = request.getParameter("method");
		
		if("toApply".equals(operate)){
			Integer releaseid = Integer.parseInt("" + request.getParameter("id"));
			System.out.println(releaseid);
			model.addAttribute("releaseid",releaseid);
			release=new EngageMajorRelease();
			release.setMre_id(releaseid);
			EngageMajorRelease releases = this.releaseBiz.getInfoByID(release);
			List<SalaryStandard> standards = this.salaryStandardBiz.getAllSalaryStandard();
			List<ConfigPublicChar> nationality = this.configPublicCharBiz.getAll("国籍");
			List<ConfigPublicChar> races = this.configPublicCharBiz.getAll("民族");
			List<ConfigPublicChar> religions = this.configPublicCharBiz.getAll("宗教信仰");
			List<ConfigPublicChar> parties = this.configPublicCharBiz.getAll("政治面貌");
			List<ConfigPublicChar> degrees = this.configPublicCharBiz.getAll("学历");
			List<ConfigPublicChar> years = this.configPublicCharBiz.getAll("教育年限");
			List<ConfigPublicChar> majors = this.configPublicCharBiz.getAll("专业");
			List<ConfigPublicChar> specility = this.configPublicCharBiz.getAll("特长");
			List<ConfigPublicChar> hobby = this.configPublicCharBiz.getAll("爱好");
			model.addAttribute("releases",releases);
			model.addAttribute("standards",standards);
			model.addAttribute("nationality",nationality);
			model.addAttribute("races",races);
			model.addAttribute("religions",religions);
			model.addAttribute("parties",parties);
			model.addAttribute("degrees",degrees);
			model.addAttribute("years",years);
			model.addAttribute("majors",majors);
			model.addAttribute("specility",specility);
			model.addAttribute("hobby",hobby);
			
			return "engage/resume/majorrelease_register";
		}else if("toAdd".equals(operate)){
			List<SalaryStandard> standards = this.salaryStandardBiz.getAllSalaryStandard();
			List<ConfigMajorKind> majorKinds = this.configMajorKindBiz.getAll();
			List<ConfigPublicChar> nationality = this.configPublicCharBiz.getAll("国籍");
			List<ConfigPublicChar> races = this.configPublicCharBiz.getAll("民族");
			List<ConfigPublicChar> religions = this.configPublicCharBiz.getAll("宗教信仰");
			List<ConfigPublicChar> parties = this.configPublicCharBiz.getAll("政治面貌");
			List<ConfigPublicChar> degrees = this.configPublicCharBiz.getAll("学历");
			List<ConfigPublicChar> years = this.configPublicCharBiz.getAll("教育年限");
			List<ConfigPublicChar> majors = this.configPublicCharBiz.getAll("专业");
			List<ConfigPublicChar> specility = this.configPublicCharBiz.getAll("特长");
			List<ConfigPublicChar> hobby = this.configPublicCharBiz.getAll("爱好");
			model.addAttribute("standards",standards);
			model.addAttribute("majorKinds",majorKinds);
			model.addAttribute("nationality",nationality);
			model.addAttribute("races",races);
			model.addAttribute("religions",religions);
			model.addAttribute("parties",parties);
			model.addAttribute("degrees",degrees);
			model.addAttribute("years",years);
			model.addAttribute("majors",majors);
			model.addAttribute("specility",specility);
			model.addAttribute("hobby",hobby);
			
			return "engage/resume/register";
		}else if("toSubmit".equals(operate)){
			resumes = resume;
			return "engage/resume/register_base_success";
		}else if("toUpLoadPhoto".equals(operate)){
			return "engage/resume/register_choose_picture";
		}else if("doUpLoadPhoto".equals(operate)){
			//上传
			String imgstr = "";
			// 上传
			Map<String, UploadFile> map = UploadFileUtil.uploadFile(request, resume.getImgUrl(), imageRootName);
			for (Entry<String, UploadFile> entry : map.entrySet()) {
				UploadFile uploadFile = entry.getValue();
				imgstr = uploadFile.getNewFileUrl();
			}
			resume.setHuman_picture(imgstr);
			resumes.setHuman_picture(resume.getHuman_picture());
			return "engage/resume/register_choose_attachment";
		}else if("toUpLoadAttach".equals(operate)){
			return "engage/resume/register_choose_attachment";
		}else if("doUpLoadAttach".equals(operate)){
			// 上传
			String pdfstr = "";
			// 上传
			Map<String, UploadFile> map = UploadFileUtil.uploadFile(request, resume.getPdfUrl(), pdfRootName);
			for (Entry<String, UploadFile> entry : map.entrySet()) {
				UploadFile uploadFile = entry.getValue();
				pdfstr = uploadFile.getNewFileUrl();
			}
			resume.setAttachment_name(pdfstr);
			resumes.setAttachment_name(resume.getAttachment_name());
			return "engage/resume/register_finish";
		}else if("doAdd".equals(operate)){
			resumes.setCheck_status(0);
			resumes.setInterview_status(0);
			this.resumeBiz.saveInfo(resumes);
			return "engage/resume/register_ok";
		}else if("locate".equals(operate)){
			
			List<ConfigMajorKind> list = this.configMajorKindBiz.getAll();
			
			model.addAttribute("list",list);
			if("check".equals(method)){
				return "engage/resume/check_locate";
			}else if("query".equals(method)){
				return "engage/resume/query_locate";
			}else if("interview".equals(method)){
				return "engage/interview/register_locate";
			}
		}else if("list".equals(operate)){
			logger.info("findResume called.....");
			Page page = null;// new 对象在下面
			int totalCount = this.resumeBiz.getCount();// 获取当前用户总记录条数			
			if (pageNow != null && pageNow != "") {// 防止出现空指针异常
				int pageNow1 = Integer.parseInt(pageNow);
				page = new Page(totalCount, pageNow1);// 这样写的好处，判断完成外面可以继续调用
			}
			page.setPageSize(10);
			resume.setPage(page);
			String major_kind_name = resume.getHuman_major_kind_name();
			if(major_kind_name != null  && !"".equals(major_kind_name)){
				major_kind_name = major_kind_name.substring(major_kind_name.lastIndexOf("/")+1);
			}			
			resume.setHuman_major_kind_name(major_kind_name);
			model.addAttribute("page",page);
			if("check".equals(method)){
				resume.setCheck_status(0);
				resume.setInterview_status(0);
				List<EngageResume> resumes = this.resumeBiz.getInfoByCondition(resume);
				model.addAttribute("list",resumes);
				return "engage/resume/check_list";
			}else if("query".equals(method)){
				resume.setCheck_status(1);
				resume.setInterview_status(0);
				List<EngageResume> resumes = this.resumeBiz.getInfoByCondition(resume);
				model.addAttribute("list",resumes);
				return "engage/resume/query_list";
			}else if("interview".equals(method)){
				resume.setCheck_status(1);
				resume.setInterview_status(0);
				List<EngageResume> resumes = this.resumeBiz.getInfoByCondition(resume);
				model.addAttribute("list",resumes);
				return "engage/interview/register_list";
			}
		}else if("toEdit".equals(operate)){
			Integer resumeid = Integer.parseInt("" + request.getParameter("id"));
			resume.setRes_id(resumeid);
			resume  = this.resumeBiz.getInfoById(resume);
			List<SalaryStandard> standards = this.salaryStandardBiz.getAllSalaryStandard();
			List<ConfigMajorKind> majorKinds = this.configMajorKindBiz.getAll();
			List<ConfigPublicChar> nationality = this.configPublicCharBiz.getAll("国籍");
			List<ConfigPublicChar> races = this.configPublicCharBiz.getAll("民族");
			List<ConfigPublicChar> religions = this.configPublicCharBiz.getAll("宗教信仰");
			List<ConfigPublicChar> parties = this.configPublicCharBiz.getAll("政治面貌");
			List<ConfigPublicChar> degrees = this.configPublicCharBiz.getAll("学历");
			List<ConfigPublicChar> years = this.configPublicCharBiz.getAll("教育年限");
			List<ConfigPublicChar> majors = this.configPublicCharBiz.getAll("专业");
			List<ConfigPublicChar> specility = this.configPublicCharBiz.getAll("特长");
			List<ConfigPublicChar> hobby = this.configPublicCharBiz.getAll("爱好");
			model.addAttribute("list",resume);
			model.addAttribute("standards",standards);
			model.addAttribute("majorKinds",majorKinds);
			model.addAttribute("nationality",nationality);
			model.addAttribute("races",races);
			model.addAttribute("religions",religions);
			model.addAttribute("parties",parties);
			model.addAttribute("degrees",degrees);
			model.addAttribute("years",years);
			model.addAttribute("majors",majors);
			model.addAttribute("specility",specility);
			model.addAttribute("hobby",hobby);
			
			return "engage/resume/check";
		}else if("doEdit".equals(operate)){
			Integer resumeid = Integer.parseInt("" + request.getParameter("id"));
			resume.setRes_id(resumeid);
			resume.setCheck_status(1);
			resume.setInterview_status(0);
			System.out.println(resume);
			this.resumeBiz.updateInfo(resume);
			return "engage/resume/check_ok_a";
		}else if("toCheck".equals(operate)){
			Integer resumeid = Integer.parseInt("" + request.getParameter("id"));
			resume.setRes_id(resumeid);
			resume  = this.resumeBiz.getInfoById(resume);
			model.addAttribute("list",resume);
			return "engage/resume/query";
		}else if("passList".equals(operate)){
			Integer passStatus = Integer.parseInt("" +request.getParameter("passStatus"));
			Page page = null;// new 对象在下面
			int totalCount = this.resumeBiz.getCount();// 获取当前用户总记录条数			
			if (pageNow != null && pageNow != "") {// 防止出现空指针异常
				int pageNow1 = Integer.parseInt(pageNow);
				page = new Page(totalCount, pageNow1);// 这样写的好处，判断完成外面可以继续调用
			}
			page.setPageSize(10);
			resume.setPage(page);
			model.addAttribute("page",page);
			if("register".equals(method)){
				resume.setPass_check_status(passStatus);
				List<EngageResume> resumes = this.resumeBiz.getPassInfoByCondition(resume);
				model.addAttribute("list",resumes);
				return "engage/pass/register_list";
			}else if("check".equals(method)){
				resume.setPass_check_status(passStatus);
				//System.out.println(passStatus);
				List<EngageResume> resumes = this.resumeBiz.getPassInfoByCondition(resume);
				model.addAttribute("list",resumes);
				return "engage/pass/check_list";
			}else if("query".equals(method)){
				resume.setPass_check_status(passStatus);
				List<EngageResume> resumes = this.resumeBiz.getPassInfoByCondition(resume);
				model.addAttribute("list",resumes);
				return "engage/pass/query_list";
			}
		}else if("topassApply".equals(operate)){
			Integer resumeid = Integer.parseInt("" + request.getParameter("id"));
			model.addAttribute("resumeid",resumeid);
			interview = new EngageInterview();
			interview.setResume_id(resumeid);
			resume.setRes_id(resumeid);
			EngageInterview list = this.interviewBiz.getInfoById(interview);
			EngageResume resumes = this.resumeBiz.getInfoById(resume);
			model.addAttribute("list",list);
			model.addAttribute("resumes",resumes);
			return "engage/pass/register";
		}else if("doCheck".equals(operate)){
			Integer resumeid = Integer.parseInt("" + request.getParameter("id"));
			resume.setRes_id(resumeid);
			resume.setPass_check_status(1);
			this.resumeBiz.updatepassstatus(resume);
			return "engage/pass/register_ok";
		}else if("topassEdit".equals(operate)){
			Integer resumeid = Integer.parseInt("" + request.getParameter("id"));
			model.addAttribute("resumeid",resumeid);
			interview = new EngageInterview();
			interview.setResume_id(resumeid);
			resume.setRes_id(resumeid);
			EngageInterview list = this.interviewBiz.getInfoById(interview);
			EngageResume resumes = this.resumeBiz.getInfoById(resume);
			model.addAttribute("list",list);
			model.addAttribute("resumes",resumes);
			return "engage/pass/check";
		}else if("topassQuery".equals(operate)){
			Integer resumeid = Integer.parseInt("" + request.getParameter("id"));
			model.addAttribute("resumeid",resumeid);
			interview = new EngageInterview();
			interview.setResume_id(resumeid);
			resume.setRes_id(resumeid);
			EngageInterview list = this.interviewBiz.getInfoById(interview);
			EngageResume resumes = this.resumeBiz.getInfoById(resume);
			model.addAttribute("list",list);
			model.addAttribute("resumes",resumes);
			return "engage/pass/query";
		}else if("doSubmit".equals(operate)){
			String results = resume.getPass_results();
			if("通过".equals(results)){
				
				resume.setRes_id(resume.getRes_id());
				resume.setPass_check_status(2);
				System.out.println(resume);
				this.resumeBiz.updatepassstatus(resume);
				this.resumeBiz.updatepass(resume);
				SendMail sendEmail=new SendMail();
				sendEmail.send_163("面试通知","恭喜你成为源辰公司的一员,请尽快到本公司进行档案登记", resume.getHuman_email());
				return "engage/pass/check_ok";
			}else if("不通过".equals(results)){
				resume.setRes_id(resume.getRes_id());
				this.resumeBiz.delInfo(resume);
				return "engage/pass/check_ok";
			}
		}
		return null;		
	}
}
