package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/reservation")
public class ReservationController {
	
	@RequestMapping("/")//상단 탭 진료 예약 클릭시, 예약화면으로 이동(영화관 예약 비슷한 그 화면...)
	public String reservation() {
		log.info("실행");
		return "reservation/reservation";
	}
}
