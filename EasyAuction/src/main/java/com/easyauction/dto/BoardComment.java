package com.easyauction.dto;

import java.io.Serializable;
import java.sql.Date;

public class BoardComment implements Serializable{
	
	private int bcNo;
	private String bcContent;
	private int bdNo;
	private String bcWriter;
	private Date bcRegdate;
	
	public int getBcNo() {
		return bcNo;
	}
	public void setBcNo(int bcNo) {
		this.bcNo = bcNo;
	}
	public String getBcContent() {
		return bcContent;
	}
	public void setBcContent(String bcContent) {
		this.bcContent = bcContent;
	}
	public int getBdNo() {
		return bdNo;
	}
	public void setBdNo(int bdNo) {
		this.bdNo = bdNo;
	}
	public String getBcWriter() {
		return bcWriter;
	}
	public void setBcWriter(String bcWriter) {
		this.bcWriter = bcWriter;
	}
	public Date getBcRegdate() {
		return bcRegdate;
	}
	public void setBcRegdate(Date bcRegdate) {
		this.bcRegdate = bcRegdate;
	}
	
}
