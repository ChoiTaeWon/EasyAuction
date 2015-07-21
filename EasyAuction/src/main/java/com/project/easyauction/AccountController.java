package com.project.easyauction;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "account")
public class AccountController {
	
	
	@RequestMapping(value = "login.action", method = RequestMethod.GET)
	public String register() {
		
		return "account/loginform";
	}

}
