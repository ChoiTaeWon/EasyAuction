package com.easyauction.mapper;

import java.util.HashMap;
import java.util.List;

import com.easyauction.dto.Auction;
import com.easyauction.dto.AuctionImage;
import com.easyauction.dto.Bidding;
import com.easyauction.dto.Member;

public interface AuctionMapper {
	void insertAuction(Auction auction);
	void insertAuctionPhotoImage(AuctionImage auctionImage);
	List<Auction> getAuctionList();
	Auction getAuctionDetailByAuctioNo(int aucNo);
	void updateAuctionReportCount(int aucNo);
	List<Auction> getAuctionListByAucState();
	void insertAuctionDirectDeal(Auction auction);
	List<Auction> getAuctionListByAucType();
	List<Auction> getAuctionListByAucWriter(String mbId);
	
	List<Auction> getAuctionListByAdmin();
	List<Auction> getAucReportList();
	void setBlindAuction(int aucNo);
	void updateAucStateByDate(int aucNo);
	void updateAucState(HashMap<String, Object> params);
	
	List<Auction> getAuctionSearchList(String aucSearchData);
	List<Auction> getAuctionListForMain();
	void insertFinishedAuctionInfo(HashMap<String, Object> params);
	
}
