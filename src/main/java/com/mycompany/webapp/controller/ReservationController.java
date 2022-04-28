package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/reservation")
public class ReservationController {
	
	@RequestMapping("/main")
	public String reservation() {
		log.info("실행");
		return "reservation/main";
	}
	//header의 탭 진료 예약 클릭시, 예약화면으로 이동
	@RequestMapping("/reservationMain")
	public String reservationMain() {
		log.info("실행");
		return "reservation/reservationMain";
	}
	
	//reservationMain화면에서 특정 치과 1개 클릭한 경우의 치과 상세 페이지.
	@RequestMapping("/dentistDetail")
	public String dentistDetail() {
		log.info("실행");
		return "reservation/dentistDetail";
	}
	
	//특정 치과 상세 페이지에서 '예약하기' 버튼 클릭시에 달력과 버튼을 이용한 예약신청 화면으로 이동.
	@RequestMapping("/reservationUsingCalendar")
	public String reservationUsingCalendar() {
		log.info("실행");
		return "reservation/reservationUsingCalendar";
	}
	@RequestMapping("/AfterReservationUsingCalendar")
	public String AfterReservationUsingCalendar() {
		log.info("실행");
		return "reservation/AfterReservationUsingCalendar";
	}
	
	
}
