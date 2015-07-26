package com.easyauction.repository;

import java.util.List;

import com.easyauction.dto.Auction;
import com.easyauction.dto.AuctionImage;
import com.easyauction.dto.Bidding;
import com.easyauction.dto.Board;
import com.easyauction.dto.BoardImage;

public interface AuctionRepository {

	void insertAuction(Auction auction);

	void insertAuctionPhotoImage(AuctionImage auctionImage);

	List<Auction> getAuctionList();

	Auction getAuctionDetailByAuctionNo(int aucNo);


	
	

}
