package com.mycompany.webapp.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class HomeController {

	@RequestMapping("/")
	public String home() {
		log.info("실행");
		return "home/home";
	}
	
	@RequestMapping("/login")
	public String login() {
		log.info("실행");
		return "home/login";
	}
	
	@RequestMapping("/signIn")
	public String signIn() {
		log.info("실행");
		return "home/signIn";
	}

}
