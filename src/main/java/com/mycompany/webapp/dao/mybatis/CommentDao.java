package com.mycompany.webapp.dao.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.Comment;
import com.mycompany.webapp.dto.Pager;

@Mapper
public interface CommentDao {
	public int countByBoardno(int boardno);
	public int countByUserid(String userid);
	public Comment selectBycommentno(int commentno);
	public List<Comment> selectByPage(@Param("boardno") int boardno, @Param("pager") Pager pager);
	public List<Comment> selectByUserid(@Param("userid") String userid, @Param("pager") Pager pager);
	public int insert(Comment comment);
	public int update(Comment comment);
	public int deleteByCommentno(int commentno);
}
