package com.easyauction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.easyauction.repository.ReportRepository;

@Service("reportService")
public class MyReportService implements ReportService {
	
	private ReportRepository reportRepository;
	@Autowired
	@Qualifier("reportRepository")
	public void setReportRepository(ReportRepository reportRepository) {
		this.reportRepository = reportRepository;
	}
	
	

	
	
}
