package com.mycompany.webapp.dao.mybatis;

import java.util.List;

import com.mycompany.webapp.dto.Comment;
import com.mycompany.webapp.dto.Pager;

public interface CommentDao {
	public int count(int boardno);
	public Comment selectByBoardno(int boardno);
	public List<Comment> selectByPage(Pager pager);
	public int insert(Comment comment);
	public int update(Comment comment);
	public int deleteByCommentno(int commentno);
}
