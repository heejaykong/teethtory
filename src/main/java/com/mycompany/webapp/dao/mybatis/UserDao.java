package com.mycompany.webapp.dao.mybatis;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.User;

@Mapper
public interface UserDao {
	public User selectByUserid(String userid);
	public int insert(User user);
	public int update(User user);
	public int deleteByUserid(@Param("userid") String userid, @Param("userpassword") String userpassword);
}
