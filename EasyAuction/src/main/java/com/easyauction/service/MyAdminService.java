package com.easyauction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.easyauction.repository.AdminRepository;

@Service("adminService")
public class MyAdminService implements AdminService{
	
	private AdminRepository adminRepository;
	@Autowired
	@Qualifier("adminRepository")
	public void setAdminRepository(AdminRepository adminRepository) {
		this.adminRepository = adminRepository;
	}
}
