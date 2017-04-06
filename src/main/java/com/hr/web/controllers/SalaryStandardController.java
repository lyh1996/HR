package com.hr.web.controllers;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hr.bean.ConfigPublicChar;
import com.hr.bean.SalaryStandard;
import com.hr.bean.SalaryStandardDetails;
import com.hr.biz.ConfigPublicCharBiz;
import com.hr.biz.SalaryStandardBiz;
import com.hr.biz.SalaryStandardDetailsBiz;

@Controller
public class SalaryStandardController {
	private SalaryStandardBiz salaryStandardBiz;
	private SalaryStandardDetailsBiz salaryStandardDetailsBiz;
	
	private ConfigPublicCharBiz configPublicCharBiz;
	
	@Resource(name = "salaryStandardDetailsBizImpl")
	public void setSalaryStandardDetailsBiz(SalaryStandardDetailsBiz salaryStandardDetailsBiz) {
		this.salaryStandardDetailsBiz = salaryStandardDetailsBiz;
	}
	
	@Resource(name = "salaryStandardBizImpl")
	public void setSalaryStandardBiz(SalaryStandardBiz salaryStandardBiz) {
		this.salaryStandardBiz = salaryStandardBiz;
	}
	
	@Resource(name = "configPublicCharBizImpl")
	public void setConfigPublicCharBiz(ConfigPublicCharBiz configPublicCharBiz) {
		this.configPublicCharBiz = configPublicCharBiz;
	}
	
