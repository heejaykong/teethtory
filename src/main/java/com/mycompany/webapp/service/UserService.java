package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.mybatis.UserDao;
import com.mycompany.webapp.dto.User;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class UserService {
	@Resource
	private UserDao userDao;
	
	public User getUser(String userid) {
		return userDao.selectByUserid(userid);
	}
	
	public int createUser(User user) {
		int createdRows = userDao.insert(user);
		log.info("생성된 user의 아이디: " + user.getUserid());
		return createdRows;
	}
	
	public int updateUser(User user) {
		int updateRows = userDao.update(user);
		log.info("수정된 user의 아이디: " + user.getUserid());
		return updateRows;
	}
	
	public int deleteUser(String userid) {
		int deletedRows = userDao.deleteByUserid(userid);
		log.info("삭제된 user의 아이디: " + userid);
		return deletedRows;
	}
}
