package com.project.easyauction;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.easyauction.common.Util;
import com.easyauction.dto.Auction;
import com.easyauction.dto.Member;
import com.easyauction.service.MemberService;


@Controller
@RequestMapping(value = "member")
public class MemberController {
	
	private MemberService mbsvc;
	@Autowired
	@Qualifier(value="memberService")
	public void setMemberService(MemberService mbsvc){
		this.mbsvc = mbsvc;
	}
	
	@InitBinder
	 public void initBinder(WebDataBinder binder) {

	 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	 dateFormat.setLenient(false);
	 binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	 }
	
	
	@RequestMapping(value = "register.action", method = RequestMethod.GET)
	public String register() {
		
		return "member/memberregisterform";
	}
	
	@RequestMapping(value = "register.action", method = RequestMethod.POST)
	public String registerMember(MultipartHttpServletRequest req,//form을 맴버 객체로 받기위해서 써야함
			Member member) {
		
		member.setMbPasswd(Util.getHashedString(member.getMbPasswd(), "SHA-1"));
		mbsvc.setRegisterMember(member);
		
		return "redirect:/home.action";
	}
	@RequestMapping(value = "view.action", method = RequestMethod.GET)
	public ModelAndView view(String mbId) {
		Member member = mbsvc.getMemberById(mbId);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/membereditviewform");
		mav.addObject("member", member);
		
		return mav; 
	}
	@RequestMapping(value = "viewmypage.action", method = RequestMethod.GET)
	public ModelAndView viewMypage(String mbId) {
		
		List<Auction> auctions = mbsvc.getMyAuctionListBymbId(mbId);
		HashMap<String, Object> countList = mbsvc.getCountMyAuctionBymbId(mbId);
		List<Auction> getauctions = mbsvc.getGetterAuctionListBymbId(mbId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/mypage");
		mav.addObject("auctions", auctions);
		mav.addObject("getauctions", getauctions);
		mav.addObject("mbId", mbId);
		mav.addObject("countList", countList);
		
		return mav;
	}
	@RequestMapping(value = "edit.action", method = RequestMethod.POST)
	public ModelAndView memberEdit(//MultipartHttpServletRequest req,//form을 맴버 객체로 받기위해서 써야함
			Member member) {
		if(member.getMbPasswd()!=null && member.getMbPasswd().length() > 0){
			member.setMbPasswd(Util.getHashedString(member.getMbPasswd(), "SHA-1"));
		}
		mbsvc.setEditMember(member);
		Member member1 = mbsvc.getMemberById(member.getMbId());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/membereditviewform");
		mav.addObject("member", member1);
		
		return mav; 
	}

	@RequestMapping(value = "email.action", method = RequestMethod.GET)
	public ModelAndView emailform(String locationurl) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/emailpasswd");
		mav.addObject("locationurl", locationurl);
	
		return mav; 
	}
	@RequestMapping(value = "email.action", method = RequestMethod.POST)
	public ModelAndView emailsend(String locationurl, String email, String mbId, String mbPasswd) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mainpage");
		mav.addObject("locationurl", locationurl);
		if(mbPasswd != null){
			mbPasswd = Util.getHashedString(mbPasswd, "SHA-1");
		}
		Member member = mbsvc.getMemberByEmail(email, mbId, mbPasswd);
		
		if(email != null){
			String host = "smtp.gmail.com";
			String username = "emilykeilyn3@gmail.com";
			String password = "zxcv123zxcv123";

			// 메일 내용
			String recipient = email;
			String subject = "";
			String body = "";
			if(locationurl.equals("findPasswd")){
				Random rnd = new Random();
				StringBuffer newmbpasswd = new StringBuffer();
				for (int i = 0; i < 20; i++) {
					if (rnd.nextBoolean()) {
						newmbpasswd.append((char) ((int) (rnd.nextInt(26)) + 97));
					} else {
						newmbpasswd.append((rnd.nextInt(10)));
					}
				}
				subject = "easyacution 비밀번호 찾기 결과";
				body = "새 임시 비밀번호<br /> <b>" + newmbpasswd + "</b>";
				
				member.setMbPasswd(Util.getHashedString(newmbpasswd.toString(), "SHA-1"));
				mbsvc.setEditMember(member);
				
			}else{
				subject = "easyacution 아이디 찾기 결과";
				body = "당신의 아이디는  <b>" + member.getMbId() + "</b> 입니다.";
			}
			

			// properties 설정
			Properties props = new Properties();
			props.put("mail.smtps.auth", "true");
			// 메일 세션
			Session session = Session.getDefaultInstance(props);
			MimeMessage msg = new MimeMessage(session);

			try {
				// 메일 관련
				msg.setSubject(subject);
				msg.setContent(body, "text/html; charset=utf-8");
				msg.setFrom(new InternetAddress(username));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
						recipient));

				// 발송 처리
				Transport transport = session.getTransport("smtps");
				transport.connect(host, username, password);
				transport.sendMessage(msg, msg.getAllRecipients());
				transport.close();
			} catch (Exception e) {

			}
		}
		
		return mav; 
	}
	@RequestMapping(value = "viewmygetauctionpage.action", method = RequestMethod.GET)
	public ModelAndView viewmygetauctionpage(String mbId) {
		
		HashMap<String, Object> countList = mbsvc.getCountMyAuctionBymbId(mbId);
		List<Auction> getauctions = mbsvc.getGetterAuctionListBymbId(mbId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/mygetauctionpage");
		mav.addObject("getauctions", getauctions);
		mav.addObject("mbId", mbId);
		mav.addObject("countList", countList);
		
		return mav;
	}
	@RequestMapping(value = "viewmyauctionpage.action", method = RequestMethod.GET)
	public ModelAndView viewmyauctionpage(String mbId) {
		
		List<Auction> auctions = mbsvc.getMyAuctionListBymbId(mbId);
		HashMap<String, Object> countList = mbsvc.getCountMyAuctionBymbId(mbId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/myauctionpage");
		mav.addObject("auctions", auctions);
		mav.addObject("mbId", mbId);
		mav.addObject("countList", countList);
		return mav;
	}
	@RequestMapping(value = "deletemember.action", method = RequestMethod.GET)
	public String deletememberform(String mbId, String confim) {
		ModelAndView mav = new ModelAndView();
		
		if(confim.equals("yes")){
		
		return "redirect:/home.action";
		}
		return "member/deletemember";
	}
	
}
