package com.easyauction.mapper;

import java.util.HashMap;
import java.util.List;

import com.easyauction.dto.Member;
import com.easyauction.dto.Message;
/*
 * MemberMapper.xml 파일의 내용에 기초해서 MyBatis가 내부적으로 클래스를 만들고 그것을 실행
 * -> 스프링-마이바티스가 내부적으로 만든 클래스를 코드에서 직접 접근하기 위해 인터페이스를 정의하고 연결
 */
public interface MessageMapper {

	List<Message> getMsgReceiveList(String mbId);

	List<Message> getMsgSenderList(String mbId);

	Message getMsgBymsgNo(int msgNo);

	void setSendMessage(Message message);

	void deleteMsgBymsgNo(HashMap<String, String> params);

	void setReadMsgBymsgNo(int msgNo);

	int getMessageCountBymbId(String mbId);
	

}
