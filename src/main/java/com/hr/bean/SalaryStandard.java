package com.hr.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
		//薪酬标准基本信息表
public class SalaryStandard implements Serializable{



	private static final long serialVersionUID = -1187055712661569895L;
	private Integer ssd_id;              //主键，自动增长列 
	private String standard_id;			//薪酬标准单编号 
	private String standard_name;		//薪酬标准单名称  
	private String designer;			//制定者名字 
	private String register;			//登记人 
	private String checker;				//复核人
	private String changer;				//变更人  
	private String regist_time;			//登记时间
	private String check_time;			//复核时间 
	private String change_time;			//变更时间
	private Double salary_sum;			//薪酬总额
	private Integer check_status;		//是否经过复核   
	private Integer change_status;		//更改状态 
	private String check_comment;		//复核意见 
	private String remark;			//备注
	private String time_first;
	private String time_second;
	
	
	@Override
	public String toString() {
		return "SalaryStandard [ssd_id=" + ssd_id + ", standard_id=" + standard_id + ", standard_name=" + standard_name
				+ ", designer=" + designer + ", register=" + register + ", checker=" + checker + ", changer=" + changer
				+ ", regist_time=" + regist_time + ", check_time=" + check_time + ", change_time=" + change_time
				+ ", salary_sum=" + salary_sum + ", check_status=" + check_status + ", change_status=" + change_status
				+ ", check_comment=" + check_comment + ", remark=" + remark + ", tiem_first=" + time_first
				+ ", time_second=" + time_second + "]";
	}


		public void setTime_first(String time_first) {
			this.time_first = time_first;
		}


		public String getTime_second() {
			return time_second;
		}
		public void setTime_second(String time_second) {
			this.time_second = time_second;
		}
		public String getTime_first() {
			return time_first;
		}
		public Integer getSsd_id() {
			return ssd_id;
		}
		public void setSsd_id(Integer ssd_id) {
			this.ssd_id = ssd_id;
		}
		public String getStandard_id() {
			return standard_id;
		}
		public void setStandard_id(String standard_id) {
			this.standard_id = standard_id;
		}
		public String getStandard_name() {
			return standard_name;
		}
		public void setStandard_name(String standard_name) {
			this.standard_name = standard_name;
		}
		public String getDesigner() {
			return designer;
		}
		public void setDesigner(String designer) {
			this.designer = designer;
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
		public String getChanger() {
			return changer;
		}
		public void setChanger(String changer) {
			this.changer = changer;
		}
		public String getRegist_time() {
			return regist_time;
		}
		public void setRegist_time(String regist_time) {
			this.regist_time = regist_time;
		}
		public String getCheck_time() {
			return check_time;
		}
		public void setCheck_time(String check_time) {
			this.check_time = check_time;
		}
		public String getChange_time() {
			return change_time;
		}
		public void setChange_time(String change_time) {
			this.change_time = change_time;
		}
		public Double getSalary_sum() {
			return salary_sum;
		}
		public void setSalary_sum(Double salary_sum) {
			this.salary_sum = salary_sum;
		}
		public Integer getCheck_status() {
			return check_status;
		}
		public void setCheck_status(Integer check_status) {
			this.check_status = check_status;
		}
		public Integer getChange_status() {
			return change_status;
		}
		public void setChange_status(Integer change_status) {
			this.change_status = change_status;
		}
		public String getCheck_comment() {
			return check_comment;
		}
		public void setCheck_comment(String check_comment) {
			this.check_comment = check_comment;
		}
		public String getRemark() {
			return remark;
		}
		public void setRemark(String remark) {
			this.remark = remark;
		}
}	