package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;
@Controller
@RequestMapping("/myPage")
@Log4j2
public class MyPageController {
	
	@RequestMapping("/")
	public String myPageHome() {
		return "/myPage/myPagePoint";
	}
	
	@RequestMapping("/myPagePoint")
	public String myPagePoint() {
		return "/myPage/myPagePoint";
	}
	
	@RequestMapping("/myDentalClinicList")
	public String myDentalClinicList() {
		return "/myPage/myDentalClinicList";
	}
	
	@RequestMapping("/myInformationEditor")
	public String myInformationEditor() {
		return "/myPage/myInformationEditor";
	}
	
	@RequestMapping("/signOut")
	public String signOut() {
		return "/myPage/signOut";
	}

}
