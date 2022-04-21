package com.mycompany.webapp.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
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
	
}
