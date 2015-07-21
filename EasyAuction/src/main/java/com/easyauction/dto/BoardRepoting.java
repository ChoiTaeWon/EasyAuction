package com.easyauction.dto;

import java.util.Date;

public class BoardRepoting {
	private	int	brpNo;
	private	String	brpContent;
	private	Date	brpDate;
	private	int	brpTargetNo;
	private	String	brpRepoter;
	public int getBrpNo() {
		return brpNo;
	}
	public void setBrpNo(int brpNo) {
		this.brpNo = brpNo;
	}
	public String getBrpContent() {
		return brpContent;
	}
	public void setBrpContent(String brpContent) {
		this.brpContent = brpContent;
	}
	public Date getBrpDate() {
		return brpDate;
	}
	public void setBrpDate(Date brpDate) {
		this.brpDate = brpDate;
	}
	public int getBrpTargetNo() {
		return brpTargetNo;
	}
	public void setBrpTargetNo(int brpTargetNo) {
		this.brpTargetNo = brpTargetNo;
	}
	public String getBrpRepoter() {
		return brpRepoter;
	}
	public void setBrpRepoter(String brpRepoter) {
		this.brpRepoter = brpRepoter;
	}

	
}
