package com.mycompany.webapp.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j2
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping("/")
	public String home(Locale locale, Model model) {
		logger.info("실행");
		return "home";
	}
	
	@RequestMapping("/myPage/myPagePoint")
	public String myPage() {
		return "/myPage/myPagePoint";
	}
	
	@RequestMapping("/myPage/myDentalClinicList")
	public String myDentalClinicList() {
		return "/myPage/myDentalClinicList";
	}
	
	@RequestMapping("/myPage/myInformationEditor")
	public String myInformationEditor() {
		return "/myPage/myInformationEditor";
	}
	
	@RequestMapping("/myPage/signOut")
	public String signOut() {
		return "/myPage/signOut";
	}
		
	@RequestMapping("/reservation")
	public String reservation() {
		log.info("실행");
		return "reservation";

	}
	
}
