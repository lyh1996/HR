package com.hr.bean;

import java.io.Serializable;
import java.util.Arrays;

public class EngageAnswerDetails implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3568450534962555302L;
	
	private Integer and_id ;
	private String answer_number ;
	private Integer subject_id ;
	private String answer;
	
	private EngageSubjects eSubjects;

	
	
	
	
	
	public EngageSubjects geteSubjects() {
		return eSubjects;
	}
	public void seteSubjects(EngageSubjects eSubjects) {
		this.eSubjects = eSubjects;
	}
	public Integer getAnd_id() {
		return and_id;
	}
	public void setAnd_id(Integer and_id) {
		this.and_id = and_id;
	}
	public String getAnswer_number() {
		return answer_number;
	}
	public void setAnswer_number(String answer_number) {
		this.answer_number = answer_number;
	}
	public Integer getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(Integer subject_id) {
		this.subject_id = subject_id;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "EngageAnswerDetails [and_id=" + and_id + ", answer_number=" + answer_number + ", subject_id="
				+ subject_id + ", answer=" + answer + ", eSubjects=" + eSubjects + "]";
	}
	 
	 
 
	
	

}
