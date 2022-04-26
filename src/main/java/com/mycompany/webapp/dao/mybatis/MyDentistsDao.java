package com.mycompany.webapp.dao.mybatis;

import java.util.List;

import com.mycompany.webapp.dto.Mydentists;
import com.mycompany.webapp.dto.Pager;

public interface MyDentistsDao {
	public List<Mydentists> selectByUserid(String userid);
}
