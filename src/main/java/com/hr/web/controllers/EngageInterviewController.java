package com.hr.web.controllers;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hr.bean.EngageInterview;
import com.hr.bean.EngageResume;
import com.hr.biz.EngageInterviewBiz;
import com.hr.biz.EngageResumeBiz;
import com.hr.email.SendMail;
import com.hr.web.utils.Page;

@Controller
public class EngageInterviewController {
	private static final Log logger = LogFactory.getLog(EngageInterviewController.class);
	
	private EngageResumeBiz resumeBiz;
	private EngageInterviewBiz interviewBiz;
	private EngageResume resume;
	
	@Resource(name = "engageResumeBizImpl")
	public void setResumeBiz(EngageResumeBiz resumeBiz) {
		this.resumeBiz = resumeBiz;
	}
	
	@Resource(name = "engageInterviewBizImpl")
	public void setInterviewBiz(EngageInterviewBiz interviewBiz) {
		this.interviewBiz = interviewBiz;
	}

	//面试管理
	@RequestMapping(value = "/engageinterview.do")
	public String getinterview(Model model, HttpServletRequest request,EngageInterview interview){
		String operate = request.getParameter("operate");
		String pageNow = request.getParameter("pageNow");
		if("toApply".equals(operate)){
			Integer resumeid = Integer.parseInt("" + request.getParameter("id"));
			resume = new EngageResume();
			resume.setRes_id(resumeid);
			model.addAttribute("resumeid",resumeid);
			EngageResume resumes = this.resumeBiz.getInfoById(resume);
			model.addAttribute("resumes",resumes);
			interview.setResume_id(resumeid);
			interview = this.interviewBiz.getInfoById(interview);
			if(interview==null){
				model.addAttribute("interviewCount",1);
			}else{
				model.addAttribute("interviewCount",interview.getInterview_amount()+1);
			}
			
			 
			return "engage/interview/register"; 
		}else if("doAdd".equals(operate)){
			Integer resume_id = Integer.parseInt("" + request.getParameter("id"));
			model.addAttribute("resume_id",resume_id);
			interview.setResume_id(resume_id);
			interview.setCheck_status(0);
			interview.setInterview_status(1);
			resume.setRes_id(resume_id);
			resume.setInterview_status(interview.getInterview_status());
			this.resumeBiz.updatestatus(resume);
			this.interviewBiz.saveInfo(interview);
			return "engage/interview/register_ok";
		}else if("list".equals(operate)){
			logger.info("findResume called.....");
			Page page = null;// new 对象在下面
			int totalCount = this.interviewBiz.getCount();// 获取当前用户总记录条数			
			if (pageNow != null && pageNow != "") {// 防止出现空指针异常
				int pageNow1 = Integer.parseInt(pageNow);
				page = new Page(totalCount, pageNow1);// 这样写的好处，判断完成外面可以继续调用
			}
			page.setPageSize(10);
			interview.setPage(page);
			interview.setInterview_status(1);
			interview.setCheck_status(0);
			model.addAttribute("page",page);
			List<EngageInterview> list = this.interviewBiz.getAll(interview);
			model.addAttribute("list",list);
			return "engage/interview/check_list";
		}else if("toEdit".equals(operate)){
			Integer resumeid = Integer.parseInt("" + request.getParameter("id"));
			resume = new EngageResume();
			resume.setRes_id(resumeid);
			model.addAttribute("resumeid",resumeid);
			EngageResume resumes = this.resumeBiz.getInfoById(resume);
			model.addAttribute("resumes",resumes);
			model.addAttribute("resumeid",resumeid);
			interview.setResume_id(resumeid);
			EngageInterview list = this.interviewBiz.getInfoById(interview);
			model.addAttribute("list",list);
			return "engage/interview/check";
		}else if("doCheck".equals(operate)){
			Integer resumeid = Integer.parseInt("" + request.getParameter("id"));
			interview.setResume_id(resumeid);
			model.addAttribute("resumeid",resumeid);
			String results = interview.getResults();
			if("删除简历".equals(results)){				
				return "engage/interview/delete_confirm";
			}
			if("建议笔试".equals(results)){
				interview.setInterview_amount(interview.getInterview_amount());
				interview.setInterview_status(1);
				interview.setCheck_status(1);
				//System.out.println(interview);
				//System.out.println(resume);
				SendMail sendEmail=new SendMail();
				sendEmail.send_163("面试通知"," 请尽快到本公司主页进行笔试",interview.getHuman_email());
			}else if("建议录用".equals(results)){
				interview.setInterview_amount(interview.getInterview_amount());
				interview.setInterview_status(1);
				interview.setCheck_status(1);
				resume.setRes_id(resumeid);
				resume.setRegister(interview.getChecker());
				resume.setRegist_time(interview.getCheck_time());
				resume.setPass_check_status(0);
				resume.setPass_checkComment(interview.getCheck_comment());
				//System.out.println(resume);
				this.resumeBiz.updateinterview(resume);
			}	
			
			this.interviewBiz.updateInfo(interview);
			
			return "engage/interview/check_ok";
			
		}else if("doDelete".equals(operate)){
			Integer resumeid = Integer.parseInt("" + request.getParameter("id"));
			//model.addAttribute("resumeid",resumeid);
			//System.out.println(resumeid);
			resume=new EngageResume();
			resume.setRes_id(resumeid);
			interview.setResume_id(resumeid);
			this.resumeBiz.delInfo(resume);
			this.interviewBiz.delInfo(interview);
			return "engage/interview/delete_ok";
		}
		return null;		
	}
}
