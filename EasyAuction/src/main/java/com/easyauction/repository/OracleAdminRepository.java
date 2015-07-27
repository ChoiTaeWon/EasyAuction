package com.easyauction.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.easyauction.mapper.AuctionMapper;

@Repository(value="adminRepository")
public class OracleAdminRepository implements AdminRepository{
	
	private AuctionMapper auctionMapper;
	@Autowired
	@Qualifier("auctionMapper")
	public void setAuctionMapper(AuctionMapper auctionMapper) {
		this.auctionMapper = auctionMapper;
	}
}
