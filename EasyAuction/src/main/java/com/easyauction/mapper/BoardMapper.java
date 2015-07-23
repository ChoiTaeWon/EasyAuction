package com.easyauction.mapper;

import java.util.List;

import com.easyauction.dto.Board;
import com.easyauction.dto.BoardImage;

public interface BoardMapper {
	
	int insertFreeboard(Board board);

	int insertGongjiboard(Board board);
	
	int insertPhoto(Board board);
	
	void insertPhotoImage(BoardImage boardImage);
	
	List<Board> getPhotoList();
	
	List<Board> getfreeBoardList();
}
