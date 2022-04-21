package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/reservationHistory")
@Log4j2
public class ReservationHistoryController {
	
	@RequestMapping("/reservationHistoryWithCalendar")
	public String reservationHistoryWithCalendar() {
		return "reservationHistory/reservationHistoryWithCalendar";
	}
}
