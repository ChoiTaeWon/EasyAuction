package com.easyauction.repository;

import java.util.List;

import com.easyauction.dto.Bidding;

public interface BiddingRepository {

	List<Bidding> getBiddingListByAuctionNo(int aucNo);

	int getCountBidders(int aucNo);

	void insertBiddingPrice(Bidding bidding);

	Bidding getBiddingByBidNo(int bidNo);

	void insertFirstBidding(Bidding bidding);

	String getLastBidder(int aucNo);

	List<Bidding> getIpchalList(int bidNo, int aucNo);

	int getMaxBiddingNo(int aucNo);

}
