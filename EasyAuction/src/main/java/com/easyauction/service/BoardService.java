package com.easyauction.service;

import java.util.List;

import com.easyauction.dto.Board;
import com.easyauction.dto.BoardImage;

public interface BoardService {

 void insertPhoto(Board board);
 void insertPhotoImage(BoardImage boardImage);
 List<Board> getPhotoList();
 void insertFreeboard(Board board);
 void insertGongjiboard(Board board);

}

