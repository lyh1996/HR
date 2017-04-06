package com.hr.web.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hr.bean.ConfigMajorKind;
import com.hr.bean.ConfigQuestionFirstKind;
import com.hr.bean.ConfigQuestionSecondKind;
import com.hr.bean.EngageAnswer;
import com.hr.bean.EngageAnswerDetails;
import com.hr.bean.EngageExam;
import com.hr.bean.EngageExamDetails;
import com.hr.bean.EngageInterview;
import com.hr.bean.EngageResume;
import com.hr.bean.EngageSubjects;
import com.hr.biz.ConfigMajorKindBiz;
import com.hr.biz.ConfigQuestionFirstKindBiz;
import com.hr.biz.ConfigQuestionSecondKindBiz;
import com.hr.biz.EngageAnswerBiz;
import com.hr.biz.EngageAnswerDetailsBiz;
import com.hr.biz.EngageExamBiz;
import com.hr.biz.EngageExamDetailsBiz;
import com.hr.biz.EngageInterviewBiz;
import com.hr.biz.EngageResumeBiz;
import com.hr.biz.EngageSubjectsBiz;
import com.hr.email.SendMail;

@Controller
public class EngageAnswerController {
	private static final Log logger = LogFactory.getLog(EngageAnswerController.class);
	private ConfigMajorKindBiz configMajorKindBiz;
	private EngageSubjectsBiz engageSubjectsBiz;
	private EngageExamBiz engageExamBiz;
	private EngageExamDetailsBiz engageExamDetailsBiz;
	private EngageAnswerBiz engageAnswerBiz;
	private EngageAnswerDetailsBiz engageAnswerDetailsBiz;
	
	private EngageResumeBiz resumeBiz;
	private EngageInterviewBiz interviewBiz;
	
	@Resource(name = "engageResumeBizImpl")
	public void setResumeBiz(EngageResumeBiz resumeBiz) {
		this.resumeBiz = resumeBiz;
	}
	
	@Resource(name = "engageInterviewBizImpl")
	public void setInterviewBiz(EngageInterviewBiz interviewBiz) {
		this.interviewBiz = interviewBiz;
	}
	 
	@Resource(name = "engageAnswerDetailsBizImpl")
	public void setEngageAnswerDetailsBiz(EngageAnswerDetailsBiz engageAnswerDetailsBiz) {
		this.engageAnswerDetailsBiz = engageAnswerDetailsBiz;
	}
	@Resource(name = "engageAnswerBizImpl")
	public void setEngageAnswerBiz(EngageAnswerBiz engageAnswerBiz) {
		this.engageAnswerBiz = engageAnswerBiz;
	}
	@Resource(name = "engageExamDetailsBizImpl")
	public void setEngageExamDetailsBiz(EngageExamDetailsBiz engageExamDetailsBiz) {
		this.engageExamDetailsBiz = engageExamDetailsBiz;
	}
	@Resource(name = "engageExamBizImpl")
	public void setEngageExamBiz(EngageExamBiz engageExamBiz) {
		this.engageExamBiz = engageExamBiz;
	}
	 
	
	@Resource(name = "engageSubjectsBizImpl")
	public void setEngageSubjectsBiz(EngageSubjectsBiz engageSubjectsBiz) {
		this.engageSubjectsBiz = engageSubjectsBiz;
	}
	
	@Resource(name = "configMajorKindBizImpl")
	public void setConfigMajorKindBiz(ConfigMajorKindBiz configMajorKindBiz) {
		this.configMajorKindBiz = configMajorKindBiz;
	}
	 
