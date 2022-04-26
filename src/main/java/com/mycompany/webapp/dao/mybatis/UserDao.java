package com.mycompany.webapp.dao.mybatis;

import com.mycompany.webapp.dto.Users;

public interface UserDao {
	public Users selectByUserid(String userid);
	public int insert(Users user);
	public int update(Users user);
	public int deleteByUserid(String userid);
}
