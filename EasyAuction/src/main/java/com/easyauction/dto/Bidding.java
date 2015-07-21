package com.easyauction.dto;
import java.util.Date;

public class Bidding {
	private	int	bidNo;
	private	boolean	bidGetterCheck;
	private	int	aucNo;
	private	int	bidPrice;
	private	String mbNo;
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
	public int getBidPrice() {
		return bidPrice;
	}
	public void setBidPrice(int bidPrice) {
		this.bidPrice = bidPrice;
	}
	public String getMbNo() {
		return mbNo;
	}
	public void setMbNo(String mbNo) {
		this.mbNo = mbNo;
	}
	public Date getBidDate() {
		return bidDate;
	}
	public void setBidDate(Date bidDate) {
		this.bidDate = bidDate;
	}
	
	

}
