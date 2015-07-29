package com.easyauction.service;

import com.easyauction.dto.AuctionReporting;
import com.easyauction.dto.BoardReporting;

public interface ReportService {

	void insertAuctionReportingByTargetNo(AuctionReporting auctionReporting);

	int getResultReportCheck(String mbId, int aucNo);

	

}
