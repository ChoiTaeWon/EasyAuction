package com.easyauction.mapper;

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
	
	List<Board> getFreeBoardList();
	
	List<Board> getGongjiList();

	Board getPhotoViewByBoardNo(int bdNo);
	
	List<BoardComment> getCommentByBoardNo(int bdNo);
	
	Board getFreeBoardViewByBoardNo(int bdNo);
	
}
