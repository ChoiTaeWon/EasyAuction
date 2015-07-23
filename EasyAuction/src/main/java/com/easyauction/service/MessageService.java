package com.easyauction.service;

import java.util.List;

import com.easyauction.dto.Message;

public interface MessageService {

	List<Message> getMsgReceiveList(String mbId);

	List<Message> getMsgSenderList(String mbId);

	Message getMsgBymsgNo(int msgNo);

}
