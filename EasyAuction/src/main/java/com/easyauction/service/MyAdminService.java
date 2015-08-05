package com.easyauction.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.easyauction.dto.Auction;
import com.easyauction.dto.AuctionReporting;
import com.easyauction.dto.Board;
import com.easyauction.dto.Member;
import com.easyauction.dto.MemberReporting;
import com.easyauction.repository.AdminRepository;
import com.easyauction.repository.AuctionRepository;
import com.easyauction.repository.BoardRepository;
import com.easyauction.repository.ReportRepository;

@Service("adminService")
public class MyAdminService implements AdminService{
	
	private AdminRepository adminRepository;
	@Autowired
	@Qualifier("adminRepository")
	public void setAdminRepository(AdminRepository adminRepository) {
		this.adminRepository = adminRepository;
	}
	private BoardRepository boardRepository;
	@Autowired
	@Qualifier("boardRepository")
	public void setBoardRepository(BoardRepository boardRepository) {
		this.boardRepository = boardRepository;
	}
	private AuctionRepository auctionRepository;
	@Autowired
	@Qualifier("auctionRepository")
	public void setAuctionRepository(AuctionRepository auctionRepository) {
		this.auctionRepository = auctionRepository;
	}
	private ReportRepository reportRepository;
	@Autowired
	@Qualifier("reportRepository")
	public void setReportRepository(ReportRepository reportRepository){
		this.reportRepository = reportRepository;
		
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
	public List<MemberReporting> getMrpList(){
		return reportRepository.getMrpList();
	}
	public List<AuctionReporting> getAucpList(){
		return reportRepository.getAucpList();
	}
	public void updateAucState(HashMap<String, Object> params){
		auctionRepository.updateAucState(params);
	}
	
	public List<Board> getBoardList(){
		return boardRepository.getBoardList();
	}
	public List<Board> getBoardReportList(){
		return boardRepository.getBoardReportList();
	}
}
