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

	List<Auction> getAuctionListByAucType();

	List<Auction> getAuctionListByAucWriter(String mbId);

	void updateAucStateByDate(int aucNo);

	List<Auction> getAuctionSearchList(String aucSearchData);

	List<Auction> getAuctionListForMain();

	void insertFinishedAuctionInfo(int finalPrice, String aucGetter, int aucNo);

	

	

	
	
}
