package com.easyauction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.easyauction.dto.Auction;
import com.easyauction.dto.AuctionImage;
import com.easyauction.dto.Bidding;
import com.easyauction.dto.Board;
import com.easyauction.dto.BoardImage;
import com.easyauction.repository.AuctionRepository;
import com.easyauction.repository.BiddingRepository;
import com.easyauction.repository.BoardRepository;

@Service("biddingService")
public class MyBiddingService implements BiddingService{

	private BiddingRepository biddingRepository;
	@Autowired
	@Qualifier("biddingRepository")
	public void setBiddingRepository(BiddingRepository biddingRepository) {
		this.biddingRepository = biddingRepository;
	}
	@Override
	public List<Bidding> getBiddingListByAuctionNo(int aucNo) {
		
		return biddingRepository.getBiddingListByAuctionNo(aucNo);
	}
	@Override
	public int getCountBidders(int aucNo) {
		// TODO Auto-generated method stub
		return biddingRepository.getCountBidders(aucNo);
	}
	@Override
	public void insertBiddingPrice(Bidding bidding) {
		 biddingRepository.insertBiddingPrice(bidding);
	}
	@Override
	public Bidding getBiddingByBidNo(int bidNo) {
		// TODO Auto-generated method stub
		return biddingRepository.getBiddingByBidNo(bidNo);
	}
	@Override
	public void insertFirstBidding(Bidding bidding) {
		 biddingRepository.insertFirstBidding(bidding);
		
	}
	@Override
	public String getLastBidder(int aucNo) {
		return biddingRepository.getLastBidder(aucNo);
	}
	@Override
	public List<Bidding> getIpchalList(int bidNo, int aucNo) {
		// TODO Auto-generated method stub
		return biddingRepository.getIpchalList(bidNo, aucNo);
	}

	@Override
	public int getMaxBiddingNo(int aucNo) {
		// TODO Auto-generated method stub
		return biddingRepository.getMaxBiddingNo(aucNo);
	}
	@Override
	public Bidding getLastBidInfo(int aucNo) {
		// TODO Auto-generated method stub
		return biddingRepository.getLastBidInfo(aucNo);
	}
	
	
	
	

	
	
	


}
