package com.easyauction.repository;

import com.easyauction.dto.AuctionReporting;
import com.easyauction.dto.BoardReporting;
import com.easyauction.dto.MemberReporting;

public interface ReportRepository {

	void insertAuctionReportingByTargetNo(AuctionReporting auctionReporting);

	int getResultReportCheck(String mbId, int aucNo);

	void insertMemberReportingBytargetmbId(MemberReporting memberReporting);

	int getResultMemberReportCheck(String mbId, String receiver);

}
