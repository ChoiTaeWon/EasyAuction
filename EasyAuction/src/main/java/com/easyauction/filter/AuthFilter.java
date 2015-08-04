package com.easyauction.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easyauction.dto.Member;



public class AuthFilter implements Filter {

	@Override
	public void destroy() {
	}


	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest)arg0;
		HttpServletResponse resp = (HttpServletResponse)arg1;
		
		String url = req.getRequestURI();
		String queryString = "";
		if (url.contains("?")) {
			queryString = url.substring(url.indexOf("?") + 1);
			url = url.substring(0, url.indexOf("?"));			
		}
		
		Member member = (Member)req.getSession().getAttribute("loginuser");
		
		if (url.contains("/board/") || url.contains("/direct/") || url.contains("/auction/")
				|| url.contains("/message/")) {			
			if (member == null) {				
				resp.sendRedirect(
					"/easyauction/account/login.action?returnurl=" + url);
				return;				
			}  
		}
		
		
		chain.doFilter(arg0, arg1);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
