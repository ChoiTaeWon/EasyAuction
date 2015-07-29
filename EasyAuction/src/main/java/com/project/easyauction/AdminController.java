package com.project.easyauction;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.easyauction.dto.Member;
import com.easyauction.service.AdminService;

@Controller
@RequestMapping(value = "admin")
public class AdminController {
	
	@Autowired
	@Qualifier("adminService")
	private AdminService adminService;
	
	@RequestMapping(value = "memberlist.action", method = RequestMethod.POST)
	public @ResponseBody List<Member> dealList() {
		List<Member> members = adminService.getMemberList();
		System.out.println(members.get(0).getMbRegdate());
		return members;
	}
	
	@RequestMapping(value = "memberlist.action", method = RequestMethod.GET)
	public String dealList1() {

		return "admin/memberlist";
	}
}