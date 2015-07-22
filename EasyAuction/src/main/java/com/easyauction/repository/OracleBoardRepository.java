package com.easyauction.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.easyauction.dto.Board;
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
	public int insertPhoto(Board board){
		
		int photoNo = boardMapper.insertPhoto(board);
		
		return photoNo;
	}
	@Override
	public void insertPhotoImage(BoardImage boardImage){
		
		boardMapper.insertPhotoImage(boardImage);
		
	}
}
