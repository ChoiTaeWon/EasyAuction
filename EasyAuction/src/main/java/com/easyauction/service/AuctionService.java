package com.easyauction.service;

import com.easyauction.dto.Auction;
import com.easyauction.dto.AuctionImage;

public interface AuctionService {

	void insertAuction(Auction auction);

	void insertAuctionPhotoImage(AuctionImage auctionImage);
	
	
}
