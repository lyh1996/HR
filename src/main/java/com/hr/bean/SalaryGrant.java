package com.hr.bean;

import java.io.Serializable;

import com.hr.web.utils.Page;

public class SalaryGrant implements Serializable{//薪资发放登记
			/**
	 * 
	 */
	private static final long serialVersionUID = -6189540567851577950L;
			private Integer  sgr_id ;
			private String salary_grant_id ;
			private Integer first_kind_id ;
			private String first_kind_name;
			private Integer second_kind_id;
			private String second_kind_name ;
			private Integer third_kind_id;
			private String third_kind_name ;
			private Integer human_amount;
			private Double salary_standard_sum;
			private Double salary_paid_sum ;
			private String register ;
			private String regist_time ;
			private String checker;
			private String check_time ;
			private Integer  check_status ;
			private Page page;
			private String startTime;
			private String endTime;
			
			
			public String getStartTime() {
				return startTime;
			}
			public void setStartTime(String startTime) {
				this.startTime = startTime;
			}
			public String getEndTime() {
				return endTime;
			}
			public void setEndTime(String endTime) {
				this.endTime = endTime;
			}
			//总数
			private Integer totalCount;
			private Double totalstandardsum;//标准总额
			private Double totalpaysum;//实发总额
			
			
			public Integer getTotalCount() {
				return totalCount;
			}
			public void setTotalCount(Integer totalCount) {
				this.totalCount = totalCount;
			}
			public Double getTotalstandardsum() {
				return totalstandardsum;
			}
			public void setTotalstandardsum(Double totalstandardsum) {
				this.totalstandardsum = totalstandardsum;
			}
			public Double getTotalpaysum() {
				return totalpaysum;
			}
			public void setTotalpaysum(Double totalpaysum) {
				this.totalpaysum = totalpaysum;
			}
			public Integer getSgr_id() {
				return sgr_id;
			}
			public void setSgr_id(Integer sgr_id) {
				this.sgr_id = sgr_id;
			}
			public String  getSalary_grant_id() {
				return salary_grant_id;
			}
			public void setSalary_grant_id(String salary_grant_id) {
				this.salary_grant_id = salary_grant_id;
			}
			
			public Integer getFirst_kind_id() {
				return first_kind_id;
			}
			public void setFirst_kind_id(Integer first_kind_id) {
				this.first_kind_id = first_kind_id;
			}
			public String getFirst_kind_name() {
				return first_kind_name;
			}
			public void setFirst_kind_name(String first_kind_name) {
				this.first_kind_name = first_kind_name;
			}
			public Integer getSecond_kind_id() {
				return second_kind_id;
			}
			public void setSecond_kind_id(Integer second_kind_id) {
				this.second_kind_id = second_kind_id;
			}
			public String getSecond_kind_name() {
				return second_kind_name;
			}
			public void setSecond_kind_name(String second_kind_name) {
				this.second_kind_name = second_kind_name;
			}
			public Integer getThird_kind_id() {
				return third_kind_id;
			}
			public void setThird_kind_id(Integer third_kind_id) {
				this.third_kind_id = third_kind_id;
			}
			public String getThird_kind_name() {
				return third_kind_name;
			}
			public void setThird_kind_name(String third_kind_name) {
				this.third_kind_name = third_kind_name;
			}
			public Integer getHuman_amount() {
				return human_amount;
			}
			public void setHuman_amount(Integer human_amount) {
				this.human_amount = human_amount;
			}
			public Double getSalary_standard_sum() {
				return salary_standard_sum;
			}
			public void setSalary_standard_sum(Double salary_standard_sum) {
				this.salary_standard_sum = salary_standard_sum;
			}
			public Double getSalary_paid_sum() {
				return salary_paid_sum;
			}
			public void setSalary_paid_sum(Double salary_paid_sum) {
				this.salary_paid_sum = salary_paid_sum;
			}
			public String getRegister() {
				return register;
			}
			public void setRegister(String register) {
				this.register = register;
			}
			public String getRegist_time() {
				return regist_time;
			}
			public void setRegist_time(String regist_time) {
				this.regist_time = regist_time;
			}
			public String getChecker() {
				return checker;
			}
			public void setChecker(String checker) {
				this.checker = checker;
			}
			public String getCheck_time() {
				return check_time;
			}
			public void setCheck_time(String check_time) {
				this.check_time = check_time;
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
				return "SalaryGrant [sgr_id=" + sgr_id + ", salary_grant_id=" + salary_grant_id + ", first_kind_id="
						+ first_kind_id + ", first_kind_name=" + first_kind_name + ", second_kind_id=" + second_kind_id
						+ ", second_kind_name=" + second_kind_name + ", third_kind_id=" + third_kind_id
						+ ", third_kind_name=" + third_kind_name + ", human_amount=" + human_amount
						+ ", salary_standard_sum=" + salary_standard_sum + ", salary_paid_sum=" + salary_paid_sum
						+ ", register=" + register + ", regist_time=" + regist_time + ", checker=" + checker
						+ ", check_time=" + check_time + ", check_status=" + check_status + ", page=" + page
						+ ", startTime=" + startTime + ", endTime=" + endTime + ", totalCount=" + totalCount
						+ ", totalstandardsum=" + totalstandardsum + ", totalpaysum=" + totalpaysum + "]";
			}
			 
			
			
			

}
