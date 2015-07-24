package com.easyauction.mapper;

import java.util.List;

import com.easyauction.dto.Board;
import com.easyauction.dto.BoardComment;
import com.easyauction.dto.BoardImage;

public interface BoardMapper {
	
	int insertFreeboard(Board board);

	int insertGongjiboard(Board board);
	
	int insertPhoto(Board board);
	
	void insertPhotoImage(BoardImage boardImage);
	
	void insertComment(BoardComment boardComment);

	List<Board> getPhotoList();

	Board getPhotoViewByBoardNo(int bdNo);
	
	List<BoardComment> getCommentByBoardNo(int bdNo);
	
}
