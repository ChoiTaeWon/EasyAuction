package com.project.easyauction;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "member")
public class MemberController {
	
	
	@RequestMapping(value = "register.action", method = RequestMethod.GET)
	public String register() {
		
		return "member/memberregisterform";
	}
	@RequestMapping(value = "view.action", method = RequestMethod.GET)
	public String view() {
		
		return "member/membereditviewform";
	}

}