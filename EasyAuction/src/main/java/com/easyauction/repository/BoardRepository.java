package com.easyauction.repository;

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
	
	List<Board> getFreeBoardList();
	
	List<Board> getGongjiList();

	Board getFreeBoardViewByBoardNo(int bdNo);

}
