package com.project.easyauction;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.easyauction.common.ThePager;
import com.easyauction.dto.Board;
import com.easyauction.dto.BoardComment;
import com.easyauction.dto.BoardImage;
import com.easyauction.service.BoardService;

@Controller
@RequestMapping(value = "board")
public class BoardController {
	
	@Autowired
	@Qualifier("boardService")
	private BoardService boardService;
	
	@RequestMapping(value = "freeboard.action", method = RequestMethod.GET)
	public ModelAndView freeboardList(Integer pageno) {

	//******* 페이징 관련 데이터 처리 ********* 
	int pageNo = 1; // 현재 페이지 번호
	int pageSize = 3; //한 페이지에 표시할 데이터 갯수
	int pagerSize = 3; //번호로 표시할 페이지 갯수
	int dataCount = 0; //전체 데이터 갯수 (pageSize와 dataCount를 알아야, 페이지가 얼마나? 있는지 알 수 있다.)
	String url = "freeboard.action"; // 페이징 관련 링크를 누르면, 페이지번호와 함께 요청할 경로
	//요청한 페이지 번호가 있다면,  읽어서 현재 페이지 번호로 설정 (없다면, 1페이지)
	if (pageno != null ) {
		pageNo = pageno;
	}
	//현재 페이지의 첫 번째 데이터의 순서번호를 계산하는 방법.
	int first = (pageNo - 1) * pageSize + 1; //1 page -> 1, 2 page -> 4, 3 page -> 7
	//1. 데이터 조회 (DAO객체 이용해서 처리)
	//내가 조건에 맞게 검색한 정보만, (type별로) 나오게 하는 작업.
	List<Board> boards = null;

	boards= boardService.getFreeBoardList(first, first + pageSize); // 페이징 처리로 해줬기 때문에 이런 처리를 해줘야한다.			
	//$$$$$$$$$$$$$$$$  페이지 개수 조정 (조건에 맞는 개수만큼만 페이징 조정) 작업.
	dataCount = boardService.getFreeBoardCount(); //전체 게시물 갯수 조회
	System.out.println(dataCount);
					
	ThePager pager = new ThePager(dataCount, pageNo, pageSize, pagerSize, url);
	System.out.println(pager);
				
	ModelAndView mav = new ModelAndView();
	/*List<Employee> employees = employeeDao.getEmployeeList(lineup);*/
	mav.addObject("boards", boards);
	mav.addObject("pager", pager);
	mav.addObject("pageno", pageNo);
	mav.setViewName("board/freeboardlist");
				
	return mav;
	}	
		
	@RequestMapping(value = "freeboardview.action", method = RequestMethod.GET)
	public ModelAndView freeboardviewList(@RequestParam("bdno")int bdNo, int pageno) {
		boardService.updateFreeBoardReadCount(bdNo);
		Board view = boardService.getFreeBoardViewByBoardNo(bdNo);
		List<BoardComment> comments = boardService.getCommentByBoardNo(bdNo);
		view.setComments(comments);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("board/freeboardview");
		mav.addObject("view", view);
		mav.addObject("pageno", pageno);
		
		return mav;
	}
	
	@RequestMapping(value="freeboardcomment.action", method=RequestMethod.POST)
	public String insertFreeBoardComment(@RequestParam("bdno")int bdNo, @RequestParam("content")String content, 
										 @RequestParam("writer")String writer){
		BoardComment boardComment = new BoardComment();
		boardComment.setBdNo(bdNo);
		boardComment.setBcContent(content);
		boardComment.setBcWriter(writer);
		System.out.println(bdNo + "/" + content + "/" +writer);
		
		boardService.insertFreeBoardComment(boardComment);
		return "redirect:/board/freeboardview.action?bdno="+bdNo;
	}
	
	@RequestMapping(value = "updatefreeboard.action", method = RequestMethod.GET)
	public ModelAndView updatefreeboard(int bdno, int pageno, Board board) {
		Board board1 = boardService.getFreeBoardViewByBoardNo(bdno);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/updatefreeboard");
		mav.addObject("view", board1);
		mav.addObject("pageno", pageno);
		return mav;
	}
	
