package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/reservation")
@Log4j2
public class ReservationUsingCalendarController {

	@RequestMapping("/reservationUsingCalendar")
	public String reservationUsingCalendar() {
		log.info("실행");
		return "reservation/reservationUsingCalendar";
	}
}
