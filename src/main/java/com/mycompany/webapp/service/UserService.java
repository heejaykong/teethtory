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
	public enum LoginResult {
		SUCCESSFUL,
		FAILED
	}
	public enum SignupResult {
		SUCCESSFUL,
		FAILED__DUPLICATED_ID
//		FAILED__MISMATCH_ID_FORMAT,
//		FAILED__MISMATCH_PASSWORD_FORMAT 이 두개 유효성검사는 클라이언트에서 하기
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

	public LoginResult login(User user) {
		User searchedUserById = this.getUser(user.getUserid());
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		// 아이디가 잘못됨
		if(searchedUserById == null) {
			return LoginResult.FAILED;
		}
		// 비번이 잘못됨
		if(!passwordEncoder.matches(user.getUserpassword(), searchedUserById.getUserpassword())) {
			return LoginResult.FAILED;
		}
		return LoginResult.SUCCESSFUL;
	}

	public SignupResult signup(User user) {
		User searchedUserById = this.getUser(user.getUserid());
		// 이미 아이디가 존재함
		if(searchedUserById != null) {
			return SignupResult.FAILED__DUPLICATED_ID;
		}
		
		// 비밀번호 인코딩한 뒤 세팅
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		String endcodedPassword = passwordEncoder.encode(user.getUserpassword());
		user.setUserpassword(endcodedPassword);
		
		// user_role 세팅
		user.setUser_role("ROLE_USER");

		this.createUser(user);
		return SignupResult.SUCCESSFUL;
	}
	
	//사용자의 포인트 잔액 가져오기.
	public int getPointBalance(String userid) {
		User user = userDao.selectByUserid(userid);
		return user.getUserpoint();
	}
}
