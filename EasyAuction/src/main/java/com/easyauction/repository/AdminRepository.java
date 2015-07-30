package com.easyauction.repository;

import java.util.List;

import com.easyauction.dto.Member;

public interface AdminRepository {
	List<Member> getMemberList();
	
	void setMemberDelete(String mbId);
	
	List<Member> getMemberDeleteList();
}
