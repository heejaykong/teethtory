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
	public String home(HttpSession session, Model model) {
		//Header에 이름, 포인트 값 넘기는 코드
		String userid = (String) session.getAttribute("sessionUserid");
		if(userid != null) {
			User user = userService.getUser(userid);
			String name = user.getUsername();
			int point = user.getUserpoint();
			model.addAttribute("name", name);
			model.addAttribute("point", point);
		}
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
		String userid = (String) session.getAttribute("sessionUserid");
		log.info("sessionUserid: " + userid);
		return "redirect:/";
	}
	
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
	@RequestMapping("/easteregg")
	public String easteregg() {
		log.info("실행");
		return "home/easteregg";
	}
}
