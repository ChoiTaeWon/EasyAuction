package com.easyauction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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

}
