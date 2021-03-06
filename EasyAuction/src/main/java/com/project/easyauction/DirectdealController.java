package com.project.easyauction;


import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.easyauction.common.Util;
import com.easyauction.dto.Auction;
import com.easyauction.dto.AuctionImage;
import com.easyauction.dto.Bidding;
import com.easyauction.service.AuctionService;
import com.easyauction.service.BiddingService;


@Controller
@RequestMapping(value = "direct")
public class DirectdealController {
	
	@Autowired
	@Qualifier("auctionService")
	private AuctionService auctionService;
	
	@Autowired
	@Qualifier("biddingService")
	private BiddingService biddingService;
	
	
	
	@InitBinder
	 public void initBinder(WebDataBinder binder) {

	 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	 dateFormat.setLenient(false);
	 binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	 }

	
	
	@RequestMapping(value = "directdeal.action", method = RequestMethod.GET)
	public String directList() {
		
		return "direct/directlist";
	}
	
	
	@RequestMapping(value = "showdeal.action", method = RequestMethod.GET)
	public ModelAndView detailView(@RequestParam("aucno") int aucNo) {
		Auction auction = auctionService.getAuctionDetailByAuctionNo(aucNo);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("direct/directview");
		mav.addObject("auction", auction);
		return mav;
	}
	
	
	//경매글 등록!
	@RequestMapping(value = "directregister.action", method = RequestMethod.GET)
	public String gotodealRegister() {
		
		return "direct/directregister";
	}
	
	
	   @RequestMapping(value = "directregister.action", method = RequestMethod.POST)
	   public String dodealRegist(MultipartHttpServletRequest req, Auction auction) {
	   //public String dodealRegist(Auction auction) {
	      //가상경로를 물리경로로 변환하는 기능을 가진 객체 반환
	            ServletContext application = req.getSession().getServletContext();
	            try {
	            	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	            	auction.setAucStartDate(dateFormat.parse(req.getParameter("aucStartDate1")));
	            	auction.setAucEndDate(dateFormat.parse(req.getParameter("aucEndDate1")));
	            } catch (ParseException e) {
	            	e.printStackTrace();
	            }
	            
	            System.out.println(auction.getAucNo() +
	                  "/" + auction.getAucTitle() +
	                  "/" + auction.getAucCategory() + 
	                  "/" + auction.getAucItemName() + 
	                  "/" + auction.getAucAdText() + 
	                  "/" + auction.getAucStartDate() + 
	                  "/" + auction.getAucEndDate() + 
	                  "/" + auction.getAucStartPrice() + 
	                  "/" + auction.getAucDetail() + 
	                  "/" + auction.getAucWriter()
	               );
	            
	            auctionService.insertAuctionDirectDeal(auction);
	            MultipartFile file = req.getFile("aucImg");//요청 데이터에서 파일 정보 추출
	            if (file != null && file.getSize() > 0) {
	               
	               String fileName = file.getOriginalFilename();//파일이름 읽어서 변수에 저장
	              
	               if (fileName.contains("\\")) {//IE일 경우 전체 경로에서 파일이름만 추출
	                  //C:\ABC\DEF\xyz.txt -> xyz.txt
	                  fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
	                  
	               }
	               
	             //가상경로 -> 물리경로
	               String path = application.getRealPath("/resources/imagefile/");
		           String savedName = Util.getUniqueFileName(path, fileName);
	               
	              
	               
	               AuctionImage auctionImage = new AuctionImage();
	               //auctionImage.setAucImgName(fileName);
	               auctionImage.setAucImgName(savedName);
	               auctionImage.setAucNo(auction.getAucNo());
	               auctionService.insertAuctionPhotoImage(auctionImage);
	               System.out.println("파일명 : "+auctionImage.getAucImgName());
	               
	               //입찰 초기값 삽입
	               	Bidding bidding = new Bidding();
					bidding.setAucNo(auction.getAucNo());
					bidding.setBidPrice(auction.getAucStartPrice());
					bidding.setMbId("admin");
					biddingService.insertFirstBidding(bidding);
	               
	               
	               //파일을 디스크에 저장
	               try {
	                  FileOutputStream ostream = 
	                     new FileOutputStream(new File(path, auctionImage.getAucImgName()));
	                  InputStream istream = file.getInputStream();
	                  while (true) {
	                     int data = istream.read();
	                     if (data == -1) break;
	                     ostream.write(data);
	                  }
	                  istream.close();
	                  ostream.close();
	               } catch (Exception ex) {
	                  ex.printStackTrace();
	               }
	            }
	            
	            

	            return "redirect:/direct/directdeal.action";
	      
	   }
	
	
	
	
	
}