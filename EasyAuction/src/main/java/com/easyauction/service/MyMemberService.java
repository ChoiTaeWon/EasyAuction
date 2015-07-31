package com.easyauction.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.easyauction.dto.Auction;
import com.easyauction.dto.Member;
import com.easyauction.repository.MemberRepository;

@Service(value="memberService")
public class MyMemberService implements MemberService {
	
	@Autowired
	@Qualifier(value="memberRepository")
	MemberRepository mbrepo;
	//사용할땐 인터페이스를 사용
	@Override
	public Member getMemberByIdAndPasswd(String mbId, String mbPasswd) {
		
		Member member = mbrepo.getMemberByIdAndPasswd(mbId, mbPasswd);
		return member;
	}
	@Override
	public int getCountByMemberId(String mbId) {
		int result = mbrepo.getCountByMemberId(mbId);
		return result;
	}
	@Override
	public Member getMemberById(String mbId) {
		Member member = mbrepo.getMemberById(mbId);
		return member;
	}
	@Override
	public void setRegisterMember(Member member) {
		mbrepo.setRegisterMember(member);
	}
	@Override
	public void setEditMember(Member member) {
		mbrepo.setEditMember(member);
		
	}
	@Override
	public List<Auction> getMyAuctionListBymbId(String mbId) {
		List<Auction> auctions = mbrepo.getMyAuctionListBymbId(mbId);
		
		return auctions;
	}
	@Override
	public HashMap<String, Object> getCountMyAuctionBymbId(String mbId) {
		HashMap<String, Object> countList = mbrepo.getCountMyAuctionBymbId(mbId);
		return countList;
	}
	@Override
	public List<Auction> getGetterAuctionListBymbId(String mbId) {
		List<Auction> getauctions = mbrepo.getGetterAuctionListBymbId(mbId);
		return getauctions;
	}
	@Override
	public int getCountByMemberEmail(String mbId, String email, String mbPasswd) {
		int result = mbrepo.getCountByMemberEmail(mbId, email, mbPasswd);
		return result;
	}
	@Override
	public Member getMemberByEmail(String email, String mbId, String mbPasswd) {
		Member member = mbrepo.getMemberByEmail(mbId, email, mbPasswd);
		return member;
	}
	@Override
	public void setMemberReportingUpdate(String targetmbId) {
		mbrepo.setMemberReportingUpdate(targetmbId);
		
	}

}
