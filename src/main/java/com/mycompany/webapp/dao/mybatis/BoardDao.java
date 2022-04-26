package com.mycompany.webapp.dao.mybatis;

import java.util.List;

import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Pager;

public interface BoardDao {
	public int count();
	public Board selectByBoardno(int boardno);
	public List<Board> selectByPage(Pager pager);
	public int insert(Board board);
	public int update(Board board);
	public int deleteByBoardno(int boradno);
}
