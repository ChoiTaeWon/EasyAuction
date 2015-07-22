package com.easyauction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.easyauction.dto.Message;
import com.easyauction.repository.MessageRepository;

@Service(value="messageService")
public class MyMessageService implements MessageService {
	
	@Autowired
	@Qualifier(value="messageRepository")
	MessageRepository msgrepo;
	//사용할땐 인터페이스를 사용
	@Override
	public List<Message> getMsgReceiveList(String mbId) {
		
		List<Message> messages = msgrepo.getMsgReceiveList(mbId);
		return messages;
	}

}
