package com.project.easyauction;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "board")
public class BoardController {
	
	
	@RequestMapping(value = "freeboard.action", method = RequestMethod.GET)
	public String freeboardList() {
		
		return "board/freeboardlist";
	}
	
	@RequestMapping(value = "gongji.action", method = RequestMethod.GET)
	public String gongjiList() {
		
		return "board/gongjilist";
	}
	
	@RequestMapping(value = "register.action", method = RequestMethod.GET)
	public String register() {
		
		return "board/freeboardregisterform";
	}
	@RequestMapping(value = "view.action", method = RequestMethod.GET)
	public String view() {
		
		return "board/freeboardeditviewform";
	}
	
	@RequestMapping(value = "photolist.action", method = RequestMethod.GET)
	public String photoList() {
		
		return "board/photolist";
		
	}
	@RequestMapping(value = "photoview.action", method = RequestMethod.GET)
	public String photoviewList() {
		
		return "board/photoview";
	}	
	@RequestMapping(value = "photoregister.action", method = RequestMethod.GET)
	public String photoregisterList() {
		
		return "board/photoregister";
	}	
}
