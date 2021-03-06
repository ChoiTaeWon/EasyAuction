package com.easyauction.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.easyauction.dto.Member;
import com.easyauction.mapper.AdminMapper;
import com.easyauction.mapper.AuctionMapper;

@Repository(value="adminRepository")
public class OracleAdminRepository implements AdminRepository{
	
	private AdminMapper adminMapper;
	@Autowired
	@Qualifier("adminMapper")
	public void setAuctionMapper(AdminMapper adminMapper) {
		this.adminMapper = adminMapper;
	}
	
	public List<Member> getMemberList(){
		return adminMapper.getMemberList();
	}
	
	public void setMemberDelete(String mbId){
		adminMapper.setMemberDelete(mbId);
	}
	
	public List<Member> getMemberDeleteList(){
		return adminMapper.getMemberDeleteList();
	}
	public List<Member> getMemberReportList(){
		return adminMapper.getMemberReportList();
	}
	public void setBlack(String mbId){
		adminMapper.setBlack(mbId);
	}
}
