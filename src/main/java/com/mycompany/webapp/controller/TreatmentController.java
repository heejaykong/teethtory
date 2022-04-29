package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/treatment")
public class TreatmentController {
	@RequestMapping("/main")
	public String main() {
		return "treatment/main";
	}
	@GetMapping("/imageDetail")
	public String imageDetail(int imageNo) {
		return "treatment/imageDetail/?imageNo" + imageNo;
	}
}
