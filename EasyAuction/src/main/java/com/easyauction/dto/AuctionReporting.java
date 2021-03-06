package com.easyauction.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class AuctionReporting {

	private	int	arpNo;
	private	String	arpContent;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm a z")
	private	Date	arpDate;
	private	String	arpRepoter;
	private	int	arpTagetNo;
	
	public int getArpNo() {
		return arpNo;
	}
	public void setArpNo(int arpNo) {
		this.arpNo = arpNo;
	}
	public String getArpContent() {
		return arpContent;
	}
	public void setArpContent(String arpContent) {
		this.arpContent = arpContent;
	}
	public Date getArpDate() {
		return arpDate;
	}
	public void setArpDate(Date arpDate) {
		this.arpDate = arpDate;
	}
	public String getArpRepoter() {
		return arpRepoter;
	}
	public void setArpRepoter(String arpRepoter) {
		this.arpRepoter = arpRepoter;
	}
	public int getArpTagetNo() {
		return arpTagetNo;
	}
	public void setArpTagetNo(int arpTagetNo) {
		this.arpTagetNo = arpTagetNo;
	}
	

	
	
	
}
