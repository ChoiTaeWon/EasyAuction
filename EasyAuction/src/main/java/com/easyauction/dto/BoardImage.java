package com.easyauction.dto;

import java.util.Date;

public class BoardImage {
	private int bdimgNo;
	private String bdImgName;
	private int bdNo;
	private Date bdimgRegdate;
	 

	public int getBdimgNo() {
		return bdimgNo;
	}
	public void setBdimgNo(int bdimgNo) {
		this.bdimgNo = bdimgNo;
	}
	public String getBdImgName() {
		return bdImgName;
	}
	public void setBdImgName(String bdImgName) {
		this.bdImgName = bdImgName;
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
