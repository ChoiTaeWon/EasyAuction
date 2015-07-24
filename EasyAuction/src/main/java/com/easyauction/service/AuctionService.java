package com.easyauction.service;

import java.util.List;

import com.easyauction.dto.Auction;
import com.easyauction.dto.AuctionImage;

public interface AuctionService {

	void insertAuction(Auction auction);

	void insertAuctionPhotoImage(AuctionImage auctionImage);

	List<Auction> getAuctionList();
	
	
}
