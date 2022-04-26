package com.mycompany.webapp.dao.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.Comments;
import com.mycompany.webapp.dto.Pager;

public interface CommentsDao {
	public List<Comments> selectByPage(@Param("boardno") int boardno, @Param("pager") Pager pager);
	public int count();
	public int insert(Comments comment);
	public int update(Comments comment);
	public int deleteByBno(int bno);
}
