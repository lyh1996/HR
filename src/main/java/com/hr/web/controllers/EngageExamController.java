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
import com.hr.bean.EngageExam;
import com.hr.bean.EngageExamDetails;
import com.hr.bean.EngageSubjects;
import com.hr.biz.ConfigMajorKindBiz;
import com.hr.biz.ConfigQuestionFirstKindBiz;
import com.hr.biz.ConfigQuestionSecondKindBiz;
import com.hr.biz.EngageExamBiz;
import com.hr.biz.EngageExamDetailsBiz;
import com.hr.biz.EngageSubjectsBiz;

@Controller
public class EngageExamController {
	private static final Log logger = LogFactory.getLog(EngageExamController.class);
	private ConfigMajorKindBiz configMajorKindBiz;
	private EngageSubjectsBiz engageSubjectsBiz;
	private ConfigQuestionFirstKindBiz configQuestionFirstKindBiz;
	private ConfigQuestionSecondKindBiz configQuestionSecondKindBiz;
	private EngageExamBiz engageExamBiz;
	private EngageExamDetailsBiz engageExamDetailsBiz;
	 
	@Resource(name = "engageExamDetailsBizImpl")
	public void setEngageExamDetailsBiz(EngageExamDetailsBiz engageExamDetailsBiz) {
		this.engageExamDetailsBiz = engageExamDetailsBiz;
	}
	@Resource(name = "engageExamBizImpl")
	public void setEngageExamBiz(EngageExamBiz engageExamBiz) {
		this.engageExamBiz = engageExamBiz;
	}
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
	
	@Resource(name = "configMajorKindBizImpl")
	public void setConfigMajorKindBiz(ConfigMajorKindBiz configMajorKindBiz) {
		this.configMajorKindBiz = configMajorKindBiz;
	}
	 
	// 档案设置
	@RequestMapping(value = "/engageExam.do")
	public String getengageexams(Model model, HttpServletRequest request, EngageExam exam,@RequestParam(name = "first_kind_name", required = false) String[] first_kind_name,
			@RequestParam(name = "second_kind_name", required = false) String[] second_kind_name,@RequestParam(name = "question_amount", required = false) String[] question_amount) {
		String operate = request.getParameter("operate");
		String pageNow=request.getParameter("pageNow");
		 if("toRegisterList".equals(operate)){//进入总体列表
			 logger.info( "getengageexams......");
			 List<EngageExam> list=this.engageExamBiz.toExamList();
			 System.out.println(list);
			 model.addAttribute("list", list);
			 return "engage/exam/register_list";
		 }else if("toRegister".equals(operate)){//前往生成套题
			 List<ConfigQuestionSecondKind> fQuestionFirstKinds=this.configQuestionSecondKindBiz.getAllnfo();
			 List<ConfigMajorKind> list2 = this.configMajorKindBiz.getAll();
			 EngageSubjects engageSubjects=new EngageSubjects();
			 for(ConfigQuestionSecondKind s :fQuestionFirstKinds){
				 engageSubjects.setFirst_kind_name(s.getFirst_kind_name());
				 engageSubjects.setSecond_kind_name(s.getSecond_kind_name());
				// System.out.println(engageSubjects);
				 int examcount=this.engageSubjectsBiz.getExamCount(engageSubjects);
				 s.setExamCount(examcount);
			 }
			 model.addAttribute("list2", list2);
			 model.addAttribute("list", fQuestionFirstKinds);
			 return "engage/exam/register";
		 }else if("doAdd".equals(operate)){//套题生成
			 int count=this.engageExamBiz.getCount();
			 String exam_number="E110"+count;
			 exam.setExam_number(exam_number);
			 getinfo(exam);
			 for(int i=0;i<first_kind_name.length;i++){
				 String first_kind_name2=first_kind_name[i];
				 String second_kind_name2=second_kind_name[i];
				 String question_amount2=question_amount[i];
				 if(!"".equals(question_amount2)&&!"0".equals(question_amount2)&&question_amount2!=null){
					 EngageExamDetails eDetails =new EngageExamDetails();
					 getinfoExam(first_kind_name2,second_kind_name2,eDetails);
					// System.out.println(question_amount2+"a");
					 eDetails.setQuestion_amount(Integer.parseInt(question_amount2));
					 eDetails.setExam_number(exam_number);
					 this.engageExamDetailsBiz.saveInfo(eDetails);
				 }
			 }
			  this.engageExamBiz.saveInfo(exam);
			 return "engage/exam/register_success";
		 }else if("toAnswerLogin".equals(operate)){//考生答题
			 List<ConfigMajorKind> list2 = this.configMajorKindBiz.getAll();
			 
			 model.addAttribute("list2", list2);
			 return "engage/exam/answer_login";
			 
		 }
		
		return null;
	}
	
	public void getinfo(EngageExam exam){
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
	
	public void getinfoExam(String first_kind_name,String second_kind_name,EngageExamDetails eDetails){
		// 拆分一级试题
					Integer first_kind_id = Integer
							.parseInt(first_kind_name.substring(0, first_kind_name.lastIndexOf("/")));
					first_kind_name = first_kind_name.substring(first_kind_name.lastIndexOf("/") + 1);
					eDetails.setFirst_kind_id(first_kind_id);
					eDetails.setFirst_kind_name(first_kind_name);
					// 拆分二级试题
					Integer second_kind_id = Integer.parseInt(second_kind_name.substring(0, second_kind_name.lastIndexOf("/")));
					second_kind_name = second_kind_name.substring(second_kind_name.lastIndexOf("/") + 1);
					eDetails.setSecond_kind_id(second_kind_id);
					eDetails.setSecond_kind_name(second_kind_name);
	}
}
