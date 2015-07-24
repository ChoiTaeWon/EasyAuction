package com.project.easyauction;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView freeboardList() {
		ModelAndView mav = new ModelAndView();
		List<Board> boards = boardService.getFreeBoardList();
		mav.setViewName("board/freeboardlist");
		mav.addObject("boards", boards);
		return mav;
	}
	
	@RequestMapping(value = "freeboardview.action", method = RequestMethod.GET)
	public ModelAndView freeboardviewList(@RequestParam("bdno")int bdNo) {
		System.out.println(bdNo);
		Board view = boardService.getFreeBoardViewByBoardNo(bdNo);
		List<BoardComment> comments = boardService.getCommentByBoardNo(bdNo);
		view.setComments(comments);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("board/freeboardview");
		mav.addObject("view", view);
		
		return mav;
	}
	
	@RequestMapping(value="freeboardcomment.action", method=RequestMethod.POST)
	public String insertFreeBoardComment(@RequestParam("bdno")int bdNo, @RequestParam("content")String content, @RequestParam("writer")String writer){
		BoardComment boardComment = new BoardComment();
		boardComment.setBdNo(bdNo);
		boardComment.setBcContent(content);
		boardComment.setBcWriter(writer);
		System.out.println(bdNo + "/" + content + "/" +writer);
		
		boardService.insertFreeBoardComment(boardComment);
		return "redirect:/board/freeboardview.action?bdno="+bdNo;
	}
	
	@RequestMapping(value="updatefreeboardcomment.action", method=RequestMethod.POST)
	public String updateFreeBoardComment(@RequestParam("bdno")int bdNo, @RequestParam("content")String content, @RequestParam("writer")String writer){
		BoardComment boardComment = new BoardComment();
		boardComment.setBdNo(bdNo);
		boardComment.setBcContent(content);
		boardComment.setBcWriter(writer);
		System.out.println(bdNo + "/" + content + "/" +writer);
		
		boardService.insertFreeBoardComment(boardComment);
		return "redirect:/board/freeboardview.action?bdno="+bdNo;
	}
	
	@RequestMapping(value="deletedfreeboardcomment.action", method=RequestMethod.POST)
	public String deletedFreeBoardComment(@RequestParam("bdno")int bdNo, @RequestParam("content")String content, @RequestParam("writer")String writer){
		BoardComment boardComment = new BoardComment();
		boardComment.setBdNo(bdNo);
		boardComment.setBcContent(content);
		boardComment.setBcWriter(writer);
		System.out.println(bdNo + "/" + content + "/" +writer);
		
		boardService.insertFreeBoardComment(boardComment);
		return "redirect:/board/freeboardview.action?bdno="+bdNo;
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
	
	@RequestMapping(value = "gongji.action", method = RequestMethod.GET)
	public ModelAndView gongjiList() {
		ModelAndView mav = new ModelAndView();
		List<Board> boards = boardService.getGongjiList();
		mav.setViewName("board/gongjilist");
		mav.addObject("boards", boards);
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
	
	@RequestMapping(value = "photoregister.action", method = RequestMethod.GET)
	public String photoregister() {
		
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
}

