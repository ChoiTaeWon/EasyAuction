package com.easyauction.dto;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Member {
	
	private String mbId;
	private String mbPasswd;
	private String mbAddress1;
	private String mbAddress2;
	private String mbPhone1;
	private String mbPhone2;
	private boolean mbGender;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm a z")
	private Date mbBirthDate;
	private int mbGrade;
	private int mbReportingCount;
	private String mbName;
	private boolean mbGrant;
	private boolean mbDelete;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm a z")
	private Date mbRegdate;
	private String mbEmail;
	
/*///////////////////////////////////////////////////////////////////////////////////	
	private List<Auction> auctions;
	public List<Auction> getAuctions() {
		return auctions;
	}
	public void setAuctions(List<Auction> auctions) {
		this.auctions = auctions;
	}
///////////////////////////////////////////////////////////////////////////////////	
*/	
	
	public String getMbId() {
		return mbId;
	}
	public void setMbId(String mbId) {
		this.mbId = mbId;
	}
	public String getMbName() {
		return mbName;
	}
	public void setMbName(String mbName) {
		this.mbName = mbName;
	}
	public String getMbPasswd() {
		return mbPasswd;
	}
	public void setMbPasswd(String mbPasswd) {
		this.mbPasswd = mbPasswd;
	}
	public String getMbAddress1() {
		return mbAddress1;
	}
	public void setMbAddress1(String mbAddress1) {
		this.mbAddress1 = mbAddress1;
	}
	public String getMbAddress2() {
		return mbAddress2;
	}
	public void setMbAddress2(String mbAddress2) {
		this.mbAddress2 = mbAddress2;
	}
	public String getMbPhone1() {
		return mbPhone1;
	}
	public void setMbPhone1(String mbPhone1) {
		this.mbPhone1 = mbPhone1;
	}
	public String getMbPhone2() {
		return mbPhone2;
	}
	public void setMbPhone2(String mbPhone2) {
		this.mbPhone2 = mbPhone2;
	}
	public Boolean getMbGender() {
		return mbGender;
	}
	public void setMbGender(Boolean mbGender) {
		this.mbGender = mbGender;
	}
	public Date getMbBirthDate() {
		return mbBirthDate;
	}
	public void setMbBirthDate(Date mbBirthDate) {
		this.mbBirthDate = mbBirthDate;
	}
	public int getMbGrade() {
		return mbGrade;
	}
	public void setMbGrade(int mbGrade) {
		this.mbGrade = mbGrade;
	}
	public int getMbReportingCount() {
		return mbReportingCount;
	}
	public void setMbReportingCount(int mbReportingCount) {
		this.mbReportingCount = mbReportingCount;
	}
	public Boolean getMbGrant() {
		return mbGrant;
	}
	public void setMbGrant(Boolean mbGrant) {
		this.mbGrant = mbGrant;
	}
	public Boolean getMbDelete() {
		return mbDelete;
	}
	public void setMbDelete(Boolean mbDelete) {
		this.mbDelete = mbDelete;
	}
	public Date getMbRegdate() {
		return mbRegdate;
	}
	public void setMbRegdate(Date mbRegdate) {
		this.mbRegdate = mbRegdate;
	}
	public String getMbEmail() {
		return mbEmail;
	}
	public void setMbEmail(String mbEmail) {
		this.mbEmail = mbEmail;
	}
	
}
