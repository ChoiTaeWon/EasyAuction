package com.easyauction.repository;

import java.util.HashMap;
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
	public List<Board> getFreeBoardList(int first, int last) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("first", first);
		params.put("last", last);
	
		List<Board> boards = boardMapper.getFreeBoardList(params);
		return boards;
	}
	
	@Override
	public List<Board> getGongjiList(int first, int last) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("first", first);
		params.put("last", last);
		
		List<Board> boards = boardMapper.getGongjiList(params);
		return boards;
	}

	@Override
	public Board getFreeBoardViewByBoardNo(int bdNo) {
		return boardMapper.getFreeBoardViewByBoardNo(bdNo);
	}
	
	@Override
	public Board getGongjiBoardViewByBoardNo(int bdNo) {
		return boardMapper.getGongjiBoardViewByBoardNo(bdNo);
	}

	@Override
	public void insertFreeBoardComment(BoardComment boardComment) {
		boardMapper.insertFreeBoardComment(boardComment);
	}

	@Override
	public void insertGongjiBoardComment(BoardComment boardComment) {
		boardMapper.insertGongjiBoardComment(boardComment);
	}
	
	@Override
	public void updateFreeBoardComment(BoardComment boardComment) {
		boardMapper.updateFreeBoardComment(boardComment);
	}
	
	@Override
	public void deleteFreeBoardComment(int bcNo) {
		boardMapper.deleteFreeBoardComment(bcNo);
	}

	@Override
	public List<Board> getFreeBoardSearchList(String search, String searchdata) {
		HashMap<String, String> params= new HashMap<String, String>();
		params.put("search", search);
		params.put("searchdata", searchdata);
		List<Board> boards = boardMapper.getFreeBoardSearchList(params);
		return boards;
	}
	
	@Override
	public List<Board> getGongjiBoardSearchList(String search, String searchdata) {
		HashMap<String, String> params= new HashMap<String, String>();
		params.put("search", search);
		params.put("searchdata", searchdata);
		List<Board> boards = boardMapper.getGongjiBoardSearchList(params);
		return boards;
	}

	@Override
	public int getFreeBoardCount() {
		return boardMapper.getFreeBoardCount();
	}
	
	@Override
	public int getFreeBoardCommentCount() {
		return boardMapper.getFreeBoardCommentCount();
	}
	
	@Override
	public void deleteFreeBoard(int bdNo) {
		boardMapper.deleteFreeBoard(bdNo);
	}

	@Override
	public void updateFreeBoard(Board board) {
		boardMapper.updateFreeBoard(board);
	}

	@Override
	public void updateFreeBoardReadCount(int bdNo) {
		boardMapper.updateFreeBoardReadCount(bdNo);
		
	}

}
