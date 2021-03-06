package com.easyauction.mapper;

import java.util.HashMap;
import java.util.List;

import com.easyauction.dto.Board;
import com.easyauction.dto.BoardComment;
import com.easyauction.dto.BoardImage;

public interface BoardMapper {
	
	int insertFreeBoard(Board board);

	int insertGongjiBoard(Board board);
	
	int insertPhoto(Board board);
	
	void insertPhotoImage(BoardImage boardImage);
	
	void insertComment(BoardComment boardComment);

	List<Board> getPhotoList();
	
	List<Board> getFreeBoardList(HashMap<String, Object> params);
	
	List<Board> getGongjiList(HashMap<String, Object> params);

	Board getPhotoViewByBoardNo(int bdNo);
	
	List<BoardComment> getCommentByBoardNo(int bdNo);
	
	Board getFreeBoardViewByBoardNo(int bdNo);
	
	Board GongjiBoardViewByBoardNo(int bdNo);

	Board getGongjiBoardViewByBoardNo(int bdNo);
	
	void insertFreeBoardComment(BoardComment boardComment);
	
	void insertGongjiBoardComment(BoardComment boardComment);
	
	void updateFreeBoardComment(HashMap<String, Object> params);
	
	void updateGongjiBoardComment(HashMap<String, Object> params);
	
	void updatePhotoBoardComment(HashMap<String, Object> params);
	
	void deleteFreeBoardComment(int bcNo);
	
	void deleteGongjiBoardComment(int bcNo);
	
	void deletePhotoBoardComment(int bcNo);
	
	List<Board> getFreeBoardSearchList(HashMap<String, String> params);

	List<Board> getGongjiBoardSearchList(HashMap<String, String> params);
	
	int getFreeBoardCount(int bdtype);
	
	int getFreeBoardCommentCount();
	
	void deleteFreeBoard(int bdno);
	
	void deleteGongjiBoard(int bdno);
	
	void deletePhotoBoard(int bdno);
	
	void updateFreeBoard(Board board);
	
	void updateGongjiBoard(Board board);
	
	void updateFreeBoardReadCount(int bdNo);

	int getFreeBoardSearchCount(HashMap<String, String> params);
	
	List<Board> gongiTypeOne();

	List<Board> getBoardSearchList(String aucSearchData);

	
	List<Board> getBoardList();
	List<Board> getBoardReportList();
	Board getBoardView(int bdno);
	void setBoardBlind(int bdNo);

	

}
