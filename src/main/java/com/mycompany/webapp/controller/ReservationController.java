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
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.Dentist;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.service.DentistService;
import com.mycompany.webapp.service.MyDentistService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/reservation")
public class ReservationController {
	@Resource
	private DentistService dentistService;
	@Resource
	private MyDentistService myDentistService;
	
	//header의 진료 예약 탭 클릭시, 예약화면으로 이동
	@RequestMapping("/main")
	public String reservation(HttpSession session
			, @RequestParam(defaultValue="null") String denname
			, @RequestParam(defaultValue="1") int pageNo
			, Model model) {
		log.info("실행");
		
		//치과 검색.(이름으로 검색.)
		if(!denname.equals("null")) {
			log.info("denname: " + denname);
			int totalRows = dentistService.getDentistNumByDenname(denname);
			Pager pager = new Pager(5, 5, totalRows, pageNo);
			model.addAttribute("pager", pager);
			List<Dentist> searchedDentistList = dentistService.getDentistByDenname(denname, pager);
			model.addAttribute("searchedDentistList", searchedDentistList);
		}
		
		return "reservation/main";
	}
	
	//reservationMain화면에서 특정 치과 1개 클릭한 경우, 치과의 간단한 정보를 지도와 함께 보여줌..
	@CrossOrigin(origins="*", allowedHeaders = "*")
	@GetMapping("/reservationUsingMap")
	public String reservationUsingMap(@RequestParam("denno") int denno
			, Model model) {
		log.info("denno: " + denno);
		Dentist dentist = dentistService.getDentistByDenno(denno);
		model.addAttribute("denno", dentist.getDenno());
		model.addAttribute("dendomain", dentist.getDendomain());
		
		
		return "reservation/reservationUsingMap";
	}
	
	//reservationUsingMap화면에서 치과정보 박스 클릭시에, 치과 상세 정보 화면으로 이동.
	@CrossOrigin(origins="*", allowedHeaders = "*")
	@GetMapping("/dentistDetail")
	public String dentistDetail(HttpSession session
			, @RequestParam("denno") int denno
			, @RequestParam(defaultValue="null") String task
			, Model model) {
		log.info("실행");
		//denno를 받아서, 웹 서버의 dentists테이블에서 dendomain의 값을 전달하면,
		//클라이언트에서 ajax통신으로 직접 해당 치과의 서버에 deninfo테이블의 정보를 받음.
		Dentist dentist = dentistService.getDentistByDenno(denno);
		model.addAttribute("dendomain", dentist.getDendomain());
		
		if(!task.equals("null")) {
			String userId = (String) session.getAttribute("sessionUserid");
			int registrationResult = myDentistService.registerMyDentist(userId, denno);
			model.addAttribute("registrationResult", registrationResult);			
		}
		
		return "reservation/dentistDetail";
	}
	
	@PostMapping(value="/dentistDetail", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String dentistDetail(HttpSession session
			, @RequestParam("denno") int denno) {
		log.info("denno : " + denno);
		//내 치과 목록에서, denno으로 점검.
		String userId = (String) session.getAttribute("sessionUserid");
		int alreadyRegistered = myDentistService.getMyDentistByDenno(userId, denno);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("alreadyRegistered", alreadyRegistered);
		return jsonObject.toString();
	}
	
	//특정 치과 상세 페이지에서 '예약하기' 버튼 클릭시에 달력과 버튼을 이용한 예약신청 화면으로 이동.
	@RequestMapping("/reservationUsingCalendar")
	public String reservationUsingCalendar() {
		log.info("실행");
		return "reservation/reservationUsingCalendar";
	}
	@RequestMapping("/afterReservationUsingCalendar")
	public String AfterReservationUsingCalendar() {
		log.info("실행");
		return "reservation/afterReservationUsingCalendar";
	}
}
