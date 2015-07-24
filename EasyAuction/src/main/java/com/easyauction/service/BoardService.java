package com.easyauction.service;

import java.util.List;

import com.easyauction.dto.Board;
import com.easyauction.dto.BoardComment;
import com.easyauction.dto.BoardImage;

public interface BoardService {
	
	void insertFreeBoard(Board board);
	
	void insertGongjiBoard(Board board);
	
	void insertPhoto(Board board);
 
	void insertPhotoImage(BoardImage boardImage);
 
	List<Board> getPhotoList();
	
	List<Board> getFreeBoardList();
	
	Board getPhotoViewByBoardNo(int bdNo);
	
	void insertComment(BoardComment boardComment);
	
	List<BoardComment> getCommentByBoardNo(int bdNo);
	
	List<Board> getGongjiList();

	Board getFreeBoardViewByBoardNo(int bdNo);

	

}
