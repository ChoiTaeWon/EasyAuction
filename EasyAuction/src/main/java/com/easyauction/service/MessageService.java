package com.easyauction.service;

import java.util.List;

import com.easyauction.dto.Message;

public interface MessageService {

	List<Message> getMsgReceiveList(String mbId);

	List<Message> getMsgSenderList(String mbId);

	Message getMsgBymsgNo(int msgNo);

	void setSendMessage(Message message);

	void deleteMsgBymsgNo(int msgNo, String pageId);

	void setReadMsgBymsgNo(int msgNo);

	int getMessageCountBymbId(String mbId);


}
