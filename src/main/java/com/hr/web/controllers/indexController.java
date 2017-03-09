package com.hr.web.controllers;

 

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
 
 

@Controller
public class indexController {
	private static final Log logger=LogFactory.getLog(indexController.class);
	 
	//进入主页面
	@RequestMapping(value="/index")
	public String index(){
		return "main/index";
	}
	
	//进入主页面
		@RequestMapping(value="/index_top")
		public String index_top(){
			return "main/index_top";
		}
		//进入主页面
		@RequestMapping(value="/index_left")
		public String index_left(){
			return "main/index_left";
		}
		//进入主页面
		@RequestMapping(value="/index_right")
		public String index_right(){
			return "main/index_right";
		}
		//进入主页面
		@RequestMapping(value="/index_bottom")
		public String index_bottom(){
			return "main/index_bottom";
		}
	 
}
