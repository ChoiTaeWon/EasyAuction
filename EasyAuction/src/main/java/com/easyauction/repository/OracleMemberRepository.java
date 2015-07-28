package com.easyauction.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.easyauction.dto.Auction;
import com.easyauction.dto.Member;
import com.easyauction.mapper.MemberMapper;

@Repository(value = "memberRepository")//객체등록
public class OracleMemberRepository implements MemberRepository {
	
	private MemberMapper memberMapper;
	@Autowired
	@Qualifier(value="memberMapper")
	public void setMemberMapper(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}	
	
	
	@Override
	public Member getMemberByIdAndPasswd(String mbId, String mbPasswd){
		HashMap<String, String> params= new HashMap<String, String>();
		params.put("mbId", mbId);
		params.put("mbPasswd", mbPasswd);
		
		Member member = memberMapper.getMemberByIdAndPasswd(params);
		return member;
	}


	@Override
	public int getCountByMemberId(String mbId) {
		int result= memberMapper.getCountByMemberId(mbId);
		return result;
	}


	@Override
	public Member getMemberById(String mbId) {
		Member member = memberMapper.getMemberById(mbId);
		return member;
	}


	@Override
	public void setRegisterMember(Member member) {
		memberMapper.setRegisterMember(member);
		
	}


	@Override
	public void setEditMember(Member member) {
		memberMapper.setEditMember(member);
	}


	@Override
	public List<Auction> getMyAuctionListBymbId(String mbId) {
		List<Auction> auctions = memberMapper.getMyAuctionListBymbId(mbId);
		return auctions;
	}


	@Override
	public HashMap<String, Object> getCountMyAuctionBymbId(String mbId) {
			HashMap<String, Object> countList = memberMapper.getCountMyAuctionBymbId(mbId);
		return countList;
	}

	
}
