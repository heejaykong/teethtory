package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;
@Controller
@RequestMapping("/treatmentlist")
@Log4j2
public class TreatmentListController {
	
	@RequestMapping("/aboutTreatmentList")
	public String aboutTreatmentList() {
		return "treatmentlist/aboutTreatmentList";
	}
	@RequestMapping("/noTreatmentList")
	public String noTreatmentList() {
		return "treatmentlist/noTreatmentList";
	}
	
	
	

}
