package com.hr.web.filters;

import java.io.IOException;

import javax.security.auth.Destroyable;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class RightFilter implements Filter {
	public RightFilter() {
		 
	}
	public void destroy(){
		
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		 HttpServletRequest req=(HttpServletRequest) request;
		 if(req.getSession().getAttribute("user")!=null){
			 chain.doFilter(request, response);
		 }else{
			 req.getSession().setAttribute("errmsg", "请先登入....");
			 request.getRequestDispatcher("/WEB-INF/jsp/home/login.jsp").forward(request, response);
		 }
		
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	 
}
