package com.project.easyauction;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "direct")
public class DirectdealController {
	
	
	@RequestMapping(value = "directdeal.action", method = RequestMethod.GET)
	public String directList() {
		
		return "direct/directlist";
	}
	
	
}
