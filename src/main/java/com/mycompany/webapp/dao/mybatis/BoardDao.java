package com.mycompany.webapp.dao.mybatis;

import java.util.List;

import com.mycompany.webapp.dto.Boards;
import com.mycompany.webapp.dto.Pager;

public interface BoardDao {
	public List<Boards> selectByPage(Pager pager);
	public int count();
	public Boards selectByBno(int bno);
	public int insert(Boards board);
	public int deleteByBno(int bno);
	public int update(Boards board);
}
