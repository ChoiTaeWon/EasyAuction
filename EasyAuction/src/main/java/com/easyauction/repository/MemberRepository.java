package com.easyauction.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.easyauction.dto.Auction;
import com.easyauction.dto.Member;
import com.easyauction.mapper.MemberMapper;

public interface MemberRepository {

	Member getMemberByIdAndPasswd(String mbId, String mbPasswd);

	int getCountByMemberId(String mbId);

	Member getMemberById(String mbId);

	void setRegisterMember(Member member);

	void setEditMember(Member member);

	List<Auction> getMyAuctionListBymbId(String mbId);

	HashMap<String, Object> getCountMyAuctionBymbId(String mbId);

	List<Auction> getGetterAuctionListBymbId(String mbId);


}