package com.mycompany.webapp.dao.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.Comment;
import com.mycompany.webapp.dto.Pager;

public interface CommentsDao {
	public List<Comment> selectByPage(@Param("boardno") int boardno, @Param("pager") Pager pager);
	public int count();
	public int insert(Comment comment);
	public int update(Comment comment);
	public int deleteByBno(int bno);
}
