package com.easyauction.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.easyauction.dto.Bidding;
import com.easyauction.mapper.AuctionMapper;
import com.easyauction.mapper.BiddingMapper;

@Repository(value="biddingRepository")
public class OracleBiddingRepository implements BiddingRepository{
	private BiddingMapper biddingMapper;
	@Autowired
	@Qualifier("biddingMapper")
	public void setBiddingMapper(BiddingMapper biddingMapper) {
		this.biddingMapper = biddingMapper;
	}
	
	@Override
	public List<Bidding> getBiddingListByAuctionNo(int aucNo) {
		
		return biddingMapper.getBiddingListByAuctionNo(aucNo);
	}

	@Override
	public int getCountBidders(int aucNo) {
		// TODO Auto-generated method stub
		return biddingMapper.getCountBidders(aucNo);
	}

	@Override
	public void insertBiddingPrice(Bidding bidding) {
		// TODO Auto-generated method stub
		 biddingMapper.insertBiddingPrice(bidding);
	}

	@Override
	public Bidding getBiddingByBidNo(int bidNo) {
		// TODO Auto-generated method stub
		return biddingMapper.getBiddingByBidNo(bidNo);
	}

	@Override
	public void insertFirstBidding(Bidding bidding) {
		// TODO Auto-generated method stub
		biddingMapper.insertFirstBidding(bidding);
	}

	@Override
	public String getLastBidder(int aucNo) {
		// TODO Auto-generated method stub
		return biddingMapper.getLastBidder(aucNo);
	}

	@Override
	public List<Bidding> getIpchalList(int bidNo, int aucNo) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("bidNo", bidNo);
		params.put("aucNo", aucNo);
		
		return biddingMapper.getIpchalList(params);
	}

	@Override
	public int getMaxBiddingNo(int aucNo) {
		// TODO Auto-generated method stub
		return biddingMapper.getMaxBiddingNo(aucNo);
	}

	

	
	
	
	
}
