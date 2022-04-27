package com.mycompany.webapp.dao.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Pager;

@Mapper
public interface BoardDao {
	public int count();
	public Board selectByBoardno(int boardno);
	public List<Board> selectByPage(Pager pager);
	public int insert(Board board);
	public int update(Board board);
	public int deleteByBoardno(int boradno);
}
