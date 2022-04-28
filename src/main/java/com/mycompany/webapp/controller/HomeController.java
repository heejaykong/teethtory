package com.mycompany.webapp.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.mycompany.webapp.dto.User;
import com.mycompany.webapp.service.UserService;
import com.mycompany.webapp.service.UserService.LoginResult;
import com.mycompany.webapp.service.UserService.SignupResult;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class HomeController {
	//header에서 '{포인트잔액}' 클릭시에, MyPageController의 myPagePointList()가 실행됨.
	//header에서 '마이페이지' 클릭시에, MyPageController의 myDentist()가 실행됨.
	@Resource
	private UserService userService;

	@RequestMapping("/")
	public String home() {
		log.info("실행");
		return "home/main";
	}
	
	@GetMapping("/login")
	public String loginForm() {
		log.info("실행");
		return "home/login";
	}
	
	@PostMapping("/login")
	public String login(User user, Model model, HttpSession session) {
		LoginResult result = userService.login(user);
		if (result == LoginResult.FAILED) {
			model.addAttribute("error", "아이디나 비밀번호가 일치하지 않습니다.");
			return "home/login";
		}
		session.setAttribute("sessionUserid", user.getUserid());
		log.info("로그인 성공한 유저: " + user.getUserid());
		log.info("sessionUserid에 저장된 userid: " + session.getAttribute("sessionUserid"));
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("sessionUserid");
		log.info(
			"로그아웃. 세션에서 sessionUserid를 remove한 뒤의 getAttribute(\"sessionUserid\"):" + session.getAttribute("sessionUserid")
		);
		return "redirect:/";
	}
	
	@GetMapping("/userinfo")
	public String userinfo(HttpSession session) {
		
		String memberId = (String) session.getAttribute("sessionUserid");

		log.info("memberId: " + memberId);
		/*
		 * log.info("sessionMid: " + sessionUserid); log.info("mid: " + userid);
		 */
		return "redirect:/";
	}
	
	// TBD(4월28일):
	// -테스팅해보고 사인업로직까지 짜기(완)
	// -user 비밀번호 칼럼은 varchar2(200)로 바꾸고(완)
	// -user role 칼럼은 디폴트값 설정해주기(완)
	// -user이메일은 낫널풀거나 칼럼 없애기(완)
	// 그러고 나서도 잘 되는지 확인하고
	// 나머지 뷰단 연결하기(회원가입링크, 로그인링크, 로그아웃링크 등)
	
	@GetMapping("/signup")
	public String signupForm() {
		log.info("실행");
		return "home/signup";
	}
	
	@PostMapping("/signup")
	public String signup(User user, Model model) {
		SignupResult signupResult = userService.signup(user);
		
		if(signupResult == SignupResult.FAILED__DUPLICATED_ID) {
			model.addAttribute("error", "중복된 아이디가 있습니다.");
			return "home/signup";
		}
		return "redirect:/login";
	}
}
