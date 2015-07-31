package com.easyauction.mapper;

import java.util.HashMap;
import java.util.List;

import com.easyauction.dto.Auction;
import com.easyauction.dto.Member;
/*
 * MemberMapper.xml 파일의 내용에 기초해서 MyBatis가 내부적으로 클래스를 만들고 그것을 실행
 * -> 스프링-마이바티스가 내부적으로 만든 클래스를 코드에서 직접 접근하기 위해 인터페이스를 정의하고 연결
 */
public interface MemberMapper {

	Member getMemberByIdAndPasswd(HashMap<String, String> params);

	int getCountByMemberId(String mbId);

	Member getMemberById(String mbId);

	void setRegisterMember(Member member);

	void setEditMember(Member member);

	List<Auction> getMyAuctionListBymbId(String mbId);

	HashMap<String, Object> getCountMyAuctionBymbId(String mbId);

	List<Auction> getGetterAuctionListBymbId(String mbId);

	int getCountByMemberEmail(HashMap<String, String> params);

	Member getMemberByEmail(HashMap<String, String> params);

	void setMemberReportingUpdate(String targetmbId);

}
