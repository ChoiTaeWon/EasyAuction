package com.easyauction.dto;

import java.util.Date;
import java.util.List;

public class Auction {
	private	int aucNo;
	private	String aucTitle;
	private	Date aucStartDate;
	private	Date aucEndDate;
	private	String aucItemName;
	private	int aucCategory;
	private	String aucDetail;
	private	int aucStartPrice;
	private	int aucFinalPrice;
	private	String aucState;
	private	Date aucRegdate;
	private	int aucReportingCount;
	private	boolean aucBlindCheck;
	private	boolean aucType;
	private	int aucReadCount;
	private	String aucWriter;
	private String aucAdText;
	private String aucGetter;
///////////////////////////////////////////////////////////////////////////
	private List<AuctionImage> auctionImage;
	public List<AuctionImage> getAuctionImage() {
		return auctionImage;
	}
	public void setAuctionImage(List<AuctionImage> auctionImage) {
		this.auctionImage = auctionImage;
	}
	
/////////////////////////////////////////////////////////////////////////////	
	private Bidding bidding;
	public Bidding getBidding() {
		return bidding;
	}
	public void setBidding(Bidding bidding) {
		this.bidding = bidding;
	}
///////////////////////////////////////////////////////////////////////////
	private int countBidders;
	public int getCountBidders() {
		return countBidders;
	}
	public void setCountBidders(int countBidders) {
		this.countBidders = countBidders;
	}
/////////////////////////////////////////////////////////////////////////
	
	public int getAucNo() {
		return aucNo;
	}
	public void setAucNo(int aucNo) {
		this.aucNo = aucNo;
	}
	public String getAucTitle() {
		return aucTitle;
	}
	public void setAucTitle(String aucTitle) {
		this.aucTitle = aucTitle;
	}
	public Date getAucStartDate() {
		return aucStartDate;
	}
	public void setAucStartDate(Date aucStartDate) {
		this.aucStartDate = aucStartDate;
	}
	public Date getAucEndDate() {
		return aucEndDate;
	}
	public void setAucEndDate(Date aucEndDate) {
		this.aucEndDate = aucEndDate;
	}
	public String getAucItemName() {
		return aucItemName;
	}
	public void setAucItemName(String aucItemName) {
		this.aucItemName = aucItemName;
	}
	public int getAucCategory() {
		return aucCategory;
	}
	public void setAucCategory(int aucCategory) {
		this.aucCategory = aucCategory;
	}
	public String getAucDetail() {
		return aucDetail;
	}
	public void setAucDetail(String aucDetail) {
		this.aucDetail = aucDetail;
	}
	public int getAucStartPrice() {
		return aucStartPrice;
	}
	public void setAucStartPrice(int aucStartPrice) {
		this.aucStartPrice = aucStartPrice;
	}
	public int getAucFinalPrice() {
		return aucFinalPrice;
	}
	public void setAucFinalPrice(int aucFinalPrice) {
		this.aucFinalPrice = aucFinalPrice;
	}
	public String getAucState() {
		return aucState;
	}
	public void setAucState(String aucState) {
		this.aucState = aucState;
	}
	public Date getAucRegdate() {
		return aucRegdate;
	}
	public void setAucRegdate(Date aucRegdate) {
		this.aucRegdate = aucRegdate;
	}
	public int getAucReportingCount() {
		return aucReportingCount;
	}
	public void setAucReportingCount(int aucReportingCount) {
		this.aucReportingCount = aucReportingCount;
	}
	public boolean isAucBlindCheck() {
		return aucBlindCheck;
	}
	public void setAucBlindCheck(boolean aucBlindCheck) {
		this.aucBlindCheck = aucBlindCheck;
	}
	public boolean isAucType() {
		return aucType;
	}
	public void setAucType(boolean aucType) {
		this.aucType = aucType;
	}
	public int getAucReadCount() {
		return aucReadCount;
	}
	public void setAucReadCount(int aucReadCount) {
		this.aucReadCount = aucReadCount;
	}
	public String getAucWriter() {
		return aucWriter;
	}
	public void setAucWriter(String aucWriter) {
		this.aucWriter = aucWriter;
	}
	
	public String getAucAdText() {
		return aucAdText;
	}
	public void setAucAdText(String aucAdText) {
		this.aucAdText = aucAdText;
	}
	public String getAucGetter() {
		return aucGetter;
	}
	public void setAucGetter(String aucGetter) {
		this.aucGetter = aucGetter;
	}	
}
