package com.easyauction.mapper;

import java.util.HashMap;

import com.easyauction.dto.AuctionReporting;

public interface ReportMapper {

	void insertAuctionReportingByTargetNo(AuctionReporting auctionReporting);

	int getResultReportCheck(HashMap<String, Object> params);

}
