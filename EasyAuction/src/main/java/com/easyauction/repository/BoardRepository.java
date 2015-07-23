package com.easyauction.repository;

import java.util.List;

import com.easyauction.dto.Board;
import com.easyauction.dto.BoardImage;

public interface BoardRepository {
	int insertPhoto(Board board);
	void insertPhotoImage(BoardImage boardImage);
	List<Board> getPhotoList();
}
