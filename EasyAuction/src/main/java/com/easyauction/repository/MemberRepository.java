package com.easyauction.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.easyauction.dto.Member;
import com.easyauction.mapper.MemberMapper;

public interface MemberRepository {

	void setMemberMapper(MemberMapper memberMapper);

	Member getMemberByIdAndPasswd(String mbId, String mbPasswd);

}