	@RequestMapping(value = "/salarystandard.do")
	public String getsalarytandard(@RequestParam(value="item_id",required=false)String[] item_id,@RequestParam(value="item_name",required=false)String[] item_name,@RequestParam(value="salary",required=false)String[] salary,Model model, HttpServletRequest request,
			SalaryStandard salaryStandard){
		String opreate = request.getParameter("operate");
		System.out.println(opreate);
		if("toAdd".equals(opreate)){
			List<SalaryStandard> list=this.salaryStandardBiz.getAllSalaryStandard();
			if(list.size()==0){
				salaryStandard.setStandard_id("SB10001");
				model.addAttribute("salaryStandard", salaryStandard);
			}else{
				Integer list2=(list.get(0).getSsd_id())+1;
				salaryStandard.setStandard_id("SB10000"+list2.toString());
				model.addAttribute("salaryStandard", salaryStandard);
			}
			List<ConfigPublicChar> countrys = this.configPublicCharBiz.getAll("薪酬设置 ");
			model.addAttribute("countrys", countrys);
			return "salary_standard/register";
		}else if("doAdd".equals(opreate)){
			List<SalaryStandard> list=this.salaryStandardBiz.getAllSalaryStandard();
			if(list.size()>0){
				Integer list2=(list.get(0).getSsd_id())+1;
				salaryStandard.setStandard_id("SB10000"+list2.toString());
				salaryStandard.setCheck_status(0);   //0 复核状态为  未复核
			}else{
				salaryStandard.setStandard_id("SB100001");
				salaryStandard.setCheck_status(0);   //0 复核状态为  未复核					
			}		
			this.salaryStandardBiz.saveSalaryStandard(salaryStandard);
			for(int i=0,len=item_id.length;i<len;i++){
				SalaryStandardDetails salaryStandardDetails=new SalaryStandardDetails();
				salaryStandardDetails.setStandard_id(salaryStandard.getStandard_id());
				salaryStandardDetails.setStandard_name(salaryStandard.getStandard_name());
				salaryStandardDetails.setItem_id(Integer.parseInt(item_id[i]));
				salaryStandardDetails.setItem_name(item_name[i]);
				salaryStandardDetails.setSalary(Double.parseDouble(salary[i]));
				this.salaryStandardDetailsBiz.saveSalaryStandardDetails(salaryStandardDetails);
			}
			return "salary_standard/register_success";
		}else if("toCheck".equals(opreate)){
			List<SalaryStandard> salaryStandards=this.salaryStandardBiz.getAllNeedCheckSalaryStandard(0);
			model.addAttribute("list", salaryStandards);
			return "salary_standard/check_list";		
		}else if("toEdit".equals(opreate)){
			String id=request.getParameter("id");
			model.addAttribute("id",id);
			SalaryStandard salaryStandards= this.salaryStandardBiz.getSalaryStandardById(id);
			List<SalaryStandardDetails> salaryStandardDetails=this.salaryStandardDetailsBiz.getSalaryStandardDetailsById(id);
		//	SalaryStandardDetails salaryStandardDetails=(SalaryStandardDetails) this.salaryStandardDetailsBiz.getSalaryStandardDetailsById(id);
			System.out.println(salaryStandardDetails);
			model.addAttribute("salaryStandardDetails",salaryStandardDetails);
			model.addAttribute("salaryStandards",salaryStandards);
			return "salary_standard/check";
		}else if("doEdit".equals(opreate)){
			String id=request.getParameter("id");
			salaryStandard.setStandard_id(id);	
			this.salaryStandardBiz.updateSalaryStandard(salaryStandard);
			
			for(int i=0,len=item_id.length;i<len;i++){
				SalaryStandardDetails salaryStandardDetails=new SalaryStandardDetails();	
				salaryStandardDetails.setStandard_id(id);
				salaryStandardDetails.setStandard_name(salaryStandard.getStandard_name());
				salaryStandardDetails.setItem_id(Integer.parseInt(item_id[i]));
				salaryStandardDetails.setItem_name(item_name[i]);
				salaryStandardDetails.setSalary(Double.parseDouble(salary[i]));
				this.salaryStandardDetailsBiz.updateSalaryStandardDetails(salaryStandardDetails);
			}
			return "salary_standard/check_success";
		}else if("toLocate".equals(opreate)){
			return "salary_standard/query_locate";
		}else if("doQuery".equals(opreate)){
			List<SalaryStandard> salaryStandards=this.salaryStandardBiz.getInfoByCondition(salaryStandard);
			model.addAttribute("salaryStandards", salaryStandards);
			return "salary_standard/query_list";
		}else if("toQueryAll".equals(opreate)){
			String id=request.getParameter("id");
			model.addAttribute("id",id);
			SalaryStandard salaryStandards= this.salaryStandardBiz.getSalaryStandardById(id);
			List<SalaryStandardDetails> salaryStandardDetails=this.salaryStandardDetailsBiz.getSalaryStandardDetailsById(id);
			model.addAttribute("salaryStandardDetails",salaryStandardDetails);
			model.addAttribute("salaryStandards",salaryStandards);
			return "salary_standard/query";
		}else if("toDelete".equals(opreate)){
			String id=request.getParameter("id");
			model.addAttribute("id", id);
			return "salary_standard/delete_false";
		}else if("doDelete".equals(opreate)){
			String id=request.getParameter("id");
			salaryStandard.setStandard_id(id);
			SalaryStandardDetails salaryStandardDetails=new SalaryStandardDetails();
			salaryStandardDetails.setStandard_id(id);
			this.salaryStandardBiz.delInfo(salaryStandard);
			this.salaryStandardDetailsBiz.delInfo(salaryStandardDetails);
			return "salary_standard/delete_success";
		}else if("toChangeLocate".equals(opreate)){
			return "salary_standard/change_locate";
		}else if("doChangeQuery".equals(opreate)){
			String check_status=request.getParameter("check_status");
			model.addAttribute("check_status",check_status);
			List<SalaryStandard> salaryStandards=this.salaryStandardBiz.getInfoByCheckStatus(salaryStandard);
			model.addAttribute("salaryStandards", salaryStandards);
			return "salary_standard/change_list";	
		}else if("toQueryMore".equals(opreate)){
			String id=request.getParameter("id");
			model.addAttribute("id",id);
			List<SalaryStandardDetails> salaryStandardDetails=this.salaryStandardDetailsBiz.getSalaryStandardDetailsById(id);	
			SalaryStandard salaryStandards =this.salaryStandardBiz.getSalaryStandardById(id);
			model.addAttribute("salaryStandardDetails", salaryStandardDetails);
			model.addAttribute("salaryStandards", salaryStandards);
			return "salary_standard/change";
		}else if("doChange".equals(opreate)){
			String id=request.getParameter("id");
			salaryStandard.setStandard_id(id);
			this.salaryStandardBiz.updateChangeSalaryStandard(salaryStandard);
			
			for(int i=0,len=item_id.length;i<len;i++){
				SalaryStandardDetails salaryStandardDetails=new SalaryStandardDetails();
				salaryStandardDetails.setStandard_id(id);
				salaryStandardDetails.setStandard_name(salaryStandard.getStandard_name());
				salaryStandardDetails.setItem_id(Integer.parseInt(item_id[i]));
				salaryStandardDetails.setItem_name(item_name[i]);
				salaryStandardDetails.setSalary(Double.parseDouble(salary[i]));
				this.salaryStandardDetailsBiz.updateChangeSalaryStandardDetails(salaryStandardDetails);
			}
			return "salary_standard/change_success";
		}
		return null;
	}


}
