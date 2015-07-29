package com.easyauction.repository;

import java.util.HashMap;
import java.util.List;

import com.easyauction.dto.Board;
import com.easyauction.dto.BoardComment;
import com.easyauction.dto.BoardImage;

public interface BoardRepository {
	
	int insertFreeboard(Board board);
	
	int insertGongjiBoard(Board board);
	
	int insertPhoto(Board board);
	
	void insertPhotoImage(BoardImage boardImage);
	
	List<Board> getPhotoList();
	
	Board getPhotoViewByBoardNo(int bdNo);
	
	void insertComment(BoardComment boardComment);
	
	List<BoardComment> getCommentByBoardNo(int bdNo);
	
	List<Board> getFreeBoardList(int first , int last);
	
	List<Board> getGongjiList(int first , int last);

	Board getFreeBoardViewByBoardNo(int bdNo);
	
	Board getGongjiBoardViewByBoardNo(int bdNo);
	
	void insertFreeBoardComment(BoardComment boardComment);
	
	void insertGongjiBoardComment(BoardComment boardComment);
	
	void updateFreeBoardComment(BoardComment boardComment);
	
	void deleteFreeBoardComment(int bcNo);
	
	List<Board> getFreeBoardSearchList(String search, String searchdata);

	List<Board> getGongjiBoardSearchList(String search, String searchdata);
	
	int getFreeBoardCount();
	
	void deleteFreeBoard(int bdno);
	
	void updateFreeBoard(Board board);

	int getFreeBoardCommentCount();
	
	void updateFreeBoardReadCount(int bdNo);
}
