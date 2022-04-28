package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/medicalHistoryPage")
@Log4j2
public class MedicalHistoryController {
	@RequestMapping("/")
	public String medicalHistoryPage() {
		return "medicalHistoryPage/main";
	}

	@RequestMapping("/reviewForm")
	public String reviewForm(Model model) {
//		model.addAttribute(치과정보넘기기)
		return "medicalHistoryPage/reviewForm";
	}

	@RequestMapping("/cancelForm")
	public String cancelForm() {
//		model.addAttribute(치과정보넘기기)
		return "redirect:/medicalHistoryPage/";
	}

	@RequestMapping("/postReview")
	public String postReview() {
//		model.addAttribute(치과정보넘기기)
		return "redirect:/medicalHistoryPage/";
	}
}
