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

	@Override
	public void setSendMessage(Message message) {
		messageMapper.setSendMessage(message);
		
	}

	@Override
	public void deleteMsgBymsgNo(int msgNo, String pageId) {
		HashMap<String, String> params= new HashMap<String, String>();
		params.put("msgNo", msgNo+"");
		params.put("pageId", pageId);
		messageMapper.deleteMsgBymsgNo(params);
		
	}

	@Override
	public void setReadMsgBymsgNo(int msgNo) {
		messageMapper.setReadMsgBymsgNo(msgNo);
	}

	@Override
	public int getMessageCountBymbId(String mbId) {
		int mssagecount = messageMapper.getMessageCountBymbId(mbId);
		return mssagecount;
	}
	
	
}
