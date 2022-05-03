package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Dentist;
import com.mycompany.webapp.dto.User;
import com.mycompany.webapp.service.MyDentistService;
import com.mycompany.webapp.service.UserService;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/treatment")
@Log4j2
public class TreatmentController {
	
	@Resource
	private UserService userservice;
	
	@Resource
	private MyDentistService myDentistService;
	
	@GetMapping("/main")
	public String showTreatmentsList(HttpSession session, Model model) {
//		TBD: patientSsn에 해당하는 치료내역 목록 가져오기
		String userid = (String) session.getAttribute("sessionUserid");
		User user = userservice.getUser(userid);
		String patientssn = user.getUserssn();
		List<Dentist> dentist = myDentistService.getMyDentist(userid);
		int dentistnum = myDentistService.getMyDentist(userid).size();
		
		model.addAttribute("dentistnum", dentistnum);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("dentist", dentist);
		String json = jsonObject.toString();
		model.addAttribute("dentist", json);
		model.addAttribute("patientssn", patientssn);
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
