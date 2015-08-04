package com.easyauction.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MemberReporting {
	
	private int mrpNo;
	private String mrpContent;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm a z")
	private Date mrpDate;
	private String mrpRepoter;
	private String mrpTarget;
	
	public String getMrpTarget() {
		return mrpTarget;
	}
	public void setMrpTarget(String mrpTarget) {
		this.mrpTarget = mrpTarget;
	}
	public int getMrpNo() {
		return mrpNo;
	}
	public void setMrpNo(int mrpNo) {
		this.mrpNo = mrpNo;
	}
	public String getMrpContent() {
		return mrpContent;
	}
	public void setMrpContent(String mrpContent) {
		this.mrpContent = mrpContent;
	}
	public Date getMrpDate() {
		return mrpDate;
	}
	public void setMrpDate(Date mrpDate) {
		this.mrpDate = mrpDate;
	}
	public String getMrpRepoter() {
		return mrpRepoter;
	}
	public void setMrpRepoter(String mrpRepoter) {
		this.mrpRepoter = mrpRepoter;
	}

	
}
