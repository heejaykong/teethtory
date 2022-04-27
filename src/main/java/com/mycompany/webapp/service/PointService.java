package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.mybatis.PointDao;
import com.mycompany.webapp.dao.mybatis.UserDao;
import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Point;
import com.mycompany.webapp.dto.User;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class PointService {
	@Resource
	private PointDao pointDao;
	
	@Resource
	private UserDao userDao;
	
	public boolean checkGotLoginPoint(String userid) {
		if(pointDao.selectTodaysLoginPoint(userid) != null) {//로그인 포인트 획득 이력 행 존재.
			return true;
		} else {//로그인 획득 이력 행 부존재.
			return false;
		}
	}
	
	//로그인 포인트 획득.
	public boolean rewardLoginPoint(String userid) {
		//당일에 로그인 포인트 획득 이력이 있는지 점검.
		int insertResult = 0;
		if(checkGotLoginPoint(userid) == false) {//로그인 포인트 획득X. 로그인 포인트 제공하면 됨.
			Point point = new Point();
			point.setUserid(userid);
			point.setPointisplus(true);
			point.setPointamount(100);
			point.setPointdesc("로그인 포인트");
			//pointdate는 쿼리문에서 sysdate로 입력.
			insertResult = pointDao.insert(point);
		}
		
		//users테이블의 userpoint에 100포인트 추가한 값으로 update.
		User user = new User();
		user = userDao.selectByUserid(userid);
		int userPoint = user.getUserpoint();
		user.setUserpoint(userPoint+100);
		int updateResult = userDao.update(user);
		
		if(insertResult == 1 && updateResult == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	//스케일링 할인.
	public boolean usePointForScaling(String userid) {
		//예약화면 표시할 때, 이미 1만 포인트 이상인지 점검했으므로,
		//컨트롤러에서 메소드 호출되면, 무조건 1만포인트 차감+userpoint 업데이트.
		
		//points 테이블에 스케일링 할인이력 insert.
		Point point = new Point();
		point.setUserid(userid);
		point.setPointisplus(false);
		point.setPointamount(10000);
		point.setPointdesc("스케일링 할인");
		int insertResult = pointDao.insert(point);
		
		//users테이블의 userpoint 10,000포인트 차감해서 업데이트.
		User user = new User();
		user = userDao.selectByUserid(userid);
		int userPoint = user.getUserpoint();
		user.setUserpoint(userPoint-10000);
		int updateResult = userDao.update(user);
		
		if(insertResult == 1 && updateResult == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public int getTotalPointCount() {
		return pointDao.count();
	}
	
	public List<Point> getAllPointsByUserid(String userid, Pager pager) {
		return pointDao.selectAllByUserid(userid, pager);
	}
	
	public List<Point> getUsedPointsByUserid(String userid, boolean pointisplus, Pager pager) {
		return pointDao. selectPointIsPlusByUserid(userid, pointisplus, pager);
	}
	
	public List<Point> getEarnedPointsByUserid(String userid, boolean pointisplus, Pager pager) {
		return pointDao. selectPointIsPlusByUserid(userid, pointisplus, pager);
	}
	
}
