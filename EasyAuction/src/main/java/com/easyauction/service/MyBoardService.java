package com.easyauction.service;

import java.util.HashMap;
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
	public void insertFreeBoard(Board board) {
		boardRepository.insertFreeboard(board);		
	}

	@Override
	public void insertGongjiBoard(Board board) {
		boardRepository.insertGongjiBoard(board);		
	}
	
	@Override
	public void insertPhoto(Board board){
		boardRepository.insertPhoto(board);
	}
	
	@Override
	public void insertPhotoImage(BoardImage boardImage){
		boardRepository.insertPhotoImage(boardImage);
	}
	
	@Override
	public List<Board> getPhotoList(){
		List<Board> photos = boardRepository.getPhotoList();
		return photos;
	}
	
	@Override
	public Board getPhotoViewByBoardNo(int bdNo){
		return boardRepository.getPhotoViewByBoardNo(bdNo);
	}
	
	@Override
	public void insertComment(BoardComment boardComment){
		boardRepository.insertComment(boardComment);
	}
	
	@Override
	public List<BoardComment> getCommentByBoardNo(int bdNo){
		return boardRepository.getCommentByBoardNo(bdNo);
	}
	
	@Override
	public List<Board> getFreeBoardList(int first, int last, int bdtype){
		List<Board> boards = boardRepository.getFreeBoardList(first, last, bdtype);
		return boards;
	}
	
	@Override
	public List<Board> getGongjiList(int first, int last) {
		List<Board> boards = boardRepository.getGongjiList(first, last);
		return boards;
	}

	@Override
	public Board getFreeBoardViewByBoardNo(int bdNo) {
		return boardRepository.getFreeBoardViewByBoardNo(bdNo);
	}

	@Override
	public Board getGongjiBoardViewByBoardNo(int bdNo) {
		return boardRepository.getGongjiBoardViewByBoardNo(bdNo);
	}
	
	@Override
	public void insertFreeBoardComment(BoardComment boardComment){
		boardRepository.insertFreeBoardComment(boardComment);
	}
	
	@Override
	public void insertGongjiBoardComment(BoardComment boardComment){
		boardRepository.insertGongjiBoardComment(boardComment);
	}
	
	@Override
	public void updateFreeBoardComment(HashMap<String, Object> params) {
		boardRepository.updateFreeBoardComment(params);
		
	}
	
	@Override
	public void updateGongjiBoardComment(HashMap<String, Object> params) {
		boardRepository.updateGongjiBoardComment(params);
		
	}
	
	@Override
	public void deleteFreeBoardComment(int bcNo){
		boardRepository.deleteFreeBoardComment(bcNo);
	}
	
	@Override
	public void deleteGongjiBoardComment(int bcNo) {
		boardRepository.deleteGongjiBoardComment(bcNo);
	}

	@Override
	public List<Board> getFreeBoardSearchList(int first, int last, String search, String searchdata, int bdtype) {
		List<Board> boards = boardRepository.getFreeBoardSearchList(first, last, search, searchdata, bdtype);
		return boards;
	}
	
	@Override
	public List<Board> getGongjiBoardSearchList(String search, String searchdata) {
		List<Board> boards = boardRepository.getGongjiBoardSearchList(search, searchdata);
		return boards;
	}

	@Override
	public int getFreeBoardCount(int bdtype) {
		return boardRepository.getFreeBoardCount(bdtype);
	}
	
	@Override
	public int getFreeBoardCommentCount() {
		return boardRepository.getFreeBoardCommentCount();
	}

	@Override
	public void deleteFreeBoard(int bdno) {
		boardRepository.deleteFreeBoard(bdno);
	}
	
	@Override
	public void deleteGongjiBoard(int bdno) {
		boardRepository.deleteGongjiBoard(bdno);
	}
	
	@Override
	public void deletePhotoBoard(int bdno) {
		boardRepository.deletePhotoBoard(bdno);
	}

	@Override
	public void updateFreeBoard(Board board) {
		boardRepository.updateFreeBoard(board);
	}
	
	@Override
	public void updateGongjiBoard(Board board) {
		boardRepository.updateGongjiBoard(board);
	}

	@Override
	public void updateFreeBoardReadCount(int bdNo) {
		boardRepository.updateFreeBoardReadCount(bdNo);
	}

	@Override
	public int getFreeBoardSearchCount(String search, String searchdata, int bdtype) {
		return boardRepository.getFreeBoardSearchCount(search, searchdata, bdtype);
	}

	@Override
	public List<Board> gongiTypeOne(){
		return boardRepository.gongiTypeOne();
	}

	@Override
	public List<Board> getBoardSearchList(String aucSearchData) {
		return boardRepository.getBoardSearchList(aucSearchData);
	}

	

	
	
}
