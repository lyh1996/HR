package com.hr.web.controllers;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.hr.bean.ConfigPublicChar;
import com.hr.bean.HumanFile;
import com.hr.bean.SalaryGrant;
import com.hr.bean.SalaryGrantDetail;
import com.hr.bean.SalaryStandardDetails;
import com.hr.biz.ConfigPublicCharBiz;
import com.hr.biz.HumanFileBiz;
import com.hr.biz.SalaryGrantBiz;
import com.hr.biz.SalaryGrantDetailBiz;
import com.hr.biz.SalaryStandardBiz;
import com.hr.biz.SalaryStandardDetailsBiz;

@Controller
public class SalaryGrantController {
	private static final Log logger = LogFactory.getLog(SalaryGrantController.class);

	private ConfigPublicCharBiz configPublicCharBiz;
	private SalaryGrantBiz salaryGrantBiz ;
	private HumanFileBiz humanFileBiz;
	private  SalaryStandardBiz salaryStandardBiz;
	private  SalaryStandardDetailsBiz sDetailsBiz;
	private SalaryGrantDetailBiz salaryGrantDetail;
	private static String ID;
	
	@Resource(name = "salaryGrantDetailBizImpl")
	public void setsalaryGrantDetailBiz(SalaryGrantDetailBiz salaryGrantDetail) {
		this.salaryGrantDetail = salaryGrantDetail;
	}

	@Resource(name = "salaryStandardDetailsBizImpl")
	public void setsalaryStandardDetailsBiz(SalaryStandardDetailsBiz sDetailsBiz) {
		this.sDetailsBiz = sDetailsBiz;
	}

	@Resource(name = "salaryStandardBizImpl")
	public void setsalaryStandardBiz(SalaryStandardBiz salaryStandardBiz) {
		this.salaryStandardBiz = salaryStandardBiz;
	}
	
	@Resource(name = "humanFileBizImpl")
	public void setHumanFileBiz(HumanFileBiz humanFileBiz) {
		this.humanFileBiz = humanFileBiz;
	}
	@Resource(name = "salaryGrantBizImpl")
	public void setsalaryGrantBiz(SalaryGrantBiz salaryGrantBiz) {
		this.salaryGrantBiz = salaryGrantBiz;
	}
	@Resource(name = "configPublicCharBizImpl")
	public void setConfigPublicCharBiz(ConfigPublicCharBiz configPublicCharBiz) {
		this.configPublicCharBiz = configPublicCharBiz;
	}
	
