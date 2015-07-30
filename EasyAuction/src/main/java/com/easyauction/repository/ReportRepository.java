package com.easyauction.repository;

import com.easyauction.dto.AuctionReporting;
import com.easyauction.dto.BoardReporting;

public interface ReportRepository {

	void insertAuctionReportingByTargetNo(AuctionReporting auctionReporting);

	int getResultReportCheck(String mbId, int aucNo);

}
