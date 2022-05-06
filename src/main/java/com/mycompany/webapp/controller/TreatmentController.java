package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.Dentist;
import com.mycompany.webapp.dto.Treatment;
import com.mycompany.webapp.dto.User;
import com.mycompany.webapp.service.MyDentistService;
import com.mycompany.webapp.service.UserService;

import lombok.extern.log4j.Log4j2;

@CrossOrigin(origins="*", allowedHeaders = "*")
@Controller
@RequestMapping("/treatment")
@Log4j2
public class TreatmentController {
	// *** USER서버쪽 컨트롤러입니다 ***
	@Resource
	private UserService userService;
	@Resource
	private MyDentistService myDentistService;
		
	@GetMapping("/main")
	public String showTreatmentsList(HttpSession session, Model model) {
		
		//Header에 이름, 포인트 값 넘기는 코드
		String userid = (String) session.getAttribute("sessionUserid");
		if(userid != null) {
			User user = userService.getUser(userid);
			String name = user.getUsername();
			int point = user.getUserpoint();
			model.addAttribute("name", name);
			model.addAttribute("point", point);
		}		
//		TBD: patientSsn에 해당하는 치료내역 목록 가져오기
		User user = userService.getUser(userid);
		String patientssn = user.getUserssn();
		
		List<Dentist> dentist = myDentistService.getMyDentist(userid);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("dentist", dentist);
		String json = jsonObject.toString();
		
		model.addAttribute("dentist", json);
		model.addAttribute("patientssn", patientssn);
		
		return "treatment/main";
	}
	
	@GetMapping("/details")
	public String detailsGet(@RequestParam String treatno,
							@RequestParam String denno,
							Model model) {
		// 리스트 중 하나 클릭 시 treatno와 denno만 물고 details 화면으로 넘어감.
		log.info("treatno: " + treatno + "denno: " + denno);
		model.addAttribute("treatno", treatno);
		model.addAttribute("denno", denno);
		return "treatment/details";
	}
	@PostMapping("/details")
	public String detailsPost(Treatment treatment, Model model) {
		log.info("treatment:" + treatment);
		model.addAttribute("treatment", treatment);
		return "treatment/details";
	}
	
	@RequestMapping("/imageShow")
	public String imageShow(@RequestParam String filename, Model model) {
		model.addAttribute("filename", filename);
		return "treatment/imageShow";
	}
	
	//-------------------------------
	@GetMapping("/reviewForm")
	public String showReviewForm(@RequestParam String treatno,
								@RequestParam String denno,
								Model model) {
		// 치료내역 상세화면에서 후기 작성하기 클릭 시 treatno와 denno만 물고 reviewForm 화면으로 넘어감.
		model.addAttribute("treatno", treatno);
		model.addAttribute("denno", denno);
		return "treatment/reviewForm";
	}
}
