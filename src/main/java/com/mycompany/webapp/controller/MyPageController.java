package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;
@Controller
@RequestMapping("/myPage")
@Log4j2
public class MyPageController {
	//마이페이지 메인화면.
	@RequestMapping("/")
	public String myPageMenu() {
		log.info("실행");
		return "/myPage/myPageMenu";
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
		log.info("실행");
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
