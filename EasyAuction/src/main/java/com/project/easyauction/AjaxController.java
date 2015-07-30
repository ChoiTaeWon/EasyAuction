package com.project.easyauction;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easyauction.common.Util;
import com.easyauction.dto.AuctionReporting;
import com.easyauction.dto.Bidding;
import com.easyauction.dto.BoardReporting;
import com.easyauction.dto.Member;
import com.easyauction.dto.MemberReporting;
import com.easyauction.service.AuctionService;
import com.easyauction.service.BiddingService;
import com.easyauction.service.MemberService;
import com.easyauction.service.MessageService;
import com.easyauction.service.ReportService;


@Controller
@RequestMapping(value = "ajax")
public class AjaxController {
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
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
	
	private AuctionService auctionService;
	@Autowired
	@Qualifier(value="auctionService")
	public void setAuctionService(AuctionService auctionService) {
		this.auctionService = auctionService;
	}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
	

	@RequestMapping(value="membercheck.action", method = RequestMethod.GET)
	@ResponseBody //별도의 뷰를 사용하지 말고 return 값을 응답 본문으로 사용하세요
	public int membercheck(String mbId) {
		int result = 0;
		
		result = mbgsvc.getCountByMemberId(mbId);
		
		return result;
	}
	@RequestMapping(value="membercheckbyemail.action", method = RequestMethod.GET)
	@ResponseBody //별도의 뷰를 사용하지 말고 return 값을 응답 본문으로 사용하세요
	public int membercheck1(String email,String locationurl,String target1) {
		int result = 0;
		String mbId = "", mbPasswd = "";
		if(locationurl.equals("findPasswd")){
			mbId = target1;
		}else{
			mbPasswd = Util.getHashedString(target1, "SHA-1");
		}
		result = mbgsvc.getCountByMemberEmail(mbId, email, mbPasswd);
		
		return result;
	}
	
	
	
	@RequestMapping(value="messagecheck.action", method = RequestMethod.GET)
	@ResponseBody //별도의 뷰를 사용하지 말고 return 값을 응답 본문으로 사용하세요
	public int messagecheck(String mbId) {
		int result = 0;
		
		result = msgsvc.getMessageCountBymbId(mbId);
		
		return result;
	}
	
	

	//입찰하기 
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
	
	//가장 마지막 입찰자 가져오기
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
	
	////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="auctionReporting.action", method = RequestMethod.GET)
	@ResponseBody //별도의 뷰를 사용하지 말고 return 값을 응답 본문으로 사용하세요
	public int auctionReporting(String reporter, int targetAuctionNo, String reportText) {
		
		int result = 0;
		
		AuctionReporting auctionReporting = new AuctionReporting();
		auctionReporting.setArpRepoter(reporter);
		auctionReporting.setArpTagetNo(targetAuctionNo);
		auctionReporting.setArpContent(reportText);
		
		System.out.println("신고하기 내용" + "////" + reporter +"////" +targetAuctionNo +"////" +reportText );
		reportService.insertAuctionReportingByTargetNo(auctionReporting);
		
		System.out.println("리턴된 brpno" + auctionReporting.getArpNo());
		
		if(auctionReporting.getArpNo() > 0){
			auctionService.updateAuctionReportCount(targetAuctionNo);
			System.out.println("updateAuctionReportCount했음");
			return result;
		}
		else{
			return result+1;
		}
		
	}
	
	@RequestMapping(value="selectRepoterCheck.action", method = RequestMethod.GET)
	@ResponseBody //별도의 뷰를 사용하지 말고 return 값을 응답 본문으로 사용하세요
	public int selectRepoterCheck(String mbId, int aucNo) {
		
		int result = 0;
		
		int repoterCheck = reportService.getResultReportCheck(mbId, aucNo);
		
		if(repoterCheck > 0){
			System.out.println("이전에 신고한 이력이 있음");
			//1 반환
			return result+1;
		}
		else{
			//0 반환
			return result;
		}
		
	}
	////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="memberReporting.action", method = RequestMethod.GET)
	@ResponseBody //별도의 뷰를 사용하지 말고 return 값을 응답 본문으로 사용하세요
	public int memberReporting(String reporter, String targetmbId, String reportText) {
		
		int result = 0;
		
		MemberReporting memberReporting = new MemberReporting();
		memberReporting.setMrpRepoter(reporter);
		memberReporting.setMrpTarget(targetmbId);
		memberReporting.setMrpContent(reportText);
		
		reportService.insertMemberReportingBytargetmbId(memberReporting);
		Member member = new Member();
		member.setMbId(targetmbId);
		mbgsvc.setEditMember(member);
		return result;
	}
		
	
	@RequestMapping(value="memberRepoterCheck.action", method = RequestMethod.GET)
	@ResponseBody //별도의 뷰를 사용하지 말고 return 값을 응답 본문으로 사용하세요
	public int memberRepoterCheck(String mbId, String receiver) {
		
		int result = 0;
		
		int repoterCheck = reportService.getResultMemberReportCheck(mbId, receiver);
		
		if(repoterCheck > 0){
			System.out.println("이전에 신고한 이력이 있음");
			//1 반환
			return result + 1;
		}
		else{
			//0 반환
			return result;
		}
		
	}
	////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="selectIpchalList.action", method = RequestMethod.GET)
	@ResponseBody //별도의 뷰를 사용하지 말고 return 값을 응답 본문으로 사용하세요
	public List<Bidding> selectIpchalList(int bidNo, int aucNo) {
		
		List<Bidding> biddingList = biddingService.getIpchalList(bidNo, aucNo);
		
		
		if(biddingList != null){
			System.out.println("입찰리스트 반환했음");
			return biddingList;
		}
		else{
			return null;
		}
		
	}
	
	
	@RequestMapping(value="selectMaxBiddingNo.action", method = RequestMethod.GET)
	@ResponseBody //별도의 뷰를 사용하지 말고 return 값을 응답 본문으로 사용하세요
	public int selectMaxBiddingNo(int aucNo) {
		
		int bidNoResult = biddingService.getMaxBiddingNo(aucNo);
		
		
		return bidNoResult;
	}
	
	
	@RequestMapping(value="selectIpchalListByBtn.action", method = RequestMethod.GET)
	@ResponseBody //별도의 뷰를 사용하지 말고 return 값을 응답 본문으로 사용하세요
	public List<Bidding> selectIpchalList(int aucNo) {
		
		List<Bidding> biddingLists = biddingService.getBiddingListByAuctionNo(aucNo);
		if(biddingLists != null){
			/*for(Bidding bidList : biddingLists){
				System.out.println(bidList.getBidNo() + "&&" + bidList.getBidPrice() + "&&" + bidList.getMbId());
			}*/
			return biddingLists;
		}else{
			return null;
		}
		
	}
	
	

}
