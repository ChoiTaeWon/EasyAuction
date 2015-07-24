package com.project.easyauction;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easyauction.dto.Message;
import com.easyauction.service.MemberService;
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
	public ModelAndView receivemessages(String mbId) {
		
		List<Message> messages = msgsvc.getMsgReceiveList(mbId);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("message/receivemessages");
		mav.addObject("messages", messages);
		mav.addObject("mbId", mbId);
		
		
		return mav; 
	}
	
	@RequestMapping(value = "sendmessages.action", method = RequestMethod.GET)
	public ModelAndView sendmessages(String mbId) {
		
		List<Message> messages = msgsvc.getMsgSenderList(mbId);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("message/sendmessages");
		mav.addObject("messages", messages);
		mav.addObject("mbId", mbId);
		
		return mav; 
	}
	@RequestMapping(value = "sendmessage.action", method = RequestMethod.GET)
	public ModelAndView sendmessage(String mbId) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("message/sendmessage");
		mav.addObject("mbId", mbId);
		return mav;
	}
	@RequestMapping(value = "sendmessage.action", method = RequestMethod.POST)
	public ModelAndView send(Message message) {
		msgsvc.setSendMessage(message);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/message/sendmessages.action");
		mav.addObject("mbId", message.getMsgSender());
		return mav;
	}
	@RequestMapping(value = "viewmessage.action", method = RequestMethod.GET)
	public ModelAndView viewmessage(int msgNo, String pageId, String mbId) {
		
		Message message = msgsvc.getMsgBymsgNo(msgNo);
		msgsvc.setReadMsgBymsgNo(msgNo);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("message/viewmessage");
		mav.addObject("message", message);
		mav.addObject("mbId", mbId);
		
		return mav;
	}
	@RequestMapping(value = "deletemessage.action", method = RequestMethod.GET)
	public ModelAndView deletemessage(int msgNo, String pageId, String mbId) {
		
		msgsvc.deleteMsgBymsgNo(msgNo, pageId);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:/message/" + pageId + ".action");
		mav.addObject("mbId", mbId);
		
		return mav;
	}
	
}
