package com.easyauction.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.easyauction.dto.Message;
import com.easyauction.mapper.MessageMapper;

@Repository(value = "messageRepository")//객체등록
public class OracleMessageRepository implements MessageRepository{
	
	private MessageMapper messageMapper;
	@Autowired
	@Qualifier(value="messageMapper")
	public void setMemberMapper(MessageMapper messageMapper) {
		this.messageMapper = messageMapper;
	}	
	
	@Override
	public List<Message> getMsgReceiveList(String mbId){
		
		 List<Message> messages = (List<Message>) messageMapper.getMsgReceiveList(mbId);
		return messages;
	}

	@Override
	public List<Message> getMsgSenderList(String mbId) {
		List<Message> messages = (List<Message>) messageMapper.getMsgSenderList(mbId);
		return messages;
	}

	@Override
	public Message getMsgBymsgNo(int msgNo) {
		Message message = messageMapper.getMsgBymsgNo(msgNo);
		return message;
	}
	
}