	@RequestMapping(value="updatefreeboard.action", method= RequestMethod.POST)
	public String updatefreeboard2(int pageNo, Board board) {
		System.out.println("aslkdlasdj");
		boardService.updateFreeBoard(board);
		
		return "redirect:/board/freeboardview.action?bdno="+ board.getBdNo()+"&pageno="+ pageNo;
	}
	
	@RequestMapping(value="updatefreeboardcomment.action", method= RequestMethod.POST)
	public ModelAndView updateFreeBoardComment(int bcNo, String bcContent) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("bcNo", bcNo);
		params.put("bcContent", bcContent);
		boardService.updateFreeBoardComment(params);
		/*return "redirect:/board/freeboardview.action?bdno="+bdno+"&bcno="+bcno+"&pageno="+ pageno*/
		ModelAndView mav = new ModelAndView();
		String success = "success";
		mav.addObject("success",success);
		return mav;
	}
	
	
	@RequestMapping(value="deletefreeboard.action", method= RequestMethod.GET)
	public String deletefreeboard(int bdno, int pageno) {
		
		boardService.deleteFreeBoard(bdno);
		return "redirect:/board/freeboard.action?bdno="+bdno+"&pageno="+pageno;
	}
	
	@RequestMapping(value="deletefreeboardcomment.action", method= RequestMethod.GET)
	public String deleteFreeBoardComment(int bdno, int bcno, int pageno) {
		
		boardService.deleteFreeBoardComment(bcno);
		return "redirect:/board/freeboardview.action?bdno="+bdno+"&pageno="+pageno;
		
	}
	
	@RequestMapping(value = "freeboardregister.action", method = RequestMethod.GET)
	public String freeboardregister() {
		
		return "board/freeboardregister";
	}
	
	@RequestMapping(value = "freeboardregister.action", method = RequestMethod.POST)
	public String freeboardregisterEdit(MultipartHttpServletRequest req, String id, String title, String content) {
		//가상경로를 물리경로로 변환하는 기능을 가진 객체 반환
		ServletContext application = req.getSession().getServletContext();
				
		//가상경로 -> 물리경로
		String path = application.getRealPath("/WEB-INF/imagefile/");
		
		Board board = new Board();
		board.setBdWriter(id);
		board.setBdTitle(title);
		board.setBdContent(content);
		System.out.println(id+"/"+title+"/"+content);
		boardService.insertFreeBoard(board);
		MultipartFile file = req.getFile("img");//요청 데이터에서 파일 정보 추출
		if (file != null && file.getSize() > 0) {
			
			String fileName = file.getOriginalFilename();//파일이름 읽어서 변수에 저장
			if (fileName.contains("\\")) {//IE일 경우 전체 경로에서 파일이름만 추출
				//C:\ABC\DEF\xyz.txt -> xyz.txt
				fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
			}
			BoardImage boardImage = new BoardImage();
			boardImage.setBdImgName(fileName);
			boardImage.setBdNo(board.getBdNo());
			
			boardService.insertPhotoImage(boardImage);
			
			//파일을 디스크에 저장
			try {
				FileOutputStream ostream = 
					new FileOutputStream(new File(path, boardImage.getBdImgName()));
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

		return "redirect:/board/freeboard.action";
	}
	
	@RequestMapping(value = "photoview.action", method = RequestMethod.GET)
	public ModelAndView photoviewList(@RequestParam("bdno")int bdNo) {
		System.out.println(bdNo);
		Board view = boardService.getPhotoViewByBoardNo(bdNo);
		List<BoardComment> comments = boardService.getCommentByBoardNo(bdNo);
		view.setComments(comments);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("board/photoview");
		mav.addObject("view", view);
		
		return mav;
	}
	
	@RequestMapping(value = "gongji.action", method = RequestMethod.GET)
	public ModelAndView gongjiList(Integer pageno) {
		
		//******* 페이징 관련 데이터 처리 ********* 
		int pageNo = 1; // 현재 페이지 번호
		int pageSize = 3; //한 페이지에 표시할 데이터 갯수
		int pagerSize = 3; //번호로 표시할 페이지 갯수
		int dataCount = 0; //전체 데이터 갯수 (pageSize와 dataCount를 알아야, 페이지가 얼마나? 있는지 알 수 있다.)
		String url = "gongji.action"; // 페이징 관련 링크를 누르면, 페이지번호와 함께 요청할 경로
		//요청한 페이지 번호가 있다면, 읽어서 현재 페이지 번호로 설정 (없다면, 1페이지)
		if (pageno != null ) {
			pageNo = pageno;
		}
		//현재 페이지의 첫 번째 데이터의 순서번호를 계산하는 방법.
		
		int first = (pageNo - 1) * pageSize + 1; //1 page -> 1, 2 page -> 4, 3 page -> 7
		//1. 데이터 조회 (DAO객체 이용해서 처리)
		//내가 조건에 맞게 검색한 정보만, (type별로) 나오게 하는 작업.
		List<Board> boards = null;

		boards= boardService.getGongjiList(first, first + pageSize); // 페이징 처리로 해줬기 때문에 이런 처리를 해줘야한다.			
		//$$$$$$$$$$$$$$$$  페이지 개수 조정 (조건에 맞는 개수만큼만 페이징 조정) 작업.
		dataCount = boardService.getFreeBoardCount(); //전체 게시물 갯수 조회
		System.out.println(dataCount);
						
		ThePager pager = new ThePager(dataCount, pageNo, pageSize, pagerSize, url);
		System.out.println(pager);
					
		ModelAndView mav = new ModelAndView();
		/*List<Employee> employees = employeeDao.getEmployeeList(lineup);*/
		mav.addObject("boards", boards);
		mav.addObject("pager", pager);
		mav.addObject("pageno", pageNo);
		mav.setViewName("board/gongjilist");
					
		return mav;
		}
	
	@RequestMapping(value = "gongjiview.action", method = RequestMethod.GET)
	public ModelAndView gongjiviewList(@RequestParam("bdno")int bdNo) {
		System.out.println(bdNo);
		Board view = boardService.getGongjiBoardViewByBoardNo(bdNo);
		List<BoardComment> comments = boardService.getCommentByBoardNo(bdNo);
		view.setComments(comments);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/gongjiview");
		mav.addObject("view", view);
		
		return mav;
	}
	
	@RequestMapping(value="gongjiboardcomment.action", method=RequestMethod.POST)
	public String insertGongjiBoardComment(@RequestParam("bdno")int bdNo, @RequestParam("content")String content, @RequestParam("writer")String writer){
		BoardComment boardComment = new BoardComment();
		boardComment.setBdNo(bdNo);
		boardComment.setBcContent(content);
		boardComment.setBcWriter(writer);
		System.out.println(bdNo + "/" + content + "/" +writer);
		
		boardService.insertComment(boardComment);
		return "redirect:/board/gongjiview.action?bdno="+bdNo;
	}
	
	@RequestMapping(value = "gongjiregister.action", method = RequestMethod.GET)
	public String gongjiregister() {
		
		return "board/gongjiregister";
	}
	
	@RequestMapping(value = "gongjiregister.action", method = RequestMethod.POST)
	public String gongjiregisterEdit(MultipartHttpServletRequest req, String id, String title, String content) {
		//가상경로를 물리경로로 변환하는 기능을 가진 객체 반환
		ServletContext application = req.getSession().getServletContext();
				
		//가상경로 -> 물리경로
		String path = application.getRealPath("/WEB-INF/imagefile/");
		
		Board board = new Board();
		board.setBdWriter(id);
		board.setBdTitle(title);
		board.setBdContent(content);
		System.out.println(id+"/"+title+"/"+content);
		boardService.insertGongjiBoard(board);
		MultipartFile file = req.getFile("img");//요청 데이터에서 파일 정보 추출
		if (file != null && file.getSize() > 0) {
			
			String fileName = file.getOriginalFilename();//파일이름 읽어서 변수에 저장
			if (fileName.contains("\\")) {//IE일 경우 전체 경로에서 파일이름만 추출
				//C:\ABC\DEF\xyz.txt -> xyz.txt
				fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
			}
			BoardImage boardImage = new BoardImage();
			boardImage.setBdImgName(fileName);
			boardImage.setBdNo(board.getBdNo());
			
			boardService.insertPhotoImage(boardImage);
			
			//파일을 디스크에 저장
			try {
				FileOutputStream ostream = 
					new FileOutputStream(new File(path, boardImage.getBdImgName()));
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

		return "redirect:/board/gongji.action";
	}
	
	@RequestMapping(value = "photolist.action", method = RequestMethod.GET)
	public ModelAndView photoList() {
		ModelAndView mav = new ModelAndView();
		List<Board> photos = boardService.getPhotoList();
		
		mav.setViewName("board/photolist");
		mav.addObject("photos",photos);
		return mav;
		
	}
	

	@RequestMapping(value="comment.action", method=RequestMethod.POST)
	public String insertComment(@RequestParam("bdno")int bdNo, @RequestParam("content")String content, @RequestParam("writer")String writer){
		BoardComment boardComment = new BoardComment();
		boardComment.setBdNo(bdNo);
		boardComment.setBcContent(content);
		boardComment.setBcWriter(writer);
		System.out.println(bdNo + "/" + content + "/" +writer);
		
		boardService.insertComment(boardComment);
		return "redirect:/board/photoview.action?bdno="+bdNo;
	}
	
	@RequestMapping(value="photoregister.action", method = RequestMethod.GET)
	public String photoregister(){
		return "board/photoregister";
	}

	@RequestMapping(value = "photoregister.action", method = RequestMethod.POST)
	public String photoregisterEdit(MultipartHttpServletRequest req, String id, String title, String content) {
		//가상경로를 물리경로로 변환하는 기능을 가진 객체 반환
		ServletContext application = req.getSession().getServletContext();
				
		//가상경로 -> 물리경로
		String path = application.getRealPath("/resources/imagefile/");
		
		Board board = new Board();
		board.setBdWriter(id);
		board.setBdTitle(title);
		board.setBdContent(content);
		System.out.println(id+"/"+title+"/"+content);
		boardService.insertPhoto(board);
		MultipartFile file = req.getFile("img");//요청 데이터에서 파일 정보 추출
		if (file != null && file.getSize() > 0) {
			
			String fileName = file.getOriginalFilename();//파일이름 읽어서 변수에 저장
			if (fileName.contains("\\")) {//IE일 경우 전체 경로에서 파일이름만 추출
				//C:\ABC\DEF\xyz.txt -> xyz.txt
				fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
			}
			BoardImage boardImage = new BoardImage();
			boardImage.setBdImgName(fileName);
			boardImage.setBdNo(board.getBdNo());
			
			boardService.insertPhotoImage(boardImage);
			
			//파일을 디스크에 저장
			try {
				FileOutputStream ostream = 
					new FileOutputStream(new File(path, boardImage.getBdImgName()));
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

		return "redirect:/board/photolist.action";
	}
	
	@RequestMapping(value = "freeboardsearch.action", method = RequestMethod.POST)
	public ModelAndView freeboardsearchList(String search, String searchdata) {
		ModelAndView mav = new ModelAndView();
		List<Board> boards = boardService.getFreeBoardSearchList(search, searchdata);
		mav.setViewName("board/freeboardlist");
		mav.addObject("boards", boards);
		return mav;
		
	}
	
	@RequestMapping(value = "gongjiboardsearch.action", method = RequestMethod.POST)
	public ModelAndView gongjiboardsearchList(String search, String searchdata) {
		ModelAndView mav = new ModelAndView();
		List<Board> boards = boardService.getGongjiBoardSearchList(search, searchdata);
		mav.setViewName("board/gongjilist");
		mav.addObject("boards", boards);
		return mav;
		
	}
}

