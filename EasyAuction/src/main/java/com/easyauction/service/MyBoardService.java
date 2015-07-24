package com.easyauction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.easyauction.dto.Board;
import com.easyauction.dto.BoardComment;
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
	
	@Override
	public void insertFreeboard(Board board) {
		boardRepository.insertFreeboard(board);		
	}

	@Override
	public void insertGongjiboard(Board board) {
		boardRepository.insertGongjiboard(board);		
	}
	
	public void insertPhoto(Board board){
		boardRepository.insertPhoto(board);
	}
	public void insertPhotoImage(BoardImage boardImage){
		boardRepository.insertPhotoImage(boardImage);
	}

	
	public List<Board> getPhotoList(){
		List<Board> photos = boardRepository.getPhotoList();
		
		return photos;
	}
	public Board getPhotoViewByBoardNo(int bdNo){
		return boardRepository.getPhotoViewByBoardNo(bdNo);
	}
	public void insertComment(BoardComment boardComment){
		boardRepository.insertComment(boardComment);
	}
	public List<BoardComment> getCommentByBoardNo(int bdNo){
		return boardRepository.getCommentByBoardNo(bdNo);
	}

}
