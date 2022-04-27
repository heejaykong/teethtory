package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.mybatis.CommentDao;
import com.mycompany.webapp.dto.Comment;
import com.mycompany.webapp.dto.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class CommentService {
	@Resource
	private CommentDao commentDao;
	
	public int getTotalCommentCount(int boardno) {
		return commentDao.countPerBoardno(boardno);
	}
	
	public List<Comment> getComments(int boardno, Pager pager){
		return commentDao.selectByPage(boardno, pager);
	}
	
	public int writeComment(Comment comment) {
		int insertedRows = commentDao.insert(comment);
		log.info("작성된 댓글 번호(comment): " + comment.getCommentno());
		return insertedRows;
	}
	
	public int updateComment(Comment comment) {
		int updatedRows = commentDao.update(comment);
		log.info("수정된 댓글 번호(comment): " + comment.getCommentno());
		return updatedRows;
	}
	
	public int deleteComment(int commentno) {
		int deletedRows = commentDao.deleteByCommentno(commentno);
		log.info("삭제된 댓글 번호(comment): " + commentno);
		return deletedRows;
	}
}
