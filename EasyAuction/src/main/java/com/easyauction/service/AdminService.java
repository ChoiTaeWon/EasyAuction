package com.easyauction.service;

import java.util.List;

import com.easyauction.dto.Auction;
import com.easyauction.dto.Member;

public interface AdminService {
	
	List<Member> getMemberList();
	
	void setMemberDelete(String mbId);
	
	List<Member> getMemberDeleteList();
	
	List<Member> getMemberReportList();
	
	void setBlack(String mbId);
	
	List<Auction> getAuctionListByAdmin();
	
	List<Auction> getAucReportList();
	
	void setBlindAuction(int aucNo);
}
