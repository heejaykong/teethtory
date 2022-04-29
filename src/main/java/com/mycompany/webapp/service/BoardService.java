package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.mybatis.BoardDao;
import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class BoardService {	
	@Resource
	private BoardDao boardDao;
	
	public int getTotalBoardCount() {
		return boardDao.count();
	}
	
	public int getTotalBoardCountBytitleContent(String boardtitle) {
		return boardDao.countBytitlecontent(boardtitle);
	}
	
	public Board getBoard(int boardno) {
		return boardDao.selectByBoardno(boardno);
	}
	
	public List<Board> getBoards(Pager pager) {
		return boardDao.selectByPage(pager);
	}
	
	public List<Board> getBoardsByUserid(String userid, Pager pager) {
		return boardDao.selectByUserid(userid, pager);
	}
	
	public List<Board> getBoardsByTitleContent(String boardtitle,Pager pager) {
		return boardDao.selectByTitleContent(boardtitle,pager);
	}
	
	
	public int writeBoard(Board board) {
		int insertedRows = boardDao.insert(board);
		log.info("저장된 게시물 번호(boardno): " + board.getBoardno());
		return insertedRows;
	}
	
	public int updateBoard(Board board) {
		int updatedRows = boardDao.update(board);
		log.info("수정된 게시물 번호(boardno): " + board.getBoardno());
		return updatedRows;
	}
	
	public int removeBoard(int boardno) {
		int deletedRows = boardDao.deleteByBoardno(boardno);
		log.info("삭제된 게시물 번호(boardno): " + boardno);
		return deletedRows;
	}
}
