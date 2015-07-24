package com.project.easyauction;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value = "register.action", method = RequestMethod.GET)
	public String register() {
		
		return "member/memberregisterform";
	}
	
	@RequestMapping(value = "register.action", method = RequestMethod.POST)
	public String registerMember(Member member) {
		
		System.out.println(member.getMbAddress1());
		
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