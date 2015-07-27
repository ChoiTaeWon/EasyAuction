package com.project.easyauction;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easyauction.dto.Bidding;
import com.easyauction.service.BiddingService;
import com.easyauction.service.MemberService;
import com.easyauction.service.MessageService;
import com.easyauction.service.ReportService;


@Controller
@RequestMapping(value = "ajax")
public class AjaxController {
	
	private MemberService mbgsvc;
	@Autowired
	@Qualifier(value="memberService")
	public void setMemberService(MemberService mbgsvc){
		this.mbgsvc = mbgsvc;
	}
	
	private MessageService msgsvc;
	@Autowired
	@Qualifier(value="messageService")
	public void setMessageService(MessageService msgsvc){
		this.msgsvc = msgsvc;
	}
	
	
	private ReportService reportService;
	@Autowired
	@Qualifier(value="reportService")
	public void setReportService(ReportService reportService){
		this.reportService = reportService;
	}
	
	
	private BiddingService biddingService;
	@Autowired
	@Qualifier(value="biddingService")
	public void setBiddingService(BiddingService biddingService) {
		this.biddingService = biddingService;
	}
	

	@RequestMapping(value="membercheck.action", method = RequestMethod.GET)
	@ResponseBody //별도의 뷰를 사용하지 말고 return 값을 응답 본문으로 사용하세요
	public int membercheck(String mbId) {
		int result = 0;
		
		result = mbgsvc.getCountByMemberId(mbId);
		
		return result;
	}
	
	@RequestMapping(value="messagecheck.action", method = RequestMethod.GET)
	@ResponseBody //별도의 뷰를 사용하지 말고 return 값을 응답 본문으로 사용하세요
	public int messagecheck(String mbId) {
		int result = 0;
		
		result = msgsvc.getMessageCountBymbId(mbId);
		
		return result;
	}
	
	
/*	@RequestMapping(value="auctionReporting.action", method = RequestMethod.POST)
	@ResponseBody //별도의 뷰를 사용하지 말고 return 값을 응답 본문으로 사용하세요
	public int auctionReport(String reporter, int targetAuctionNo, String reportText) {
		
		System.out.println("repoter : " + reporter
						 + "targetAuctionNo : " + targetAuctionNo
						 +	"reportText : " + reportText);
		//reportService.insertAuctionReportContent();
	
			Member member = null;
		if(id != null && passwd != null) {
			passwd = Util.getHashedString(passwd, "SHA-1");
			
			//2. 데이터 처리 (데이터베이스에서 데이터 조회 - Dao 객체를 호출해서 처리)		
			MemberDao dao = new MemberDao();
			member = dao.getMemberByIdAndPasswd(id, passwd);
		}
		
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		//3. 결과 응답 (여기서는 목록 페이지 요청)
		if (member != null) {//로그인 성공한 경우
			//로그인 처리 -> 세션 또는 쿠키에 로그인 데이터 저장 (여기서는 세션)
			HttpSession session = request.getSession();
			session.setAttribute("loginuser", member);//로그인 처리
			
			writer.print("success");
			
		} else {//로그인 실패한 경우
			writer.print("fail");
		}
		
		
		
		int result = 0;
		
		
		
		return result;
	}*/
	
	
	
/*	@RequestMapping(value="insertBiddingPrice.action", method = RequestMethod.POST)
	@ResponseBody
	public String doBidding(String mbId, int aucNo){
		String returnId = null;
		Bidding bidding = new Bidding();
		bidding.setMbId(mbId);
		bidding.setAucNo(aucNo);
		
		returnId = biddingService.insertBiddingPrice(bidding);
		
		return returnId;
	}*/
	
	@RequestMapping(value="insertBiddingPrice.action", method = RequestMethod.GET)
	@ResponseBody
	public Bidding doBidding(String mbId, int aucNo){
		
		Bidding bidding = new Bidding();
		bidding.setMbId(mbId);
		bidding.setAucNo(aucNo);
		
		
		System.out.println(mbId + "//" + aucNo);
		
		biddingService.insertBiddingPrice(bidding);
		
		System.out.println(bidding.getBidNo());
		bidding = biddingService.getBiddingByBidNo(bidding.getBidNo());
		
		//System.out.println("returnId :" + bidding.getMbId());
		/*if(bidding.getMbId().length() > 0){
			return mbId;
		}*/
		
		return bidding;
	}
	
	@RequestMapping(value="selectLastBidder.action", method = RequestMethod.GET)
	@ResponseBody //별도의 뷰를 사용하지 말고 return 값을 응답 본문으로 사용하세요
	public int selectLastBidder(String mbId, int aucNo) {
		int result = 0;
		
		String lastBidder = biddingService.getLastBidder(aucNo);
		System.out.println("마지막 낙찰자  :" + lastBidder);
		
		if(mbId.equals(lastBidder)){
			System.out.println(result+1);
			return result+1;
			//같으면 1; 에러
		}else{
			System.out.println(result);
			return result;	
		}
		
		
	}
	
	
	

}
