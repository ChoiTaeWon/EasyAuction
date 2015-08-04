package com.easyauction.mapper;

import java.util.HashMap;
import java.util.List;

import com.easyauction.dto.AuctionReporting;
import com.easyauction.dto.MemberReporting;

public interface ReportMapper {

	void insertAuctionReportingByTargetNo(AuctionReporting auctionReporting);

	int getResultReportCheck(HashMap<String, Object> params);

	void insertMemberReportingBytargetmbId(MemberReporting memberReporting);

	int getResultMemberReportCheck(HashMap<String, Object> params);
	
	List<MemberReporting> getMrpList();
	
	List<AuctionReporting> getAucpList();
}
