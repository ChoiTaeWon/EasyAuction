package com.project.easyauction;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "deal")
public class DealController {
	
	
	@RequestMapping(value = "deal.action", method = RequestMethod.GET)
	public String directList() {
		
		return "deal/deallist";
	}
	
	
}