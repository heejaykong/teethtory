package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/board")
@Log4j2
public class BoardController {
	
	@RequestMapping("/main")
	public String main() {
		return "board/main";
	}
	
	@RequestMapping("/boardDetail")
	public String boardDetail() {
		return "board/boardDetail";
	}
	
	@RequestMapping("/boardForm")
	public String boardForm() {
		return "board/boardForm";
	}
	
	@PostMapping("/boardWrite")
	public String boardWrite() {
		return "redirect:/board/main";
	}
}
