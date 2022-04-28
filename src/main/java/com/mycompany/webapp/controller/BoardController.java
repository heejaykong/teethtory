package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.service.BoardService;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/board")
@Log4j2
public class BoardController {
	@Resource
	private BoardService boardService;

	@GetMapping("/boardList")
	public String boardList(@RequestParam(defaultValue = "1") int pageNo, Model model) {
		int totalBoardNum = boardService.getTotalBoardCount();

		Pager pager = new Pager(5, 5, totalBoardNum, pageNo);
		model.addAttribute("pager", pager);

		List<Board> boards = boardService.getBoards(pager);
		model.addAttribute("boards", boards);

		return "board/boardList";
	}
	
	@GetMapping("/boardDetail")
	public String boardDetail(int bno, Model model) {
		Board board = boardService.getBoard(bno);
		model.addAttribute("board", board);

		return "board/boardDetail";
	}
	
	@RequestMapping("/boardForm")
	public String boardForm() {
		return "board/boardForm";
	}
	
	@PostMapping("/boardWrite")
	public String boardWrite() {
		return "redirect:/board/boardList";
	}
}
