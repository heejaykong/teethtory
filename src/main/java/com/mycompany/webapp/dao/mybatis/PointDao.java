package com.mycompany.webapp.dao.mybatis;

import java.util.List;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Point;

public interface PointDao {
	public List<Point> selectAllByUserid(String userid, Pager pager);// 전체
	public List<Point> selectPointIsPlusByUserid(String userid, boolean pointisplus, Pager pager);//획득(true(+)), 사용(false(-))
	public int insert(Point point);
}
