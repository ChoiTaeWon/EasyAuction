package com.easyauction.mapper;

import com.easyauction.dto.Board;
import com.easyauction.dto.BoardImage;

public interface BoardMapper {
	int insertPhoto(Board board);
	void insertPhotoImage(BoardImage boardImage);
}
