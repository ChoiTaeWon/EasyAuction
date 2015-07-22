package com.project.easyauction;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easyauction.dto.Message;
import com.easyauction.service.MessageService;


@Controller
@RequestMapping(value = "message")
public class MessageController {
	
	private MessageService msgsvc;
	@Autowired
	@Qualifier(value="messageService")
	public void setMessageService(MessageService msgsvc){
		this.msgsvc = msgsvc;
	}
	
	@RequestMapping
	(value = "receivemessages.action", method = RequestMethod.GET)
	public ModelAndView register(String mbId) {
		
		List<Message> messages = msgsvc.getMsgReceiveList(mbId);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("message/receivemessages");
		mav.addObject("messages", messages);
		
		return mav; 
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
