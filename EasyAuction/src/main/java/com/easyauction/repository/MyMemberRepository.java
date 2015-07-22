package com.easyauction.repository;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.easyauction.dto.Member;
import com.easyauction.mapper.MemberMapper;

@Repository(value = "memberRepository")//객체등록
public class MyMemberRepository implements MemberRepository {
	
	private MemberMapper memberMapper;
	@Override
	@Autowired
	@Qualifier("memberMapper")
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
	
}
