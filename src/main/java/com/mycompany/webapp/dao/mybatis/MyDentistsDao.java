package com.mycompany.webapp.dao.mybatis;

import java.util.List;

import com.mycompany.webapp.dto.Mydentists;
import com.mycompany.webapp.dto.Pager;

public interface MyDentistsDao {
	public List<Mydentists> selectByUserid(String userid);
	
	//사용자가 치과 검색 후, 내 치과로 등록.
	public int insert(Mydentists mydentists);
	//사용자가 내 치과 목록에서 특정 치과 삭제.
	public int delete(Mydentists mydentists);
	
}
