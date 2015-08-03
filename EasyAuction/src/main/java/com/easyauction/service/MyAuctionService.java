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
import com.easyauction.repository.BoardRepository;

@Service("auctionService")
public class MyAuctionService implements AuctionService{

	private AuctionRepository auctionRepository;
	@Autowired
	@Qualifier("auctionRepository")
	public void setAuctionRepository(AuctionRepository auctionRepository) {
		this.auctionRepository = auctionRepository;
	}
	
	
	
	@Override
	public void insertAuction(Auction auction) {
		// TODO Auto-generated method stub
		auctionRepository.insertAuction(auction);
	}
	

	@Override
	public void insertAuctionPhotoImage(AuctionImage auctionImage) {
		auctionRepository.insertAuctionPhotoImage(auctionImage);
		
	}



	@Override
	public List<Auction> getAuctionList() {
		
		return auctionRepository.getAuctionList();
	}



	@Override
	public Auction getAuctionDetailByAuctionNo(int aucNo) {
		// TODO Auto-generated method stub
		return auctionRepository.getAuctionDetailByAuctionNo(aucNo);
	}



	@Override
	public void updateAuctionReportCount(int aucNo) {
		auctionRepository.updateAuctionReportCount(aucNo);
		
	}



	@Override
	public List<Auction> getAuctionListByAucState() {
		// TODO Auto-generated method stub
		return auctionRepository.getAuctionListByAucState();
	}



	@Override
	public void insertAuctionDirectDeal(Auction auction) {
		auctionRepository.insertAuctionDirectDeal(auction);
	}



	@Override
	public List<Auction> getAuctionListByAucType() {
		return auctionRepository.getAuctionListByAucType();
	}



	@Override
	public List<Auction> getAuctionListByAucWriter(String mbId) {
		// TODO Auto-generated method stub
		return auctionRepository.getAuctionListByAucWriter(mbId);
	}




}
