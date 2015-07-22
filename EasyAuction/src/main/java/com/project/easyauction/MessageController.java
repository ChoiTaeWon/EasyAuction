package com.project.easyauction;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "message")
public class MessageController {
	
	
	@RequestMapping(value = "receivemessages.action", method = RequestMethod.GET)
	public String register(String mbId) {
		
	
		return "message/receivemessages";
	}
	@RequestMapping(value = "sendmessages.action", method = RequestMethod.GET)
	public String view() {
		
		return "message/sendmessages";
	}
	@RequestMapping(value = "sendmessage.action", method = RequestMethod.GET)
	public String message() {
		
		return "message/sendmessage";
	}
	@RequestMapping(value = "viewmessage.action", method = RequestMethod.GET)
	public String viewmessage() {
		
		return "message/viewmessage";
	}
	
}
