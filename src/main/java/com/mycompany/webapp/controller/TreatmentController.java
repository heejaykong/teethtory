package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/treatment")
@Log4j2
public class TreatmentController {
	@GetMapping("/main")
	public String showTreatmentsList() {
//		TBD: patientSsn에 해당하는 치료내역 목록 가져오기
		return "treatment/main";
//		또는
//		return "treatment/emptyTreatmentList";
	}
	
	@GetMapping("/details")
	public String details() {
//		TBD: treatNo에 해당하는 치료 상세화면으로 가기
//		return "treatment/details?treatNo=" + treatNo;
		return "treatment/details";
	}
	
	
	
	//-------------------------------
	@RequestMapping("/reviewForm")
	public String reviewForm(Model model) {
//		model.addAttribute(치과정보넘기기)
		return "treatment/reviewForm";
	}

	@RequestMapping("/cancelForm")
	public String cancelForm() {
//		model.addAttribute(치과정보넘기기)
		return "redirect:/treatment/";
	}

	@RequestMapping("/postReview")
	public String postReview() {
//		model.addAttribute(치과정보넘기기)
		return "redirect:/treatment/";
	}

}
