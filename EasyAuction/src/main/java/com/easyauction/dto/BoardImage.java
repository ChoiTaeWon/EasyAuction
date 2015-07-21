package com.easyauction.dto;

import java.util.Date;

public class BoardImage {
	private int bdimgNo;
	private String bdName;
	private int bdNo;
	private Date bdimgRegdate;
	 

	public int getBdimgNo() {
		return bdimgNo;
	}
	public void setBdimgNo(int bdimgNo) {
		this.bdimgNo = bdimgNo;
	}
	public String getBdName() {
		return bdName;
	}
	public void setBdName(String bdName) {
		this.bdName = bdName;
	}
	public int getBdNo() {
		return bdNo;
	}
	public void setBdNo(int bdNo) {
		this.bdNo = bdNo;
	}
	public Date getBdimgRegdate() {
		return bdimgRegdate;
	}
	public void setBdimgRegdate(Date bdimgRegdate) {
		this.bdimgRegdate = bdimgRegdate;
	}
	
}
