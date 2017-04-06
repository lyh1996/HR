package com.hr.bean;

import java.io.Serializable;

public class EngageAnswer implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2619038834996046194L;
	
	private Integer ans_id ;
	private String answer_number ;
	private String exam_number ;
	private Integer resume_id ;
	private Integer interview_id ;
	private String human_name ;
	private String human_idcard ;
	private Integer major_kind_id ;
	private String major_kind_name;
	private Integer major_id ;
	private String major_name ;
	private String test_time;
	private String use_time ;
	private Double total_point ;
	
	private String start_time;
	private String end_time;
	
	private EngageInterview engageInterview;
	public EngageInterview getEngageInterview() {
		return engageInterview;
	}
	public void setEngageInterview(EngageInterview engageInterview) {
		this.engageInterview = engageInterview;
	}
	
	
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public Integer getAns_id() {
		return ans_id;
	}
	public void setAns_id(Integer ans_id) {
		this.ans_id = ans_id;
	}
	public String getAnswer_number() {
		return answer_number;
	}
	public void setAnswer_number(String answer_number) {
		this.answer_number = answer_number;
	}
	public String getExam_number() {
		return exam_number;
	}
	public void setExam_number(String exam_number) {
		this.exam_number = exam_number;
	}
	public Integer getResume_id() {
		return resume_id;
	}
	public void setResume_id(Integer resume_id) {
		this.resume_id = resume_id;
	}
	public Integer getInterview_id() {
		return interview_id;
	}
	public void setInterview_id(Integer interview_id) {
		this.interview_id = interview_id;
	}
	public String getHuman_name() {
		return human_name;
	}
	public void setHuman_name(String human_name) {
		this.human_name = human_name;
	}
	public String getHuman_idcard() {
		return human_idcard;
	}
	public void setHuman_idcard(String human_idcard) {
		this.human_idcard = human_idcard;
	}
	public Integer getMajor_kind_id() {
		return major_kind_id;
	}
	public void setMajor_kind_id(Integer major_kind_id) {
		this.major_kind_id = major_kind_id;
	}
	public String getMajor_kind_name() {
		return major_kind_name;
	}
	public void setMajor_kind_name(String major_kind_name) {
		this.major_kind_name = major_kind_name;
	}
	public Integer getMajor_id() {
		return major_id;
	}
	public void setMajor_id(Integer major_id) {
		this.major_id = major_id;
	}
	public String getMajor_name() {
		return major_name;
	}
	public void setMajor_name(String major_name) {
		this.major_name = major_name;
	}
	 
	public String getTest_time() {
		return test_time;
	}
	public void setTest_time(String test_time) {
		this.test_time = test_time;
	}
	public String getUse_time() {
		return use_time;
	}
	public void setUse_time(String use_time) {
		this.use_time = use_time;
	}
	public Double getTotal_point() {
		return total_point;
	}
	public void setTotal_point(Double total_point) {
		this.total_point = total_point;
	}
	@Override
	public String toString() {
		return "EngageAnswer [ans_id=" + ans_id + ", answer_number=" + answer_number + ", exam_number=" + exam_number
				+ ", resume_id=" + resume_id + ", interview_id=" + interview_id + ", human_name=" + human_name
				+ ", human_idcard=" + human_idcard + ", major_kind_id=" + major_kind_id + ", major_kind_name="
				+ major_kind_name + ", major_id=" + major_id + ", major_name=" + major_name + ", test_time=" + test_time
				+ ", use_time=" + use_time + ", total_point=" + total_point + ", start_time=" + start_time
				+ ", end_time=" + end_time + "]";
	}
	 
	

}
