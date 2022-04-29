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
import com.mycompany.webapp.dto.Comment;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.service.BoardService;
import com.mycompany.webapp.service.CommentService;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/board")
@Log4j2
public class BoardController {
	@Resource
	private BoardService boardService;
	
	@Resource
	private CommentService commentService;

	@GetMapping("/boardList")
	public String boardList(@RequestParam(defaultValue = "1") int pageNo, Model model) {
		int totalBoardNum = boardService.getTotalBoardCount();

		Pager pager = new Pager(5, 5, totalBoardNum, pageNo);
		model.addAttribute("pager", pager);

		List<Board> boards = boardService.getBoards(pager);
		model.addAttribute("boards", boards);

		return "board/boardList";
	}
	
	@GetMapping("/boardDetail") //여기에서 댓글도 같이 출력
	public String boardDetail(int boardno, @RequestParam(defaultValue = "1") int pageNo, Model model) {
		Board board = boardService.getBoard(boardno);
		model.addAttribute("board", board);

		int totalCommentNum = commentService.getTotalCommentCountByBoardno(boardno);
		Pager pager = new Pager(5, 5, totalCommentNum, pageNo);
		model.addAttribute("pager", pager);
		
		List<Comment> comments = commentService.getComments(boardno, pager);
		model.addAttribute("comments", comments);
		return "board/boardDetail";
	}
	
	@RequestMapping("/boardWriteForm")
	public String boardWriteForm() {
		return "board/boardWriteForm";
	}
	
	@RequestMapping("/boardUpdateForm")
	public String boardUpdateForm(int boardno, Model model) {
		Board board = boardService.getBoard(boardno);
		model.addAttribute("board", board);
		return "board/boardUpdateForm";
	}
	
	@PostMapping("/boardWrite")
	public String boardWrite() {
		return "redirect:/board/boardList";
	}
	
	@PostMapping("/boardUpdate")
	public String boardUpdate(Board board) {
		boardService.updateBoard(board);
		return "redirect:/board/boardDetail?boardno=" + board.getBoardno();
	}
	
	@GetMapping("/boardDelete")
	public String boardDelete(int boardno) {
		boardService.removeBoard(boardno);
		return "redirect:/board/boardList";
	}
}
