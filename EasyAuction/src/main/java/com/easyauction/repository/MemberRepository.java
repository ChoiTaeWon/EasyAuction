package com.easyauction.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.easyauction.dto.Member;
import com.easyauction.mapper.MemberMapper;

public interface MemberRepository {

	Member getMemberByIdAndPasswd(String mbId, String mbPasswd);

	int getCountByMemberId(String mbId);

}