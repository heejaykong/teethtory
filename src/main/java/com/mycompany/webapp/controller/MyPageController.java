package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Point;
import com.mycompany.webapp.service.PointService;

import lombok.extern.log4j.Log4j2;
@Controller
@RequestMapping("/myPage")
@Log4j2
public class MyPageController {
	@Resource
	private PointService pointService;
	
	//마이페이지 메인화면.
	@RequestMapping("/main")
	public String myPageMenu() {
		log.info("실행");
		return "/myPage/main";
	}

	//마이페이지 선택시에 출력. 사용자가 내 치과로 등록한 치과 목록+등록 페이지.
	@RequestMapping("/myDentist")
	public String myDentist() {
		log.info("실행");
		return "/myPage/myDentist";
	}

	//마이페이지 - 내 포인트
	@RequestMapping("/myPointList")
	public String myPointList() {
		//Pager객체를 생성할 수 있도록, 로그인한 유저의 포인트 내역의 총 행 수를 얻어옴.
		int totalRows = pointService.getTotalPointCount("spring");
		log.info(totalRows);
		Pager pager = new Pager(10, 5, totalRows, 1);
		List<Point> list = pointService.getAllPointsByUserid("spring", pager);
		log.info("list 불러오기 완료");
		for(int i=0; i<10; i++) {
			log.info(list.get(i));
		}
		return "/myPage/myPointList";
	}
	
	//마이페이지 - 캘린더.
	@RequestMapping("/reservationHistoryWithCalendar")
	public String reservationHistoryWithCalendar() {
		log.info("실행");
		return "/myPage/reservationHistoryWithCalendar";
	}
	
	//마이페이지에서 햄버거 메뉴 중 '설정' 클릭시에 사용자의 계정정보 페이지 출력.
	@RequestMapping("/myInformation")
	public String myInformation() {
		log.info("실행");
		return "/myPage/myInformation";
	}

	//마이페이지 - 설정 - 회원정보 '수정하기' 클릭시에 출력. 
	@RequestMapping("/myInformationEditor")
	public String myInformationEditor() {
		log.info("실행");
		return "/myPage/myInformationEditor";
	}
	
	//마이페이지 - 설정 - '탈퇴하기' 클릭시에 출력
	@RequestMapping("/signOut")
	public String signOut() {
		log.info("실행");
		return "/myPage/signOut";
	} 

	@RequestMapping("/myReservationList")
	public String myReservationList() {
		log.info("실행");
		return "/myPage/myReservationList";
	}
}
