package com.project.easyauction;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.easyauction.dto.Auction;
import com.easyauction.service.DealService;


@Controller
@RequestMapping(value = "deal")
public class DealController {
	
	private DealService dealService;
	//@Autowired
	//@Qualifier("dealService")
	public void setDealService(DealService dealService) {
		this.dealService = dealService;
	}
	
	


	@RequestMapping(value = "deal.action", method = RequestMethod.GET)
	public String directList(Auction auction) {
		
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
