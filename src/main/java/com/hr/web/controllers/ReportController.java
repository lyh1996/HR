package com.hr.web.controllers;

import java.awt.Color;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hr.bean.ConfigPrimaryKey;
import com.hr.biz.ConfigPrimaryKeyBiz;
import com.hr.web.utils.PdfFileExport;

import jxl.Sheet;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;


 
 
 

@Controller
public class ReportController {
	private static final Log logger = LogFactory.getLog(ReportController.class);
	 private ConfigPrimaryKeyBiz configPrimaryKeyBiz;
	 
	 
	 @Resource(name = "configPrimaryKeyBizImpl")
		public void setconfigPrimaryKeyBiz(ConfigPrimaryKeyBiz configPrimaryKeyBiz) {
			this.configPrimaryKeyBiz = configPrimaryKeyBiz;
		}
	  

	// 档案设置
	@RequestMapping(value = "/exportfile.do")
	public String getreports(Model model, HttpServletRequest request, ConfigPrimaryKey cKey,@RequestParam(name = "primary_key", required = false) String[] primary_key) {
		String opreate = request.getParameter("operate");
		String method=request.getParameter("method");
		if("toExport".equals(opreate)){
			if("excel".equals(method)){
				return "report/excel";
			}else if("pdf".equals(method)){
				 return "report/pdf";
			}/*else if("xml".equals(method)){
				 return "report/xml";
			}*/
		}else if("doexport".equals(opreate)){
			if("excel".equals(method)){
				 
				cKey.setPrimary_key_status(1);
				List<ConfigPrimaryKey> list=this.configPrimaryKeyBiz.getAll(cKey);
				model.addAttribute("list", list);
				if(list.size()>0){
				model.addAttribute("tableName", list.get(0).getPrimary_key_table());
				}
				model.addAttribute("ckey", cKey);
				return "report/excel_locate";
			}else if("pdf".equals(method)){
				cKey.setPrimary_key_status(1);
				List<ConfigPrimaryKey> list=this.configPrimaryKeyBiz.getAll(cKey);
				model.addAttribute("list", list);
				if(list.size()>0){
					model.addAttribute("tableName", list.get(0).getPrimary_key_table());
				}
				return "report/pdf_locate";
			}
		}else if("toexportlocate".equals(opreate)){
			if("excel".equals(method)){
				String pString="";
				for (int i = 1; i <= primary_key.length; i++) {
					if(i<primary_key.length){
						pString=pString+primary_key[i-1]+",";
					}else{
						pString=pString+primary_key[i-1];
					}
				}
				//获取路径
				//String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/excel";
				ConfigPrimaryKey cKey2=new ConfigPrimaryKey();
				cKey2.setPrimary_key_table(cKey.getPrimary_key_table());
				cKey2.setPrimary_key(pString);
				cKey2.setEntity(cKey.getEntity());
				cKey2.setEntityName(cKey.getEntityName());
				System.out.println(cKey2);
				List<Map<String, Object>> mapList=this.configPrimaryKeyBiz.getInfo(cKey2);
				List<Object[]> list = new ArrayList<Object[]>();
				for (Map<String, Object> map : mapList) {
					//System.out.println(map.values());
					Collection values = map.values();
					 List list1 = new ArrayList(values);
					 list.add(list1.toArray());
				}
				//System.out.println(list);
				try{
					File webappsfile=new File( request.getSession().getServletContext().getRealPath(  "/"     )).getParentFile();
					File picFile=new File(  webappsfile, "excel");
					File saveDirFile=new File( picFile+getNowDateStr());
					String picBasePath =  request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/excel" ;
					String newFileUrl= picBasePath+getNowDateStr()+"/"+cKey.getPrimary_key_table()+".xls";
					model.addAttribute("newFileUrl", newFileUrl);
					if (!saveDirFile.exists()) {
						saveDirFile.mkdirs();
					}
					//创建工作簿
					FileOutputStream fos=new FileOutputStream(saveDirFile+"/"+cKey.getPrimary_key_table()+".xls");
					WritableWorkbook wwb=Workbook.createWorkbook(fos);
					//创建工作表
					WritableSheet ws=wwb.createSheet(cKey.getPrimary_key_table(), 0);
					//打印表头
					for (int i = 0; i < primary_key.length; i++) {
						ws.addCell(new Label(i, 0, primary_key[i]));
					}
					//写入查出来的数据
					if(primary_key.length==1){
						for (int j = 0; j < list.size(); j++) {
							for (int i = 0; i < primary_key.length; i++) {
								ws.addCell(new Label(i, j+1, list.get(j)+""));
							}
						}
					}else{
						for (int j = 0; j < list.size(); j++) {
							for (int i = 0; i < primary_key.length; i++) {
								ws.addCell(new Label(i, j+1, list.get(j)[i]+""));
							}
						}
					}
					model.addAttribute("tableName", cKey.getPrimary_key_table());
					wwb.write();
					wwb.close();
				}catch(Exception e){
					e.printStackTrace();
				}
				model.addAttribute("rows", 1);
				return "report/excel_success";
			}else if("pdf".equals(method)){
				String pString="";
				for (int i = 1; i <= primary_key.length; i++) {
					if(i<primary_key.length){
						pString=pString+primary_key[i-1]+",";
					}else{
						pString=pString+primary_key[i-1];
					}
				}
				//获取路径
				//String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/excel";
				ConfigPrimaryKey cKey2=new ConfigPrimaryKey();
				cKey2.setPrimary_key_table(cKey.getPrimary_key_table());
				cKey2.setPrimary_key(pString);
				//System.out.println(cKey2);
				List<Map<String, Object>> mapList=this.configPrimaryKeyBiz.getInfo(cKey2);
				List<Object[]> list = new ArrayList<Object[]>();
				for (Map<String, Object> map : mapList) {
					//System.out.println(map.values());
					Collection values = map.values();
					 List list1 = new ArrayList(values);
					 list.add(list1.toArray());
				}
				File webappsfile=new File( request.getSession().getServletContext().getRealPath(  "/"     )).getParentFile();
				File picFile=new File(  webappsfile, "pdf");
				File saveDirFile=new File( picFile+getNowDateStr());
				if (!saveDirFile.exists()) {
					saveDirFile.mkdirs();
				}
				PdfFileExport pdfFileExport = new PdfFileExport();
				pdfFileExport.exportTableContent(saveDirFile+"/"+cKey.getPrimary_key_table()+".pdf", list, 100000, 2000,primary_key);
				
				String picBasePath =  request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/pdf" ;
				String newFileUrl= picBasePath+getNowDateStr()+"/"+cKey.getPrimary_key_table()+".pdf";
				model.addAttribute("newFileUrl", newFileUrl);
				model.addAttribute("tableName", cKey.getPrimary_key_table());
				model.addAttribute("rows", 1);
				return "report/pdf_success";
			}
		}
		return null;
	}
	
	private static String getNowDateStr() {
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1;
		int day = now.get(Calendar.DATE);
	//	return File.separator+year + File.separator + month + File.separator + day+File.separator;
		return "/"+year + "/"+ month + "/" + day+"/";
	}
}
