package com.project.easyauction;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easyauction.common.Util;
import com.easyauction.dto.Member;
import com.easyauction.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private MemberService mbsvc;
	@Autowired
	@Qualifier(value="memberService")
	public void setMemberService(MemberService mbsvc) {
		this.mbsvc = mbsvc;
	}
	
	@RequestMapping(value ={ "/","home.action"}, method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
//	public ModelAndView home(HttpServletRequest req) {
//			//요청 데이터 읽기
//			String mbId = "in";
//			String passwd = "123";
//			passwd = Util.getHashedString(passwd, "SHA-1");
//			
//			Member member = mbsvc.getMemberByIdAndPasswd(mbId, passwd);
//
//			ModelAndView mav = new ModelAndView();
//			
//				mav.setViewName("mainpage");
//				req.getSession().setAttribute("loginuser", member);
//			return mav; 
//		}
		return "mainpage";
	}
	
}
