package com.easyauction.mapper;

import java.util.List;

import com.easyauction.dto.Auction;
import com.easyauction.dto.AuctionImage;

public interface AuctionMapper {
	void insertAuction(Auction auction);
	void insertAuctionPhotoImage(AuctionImage auctionImage);
	List<Auction> getAuctionList();
	
	
}
