package com.easyauction.repository;

import com.easyauction.dto.Board;
import com.easyauction.dto.BoardImage;

public interface BoardRepository {
	int insertPhoto(Board board);
	void insertPhotoImage(BoardImage boardImage);
}