	// 档案设置
	@RequestMapping(value = "/engageAnswer.do")
	public String getengageexams(Model model, HttpServletRequest request, EngageAnswer eAnswer,EngageInterview interview ,EngageResume resume,@RequestParam(name = "subject_id", required = false) String[] subject_id
			,@RequestParam(name = "answer", required = false) String[] answer) {
		String operate = request.getParameter("operate");
		String pageNow=request.getParameter("pageNow");
		  if("toAnswerLogin".equals(operate)){//考生答题准备信息
			 List<ConfigMajorKind> list2 = this.configMajorKindBiz.getAll();
			 model.addAttribute("list2", list2);
			 return "engage/exam/answer_login";
		 }else if("toAnswer".equals(operate)){//前往答题
			 
			 //System.out.println(eAnswer);
			 List<List<EngageSubjects>> subjects=new ArrayList<List<EngageSubjects>>();
			 getinfo(eAnswer);
			 EngageExam exam=new EngageExam();//判断有没有试卷
			 exam.setMajor_id(eAnswer.getMajor_id());
			 exam.setMajor_kind_id(eAnswer.getMajor_kind_id());
			 exam=this.engageExamBiz.getInfoRand(exam);
			// 判断有没有该简历
			 resume.setHuman_name(eAnswer.getHuman_name());
			 resume.setHuman_idcard(eAnswer.getHuman_idcard());
			 resume=this.resumeBiz.searchResume(resume);
			 //System.out.println(resume);
			/* //判断是否答过题
			 EngageAnswer eAnswer2=this.engageAnswerBiz.getInfoByFilter(eAnswer).get(0);
			 if(eAnswer2!=null){
				 return "engage/exam/answer_failure2";
			 }*/
			
			   if(resume!=null){
				 EngageInterview sInterview=new EngageInterview();
				 sInterview.setResume_id(resume.getRes_id());
			  sInterview=this.interviewBiz.getInfoById(sInterview);
			  if(sInterview!=null){
				 // System.out.println(sInterview);
				  if(sInterview.getCheck_status()!=1||sInterview.getInterview_status()!=1||!"建议笔试".equals(sInterview.getResults())){
				  return "engage/exam/answer_failure";
				  }
			  }
			  if(sInterview==null){
				  return "engage/exam/answer_failure";
			  }
			 }else {
				 return "engage/exam/answer_failure";
			 }
			   if(exam==null){
				 return "engage/exam/answer_failure";
			 }
			   if(exam!=null&&resume!=null){
			 eAnswer.setExam_number(exam.getExam_number());
			 List<EngageExamDetails>details=this.engageExamDetailsBiz.getInfoById(exam.getExam_number());
			 int num=0;
			 for(EngageExamDetails details2:details){
				 num+=details2.getQuestion_amount();
				 EngageSubjects eSubjects=new EngageSubjects();
				 eSubjects.setFirst_kind_id(details2.getFirst_kind_id());
				 eSubjects.setSecond_kind_id(details2.getSecond_kind_id());
				 eSubjects.setSubjectCount(details2.getQuestion_amount());
				 subjects.add(this.engageSubjectsBiz.getInfoRand(eSubjects));
			 }
			 model.addAttribute("limitetime", exam.getLimite_time());
			 model.addAttribute("num", num);
			 model.addAttribute("list2", details);
			 model.addAttribute("list", eAnswer);
			 model.addAttribute("subjects", subjects);
			 return "engage/exam/answer";
			 }
		 }else if("doAnswerSuccess".equals(operate)){
			 int count=this.engageAnswerBiz.getCount();
			 String answer_number="A110"+count;
			 eAnswer.setAnswer_number(answer_number);
			 for(int i=0;i<subject_id.length;i++){
				 String subject_id1=subject_id[i];
				 String answer1=null;
				 //System.out.println(answer);
				 if(answer!=null&&!"".equals(answer)){
					 if(i>=answer.length){
						 answer1=null;
					 }else{
					 if(answer[i]!=null&&!"".equals(answer[i])){
					 answer1=answer[i];
					 }else{
						 answer1=null;
					 }
					 }
				 } 
				 EngageAnswerDetails details=new EngageAnswerDetails();
				 details.setSubject_id(Integer.parseInt(subject_id1));
				 details.setAnswer_number(eAnswer.getAnswer_number());
				 details.setAnswer(answer1);
				this.engageAnswerDetailsBiz.saveInfo(details);
				 //System.out.println(details);
			 }
			 eAnswer.setTotal_point(0.0);
			 resume.setHuman_name(eAnswer.getHuman_name());
			 resume.setHuman_idcard(eAnswer.getHuman_idcard());
			 resume=this.resumeBiz.searchResume(resume);
			 eAnswer.setResume_id(resume.getRes_id());
			 EngageInterview sInterview=new EngageInterview();
			 sInterview.setResume_id(resume.getRes_id());
		  sInterview=this.interviewBiz.getInfoById(sInterview);
		  eAnswer.setInterview_id(sInterview.getEin_id());
			 this.engageAnswerBiz.saveInfo(eAnswer);
			//System.out.println(eAnswer);
			 return "engage/exam/answer_success";
		 }else if("toReadLocate".equals(operate)){//考试阅卷信息填写
			 List<ConfigMajorKind> list2 = this.configMajorKindBiz.getAll();
			 model.addAttribute("list2", list2);
			 return "engage/exam/read_locate";
		 }else if("toReadList".equals(operate)){
			 getinfo(eAnswer);
			 List<EngageAnswer> list=this.engageAnswerBiz.getInfoByCondition(eAnswer);
			 model.addAttribute("list", list);
			 return "engage/exam/read_list";
		 }else if("doRead".equals(operate)){
			 String answer_number=request.getParameter("id");
			 List<EngageAnswerDetails> list=this.engageAnswerDetailsBiz.getInfoById(answer_number);
			 double  score=0.0;
			 for(EngageAnswerDetails details:list){
				 EngageSubjects subjects=this.engageSubjectsBiz.getInfoById(details.getSubject_id());
				 String correct_key=subjects.getCorrect_key();
				 String correct_answer=details.getAnswer();
				 if(correct_answer!=null&&!"".equals(correct_answer)){
				 if(correct_answer.equalsIgnoreCase(correct_key)){
					 score+=5;
				 }
				 }
			 }
			  EngageAnswer eAnswer2=new EngageAnswer();
			  eAnswer2.setAnswer_number(answer_number);
			  eAnswer2.setTotal_point(score);
			  this.engageAnswerBiz.updateInfo(eAnswer2);
			 return "engage/exam/read_success";
		 }else if("toFilter".equals(operate)){//筛选
			 
			 return "engage/exam/filter";
		 }else if("tofilterlist".equals(operate)){//赛选列表
			 List<EngageAnswer> list=this.engageAnswerBiz.getInfoByFilter(eAnswer);
			 for(EngageAnswer sAnswer:list){
					interview.setResume_id(sAnswer.getResume_id());
					EngageInterview engageInterview = this.interviewBiz.getInfoById(interview);
					sAnswer.setEngageInterview(engageInterview);
			 }
			 model.addAttribute("list", list);
			 return "engage/exam/filter_list";
		 }else if("toDetail".equals(operate)){//查看详情
			 String answer_number=request.getParameter("id");
			 EngageAnswer list=this.engageAnswerBiz.getInfoById(answer_number);
			 model.addAttribute("list", list);
			 
			 List<EngageAnswerDetails> details=this.engageAnswerDetailsBiz.getInfoById(answer_number);
			 for(EngageAnswerDetails details2:details){
				EngageSubjects eSubjects=  this.engageSubjectsBiz.getInfoById(details2.getSubject_id());
				 details2.seteSubjects(eSubjects);
			 }
			 model.addAttribute("list2", details);
			 return "engage/exam/filter_detail";
		 }else if("toFilterResult".equals(operate)){
			 Integer resumeid = Integer.parseInt("" + request.getParameter("id"));
				resume.setRes_id(resumeid);
				EngageResume resumes = this.resumeBiz.getInfoById(resume);
				model.addAttribute("resumes",resumes);
				interview.setResume_id(resumeid);
				EngageInterview list = this.interviewBiz.getInfoById(interview);
				model.addAttribute("list",list);
				List<EngageAnswer> eAnswers=this.engageAnswerBiz.getInfoByResumeId(resumeid);
				
				model.addAttribute("testCount", eAnswers.size());
				double score=0.0;
				for(EngageAnswer e:eAnswers){
					score+=e.getTotal_point();
				}
				model.addAttribute("score", score);
				return "engage/exam/filter_result";
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
					resume.setRegister(resume.getTest_checker());
					resume.setRegist_time(resume.getTest_check_time());
					resume.setPass_check_status(0);
					//resume.setPass_checkComment(interview.getCheck_comment());
					//System.out.println(resume);
					this.resumeBiz.updateinterviewTest(resume);
				}	
				//System.out.println(interview);
				//System.out.println(resume);
				//this.resumeBiz.updateinterviewTest(resume);
				this.interviewBiz.updateInfo(interview);
				
				return "engage/exam/filter_success";
				 
		 }
		
		return null;
	}
	
	public void getinfo(EngageAnswer exam){
		// 拆分
					String major_kind_name = exam.getMajor_kind_name();
					Integer major_kind_id = Integer
							.parseInt(major_kind_name.substring(0, major_kind_name.lastIndexOf("/")));
					major_kind_name = major_kind_name.substring(major_kind_name.lastIndexOf("/") + 1);
					exam.setMajor_kind_id(major_kind_id);
					exam.setMajor_kind_name(major_kind_name);
					 
					String major_name = exam.getMajor_name();
					Integer major_id = Integer
							.parseInt(major_name.substring(0, major_name.lastIndexOf("/")));
					major_name = major_name.substring(major_name.lastIndexOf("/") + 1);
					exam.setMajor_id(major_id);
					exam.setMajor_name(major_name);
	}
	 
}
