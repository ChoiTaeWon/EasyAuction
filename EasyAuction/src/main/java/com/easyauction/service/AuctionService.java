package com.easyauction.service;

import java.util.List;

import com.easyauction.dto.Auction;
import com.easyauction.dto.AuctionImage;
import com.easyauction.dto.Bidding;

public interface AuctionService {

	void insertAuction(Auction auction);

	void insertAuctionPhotoImage(AuctionImage auctionImage);

	List<Auction> getAuctionList();

	Auction getAuctionDetailByAuctionNo(int aucNo);

	void updateAuctionReportCount(int aucNo);

	List<Auction> getAuctionListByAucState();

	void insertAuctionDirectDeal(Auction auction);

	

	
	
}
