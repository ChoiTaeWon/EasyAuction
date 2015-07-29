package com.easyauction.service;

import java.util.List;

import com.easyauction.dto.Bidding;

public interface BiddingService {

	List<Bidding> getBiddingListByAuctionNo(int aucNo);

	Bidding getExceptBidder(int aucNo);

	int getCountBidders(int aucNo);

	void insertBiddingPrice(Bidding bidding);

	Bidding getBiddingByBidNo(int bidNo);

	void insertFirstBidding(Bidding bidding);


}
