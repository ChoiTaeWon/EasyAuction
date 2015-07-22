package com.easyauction.dto;

import java.util.Date;

public class Message {
	
	private int msgNo;
	private boolean msgSenderDelete;
	private boolean msgReceiverDelete;
	private String msgContent;
	private String msgTitle;
	private Date msgDate;
	private String msgSenger;
	private String msgReceiver;
	private boolean msgReadCheck;
	
	
	public int getMsgNo() {
		return msgNo;
	}
	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}
	public Boolean getMsgSenderDelete() {
		return msgSenderDelete;
	}
	public void setMsgSenderDelete(Boolean msgSenderDelete) {
		this.msgSenderDelete = msgSenderDelete;
	}
	public Boolean getMsgReceiverDelete() {
		return msgReceiverDelete;
	}
	public void setMsgReceiverDelete(Boolean msgReceiverDelete) {
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
	public String getMsgSenger() {
		return msgSenger;
	}
	public void setMsgSenger(String msgSenger) {
		this.msgSenger = msgSenger;
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
