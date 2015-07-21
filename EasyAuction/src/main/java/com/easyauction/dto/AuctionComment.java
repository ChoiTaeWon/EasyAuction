package com.easyauction.dto;

import java.util.Date;

public class AuctionComment {
	private	int	acNo;
	private	String acContent;
	private	Date acRegdate;
	private	String acWriter;
	private	int	aucNo;
	
	public int getAcNo() {
		return acNo;
	}
	public void setAcNo(int acNo) {
		this.acNo = acNo;
	}
	public String getAcContent() {
		return acContent;
	}
	public void setAcContent(String acContent) {
		this.acContent = acContent;
	}
	public Date getAcRegdate() {
		return acRegdate;
	}
	public void setAcRegdate(Date acRegdate) {
		this.acRegdate = acRegdate;
	}
	public String getAcWriter() {
		return acWriter;
	}
	public void setAcWriter(String acWriter) {
		this.acWriter = acWriter;
	}
	public int getAucNo() {
		return aucNo;
	}
	public void setAucNo(int aucNo) {
		this.aucNo = aucNo;
	}
	
	

}
