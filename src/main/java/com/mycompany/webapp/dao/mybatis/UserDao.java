package com.mycompany.webapp.dao.mybatis;

import com.mycompany.webapp.dto.User;

public interface UserDao {
	public User selectByUserid(String userid);
	public int insert(User user);
	public int update(User user);
	public int deleteByUserid(String userid);
}
