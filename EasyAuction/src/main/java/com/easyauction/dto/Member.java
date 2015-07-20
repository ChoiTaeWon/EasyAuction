package com.easyauction.dto;

import java.util.Date;

public class Member {
	
	private int memberNo;
	private String memberName;
	private String memberId;
	private String memberPasswd;
	private String memberAddress1;
	private String memberAddress2;
	private String memberContact;
	private String memberUsertype;
	private Date memberRegdate;
	
	
	
	public String getMemberUsertype() {
		return memberUsertype;
	}
	public void setMemberUsertype(String memberUsertype) {
		this.memberUsertype = memberUsertype;
	}
	private int memberEmployee;
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPasswd() {
		return memberPasswd;
	}
	public void setMemberPasswd(String memberPasswd) {
		this.memberPasswd = memberPasswd;
	}

	public String getMemberAddress1() {
		return memberAddress1;
	}
	public void setMemberAddress1(String memberAddress1) {
		this.memberAddress1 = memberAddress1;
	}
	public String getMemberAddress2() {
		return memberAddress2;
	}
	public void setMemberAddress2(String memberAddress2) {
		this.memberAddress2 = memberAddress2;
	}
	public String getMemberContact() {
		return memberContact;
	}
	public void setMemberContact(String memberContact) {
		this.memberContact = memberContact;
	}
	public Date getMemberRegdate() {
		return memberRegdate;
	}
	public void setMemberRegdate(Date memberRegdate) {
		this.memberRegdate = memberRegdate;
	}
	public int getMemberEmployee() {
		return memberEmployee;
	}
	public void setMemberEmployee(int memberEmployee) {
		this.memberEmployee = memberEmployee;
	}
	
	
	
}
