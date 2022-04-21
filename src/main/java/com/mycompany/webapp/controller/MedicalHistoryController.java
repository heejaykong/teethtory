package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/medicalHistoryPage")
@Log4j2
public class MedicalHistoryController {
	@RequestMapping("/")
	public String medicalHistoryPage() {
		return "medicalHistoryPage";
	}
}
