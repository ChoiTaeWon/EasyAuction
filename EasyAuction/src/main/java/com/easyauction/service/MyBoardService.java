package com.easyauction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.easyauction.dto.Board;
import com.easyauction.dto.BoardImage;
import com.easyauction.repository.BoardRepository;

@Service("boardService")
public class MyBoardService implements BoardService{
	
	private BoardRepository boardRepository;
	@Autowired
	@Qualifier("boardRepository")
	public void setBoardRepository(BoardRepository boardRepository) {
		this.boardRepository = boardRepository;
	}
	
	public void insertPhoto(Board board){
		boardRepository.insertPhoto(board);
	}
	public void insertPhotoImage(BoardImage boardImage){
		boardRepository.insertPhotoImage(boardImage);
	}
}
