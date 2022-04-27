package com.mycompany.webapp.dao.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Comment;
import com.mycompany.webapp.dto.Pager;

@Mapper
public interface CommentDao {
	public int count(int boardno);
	public List<Comment> selectByPage(int boardno, Pager pager);
	public int insert(Comment comment);
	public int update(Comment comment);
	public int deleteByCommentno(int commentno);
}
