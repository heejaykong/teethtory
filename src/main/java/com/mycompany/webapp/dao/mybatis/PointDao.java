package com.mycompany.webapp.dao.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Point;

@Mapper
public interface PointDao {
	//나중에 수정이 필요할 수도 있음. 빠른 테스트 필요.
	public List<Point> selectAllByUserid(@Param("userid") String userid, @Param("pager") Pager pager);// 전체
	public List<Point> selectPointIsPlusByUserid(@Param("userid") String userid, @Param("pointisplus") boolean pointisplus, @Param("pager") Pager pager);//획득(true(+)), 사용(false(-))
	//로그인시에, 해당일에 로그인으로 인한 포인트 획득 내역이 있는지 점검.
	public Point selectTodaysLoginPoint(String userid);
	public int insert(Point point);
}
