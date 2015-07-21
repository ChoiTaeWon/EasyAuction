package com.project.easyauction;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easyauction.common.Util;
import com.easyauction.dto.Member;
import com.easyauction.repository.MemberRepository;
import com.easyauction.service.MemberService;


@Controller
@RequestMapping(value = "account")
public class AccountController {
	
	
	@RequestMapping(value="login.action", method=RequestMethod.POST)
	public ModelAndView login(HttpServletRequest req) {
		
		//요청 데이터 읽기
		String mbId = req.getParameter("memberId");
		String passwd = req.getParameter("passwd");
		passwd = Util.getHashedString(passwd, "SHA-1");
		
		//Member member = MemberService.getMemberByIdAndPasswd(mbId, passwd);

		ModelAndView mav = new ModelAndView();
//		if(member==null){
//			mav.setViewName("account/loginform");
//			mav.addObject("failedid", mbId);
//		}else {
//			mav.setViewName("redirect:/home.action");
//			req.getSession().setAttribute("loginuser", member);
//		}
		return mav; 
	}

}
