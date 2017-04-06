package com.hr.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.hr.web.utils.Page;

public class HumanFile implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7950917170991303042L;
	private Integer huf_id;
	private Integer human_id;
	private Integer first_kind_id;
	private String first_kind_name;
	private Integer second_kind_id;
	private String second_kind_name;
	private Integer third_kind_id;
	private String third_kind_name;
	private String human_name;
	private String human_address;
	private String human_postcode;
	private String human_pro_designation;
	private Integer human_major_kind_id;
	private String human_major_kind_name;
	private Integer human_major_id;
	private String human_major_name;
	private String human_telephone;
	private String human_mobilephone;
	private String human_bank;
	private String human_account;
	private String human_qq;
	private String humanEmail;
	private String human_email;
	private String human_hobby;
	private String human_speciality;
	private String human_sex;
	private String human_religion;
	private String human_party;
	private String human_nationality;
	private String human_race;
	private String human_birthday;
	private String human_birthplace;
	private Integer human_age;
	private String human_educated_degree;
	private Integer human_educated_years;
	private String human_educated_major;
	private String human_society_security_id;
	private String human_id_card;
	private String remark;
	private String salary_standard_id;
	private String salary_standard_name;
	private Double salary_sum;
	private Double demand_salaray_sum;
	private Double paid_salary_sum;
	private Integer major_change_amount;
	private Integer bonus_amount;
	private Integer training_amount;
	private Integer file_chang_amount;
	private String human_histroy_records;
	private String human_family_membership;
	private String human_picture;
	private String attachment_name;
	private Integer check_status;
	private String register;
	private String checker;
	private String changer;
	private String regist_time;
	private String check_time;
	private String change_time;
	private String lastly_change_time;
	private String delete_time;
	private String recovery_time;
	private Integer human_file_status;
	private List<MultipartFile> imgUrl;// 对应界面的内容
	private List<MultipartFile> pdfUrl;// 对应界面的内容

	// 用于报表
	private String primary_key_table;
	private String primary_key;

	public String getPrimary_key_table() {
		return primary_key_table;
	}

	public void setPrimary_key_table(String primary_key_table) {
		this.primary_key_table = primary_key_table;
	}

	public String getPrimary_key() {
		return primary_key;
	}

	public void setPrimary_key(String primary_key) {
		this.primary_key = primary_key;
	}

	private String startTime;
	private String endTime;

	private Integer humanCount;
	private Double salarySum;

	public Integer getHumanCount() {
		return humanCount;
	}

	public void setHumanCount(Integer humanCount) {
		this.humanCount = humanCount;
	}

	public Double getSalarySum() {
		return salarySum;
	}

	public void setSalarySum(Double salarySum) {
		this.salarySum = salarySum;
	}

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

	private Page page;

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public List<MultipartFile> getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(List<MultipartFile> imgUrl) {
		this.imgUrl = imgUrl;
	}

	public List<MultipartFile> getPdfUrl() {
		return pdfUrl;
	}

	public void setPdfUrl(List<MultipartFile> pdfUrl) {
		this.pdfUrl = pdfUrl;
	}

	public Integer getHuf_id() {
		return huf_id;
	}

	public void setHuf_id(Integer huf_id) {
		this.huf_id = huf_id;
	}

	public Integer getHuman_id() {
		return human_id;
	}

	public void setHuman_id(Integer human_id) {
		this.human_id = human_id;
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

	public String getHuman_name() {
		return human_name;
	}

	public void setHuman_name(String human_name) {
		this.human_name = human_name;
	}

	public String getHuman_address() {
		return human_address;
	}

	public void setHuman_address(String human_address) {
		this.human_address = human_address;
	}

	public String getHuman_postcode() {
		return human_postcode;
	}

	public void setHuman_postcode(String human_postcode) {
		this.human_postcode = human_postcode;
	}

	public String getHuman_pro_designation() {
		return human_pro_designation;
	}

	public void setHuman_pro_designation(String human_pro_designation) {
		this.human_pro_designation = human_pro_designation;
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

	public String getHuman_telephone() {
		return human_telephone;
	}

	public void setHuman_telephone(String human_telephone) {
		this.human_telephone = human_telephone;
	}

	public String getHuman_mobilephone() {
		return human_mobilephone;
	}

	public void setHuman_mobilephone(String human_mobilephone) {
		this.human_mobilephone = human_mobilephone;
	}

	public String getHuman_bank() {
		return human_bank;
	}

	public void setHuman_bank(String human_bank) {
		this.human_bank = human_bank;
	}

	public String getHuman_account() {
		return human_account;
	}

	public void setHuman_account(String human_account) {
		this.human_account = human_account;
	}

	public String getHuman_qq() {
		return human_qq;
	}

	public void setHuman_qq(String human_qq) {
		this.human_qq = human_qq;
	}

	public String getHumanEmail() {
		return humanEmail;
	}

	public void setHumanEmail(String humanEmail) {
		this.humanEmail = humanEmail;
	}

	public String getHuman_email() {
		return human_email;
	}

	public void setHuman_email(String human_email) {
		this.human_email = human_email;
	}

	public String getHuman_hobby() {
		return human_hobby;
	}

	public void setHuman_hobby(String human_hobby) {
		this.human_hobby = human_hobby;
	}

	public String getHuman_speciality() {
		return human_speciality;
	}

	public void setHuman_speciality(String human_speciality) {
		this.human_speciality = human_speciality;
	}

	public String getHuman_sex() {
		return human_sex;
	}

	public void setHuman_sex(String human_sex) {
		this.human_sex = human_sex;
	}

	public String getHuman_religion() {
		return human_religion;
	}

	public void setHuman_religion(String human_religion) {
		this.human_religion = human_religion;
	}

	public String getHuman_party() {
		return human_party;
	}

	public void setHuman_party(String human_party) {
		this.human_party = human_party;
	}

	public String getHuman_nationality() {
		return human_nationality;
	}

	public void setHuman_nationality(String human_nationality) {
		this.human_nationality = human_nationality;
	}

	public String getHuman_race() {
		return human_race;
	}

	public void setHuman_race(String human_race) {
		this.human_race = human_race;
	}

	public String getHuman_birthday() {
		return human_birthday;
	}

	public void setHuman_birthday(String human_birthday) {
		this.human_birthday = human_birthday;
	}

	public String getHuman_birthplace() {
		return human_birthplace;
	}

	public void setHuman_birthplace(String human_birthplace) {
		this.human_birthplace = human_birthplace;
	}

	public Integer getHuman_age() {
		return human_age;
	}

	public void setHuman_age(Integer human_age) {
		this.human_age = human_age;
	}

	public String getHuman_educated_degree() {
		return human_educated_degree;
	}

	public void setHuman_educated_degree(String human_educated_degree) {
		this.human_educated_degree = human_educated_degree;
	}

	public Integer getHuman_educated_years() {
		return human_educated_years;
	}

	public void setHuman_educated_years(Integer human_educated_years) {
		this.human_educated_years = human_educated_years;
	}

	public String getHuman_educated_major() {
		return human_educated_major;
	}

	public void setHuman_educated_major(String human_educated_major) {
		this.human_educated_major = human_educated_major;
	}

	public String getHuman_society_security_id() {
		return human_society_security_id;
	}

	public void setHuman_society_security_id(String human_society_security_id) {
		this.human_society_security_id = human_society_security_id;
	}

	public String getHuman_id_card() {
		return human_id_card;
	}

	public void setHuman_id_card(String human_id_card) {
		this.human_id_card = human_id_card;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getSalary_standard_id() {
		return salary_standard_id;
	}

	public void setSalary_standard_id(String salary_standard_id) {
		this.salary_standard_id = salary_standard_id;
	}

	public String getSalary_standard_name() {
		return salary_standard_name;
	}

	public void setSalary_standard_name(String salary_standard_name) {
		this.salary_standard_name = salary_standard_name;
	}

	public Double getSalary_sum() {
		return salary_sum;
	}

	public void setSalary_sum(Double salary_sum) {
		this.salary_sum = salary_sum;
	}

	public Double getDemand_salaray_sum() {
		return demand_salaray_sum;
	}

	public void setDemand_salaray_sum(Double demand_salaray_sum) {
		this.demand_salaray_sum = demand_salaray_sum;
	}

	public Double getPaid_salary_sum() {
		return paid_salary_sum;
	}

	public void setPaid_salary_sum(Double paid_salary_sum) {
		this.paid_salary_sum = paid_salary_sum;
	}

	public Integer getMajor_change_amount() {
		return major_change_amount;
	}

	public void setMajor_change_amount(Integer major_change_amount) {
		this.major_change_amount = major_change_amount;
	}

	public Integer getBonus_amount() {
		return bonus_amount;
	}

	public void setBonus_amount(Integer bonus_amount) {
		this.bonus_amount = bonus_amount;
	}

	public Integer getTraining_amount() {
		return training_amount;
	}

	public void setTraining_amount(Integer training_amount) {
		this.training_amount = training_amount;
	}

	public Integer getFile_chang_amount() {
		return file_chang_amount;
	}

	public void setFile_chang_amount(Integer file_chang_amount) {
		this.file_chang_amount = file_chang_amount;
	}

	public String getHuman_histroy_records() {
		return human_histroy_records;
	}

	public void setHuman_histroy_records(String human_histroy_records) {
		this.human_histroy_records = human_histroy_records;
	}

	public String getHuman_family_membership() {
		return human_family_membership;
	}

	public void setHuman_family_membership(String human_family_membership) {
		this.human_family_membership = human_family_membership;
	}

	public String getHuman_picture() {
		return human_picture;
	}

	public void setHuman_picture(String human_picture) {
		this.human_picture = human_picture;
	}

	public String getAttachment_name() {
		return attachment_name;
	}

	public void setAttachment_name(String attachment_name) {
		this.attachment_name = attachment_name;
	}

	public Integer getCheck_status() {
		return check_status;
	}

	public void setCheck_status(Integer check_status) {
		this.check_status = check_status;
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

	public String getLastly_change_time() {
		return lastly_change_time;
	}

	public void setLastly_change_time(String lastly_change_time) {
		this.lastly_change_time = lastly_change_time;
	}

	public String getDelete_time() {
		return delete_time;
	}

	public void setDelete_time(String delete_time) {
		this.delete_time = delete_time;
	}

	public String getRecovery_time() {
		return recovery_time;
	}

	public void setRecovery_time(String recovery_time) {
		this.recovery_time = recovery_time;
	}

	public Integer getHuman_file_status() {
		return human_file_status;
	}

	public void setHuman_file_status(Integer human_file_status) {
		this.human_file_status = human_file_status;
	}

	@Override
	public String toString() {
		return "HumanFile [huf_id=" + huf_id + ", human_id=" + human_id + ", first_kind_id=" + first_kind_id
				+ ", first_kind_name=" + first_kind_name + ", second_kind_id=" + second_kind_id + ", second_kind_name="
				+ second_kind_name + ", third_kind_id=" + third_kind_id + ", third_kind_name=" + third_kind_name
				+ ", human_name=" + human_name + ", human_address=" + human_address + ", human_postcode="
				+ human_postcode + ", human_pro_designation=" + human_pro_designation + ", human_major_kind_id="
				+ human_major_kind_id + ", human_major_kind_name=" + human_major_kind_name + ", human_major_id="
				+ human_major_id + ", human_major_name=" + human_major_name + ", human_telephone=" + human_telephone
				+ ", human_mobilephone=" + human_mobilephone + ", human_bank=" + human_bank + ", human_account="
				+ human_account + ", human_qq=" + human_qq + ", humanEmail=" + humanEmail + ", human_email="
				+ human_email + ", human_hobby=" + human_hobby + ", human_speciality=" + human_speciality
				+ ", human_sex=" + human_sex + ", human_religion=" + human_religion + ", human_party=" + human_party
				+ ", human_nationality=" + human_nationality + ", human_race=" + human_race + ", human_birthday="
				+ human_birthday + ", human_birthplace=" + human_birthplace + ", human_age=" + human_age
				+ ", human_educated_degree=" + human_educated_degree + ", human_educated_years=" + human_educated_years
				+ ", human_educated_major=" + human_educated_major + ", human_society_security_id="
				+ human_society_security_id + ", human_id_card=" + human_id_card + ", remark=" + remark
				+ ", salary_standard_id=" + salary_standard_id + ", salary_standard_name=" + salary_standard_name
				+ ", salary_sum=" + salary_sum + ", demand_salaray_sum=" + demand_salaray_sum + ", paid_salary_sum="
				+ paid_salary_sum + ", major_change_amount=" + major_change_amount + ", bonus_amount=" + bonus_amount
				+ ", training_amount=" + training_amount + ", file_chang_amount=" + file_chang_amount
				+ ", human_histroy_records=" + human_histroy_records + ", human_family_membership="
				+ human_family_membership + ", human_picture=" + human_picture + ", attachment_name=" + attachment_name
				+ ", check_status=" + check_status + ", register=" + register + ", checker=" + checker + ", changer="
				+ changer + ", regist_time=" + regist_time + ", check_time=" + check_time + ", change_time="
				+ change_time + ", lastly_change_time=" + lastly_change_time + ", delete_time=" + delete_time
				+ ", recovery_time=" + recovery_time + ", human_file_status=" + human_file_status + ", imgUrl=" + imgUrl
				+ ", pdfUrl=" + pdfUrl + ", startTime=" + startTime + ", endTime=" + endTime + ", page=" + page + "]";
	}

}
