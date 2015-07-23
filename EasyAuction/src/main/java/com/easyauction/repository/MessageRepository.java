package com.easyauction.repository;

import java.util.List;

import com.easyauction.dto.Message;

public interface MessageRepository {

	List<Message> getMsgReceiveList(String mbId);

	List<Message> getMsgSenderList(String mbId);

	Message getMsgBymsgNo(int msgNo);

}