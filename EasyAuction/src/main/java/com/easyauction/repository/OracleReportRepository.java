package com.easyauction.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.easyauction.mapper.ReportMapper;

@Repository(value = "reportRepository")
public class OracleReportRepository implements ReportRepository{

	private ReportMapper reportMapper;
	@Autowired
	@Qualifier("reportMapper")
	public void setReportMapper(ReportMapper reportMapper) {
		this.reportMapper = reportMapper;
	}
	
	
}
