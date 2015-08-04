package com.project.easyauction;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.easyauction.common.Util;
import com.easyauction.dto.Auction;
import com.easyauction.dto.Member;
import com.easyauction.service.AuctionService;
import com.easyauction.dto.Auction;
import com.easyauction.dto.Board;
import com.easyauction.service.AuctionService;
import com.easyauction.service.BoardService;
import com.easyauction.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private MemberService mbsvc;
	@Autowired
	@Qualifier(value="memberService")
	public void setMemberService(MemberService mbsvc) {
		this.mbsvc = mbsvc;
	}
	@Autowired
	@Qualifier("boardService")
	private BoardService boardService;
	
	@Autowired
	@Qualifier("auctionService")
	private AuctionService auctionService;
	
	
	
	@RequestMapping(value ={ "/","home.action"}, method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest req) {

		ModelAndView mav = new ModelAndView();
		List<Board> boards = boardService.gongiTypeOne();
		List<Board> photos = boardService.getPhotoList();
		List<Auction> auctions = auctionService.getAuctionList();
		mav.addObject("boards", boards);
		mav.addObject("photos", photos);
		mav.addObject("auctions", auctions);
		mav.setViewName("mainpage");
		
		
 		return mav;
	}
	
}
