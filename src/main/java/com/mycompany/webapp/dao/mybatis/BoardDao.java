package com.mycompany.webapp.dao.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Pager;

@Mapper
public interface BoardDao {
	public int count();
	public int countByUserid(String userid);
	public int countBytitlecontent(String boardtitle);
	public Board selectByBoardno(int boardno);
	public List<Board> selectByPage(Pager pager);
	public List<Board> selectByUserid(@Param("userid") String userid, @Param("pager") Pager pager);
	public List<Board> selectByTitleContent(@Param("boarddata") String boardtitle, @Param("pager") Pager pager);
	public int insert(Board board);
	public int update(Board board);
	public int deleteByBoardno(int boardno);
	
}
