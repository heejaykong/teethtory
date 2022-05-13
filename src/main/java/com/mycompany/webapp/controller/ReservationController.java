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
import com.mycompany.webapp.dto.User;
import com.mycompany.webapp.service.DentistService;
import com.mycompany.webapp.service.MyDentistService;
import com.mycompany.webapp.service.UserService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@CrossOrigin(origins="*", allowedHeaders = "*")
@RequestMapping("/reservation")
public class ReservationController {
	
	@Resource
	private UserService userService;
	@Resource
	private DentistService dentistService;
	@Resource
	private MyDentistService myDentistService;
	private Pager pager;
	
	//header의 진료 예약 탭 클릭시, 예약화면으로 이동
	@RequestMapping("/main")
	public String reservation(HttpSession session
			, @RequestParam(required=false) String denname
			, @RequestParam(defaultValue="1") int pageNo
			, Model model) {

		String userid = (String) session.getAttribute("sessionUserid");
		if(userid != null) {
			//Header에 이름, 포인트 값 넘기는 코드
			User user = userService.getUser(userid);
			String name = user.getUsername();
			int point = user.getUserpoint();
			model.addAttribute("name", name);
			model.addAttribute("point", point);
			
			//예약화면에 내 기본 등록 병원 값 넘기는 코드
			List<Dentist> myDentistList = myDentistService.getMyDentist(userid);
			model.addAttribute("myDentistList", myDentistList);
		}
		
		//치과 검색.(이름으로 검색.)
		if(denname != null) {
			log.info("denname: " + denname);
			int totalRows = dentistService.getDentistNumByDenname(denname);
			pager = new Pager(5, 5, totalRows, pageNo);
			model.addAttribute("pager", pager);
			List<Dentist> searchedDentistList = dentistService.getDentistByDenname(denname, pager);
			model.addAttribute("searchedDentistList", searchedDentistList);
			log.info(searchedDentistList);
		}
		model.addAttribute("denname", denname);
		
		return "reservation/main";
	}
	
	//reservationMain화면에서 특정 치과 1개 클릭한 경우, 치과의 간단한 정보를 지도와 함께 보여줌..
	@CrossOrigin(origins="*", allowedHeaders = "*")
	@GetMapping("/reservationUsingMap")
	public String reservationUsingMap(@RequestParam("dendomain") String dendomain
									, Model model) {
		log.info("dendomain: " + dendomain);
		Dentist dentist = dentistService.getDentistByDendomain(dendomain);
		model.addAttribute("dendomain", dentist.getDendomain());
//		model.addAttribute("dentist", dentist);//..?
		
		return "reservation/reservationUsingMap";
	}
	
	@CrossOrigin(origins="*", allowedHeaders = "*")
	@PostMapping(value="/dentistDetail", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String dentistDetail(HttpSession session
			, @RequestParam("dendomain") String dendomain, Model model) {
		log.info("dendomain : " + dendomain);

//		String dendomain = dentistService.getDentistByDenno(denno).getDendomain();
		model.addAttribute("dendomain", dendomain);
		//내 치과 목록에서, dendomain으로 점검.
		String userId = (String) session.getAttribute("sessionUserid");
		int alreadyRegistered = myDentistService.getMyDentistByDendomain(userId, dendomain);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("alreadyRegistered", alreadyRegistered);
		return jsonObject.toString();
	}
	
	//reservationUsingMap화면에서 치과정보 박스 클릭시에, 치과 상세 정보 화면으로 이동.
	@CrossOrigin(origins="*", allowedHeaders = "*")
	@GetMapping("/dentistDetail")
	public String dentistDetail(HttpSession session
			, @RequestParam("dendomain") String dendomain
			, @RequestParam(defaultValue="null") String task
			, Model model) {
		log.info("실행");
		//dendomain를 받아서, 웹 서버의 dentists테이블에서 dendomain의 값을 전달하면,
		//클라이언트에서 ajax통신으로 직접 해당 치과의 서버에 deninfo테이블의 정보를 받음.
		
		Dentist dentist = dentistService.getDentistByDendomain(dendomain);
		model.addAttribute("dendomain", dentist.getDendomain());
		
//		if(!task.equals("null")) {
		String userId = (String) session.getAttribute("sessionUserid");
		int registrationResult = myDentistService.registerMyDentist(userId, dendomain);
		model.addAttribute("registrationResult", registrationResult);			
//		}
		
		return "reservation/dentistDetail";
	}
	
	//특정 치과 상세 페이지에서 '예약하기' 버튼 클릭시에 달력과 버튼을 이용한 예약신청 화면으로 이동.
	@CrossOrigin(origins="*", allowedHeaders = "*")
	@RequestMapping("/reservationUsingCalendar")
	public String reservationUsingCalendar(@RequestParam("dendomain") String dendomain
			, HttpSession session,Model model) {
		String userid =(String)session.getAttribute("sessionUserid");
		User user = userService.getUser(userid);
		log.info("실행");
		int point = user.getUserpoint();
		model.addAttribute("point",point);
		model.addAttribute("dendomain", dendomain);
		return "reservation/reservationUsingCalendar";
	}
	
	@CrossOrigin(origins="*", allowedHeaders = "*")
	@GetMapping("/afterReservationUsingCalendar")
	public String AfterReservationUsingCalendar(@RequestParam("dendomain") String dendomain
			, @RequestParam("gotDiscount") String gotDiscount
			, Model model, HttpSession session) {

		log.info("gotDiscount : " + gotDiscount);
		log.info("gotDiscount.getClass().getName() : " + gotDiscount.getClass().getName());

		String userid = (String) session.getAttribute("sessionUserid");
		String patientssn = userService.getUser(userid).getUserssn();

		model.addAttribute("dendomain", dendomain);
		model.addAttribute("patientssn", patientssn);
		model.addAttribute("gotDiscount", gotDiscount);
		return "reservation/afterReservationUsingCalendar";
	}
	
	@CrossOrigin(origins="*", allowedHeaders = "*")
	@PostMapping(value="/getRecipientInformation", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getRecipientInformation(HttpSession session) {
		log.info("실행");
		String userid = (String) session.getAttribute("sessionUserid");
		// 사용자의 이름, 연락처 가져와서 응답으로 보내기.
		User user = userService.getUser(userid);
		String userName = user.getUsername();
		String userPhone = user.getUserphone();
		
		JSONObject obj = new JSONObject();
		obj.put("userName", userName);
		obj.put("userPhone", userPhone);
		
		return obj.toString();
	}
	
	@CrossOrigin(origins="*", allowedHeaders = "*")
	@PostMapping(value="/getReviewRank", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getReviewRank(@RequestParam("userid") String userid) {
		String backgroundColor = "";
		if(userid != null) {
			int usedpoint = 0;
			usedpoint = userService.getusedPointBalance(userid);
			if(usedpoint >= 50000) {
				backgroundColor = "fa-tree";
			} else if(usedpoint >= 20000) {
				backgroundColor = "fa-pagelines";
			} else {
				backgroundColor = "fa-seedling";
			}
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("backgroundColor", backgroundColor);
		String json = jsonObject.toString();
		return json;
	}
	
}
