package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class HomeController {
	@RequestMapping("/")
	public String home() {
		return "home/home";
	}
	
	//header에서 '{포인트잔액}' 클릭시에, MyPageController의 myPagePointList()가 실행됨.
	//header에서 '마이페이지' 클릭시에, MyPageController의 myDentist()가 실행됨.
	
	@RequestMapping("/login")
	public String login() {
		return "home/login";
	}
	
	@RequestMapping("/signIn")
	public String signIn() {
		log.info("실행");
		return "home/signIn";
	}
	
}
