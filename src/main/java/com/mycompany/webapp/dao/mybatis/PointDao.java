package com.mycompany.webapp.dao.mybatis;

import java.util.List;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Points;

public interface PointDao {
	public List<Points> selectAllByUserid(String userid, Pager pager);// 전체
	public List<Points> selectPointIsPlusByUserid(String userid, boolean pointisplus, Pager pager);//획득(), 사용()
	public int insert(Points point);
	
}
