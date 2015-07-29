package com.easyauction.mapper;

import java.util.HashMap;
import java.util.List;

import com.easyauction.dto.Bidding;

public interface BiddingMapper {

	List<Bidding> getBiddingListByAuctionNo(int aucNo);

	int getCountBidders(int aucNo);

	void insertBiddingPrice(Bidding bidding);

	Bidding getBiddingByBidNo(int bidNo);

	void insertFirstBidding(Bidding bidding);

	String getLastBidder(int aucNo);

	List<Bidding> getIpchalList(HashMap<String, Object> params);

	int getMaxBiddingNo();

	int getMaxBiddingNo(int aucNo);

}
