package com.mycompany.webapp.dao.mybatis;

import java.util.List;

import com.mycompany.webapp.dto.Comments;
import com.mycompany.webapp.dto.Pager;

public interface CommentsDao {
	public List<Comments> selectByPage(Pager pager);
	public int count();
	public Comments selectByBno(int bno);
	public int insert(Comments comment);
	public int deleteByBno(int bno);
	public int update(Comments comment);
}
