package com.easyauction.repository;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.easyauction.dto.AuctionReporting;
import com.easyauction.dto.BoardReporting;
import com.easyauction.dto.MemberReporting;
import com.easyauction.mapper.ReportMapper;

@Repository(value = "reportRepository")
public class OracleReportRepository implements ReportRepository{

	private ReportMapper reportMapper;
	@Autowired
	@Qualifier("reportMapper")
	public void setReportMapper(ReportMapper reportMapper) {
		this.reportMapper = reportMapper;
	}
	
	@Override
	public void insertAuctionReportingByTargetNo(AuctionReporting auctionReporting) {
		reportMapper.insertAuctionReportingByTargetNo(auctionReporting);
	}

	@Override
	public int getResultReportCheck(String mbId, int aucNo) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("mbId", mbId);
		params.put("aucNo", aucNo);
		
		return reportMapper.getResultReportCheck(params);
	}

	@Override
	public void insertMemberReportingBytargetmbId(MemberReporting memberReporting) {
		
		reportMapper.insertMemberReportingBytargetmbId(memberReporting);
		
	}

	@Override
	public int getResultMemberReportCheck(String mbId, String receiver) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("mbId", mbId);
		params.put("receiver", receiver);
		
		return reportMapper.getResultMemberReportCheck(params);
	}
	
	
}
