package com.easyauction.service;

import java.util.List;

import com.easyauction.dto.Member;

public interface AdminService {
	
	List<Member> getMemberList();
	
	void setMemberDelete(String mbId);
	
	List<Member> getMemberDeleteList();
}
