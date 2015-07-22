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
	
	@RequestMapping(value = "showdeal.action", method = RequestMethod.GET)
	public String detailView() {
		
		return "deal/dealview";
	}
	
	@RequestMapping(value = "dealregister.action", method = RequestMethod.GET)
	public String dealRegister() {
		
		return "deal/dealregister";
	}
	
	
}
