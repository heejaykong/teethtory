package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/reservation")
public class ReservationMainController {

	@RequestMapping("/reservationMain")
	public String reservationMain() {
		log.info("실행");
		return "reservation/reservationMain";
	}
}
