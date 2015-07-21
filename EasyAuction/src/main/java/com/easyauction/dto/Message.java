package com.easyauction.dto;

import java.util.Date;

public class Message {
	
	private int msgNo;
	private Boolean msgsenderdelete;
	private Boolean msgreceiverdelete;
	private String msgContent;
	private String msgTitle;
	private Date msgDate;
	private String msgSenger;
	private String msgreceiver;
	
	
	public int getMsgNo() {
		return msgNo;
	}
	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}
	public Boolean getMsgsenderdelete() {
		return msgsenderdelete;
	}
	public void setMsgsenderdelete(Boolean msgsenderdelete) {
		this.msgsenderdelete = msgsenderdelete;
	}
	public Boolean getMsgreceiverdelete() {
		return msgreceiverdelete;
	}
	public void setMsgreceiverdelete(Boolean msgreceiverdelete) {
		this.msgreceiverdelete = msgreceiverdelete;
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
	public String getMsgreceiver() {
		return msgreceiver;
	}
	public void setMsgreceiver(String msgreceiver) {
		this.msgreceiver = msgreceiver;
	}
	
}
