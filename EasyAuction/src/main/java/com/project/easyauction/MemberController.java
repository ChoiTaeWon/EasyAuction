package com.project.easyauction;


import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.easyauction.common.Util;
import com.easyauction.dto.Member;
import com.easyauction.service.MemberService;


@Controller
@RequestMapping(value = "member")
public class MemberController {
	
	private MemberService mbsvc;
	@Autowired
	@Qualifier(value="memberService")
	public void setMemberService(MemberService mbsvc){
		this.mbsvc = mbsvc;
	}
	
	@InitBinder
	 public void initBinder(WebDataBinder binder) {

	 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	 dateFormat.setLenient(false);
	 binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	 }
	
	
	@RequestMapping(value = "register.action", method = RequestMethod.GET)
	public String register() {
		
		return "member/memberregisterform";
	}
	
	@RequestMapping(value = "register.action", method = RequestMethod.POST)
	public String registerMember(MultipartHttpServletRequest req,//form을 맴버 객체로 받기위해서 써야함
			Member member) {
		
		member.setMbPasswd(Util.getHashedString(member.getMbPasswd(), "SHA-1"));
		mbsvc.setRegisterMember(member);
		
		return "redirect:/home.action";
	}
	@RequestMapping(value = "view.action", method = RequestMethod.GET)
	public ModelAndView view(String mbId) {
		Member member = mbsvc.getMemberById(mbId);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/membereditviewform");
		mav.addObject("member", member);
		
		return mav; 
	}
	@RequestMapping(value = "viewmypage.action", method = RequestMethod.GET)
	public String viewMypage() {
		
		return "member/mypage";
	}

}