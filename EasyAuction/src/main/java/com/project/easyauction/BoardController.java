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
	@RequestMapping(value = "photolist.action", method = RequestMethod.GET)
	public String photoList() {
		
		return "board/photolist";
	}	
	
}
