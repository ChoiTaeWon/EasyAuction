package com.easyauction.service;

import com.easyauction.dto.Board;
import com.easyauction.dto.BoardImage;

public interface BoardService {
 void insertPhoto(Board board);
 void insertPhotoImage(BoardImage boardImage);
}

