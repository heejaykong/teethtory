package com.mycompany.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.Dentist;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Point;
import com.mycompany.webapp.service.DentistService;
import com.mycompany.webapp.service.MyDentistService;
import com.mycompany.webapp.service.PointService;
import com.mycompany.webapp.service.UserService;

import lombok.extern.log4j.Log4j2;
@Controller
@RequestMapping("/myPage")
@Log4j2
public class MyPageController {
	@Resource
	private PointService pointService;
	@Resource
	private UserService userService;
	@Resource
	private MyDentistService myDentistService;
	@Resource
	private DentistService dentistService;
	
	//마이페이지 메인화면.
	@RequestMapping("/main")
	public String myPageMenu() {
		log.info("실행");
		return "myPage/main";
	}

	//마이페이지 선택시에 출력. 사용자가 내 치과로 등록한 치과 목록+등록+삭제 페이지.
	@GetMapping("/myDentist")
	public String myDentist(HttpSession session
			, @RequestParam(defaultValue="null") String denname
			, @RequestParam(defaultValue="-1") int denno
			, String task
			, @RequestParam(defaultValue="1") int pageNo
			, Model model) {
		log.info("실행");
		String userId = (String) session.getAttribute("sessionUserid");
		
		//내 치과 등록하기
		//이미 등록된 치과는 추가X.(팝업까진 띄울필요X. MyDentists테이블에 PK없기 때문에 중복 행 입력 방지조치임.)
		//1. 이미 등록된 치과인지 점검.
		//1-1. 이미 등록된 치과면 아무조치X.
		//1-2. 등록 안 된 치과면 등록.
		if(denno != -1) {
			if(task.equals("add")) {
				if(myDentistService.getMyDentistByDenno(userId, denno) < 1) {//0인 경우에만 추가!
					myDentistService.registerMyDentist(userId, denno);
				}
			} else if(task.equals("delete")) {
				//내 치과 삭제하기
				myDentistService.removeMyDentist(userId, denno);
			}
		}
		
		//로그인한 유저의 '내 치과' 목록을 조회.
		List<Dentist> list = myDentistService.getMyDentist(userId);
		model.addAttribute("myDentists", list);
		
		//치과 검색.(이름으로 검색.)
		if(!denname.equals("null")) {
			log.info("denname: " + denname);
			int totalRows = dentistService.getDentistNumByDenname(denname);
			Pager pager = new Pager(5, 5, totalRows, pageNo);
			model.addAttribute("pager", pager);
			List<Dentist> searchedDentistList = dentistService.getDentistByDenname(denname, pager);
			model.addAttribute("searchedDentistList", searchedDentistList);
		}
		model.addAttribute("denname", denname);
		
		return "myPage/myDentist";
	}

	//마이페이지 - 내 포인트
	@GetMapping("/myPointList")
	public String myPointList(HttpSession session
			, @RequestParam(defaultValue="1") int pageNo
			, @RequestParam(defaultValue="TOTAL") String specification
			, Model model) {
		
		//로그인한 사용자의 포인트 잔액 전송.
		String userId = (String) session.getAttribute("sessionUserid");
		int pointBalance = userService.getPointBalance(userId);
		model.addAttribute("pointBalance", pointBalance);
		
		Pager pager = new Pager();
		List<Point> list = new ArrayList<>();
		//출력하려는 목록이 '전체/획득/사용' 중 어느 범주인지 확인하고 service의 각기 다른 메소드를 호출.
		if(specification.equals("TOTAL")) {
			//Pager객체를 생성할 수 있도록, 로그인한 유저의 포인트 내역의 총 행 수를 얻어옴.
			int totalRows = pointService.getTotalPointCount(userId);
			log.info(totalRows);
			pager = new Pager(10, 5, totalRows, pageNo);
			list = pointService.getAllPointsByUserid(userId, pager);
		} else if(specification.equals("GOT")) {
			int totalRows = pointService.getSpecificPointCount(userId, true);
			log.info(totalRows);
			pager = new Pager(10, 5, totalRows, pageNo);
			list = pointService.getEarnedPointsByUserid(userId, true, pager);
		} else {
			int totalRows = pointService.getSpecificPointCount(userId, false);
			log.info(totalRows);
			pager = new Pager(10, 5, totalRows, pageNo);
			list = pointService.getUsedPointsByUserid(userId, false, pager);
		}
		
		model.addAttribute("pager", pager);
		model.addAttribute("points", list);		
		return "myPage/myPointList";
	}
	
	//마이페이지 - 캘린더.
	@RequestMapping("/reservationHistoryWithCalendar")
	public String reservationHistoryWithCalendar() {
		log.info("실행");
		return "myPage/reservationHistoryWithCalendar";
	}
	
	//마이페이지에서 햄버거 메뉴 중 '설정' 클릭시에 사용자의 계정정보 페이지 출력.
	@RequestMapping("/myInformation")
	public String myInformation() {
		log.info("실행");
		return "myPage/myInformation";
	}

	//마이페이지 - 설정 - 회원정보 '수정하기' 클릭시에 출력. 
	@RequestMapping("/myInformationEditor")
	public String myInformationEditor() {
		log.info("실행");
		return "myPage/myInformationEditor";
	}
	
	//마이페이지 - 설정 - '탈퇴하기' 클릭시에 출력
	@RequestMapping("/signOut")
	public String signOut() {
		log.info("실행");
		return "myPage/signOut";
	} 

	@RequestMapping("/myReservationList")
	public String myReservationList() {
		log.info("실행");
		return "myPage/myReservationList";
	}
}
