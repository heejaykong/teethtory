package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;
@Controller
@RequestMapping("/registerMyDentist")
@Log4j2
public class RegisterMyDentistController {
	
	@RequestMapping("/")
	public String registerMyDentist() {
		return "/registerMyDentist";
	}
}
