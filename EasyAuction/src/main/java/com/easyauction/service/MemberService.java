package com.easyauction.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.easyauction.dto.Auction;
import com.easyauction.dto.Member;
import com.easyauction.mapper.MemberMapper;

public interface MemberService {

	public Member getMemberByIdAndPasswd(String mbId, String mbPasswd);

	public int getCountByMemberId(String mbId);

	public Member getMemberById(String mbId);

	public void setRegisterMember(Member member);

	public void setEditMember(Member member);

	public List<Auction> getMyAuctionListBymbId(String mbId);

	HashMap<String, Object> getCountMyAuctionBymbId(String mbId);

	public List<Auction> getGetterAuctionListBymbId(String mbId);

	public int getCountByMemberEmail(String mbId, String email, String mbPasswd);

	public Member getMemberByEmail(String email, String mbId, String mbPasswd);


}
