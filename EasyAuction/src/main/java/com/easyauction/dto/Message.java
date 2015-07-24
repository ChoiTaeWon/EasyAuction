package com.easyauction.dto;

import java.util.Date;

public class Message {
	
	private int msgNo;
	private boolean msgSenderDelete;
	private boolean msgReceiverDelete;
	private String msgContent;
	private String msgTitle;
	private Date msgDate;
	private String msgSender;
	private String msgReceiver;
	private boolean msgReadCheck;
	
	
	
	public int getMsgNo() {
		return msgNo;
	}
	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}
	public boolean isMsgSenderDelete() {
		return msgSenderDelete;
	}
	public void setMsgSenderDelete(boolean msgSenderDelete) {
		this.msgSenderDelete = msgSenderDelete;
	}
	public boolean isMsgReceiverDelete() {
		return msgReceiverDelete;
	}
	public void setMsgReceiverDelete(boolean msgReceiverDelete) {
		this.msgReceiverDelete = msgReceiverDelete;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	public String getMsgTitle() {
		return msgTitle;
	}
	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}
	public Date getMsgDate() {
		return msgDate;
	}
	public void setMsgDate(Date msgDate) {
		this.msgDate = msgDate;
	}
	public String getMsgSender() {
		return msgSender;
	}
	public void setMsgSender(String msgSender) {
		this.msgSender = msgSender;
	}
	public String getMsgReceiver() {
		return msgReceiver;
	}
	public void setMsgReceiver(String msgReceiver) {
		this.msgReceiver = msgReceiver;
	}
	public boolean isMsgReadCheck() {
		return msgReadCheck;
	}
	public void setMsgReadCheck(boolean msgReadCheck) {
		this.msgReadCheck = msgReadCheck;
	}
	
}
