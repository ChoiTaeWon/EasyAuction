package com.easyauction.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.easyauction.dto.Board;
import com.easyauction.dto.BoardComment;
import com.easyauction.dto.BoardImage;
import com.easyauction.mapper.BoardMapper;

@Repository(value="boardRepository")
public class OracleBoardRepository implements BoardRepository{
	
	private BoardMapper boardMapper;
	@Autowired
	@Qualifier("boardMapper")
	public void setBoardMapper(BoardMapper boardMapper){
		this.boardMapper = boardMapper;
	}
	
	@Override
	public int insertFreeboard(Board board) {
		int bdNo = boardMapper.insertFreeBoard(board);
		
		return bdNo;		
	}

	@Override
	public int insertGongjiBoard(Board board) {
		int bdNo = boardMapper.insertGongjiBoard(board);
		
		return bdNo;		
	}
	
	@Override
	public int insertPhoto(Board board){
		
		int photoNo = boardMapper.insertPhoto(board);
		
		return photoNo;
	}
	@Override
	public void insertPhotoImage(BoardImage boardImage){
		
		boardMapper.insertPhotoImage(boardImage);
		
	}
	@Override
	public void insertComment(BoardComment boardComment){
		boardMapper.insertComment(boardComment);
	}
	@Override
	public List<Board> getPhotoList(){
		List<Board> photos = boardMapper.getPhotoList();
		return photos;
	}
	@Override
	public Board getPhotoViewByBoardNo(int bdNo){
		return boardMapper.getPhotoViewByBoardNo(bdNo);
	}
	public List<BoardComment> getCommentByBoardNo(int bdNo){
		return boardMapper.getCommentByBoardNo(bdNo);
	}
	@Override
	public List<Board> getFreeBoardList() {
		List<Board> boards = boardMapper.getFreeBoardList();
		return boards;
	}

	@Override
	public List<Board> getGongjiList() {
		List<Board> boards = boardMapper.getGongjiList();
		return boards;
	}

	@Override
	public Board getFreeBoardViewByBoardNo(int bdNo) {
		return boardMapper.getFreeBoardViewByBoardNo(bdNo);
	}
	
}
