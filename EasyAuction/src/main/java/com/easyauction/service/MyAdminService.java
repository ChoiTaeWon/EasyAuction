package com.easyauction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.easyauction.dto.Auction;
import com.easyauction.dto.Member;
import com.easyauction.repository.AdminRepository;
import com.easyauction.repository.AuctionRepository;

@Service("adminService")
public class MyAdminService implements AdminService{
	
	private AdminRepository adminRepository;
	@Autowired
	@Qualifier("adminRepository")
	public void setAdminRepository(AdminRepository adminRepository) {
		this.adminRepository = adminRepository;
	}
	
	private AuctionRepository auctionRepository;
	@Autowired
	@Qualifier("auctionRepository")
	public void setAuctionRepository(AuctionRepository auctionRepository) {
		this.auctionRepository = auctionRepository;
	}
	
	public List<Member> getMemberList(){
		return adminRepository.getMemberList();
	}
	
	public void setMemberDelete(String mbId){
		adminRepository.setMemberDelete(mbId);
	}
	
	public List<Member> getMemberDeleteList(){
		return adminRepository.getMemberDeleteList();
	}
	public List<Member> getMemberReportList(){
		return adminRepository.getMemberReportList();
	}
	
	public void setBlack(String mbId){
		adminRepository.setBlack(mbId);
	}
	
	public List<Auction> getAuctionListByAdmin(){
		return auctionRepository.getAuctionListByAdmin();
	}
	public List<Auction> getAucReportList(){
		return auctionRepository.getAucReportList();
	}
	public void setBlindAuction(int aucNo){
		auctionRepository.setBlindAuction(aucNo);
	}
	
}
