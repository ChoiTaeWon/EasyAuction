package com.easyauction.dto;
import java.util.Date;

public class Bidding {
	private	int	bidNo;
	private	boolean	bidGetterCheck;
	private	int	aucNo;
	private	int	bidPrice;
	private	String mbId;
	private	Date bidDate;
	
	public int getBidNo() {
		return bidNo;
	}
	public void setBidNo(int bidNo) {
		this.bidNo = bidNo;
	}
	public boolean isBidGetterCheck() {
		return bidGetterCheck;
	}
	public void setBidGetterCheck(boolean bidGetterCheck) {
		this.bidGetterCheck = bidGetterCheck;
	}
	public int getAucNo() {
		return aucNo;
	}
	public void setAucNo(int aucNo) {
		this.aucNo = aucNo;
	}

	public String getMbId() {
		return mbId;
	}
	public void setMbId(String mbId) {
		this.mbId = mbId;
	}
	public int getBidPrice() {
		return bidPrice;
	}
	public void setBidPrice(int bidPrice) {
		this.bidPrice = bidPrice;
	}

	public Date getBidDate() {
		return bidDate;
	}
	public void setBidDate(Date bidDate) {
		this.bidDate = bidDate;
	}
	
	

}
