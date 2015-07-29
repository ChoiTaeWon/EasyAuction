package com.easyauction.service;

import java.util.HashMap;
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
	
	List<Board> getFreeBoardList(int first, int last);
	
	Board getPhotoViewByBoardNo(int bdNo);
	
	void insertComment(BoardComment boardComment);
	
	List<BoardComment> getCommentByBoardNo(int bdNo);
	
	List<Board> getGongjiList(int first, int last);

	Board getFreeBoardViewByBoardNo(int bdNo);

	Board getGongjiBoardViewByBoardNo(int bdNo);

	void insertFreeBoardComment(BoardComment boardComment);
	
	void insertGongjiBoardComment(BoardComment boardComment);

	void updateFreeBoardComment(BoardComment boardComment);
	
	void deleteFreeBoardComment(int bcNo);
	
	List<Board> getFreeBoardSearchList(String search, String searchdata);

	List<Board> getGongjiBoardSearchList(String search, String searchdata);

	void deleteFreeBoard(int bdno);

	void updateFreeBoard(Board board);

	int getFreeBoardCommentCount();

	int getFreeBoardCount();
	
	void updateFreeBoardReadCount(int bdNo);

}

