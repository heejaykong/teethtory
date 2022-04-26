package com.mycompany.webapp.dao.mybatis;

import java.util.List;

import com.mycompany.webapp.dto.Dentists;

public interface DentistsDao {
	public List<Dentists> selectByDenno(int denno);
}
