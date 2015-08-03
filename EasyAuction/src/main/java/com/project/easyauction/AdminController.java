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
import com.easyauction.dto.Auction;
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
		if(member.getMbGrade() == 0){
			member.setMbGrade(0);
		}else if(member.getMbGrade() >= 1 && member.getMbGrade() < 5){
			member.setMbGrade(1);
		}else if(member.getMbGrade() >= 6 && member.getMbGrade() < 15){
			member.setMbGrade(6);
		}else if(member.getMbGrade() >= 16 && member.getMbGrade() < 30){
			member.setMbGrade(16);
		}else if(member.getMbGrade() >= 31 && member.getMbGrade() < 50){
			member.setMbGrade(31);
		}else if(member.getMbGrade() >= 51 && member.getMbGrade() < 70){
			member.setMbGrade(51);
		}else if(member.getMbGrade() >= 71 && member.getMbGrade() < 100){
			member.setMbGrade(71);
		}else{
			member.setMbGrade(101);
		}
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
	@RequestMapping(value = "memberreportlist.action", method = RequestMethod.GET)
	public String memberReportList() {
		return "admin/memberlist";
	}
	@RequestMapping(value = "memberreportlist.action", method = RequestMethod.POST)
	public @ResponseBody List<Member> memberReportList2() {
		List<Member> members2 = adminService.getMemberReportList();
		return members2;
	}
	@RequestMapping(value = "black.action", method = RequestMethod.GET)
	public String blackOut(String mbId) {
		System.out.println(mbId);
		adminService.setBlack(mbId);
		return "admin/memberlist";
	}
	
	
	@RequestMapping(value = "auctionlist.action", method = RequestMethod.GET)
	public String boardList() {
		return "admin/auctionlist";
	}
	@RequestMapping(value = "auctionlist.action", method = RequestMethod.POST)
	public @ResponseBody List<Auction> auctionList() {
		List<Auction> auctions = adminService.getAuctionListByAdmin();
		
		return auctions;
	}
	@RequestMapping(value = "aucreportlist.action", method = RequestMethod.GET)
	public String auctionReportList() {
		return "admin/auctionlist";
	}
	@RequestMapping(value = "aucreportlist.action", method = RequestMethod.POST)
	public @ResponseBody List<Auction> auctionReportList2() {
		List<Auction> auctions2 = adminService.getAucReportList();
		return auctions2;
	}
	@RequestMapping(value = "blind.action", method = RequestMethod.GET)
	public String blind(int aucNo) {
		adminService.setBlindAuction(aucNo);
		return "admin/auctionlist";
	}
}