	// 档案设置
		@RequestMapping(value = "/salarygrant.do")
		public String getsalarygrant(Model model, HttpServletRequest request, SalaryGrant sg,ConfigPublicChar char1
				,@RequestParam(name = "human_id", required = false) String[] human_id,@RequestParam(name = "bouns_sum", required = false) String[] bouns_sum
				,@RequestParam(name = "sale_sum", required = false) String[] sale_sum,@RequestParam(name = "deduct_sum", required = false) String[] deduct_sum) {
			String opreate = request.getParameter("operate");
		//	String pageNow=request.getParameter("pageNow");
			if("locate".equals(opreate)){
				logger.info("getsalarygrant called....");
				List<ConfigPublicChar> list=this.configPublicCharBiz.getAll("薪酬发放方式");
				model.addAttribute("list", list);
				return "salarygrant/salarygrant_register_locate";
			}else if("toSearch".equals(opreate)){
				String GrantName=char1.getAttribute_name();
				 int max=this.salaryGrantBiz.getCount()+1;
			      String myId="SG100000"+max;
			      ID=myId;
			      model.addAttribute("myId",myId);
			       int  sum = 0;
				   double money=0;
				   int  b=0;
				   double  c=0.0;
			        if(GrantName.equals("一级机构发放方式")){
			        	//一级发放方式
			        	List<HumanFile>list=this.humanFileBiz.getInfoToSalaryGrant();
						   for (int i = 0; i < list.size(); i++)
						    {
							   HumanFile obj = list.get(i);
							         b=obj.getHumanCount();
									 c=obj.getSalarySum();
								     sum+=b;
								     money+=c;
						     }
						model.addAttribute("sum", sum);
						model.addAttribute("money", money);
						model.addAttribute("FFFS",1);
						model.addAttribute("HF", list); 
			        }else if(GrantName.equals("二级机构发放方式")){
			        	List<HumanFile>list=this.humanFileBiz.getInfoToSalaryGrant2();
						   for (int i = 0; i < list.size(); i++)
						    {
							   HumanFile obj = list.get(i);
							   b=obj.getHumanCount();
								 c=obj.getSalarySum();
							     sum+=b;
							     money+=c;
						     }
						model.addAttribute("sum", sum);
						model.addAttribute("money", money);
						model.addAttribute("FFFS",2);
						model.addAttribute("HF", list); 
						}
			        else if(GrantName.equals("三级机构发放方式")){
			        	List<HumanFile>list=this.humanFileBiz.getInfoToSalaryGrant3();
						   for (int i = 0; i < list.size(); i++)
						    {
							   HumanFile obj = list.get(i);
							   b=obj.getHumanCount();
								 c=obj.getSalarySum();
							     sum+=b;
							     money+=c;
						     }
						model.addAttribute("sum", sum);
						model.addAttribute("money", money);
						model.addAttribute("HF", list); 
						}
				return "salarygrant/salarygrant_register_list";
			}else if("toAdd".equals(opreate)){
				   Integer FirstKindID=Integer.parseInt("" + request.getParameter("firstkindID"));
				   Integer type=Integer.parseInt("" + request.getParameter("type"));
				   Integer SecondKindID=0;
				   if(request.getParameter("secondkindID")!=null&&!"".equals( request.getParameter("secondkindID"))){
					   SecondKindID=Integer.parseInt("" + request.getParameter("secondkindID"));
				   }
				   Integer ThirdKindID=0;
				   if(request.getParameter("thirdkindID")!=null&&!"".equals( request.getParameter("thirdkindID"))){
					   ThirdKindID=  Integer.parseInt("" + request.getParameter("thirdkindID"));
				   }
						 
				   System.out.println("一级名字ID"+FirstKindID);
			   	      System.out.println("二级名字ID"+SecondKindID);
			   	      System.out.println("三级名字ID"+ThirdKindID);
	        	//人力资源集合
	        	 List<HumanFile>list=null;
	        	 //薪酬标准单详细集合
	        	 List<SalaryStandardDetails> list2=null;
	        	 //将薪酬标准单详加到list3集合中
	        	 //薪酬标准基本信息表
	        	HumanFile humanFile=new HumanFile();
	        	humanFile.setFirst_kind_id(FirstKindID);
	        	humanFile.setSecond_kind_id(SecondKindID);
	        	humanFile.setThird_kind_id(ThirdKindID);
	        	 list= this.humanFileBiz.getInfoByCondition(humanFile);
	        	 double money=0.0;
	      		 for (HumanFile s : list) {
	      					 money+=s.getSalary_sum();
					  list2=this.sDetailsBiz.getSalaryStandardDetailsById(s.getSalary_standard_id());//薪酬标准单详细信息 
				 } 
	    	       model.addAttribute("money",money);
	    	       model.addAttribute("firstKindName",list.get(0).getFirst_kind_name());
	    	       if(SecondKindID!=0){
	    	       model.addAttribute("secondKindName",list.get(0).getSecond_kind_name());
	    	       }
	    	       if(ThirdKindID!=0){
	    	       model.addAttribute("thirdKindName", list.get(0).getThird_kind_name());
	    	       }
	      		model.addAttribute("HfList",list);  
	      		model.addAttribute("list2", list2);
	      		model.addAttribute("id", ID);
	      		model.addAttribute("type", type);
	        	    return "salarygrant/salarygrant_register_commit";
			}else if("save".equals(opreate)){
			 System.out.println(sale_sum);
				System.out.println(sg);
				  Integer type=Integer.parseInt("" + request.getParameter("type"));
				 // System.out.println(human_id.toString());
				  //System.out.println(bouns_sum.toString());
				  //System.out.println(sale_sum.toString());
				 
				double salary_standard_sum = 0.0;
				 double salary_paid_sum=0.0;
				for(int i=0;i<human_id.length;i++){
					 
					 HumanFile hFile=this.humanFileBiz.getInfoByHumanIds(Integer.parseInt(human_id[i]));
					// SalaryGrant sGrant=new SalaryGrant();
					 SalaryGrantDetail sDetail =new SalaryGrantDetail();
					 
					 sDetail.setSalary_grant_id(sg.getSalary_grant_id());//薪酬发放编号 
					 sDetail.setHuman_id(hFile.getHuman_id());//档案编号
					//薪酬标准单编号 
					 sDetail.setSalary_standard_id(hFile.getSalary_standard_id());
					 sDetail.setHuman_name(hFile.getHuman_name());//姓名
					 Double bonus_sums=Double.parseDouble(bouns_sum[i]);//奖励金额 
					 sDetail.setBouns_sum(bonus_sums);//奖励金额 
					 Double sale_sums=Double.parseDouble(sale_sum[i]);//奖励金额 
					 sDetail.setSale_sum((sale_sums));//销售绩效金额 
					 Double deduct_sums=Double.parseDouble(deduct_sum[i]);//奖励金额 
					 sDetail.setDeduct_sum(deduct_sums);//销售绩效金额 
					 sDetail.setSalary_standard_sum(hFile.getSalary_sum());//标准薪酬总额 
				     // System.out.println("标准薪酬总额"+SalaryStandardSum);
				      //实发金额
					 sDetail.setSalary_paid_sum(hFile.getSalary_sum()+bonus_sums+sale_sums-deduct_sums);
                     //添加方法详细信息表
                   this.salaryGrantDetail.saveInfo(sDetail);
                      
					 //添加登记发放表 
                     //判断发放方式如果等于一就清空二三级的名字和ID
                     if(type==1){
                    	 hFile.setSecond_kind_id(0);
                    	 hFile.setSecond_kind_name("");
                    	 hFile.setThird_kind_id(0);
                    	 hFile.setThird_kind_name("");
                      }else if (type==2) {
                    	  hFile.setThird_kind_id(0);
                    	  hFile.setThird_kind_name("");
					   }
                     
                    
                     //一级名字和编号
                     sg.setFirst_kind_id(hFile.getFirst_kind_id());
                     sg.setFirst_kind_name(hFile.getFirst_kind_name());
                     //System.out.println(g.getFirstKindName());
                     //二级名字和编号
                     sg.setSecond_kind_id(hFile.getSecond_kind_id());
                     sg.setSecond_kind_name(hFile.getSecond_kind_name());
                     //三级名字和编号
                     sg.setThird_kind_id(hFile.getThird_kind_id());
                     sg.setThird_kind_name(hFile.getThird_kind_name());
                      //设置标准薪酬总金额
                     salary_standard_sum+=sDetail.getSalary_standard_sum();
                      sg.setSalary_paid_sum(salary_standard_sum);
                    //设置实发总金额
                      salary_paid_sum+=sDetail.getSalary_paid_sum();
                      sg.setSalary_paid_sum(salary_paid_sum);
                      //设置复核状态
                      sg.setCheck_status(0);
                     //修改人力资源表
				}
				this.salaryGrantBiz.saveInfo(sg);
				return "salarygrant/salarygrant_register_success";
			}else if("tocheck".equals(opreate)){
				  int  sum = 0;
	    		   double money=0.0;
	    		   double paymoney=0.0;
	    		   int  b=0;
	    		   double  c=0.0;
	    		   double  d=0.0;
	        	 List<SalaryGrant>list= this.salaryGrantBiz.getInfoTochecklist();
	        	 for (int i = 0; i < list.size(); i++) {
	        		 SalaryGrant obj =  list.get(i);
					        b=(Integer)obj.getTotalCount();
							c=(Double)obj.getTotalstandardsum();//标准总额
							d=(Double)obj.getTotalpaysum();//实总额
						     sum +=b;
						     money+=c;
						     paymoney+=d;
				    }
	        	 model.addAttribute("sum2", sum);
	        	 model.addAttribute("money2",money);
	        	 model.addAttribute("paymoney",paymoney);
	        	 model.addAttribute("selectSg",list);
				return "salarygrant/salarygrant_check_list";
			}else if("docheck".equals(opreate)){//点击复核
				   String salary_grant_id=request.getParameter("salaryGrantId");
				 List<SalaryGrantDetail> list1=this.salaryGrantDetail.getSalaryGrantDetailById(salary_grant_id);
	        	  List<SalaryGrant> list2=this.salaryGrantBiz.getSalaryGrantById(salary_grant_id);
	        	  List<SalaryStandardDetails> list3=null;
	        	  double BaseSalaryTotal=0.0;
	        	  Double PaySalaryTotal=0.0;
	        	  for (SalaryGrantDetail sGrantDetail:list1){
	        		  BaseSalaryTotal+=sGrantDetail.getSalary_standard_sum();
	        		  PaySalaryTotal+=sGrantDetail.getSalary_paid_sum();
	        		  list3=this.sDetailsBiz.getSalaryStandardDetailsById(sGrantDetail.getSalary_standard_id());
	        	  }
	        	  model.addAttribute("BaseSalaryTotal", BaseSalaryTotal);
	        	  model.addAttribute("PaySalaryTotal", PaySalaryTotal);
	        	  model.addAttribute("salary_grant_id", salary_grant_id);
	        	  model.addAttribute("firstKindName", list2.get(0).getFirst_kind_name());
	        	  model.addAttribute("secondKindName", list2.get(0).getSecond_kind_name());
	        	  model.addAttribute("thirdKindName", list2.get(0).getThird_kind_name());
	        	  
	        	  model.addAttribute("list1", list1);//详情
	        	  model.addAttribute("list2", list2);//发放
	        	  model.addAttribute("list3", list3);//薪资详细
	        	  //System.out.println(list3);
				return "salarygrant/salarygrant_check";
			}else if("doupdate".equals(opreate)){
				 double salary_paid_sum=0.0;
				for(int i=0;i<human_id.length;i++){
					 
					 SalaryGrantDetail sDetail =new SalaryGrantDetail();
					 
					 sDetail.setSalary_grant_id(sg.getSalary_grant_id());//薪酬发放编号 
					 sDetail.setHuman_id(Integer.parseInt(human_id[i]));//档案编号
					 Double bonus_sums=Double.parseDouble(bouns_sum[i]);//奖励金额 
					 sDetail.setBouns_sum(bonus_sums);//奖励金额 
					 Double sale_sums=Double.parseDouble(sale_sum[i]);//销售绩效金额 
					 sDetail.setSale_sum((sale_sums));//销售绩效金额 
					 Double deduct_sums=Double.parseDouble(deduct_sum[i]);//应扣金额 
					 sDetail.setDeduct_sum(deduct_sums);//应扣金额
				     // System.out.println("标准薪酬总额"+SalaryStandardSum);
				      //实发金额
					 SalaryGrantDetail sDetail2=this.salaryGrantDetail.getSalaryGrantDetail(sDetail);
					 sDetail.setSalary_paid_sum(sDetail2.getSalary_standard_sum()+bonus_sums+sale_sums-deduct_sums);
                    //更新方法详细信息表
                  this.salaryGrantDetail.updateInfo(sDetail);
                  //更新人力资源表
                  HumanFile hFile=new HumanFile();
                  hFile.setHuman_id(Integer.parseInt(human_id[i]));
                  hFile.setPaid_salary_sum(sDetail.getSalary_paid_sum());
                  this.humanFileBiz.updateInfoToSalary(hFile);
                  //System.out.println(sDetail);
					 //更新登记发放表 
                     //设置实发薪酬总金额
                     salary_paid_sum+=sDetail.getSalary_paid_sum();
                     sg.setSalary_paid_sum(salary_paid_sum);
                     //设置复核状态
                     sg.setCheck_status(1);
                    //更新人力资源表
				}
				  this.salaryGrantBiz.updateInfo(sg);
				return "salarygrant/salarygrant_check_success";
			}else if("toquerylocate".equals(opreate)){
				return "salarygrant/salarygrant_query_locate";
			}else if("toquerylist".equals(opreate)) {
			 List<SalaryGrant> list=this.salaryGrantBiz.getInfoByCondition(sg);
			 model.addAttribute("list", list);
				return "salarygrant/salarygrant_query_list";
			}else if("toQueryAll".equals(opreate)){//点击查询详情
				String salary_grant_id=request.getParameter("id");
				 List<SalaryGrantDetail> list1=this.salaryGrantDetail.getSalaryGrantDetailById(salary_grant_id);
	        	  List<SalaryGrant> list2=this.salaryGrantBiz.getSalaryGrantById(salary_grant_id);
	        	  List<SalaryStandardDetails> list3=null;
	        	  double BaseSalaryTotal=0.0;
	        	  Double PaySalaryTotal=0.0;
	        	  for (SalaryGrantDetail sGrantDetail:list1){
	        		  BaseSalaryTotal+=sGrantDetail.getSalary_standard_sum();
	        		  PaySalaryTotal+=sGrantDetail.getSalary_paid_sum();
	        		  list3=this.sDetailsBiz.getSalaryStandardDetailsById(sGrantDetail.getSalary_standard_id());
	        	  }
	        	  model.addAttribute("BaseSalaryTotal", BaseSalaryTotal);
	        	  model.addAttribute("PaySalaryTotal", PaySalaryTotal);
	        	  model.addAttribute("salary_grant_id", salary_grant_id);
	        	  model.addAttribute("firstKindName", list2.get(0).getFirst_kind_name());
	        	  model.addAttribute("secondKindName", list2.get(0).getSecond_kind_name());
	        	  model.addAttribute("thirdKindName", list2.get(0).getThird_kind_name());
	        	  model.addAttribute("list1", list1);//详情
	        	  model.addAttribute("list2", list2.get(0));//发放
	        	  model.addAttribute("list3", list3);//薪资详细
	        	 // System.out.println(list2);
	        	  return "salarygrant/salarygrant_query";
			}else if("toDelete".equals(opreate)){
				String  salary_grant_id =request.getParameter("id");
				model.addAttribute("salary_grant_id", salary_grant_id);
				return "salarygrant/salarygrant_delete";
			}else if("doDelete".equals(opreate)){
				String  salary_grant_id =request.getParameter("id");
			 sg.setSalary_grant_id(salary_grant_id);
			 SalaryGrantDetail sDetail=new SalaryGrantDetail();
			 sDetail.setSalary_grant_id(salary_grant_id);
			 this.salaryGrantBiz.delInfo(sg);
			 this.salaryGrantDetail.delInfo(sDetail);
				 return "salarygrant/delete_success";
			}
			return null;
		}
		 
}
