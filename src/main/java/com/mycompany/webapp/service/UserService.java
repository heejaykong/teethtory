package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.mybatis.UserDao;
import com.mycompany.webapp.dto.User;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class UserService {
	
	public enum JoinResult {
		SUCCESS, FAIL, DUPLICATED
	}
	
	public enum LoginResult {
		SUCCESS, FAIL_MID, FAIL_MPASSWORD
	}
	
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

	public JoinResult join(User user) {
		
		User dbUser = userDao.selectByUserid(user.getUserid());
		if(dbUser == null) {
			PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
//			PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			user.setUserpassword(passwordEncoder.encode(user.getUserpassword()));
			int result = userDao.insert(user);
			return JoinResult.SUCCESS;		
		} else {
			return JoinResult.DUPLICATED;
		}
		
	}

	public LoginResult login(User user) {
		User dbUser = userDao.selectByUserid(user.getUserid());
		if(dbUser == null) {
			return LoginResult.FAIL_MID;
		} else {
			PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			if(passwordEncoder.matches(user.getUserpassword(), dbUser.getUserpassword())) {
				return LoginResult.SUCCESS;
			} else {
				return LoginResult.FAIL_MPASSWORD;
			}
		}
		
	}

}
