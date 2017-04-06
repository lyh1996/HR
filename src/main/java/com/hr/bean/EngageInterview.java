package com.hr.bean;

import java.io.Serializable;
import com.hr.web.utils.Page;

public class EngageInterview implements Serializable {
	
	private static final long serialVersionUID = -4949386107982917326L;
	
	private Integer ein_id;
     private String human_name;
     private Integer interview_amount;
     private Integer human_major_kind_id;
     private String human_major_kind_name;
     private Integer human_major_id;
     private String human_major_name;
     private String image_degree;
     private String native_language_degree;
     private String foreign_language_degree;
     private String response_speed_degree;
     private String EQ_degree;
     private String IQ_degree;
     private String multi_quality_degree;
     private String register;
     private String checker;
     private String registe_time;
     private String check_time;
     private Integer resume_id;
     private String results;
     private String interview_comment;
     private String check_comment;
     private Integer interview_status;
     private Integer check_status;
     private Page page;
     
     private String human_email;
     
     
     
	public String getHuman_email() {
		return human_email;
	}
	public void setHuman_email(String human_email) {
		this.human_email = human_email;
	}
	public Integer getEin_id() {
		return ein_id;
	}
	public void setEin_id(Integer ein_id) {
		this.ein_id = ein_id;
	}
	public String getHuman_name() {
		return human_name;
	}
	public void setHuman_name(String human_name) {
		this.human_name = human_name;
	}
	public Integer getInterview_amount() {
		return interview_amount;
	}
	public void setInterview_amount(Integer interview_amount) {
		this.interview_amount = interview_amount;
	}
	public Integer getHuman_major_kind_id() {
		return human_major_kind_id;
	}
	public void setHuman_major_kind_id(Integer human_major_kind_id) {
		this.human_major_kind_id = human_major_kind_id;
	}
	public String getHuman_major_kind_name() {
		return human_major_kind_name;
	}
	public void setHuman_major_kind_name(String human_major_kind_name) {
		this.human_major_kind_name = human_major_kind_name;
	}
	public Integer getHuman_major_id() {
		return human_major_id;
	}
	public void setHuman_major_id(Integer human_major_id) {
		this.human_major_id = human_major_id;
	}
	public String getHuman_major_name() {
		return human_major_name;
	}
	public void setHuman_major_name(String human_major_name) {
		this.human_major_name = human_major_name;
	}
	public String getImage_degree() {
		return image_degree;
	}
	public void setImage_degree(String image_degree) {
		this.image_degree = image_degree;
	}
	public String getNative_language_degree() {
		return native_language_degree;
	}
	public void setNative_language_degree(String native_language_degree) {
		this.native_language_degree = native_language_degree;
	}
	public String getForeign_language_degree() {
		return foreign_language_degree;
	}
	public void setForeign_language_degree(String foreign_language_degree) {
		this.foreign_language_degree = foreign_language_degree;
	}
	public String getResponse_speed_degree() {
		return response_speed_degree;
	}
	public void setResponse_speed_degree(String response_speed_degree) {
		this.response_speed_degree = response_speed_degree;
	}
	public String getEQ_degree() {
		return EQ_degree;
	}
	public void setEQ_degree(String eQ_degree) {
		EQ_degree = eQ_degree;
	}
	public String getIQ_degree() {
		return IQ_degree;
	}
	public void setIQ_degree(String iQ_degree) {
		IQ_degree = iQ_degree;
	}
	public String getMulti_quality_degree() {
		return multi_quality_degree;
	}
	public void setMulti_quality_degree(String multi_quality_degree) {
		this.multi_quality_degree = multi_quality_degree;
	}
	public String getRegister() {
		return register;
	}
	public void setRegister(String register) {
		this.register = register;
	}
	public String getChecker() {
		return checker;
	}
	public void setChecker(String checker) {
		this.checker = checker;
	}
	public String getRegiste_time() {
		return registe_time;
	}
	public void setRegiste_time(String registe_time) {
		this.registe_time = registe_time;
	}
	public String getCheck_time() {
		return check_time;
	}
	public void setCheck_time(String check_time) {
		this.check_time = check_time;
	}
	public Integer getResume_id() {
		return resume_id;
	}
	public void setResume_id(Integer resume_id) {
		this.resume_id = resume_id;
	}
	public String getResults() {
		return results;
	}
	public void setResults(String results) {
		this.results = results;
	}
	public String getInterview_comment() {
		return interview_comment;
	}
	public void setInterview_comment(String interview_comment) {
		this.interview_comment = interview_comment;
	}
	public String getCheck_comment() {
		return check_comment;
	}
	public void setCheck_comment(String check_comment) {
		this.check_comment = check_comment;
	}
	public Integer getInterview_status() {
		return interview_status;
	}
	public void setInterview_status(Integer interview_status) {
		this.interview_status = interview_status;
	}
	public Integer getCheck_status() {
		return check_status;
	}
	public void setCheck_status(Integer check_status) {
		this.check_status = check_status;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	@Override
	public String toString() {
		return "EngageInterview [ein_id=" + ein_id + ", human_name=" + human_name + ", interview_amount="
				+ interview_amount + ", human_major_kind_id=" + human_major_kind_id + ", human_major_kind_name="
				+ human_major_kind_name + ", human_major_id=" + human_major_id + ", human_major_name="
				+ human_major_name + ", image_degree=" + image_degree + ", native_language_degree="
				+ native_language_degree + ", foreign_language_degree=" + foreign_language_degree
				+ ", response_speed_degree=" + response_speed_degree + ", EQ_degree=" + EQ_degree + ", IQ_degree="
				+ IQ_degree + ", multi_quality_degree=" + multi_quality_degree + ", register=" + register + ", checker="
				+ checker + ", registe_time=" + registe_time + ", check_time=" + check_time + ", resume_id=" + resume_id
				+ ", results=" + results + ", interview_comment=" + interview_comment + ", check_comment="
				+ check_comment + ", interview_status=" + interview_status + ", check_status=" + check_status
				+ ", page=" + page + ", human_email=" + human_email + "]";
	}
	
 
     
}
