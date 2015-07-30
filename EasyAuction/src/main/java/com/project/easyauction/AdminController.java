package com.project.easyauction;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.easyauction.common.Util;
import com.easyauction.dto.Member;
import com.easyauction.service.AdminService;
import com.easyauction.service.MemberService;

@Controller
@RequestMapping(value = "admin")
public class AdminController {
	
	@Autowired
	@Qualifier("adminService")
	private AdminService adminService;
	
	
	@Autowired
	@Qualifier(value="memberService")
	private MemberService memberService;
	
	@InitBinder
	 public void initBinder(WebDataBinder binder) {

	 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	 dateFormat.setLenient(false);
	 binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	 }
	
	@RequestMapping(value = "memberlist.action", method = RequestMethod.POST)
	public @ResponseBody List<Member> dealList() {
		List<Member> members = adminService.getMemberList();
		return members;
	}
	
	@RequestMapping(value = "memberlist.action", method = RequestMethod.GET)
	public String dealList1() {

		return "admin/memberlist";
	}
	
	@RequestMapping(value = "memberview.action", method = RequestMethod.GET)
	public ModelAndView view(String mbId) {
		Member member = memberService.getMemberById(mbId);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/membereditview");
		mav.addObject("member", member);
		
		return mav; 
	}
	@RequestMapping(value = "memberedit.action", method = RequestMethod.POST)
	public ModelAndView memberEdit(//MultipartHttpServletRequest req,//form을 맴버 객체로 받기위해서 써야함
			Member member) {
		if(member.getMbPasswd()!=null && member.getMbPasswd().length() > 0){
			member.setMbPasswd(Util.getHashedString(member.getMbPasswd(), "SHA-1"));
		}
		memberService.setEditMember(member);
		Member member1 = memberService.getMemberById(member.getMbId());
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/membereditview");
		mav.addObject("member", member1);
		
		return mav; 
	}
	@RequestMapping(value = "memberdelete.action", method = RequestMethod.GET)
	public String deleteMamber(String mbId) {
		
		adminService.setMemberDelete(mbId);
		
		return "admin/memberlist"; 
	}
	@RequestMapping(value = "memberdeletlist.action", method = RequestMethod.POST)
	public @ResponseBody List<Member> memberDeleteList() {
		List<Member> members = adminService.getMemberDeleteList();
		return members;
	}
}