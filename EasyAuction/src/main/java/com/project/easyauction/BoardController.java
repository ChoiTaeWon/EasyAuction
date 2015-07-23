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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.easyauction.dto.Board;
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
		List<Board> boards = boardService.getfreeBoardList();
		
//		for(int i=0; i< boards.size(); i++){
//			System.out.println(boards);
//		}
		
		mav.setViewName("board/freeboardlist");
		mav.addObject("boards", boards);
		return mav;
		
	}
	
	@RequestMapping(value = "freeboardview.action", method = RequestMethod.GET)
	public String freeboardview() {
		
		return "board/freeboardview";
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
		boardService.insertFreeboard(board);
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
	public String gongjiList() {
		
		return "board/gongjilist";
	}
	
	@RequestMapping(value = "gongjiview.action", method = RequestMethod.GET)
	public String gongjiview() {
		
		return "board/gongjiview";
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
		boardService.insertGongjiboard(board);
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
	public String photoviewList() {
		
		return "board/photoview";
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

