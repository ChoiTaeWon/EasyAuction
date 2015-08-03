package com.easyauction.dto;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class Board implements Serializable{
	
	private int bdNo;
	private int bdType;
	private String bdContent;
	private String bdWriter;
	private String bdTitle;
	private int bdReadCount;
	private Date bdDate;
	private int bdReportingCount;
	private boolean bdBlindCheck;
	private int commentCount;
	
	// 데이터베이스의 Board 와 BoardComment 테이블 간의 1:M 관계를 구현한 필드 
	private List<BoardComment> comments;
	
	private List<BoardImage> boardImage;
		
	public Board() {}
	
	public List<BoardComment> getComments() {
		return comments;
	}

	public void setComments(List<BoardComment> comments) {
		this.comments = comments;
	}

	public int getBdNo() {
		return bdNo;
	}

	public void setBdNo(int bdNo) {
		this.bdNo = bdNo;
	}

	public int getBdType() {
		return bdType;
	}

	public void setBdType(int bdType) {
		this.bdType = bdType;
	}

	public String getBdContent() {
		return bdContent;
	}

	public void setBdContent(String bdContent) {
		this.bdContent = bdContent;
	}

	public String getBdWriter() {
		return bdWriter;
	}

	public void setBdWriter(String bdWriter) {
		this.bdWriter = bdWriter;
	}

	public String getBdTitle() {
		return bdTitle;
	}

	public void setBdTitle(String bdTitle) {
		this.bdTitle = bdTitle;
	}

	public int getBdReadCount() {
		return bdReadCount;
	}

	public void setBdReadCount(int bdReadCount) {
		this.bdReadCount = bdReadCount;
	}

	public Date getBdDate() {
		return bdDate;
	}

	public void setBdDate(Date bdDate) {
		this.bdDate = bdDate;
	}

	public int getBdReportingCount() {
		return bdReportingCount;
	}

	public void setBdReportingCount(int bdReportingCount) {
		this.bdReportingCount = bdReportingCount;
	}

	public boolean isBdBlindCheck() {
		return bdBlindCheck;
	}

	public void setBdBlindCheck(boolean bdBlindCheck) {
		this.bdBlindCheck = bdBlindCheck;
	}

	public List<BoardImage> getboardImage() {
		return boardImage;
	}

	public void setBdImage(List<BoardImage> boardImage) {
		this.boardImage = boardImage;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	
}
