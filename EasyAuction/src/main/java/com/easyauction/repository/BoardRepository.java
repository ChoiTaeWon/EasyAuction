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
	
	List<Board> getFreeBoardList(int first , int last, int bdtype);
	
	List<Board> getGongjiList(int first , int last);

	Board getFreeBoardViewByBoardNo(int bdNo);
	
	Board getGongjiBoardViewByBoardNo(int bdNo);
	
	void insertFreeBoardComment(BoardComment boardComment);
	
	void insertGongjiBoardComment(BoardComment boardComment);
	
	void updateFreeBoardComment(HashMap<String, Object> params);
	
	void updateGongjiBoardComment(HashMap<String, Object> params);
	
	void deleteFreeBoardComment(int bcNo);
	
	void deleteGongjiBoardComment(int bcNo);
	
	List<Board> getFreeBoardSearchList(int first, int last, String search, String searchdata, int bdtype);

	List<Board> getGongjiBoardSearchList(String search, String searchdata);
	
	int getFreeBoardCount(int bdtype);
	
	void deleteFreeBoard(int bdno);
	
	void deleteGongjiBoard(int bdno);
	
	void deletePhotoBoard(int bdno);
	
	void updateFreeBoard(Board board);
	
	void updateGongjiBoard(Board board);

	int getFreeBoardCommentCount();
	
	void updateFreeBoardReadCount(int bdNo);

	int getFreeBoardSearchCount(String search, String searchdata, int bdtype);
	
	List<Board> gongiTypeOne();

	List<Board> getBoardSearchList(String aucSearchData);

	

	

	

	

	
}
