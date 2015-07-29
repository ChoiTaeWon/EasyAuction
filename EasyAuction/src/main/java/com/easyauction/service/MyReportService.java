package com.easyauction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.easyauction.dto.AuctionReporting;
import com.easyauction.dto.BoardReporting;
import com.easyauction.repository.ReportRepository;

@Service("reportService")
public class MyReportService implements ReportService {
	
	private ReportRepository reportRepository;
	@Autowired
	@Qualifier("reportRepository")
	public void setReportRepository(ReportRepository reportRepository) {
		this.reportRepository = reportRepository;
	}
	

	@Override
	public void insertAuctionReportingByTargetNo(AuctionReporting auctionReporting) {
		reportRepository.insertAuctionReportingByTargetNo(auctionReporting);
		
	}


	@Override
	public int getResultReportCheck(String mbId, int aucNo) {
		
		return reportRepository.getResultReportCheck(mbId, aucNo);
	}
	
	

	
	
}
