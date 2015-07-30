package com.easyauction.service;

import java.util.List;

import com.easyauction.dto.Bidding;

public interface BiddingService {

	List<Bidding> getBiddingListByAuctionNo(int aucNo);

	int getCountBidders(int aucNo);

	void insertBiddingPrice(Bidding bidding);

	Bidding getBiddingByBidNo(int bidNo);

	void insertFirstBidding(Bidding bidding);

	String getLastBidder(int aucNo);

	List<Bidding> getIpchalList(int bidNo, int aucNo);

	int getMaxBiddingNo(int aucNo);


}
