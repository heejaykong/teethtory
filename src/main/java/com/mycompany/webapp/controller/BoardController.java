package com.mycompany.webapp.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Comment;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.User;
import com.mycompany.webapp.service.BoardService;
import com.mycompany.webapp.service.CommentService;
import com.mycompany.webapp.service.UserService;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/board")
@Log4j2
public class BoardController {
	
	@Resource
	private UserService userService;
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private CommentService commentService;
	
	@GetMapping("/boardList")
	public String boardList(@RequestParam(defaultValue = "1") int pageNo, Model model, HttpSession session) {
		//Header에 이름, 포인트 값 넘기는 코드
		String userid = (String) session.getAttribute("sessionUserid");
		if(userid != null) {
			User user = userService.getUser(userid);
			String name = user.getUsername();
			int point = user.getUserpoint();
			model.addAttribute("name", name);
			model.addAttribute("point", point);
		}
		
		int totalBoardNum = boardService.getTotalBoardCount();

		Pager pager = new Pager(5, 5, totalBoardNum, pageNo);
		model.addAttribute("pager", pager);

		List<Board> boards = boardService.getBoards(pager);
		model.addAttribute("boards", boards);

		return "board/boardList";
	}
	
	@GetMapping("/searchBoardList")
	public String searchBoardList(@RequestParam(defaultValue = "1") int pageNo, String boardtitle, Model model) {
		int totalBoardNum = boardService.getTotalBoardCountBytitleContent(boardtitle);

		Pager pager = new Pager(5, 5, totalBoardNum, pageNo);
		model.addAttribute("pager", pager);

		List<Board> boards = boardService.getBoardsByTitleContent(boardtitle, pager);
		model.addAttribute("boards", boards);
		model.addAttribute("boardtitle", boardtitle);
		return "board/searchBoardList";
	}
	
	@GetMapping("/boardDetail") //여기에서 댓글도 같이 출력
	public String boardDetail(int boardno, @RequestParam(defaultValue = "1") int pageNo, Model model, HttpSession session) {
		Board board = boardService.getBoard(boardno);
		model.addAttribute("board", board);

		int totalCommentNum = commentService.getTotalCommentCountByBoardno(boardno);
		Pager pager = new Pager(5, 5, totalCommentNum, pageNo);
		model.addAttribute("pager", pager);
		
		List<Comment> comments = commentService.getComments(boardno, pager);
		model.addAttribute("comments", comments);
		session.setAttribute("boardno", boardno);
		
		String userid = (String) session.getAttribute("sessionUserid");
		model.addAttribute("userid", userid);
		return "board/boardDetail";
	}
	
	@RequestMapping("/boardWriteForm")
	public String boardWriteForm(HttpSession session) {
		if(session.getAttribute("sessionUserid") == null) {
			String formError = "글 작성을 위해선 로그인을 해주세요!";
			session.setAttribute("formError", formError);
			return "redirect:/login";
		}
		return "board/boardWriteForm";
	}
	
	@RequestMapping("/boardUpdateForm")
	public String boardUpdateForm(int boardno, Model model) {
		Board board = boardService.getBoard(boardno);
		model.addAttribute("board", board);
		return "board/boardUpdateForm";
	}
	
	@RequestMapping("/commentUpdateForm")
	public String commentUpdateForm(int commentno, Model model) {
		Comment comment = commentService.getComments(commentno);
		model.addAttribute("comment", comment);
		return "board/commentUpdateForm";
	}
	
	@PostMapping("/boardWrite")
	public String boardWrite(Board board, HttpSession session) throws Exception {
		String userid = (String) session.getAttribute("sessionUserid");
		board.setBoardwriter(userid);
		
		if (!board.getBattach().isEmpty()) { // Multipartfile은 넘어오지 않아도 null값이 아니라 객체 하나가 들어가서 null로 체크하지 않는다.
			board.setBimageoriginalfilename(board.getBattach().getOriginalFilename());
			board.setBimagecontenttype(board.getBattach().getContentType());
			board.setBimageoriginalfilename(board.getBimageoriginalfilename());
			board.setBimagesavedfilename(new Date().getTime() + "-" + board.getBimageoriginalfilename());
			File file = new File("/Users/choisukhee/Documents/2022/오스템 임플란트/중간 프로젝트/fileStorage/" + board.getBimagesavedfilename());
			board.getBattach().transferTo(file);
		}

		boardService.writeBoard(board);

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
	
	
	@GetMapping("/commentDelete")
	public String commentDelete(int commentno, HttpSession session) {
		commentService.removeComment(commentno);
		int boardno= (int)session.getAttribute("boardno");
		
		return "redirect:/board/boardDetail?boardno=" + boardno;
	}
	
	@PostMapping("/commentWrite")
	public String commentWrite(Comment comment, HttpSession session){
		if(session.getAttribute("sessionUserid") == null) {
			String formError = "댓글 작성을 위해선 로그인을 해주세요!";
			session.setAttribute("formError", formError);
			return "redirect:/login";
		}
		String userid = (String) session.getAttribute("sessionUserid");
		comment.setCommentwriter(userid);
		
		commentService.writeComment(comment);

		return "redirect:/board/boardDetail?boardno=" + comment.getBoardno();
	}
	
	@PostMapping("/commentUpdate")
	public String commentUpdate(Comment comment) {
		commentService.updateComment(comment);
		return "redirect:/board/boardDetail?boardno=" + comment.getBoardno();
	}
	
}
