package com.easyauction.repository;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.easyauction.dto.Auction;
import com.easyauction.dto.AuctionImage;
import com.easyauction.dto.Bidding;
import com.easyauction.dto.Board;
import com.easyauction.mapper.AuctionMapper;

@Repository(value="auctionRepository")
public class OracleAuctionRepository implements AuctionRepository{
	
	private AuctionMapper auctionMapper;
	@Autowired
	@Qualifier("auctionMapper")
	public void setAuctionMapper(AuctionMapper auctionMapper) {
		this.auctionMapper = auctionMapper;
	}
	
	
	@Override
	public void insertAuction(Auction auction) {
		// TODO Auto-generated method stub
		auctionMapper.insertAuction(auction);
		
	}
	@Override
	public void insertAuctionPhotoImage(AuctionImage auctionImage) {
		
		auctionMapper.insertAuctionPhotoImage(auctionImage);
	}


	@Override
	public List<Auction> getAuctionList() {
		
		return auctionMapper.getAuctionList();
	}


	@Override
	public Auction getAuctionDetailByAuctionNo(int aucNo) {
		
		return auctionMapper.getAuctionDetailByAuctioNo(aucNo);
	}


	@Override
	public void updateAuctionReportCount(int aucNo) {
		// TODO Auto-generated method stub
		auctionMapper.updateAuctionReportCount(aucNo);
	}


	@Override
	public List<Auction> getAuctionListByAucState() {
		// TODO Auto-generated method stub
		return auctionMapper.getAuctionListByAucState();
	}


	@Override
	public void insertAuctionDirectDeal(Auction auction) {
		// TODO Auto-generated method stub
		auctionMapper.insertAuctionDirectDeal(auction);
	}




}
