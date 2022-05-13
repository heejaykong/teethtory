package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.Banner;
import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Comment;
import com.mycompany.webapp.dto.Pager;
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
	
	//유저등급 중복 코드 제거
	private String getbackgroundColor(String userid) {
		//등급 기준 나누기
		int firstGradeStandard = 50000;
		int secondGradeStandard = 20000;
		
		String backgroundColor = "";
		if(!userid.equals("(알 수 없음)")) {
			int usedpoint = 0;
			usedpoint = userService.getusedPointBalance(userid);
			
			if(usedpoint >= firstGradeStandard) {
				backgroundColor = "fa-tree";
			} else if(usedpoint >= secondGradeStandard) {
				backgroundColor = "fa-pagelines";
			} else {
				backgroundColor = "fa-seedling";
			}
			
			//의사인지 체크하는 코드
			if(userService.getUser(userid).isIsdoctor()) {
				backgroundColor = "fa-user-doctor";
			}
			
		}
		return backgroundColor;
	}
	
	//배너 중복 코드 제거
	public Banner getBanner() {
		String[] linkList = {
				"https://mall.denall.com//event/event.do?method=eventDetail&subPjtType=DEN&event_cd=814",
				
				"https://smartstore.naver.com/vussen/category/7f642acf28244189a1a5f668f374e54c?cp=1",
				
				"https://mall.denall.com/event/event.do?method=eventDetail&event_cd=827&subPjtType=DEN",
				
				"https://smartstore.naver.com/vussen/category/198fb4217a194a0d9b32c0cb40741712?cp=1",
				
				"https://smartstore.naver.com/vussen",
				
				"https://smartstore.naver.com/vussen/category/7c07eb5b8ae2437eb162073b18511b8b?cp=1",
				
				"https://smartstore.naver.com/vussen/category/198fb4217a194a0d9b32c0cb40741712?cp=1",
				
				"https://smartstore.naver.com/vussen/products/6232800519"
			};
		//linkList 길이만큼 1부터 난수 생성
		int randomno = (int) (Math.random() * linkList.length) + 1;
		Banner banner = new Banner();
		
		String bannername = "banner" + randomno + ".png";
		String bannerlink = linkList[randomno - 1]; //인덱스는 0부터
		
		banner.setBannername(bannername);
		banner.setBannerlink(bannerlink);
		log.info(banner);
		return banner;
	}
	
	@GetMapping("/boardList")
	public String boardList(@RequestParam(defaultValue = "1") int pageNo, Model model, HttpSession session) {
				
		int totalBoardNum = boardService.getTotalBoardCount();

		Pager pager = new Pager(20, 5, totalBoardNum, pageNo);
		model.addAttribute("pager", pager);

		List<Board> boards = boardService.getBoards(pager);
		for(Board board : boards) {
			String userid = board.getBoardwriter();
			int commentcount = commentService.getTotalCommentCountByBoardno(board.getBoardno());
			
			//유저등급 중복 코드 제거
			String backgroundColor = getbackgroundColor(userid);
			board.setBackgroundColor(backgroundColor);
			
			board.setCommentcount(commentcount);
			
			if(board.getBimageoriginalfilename() != null) {
				board.setFilecount(true);
			}
			
		}
		
		//배너 중복 코드 제거
		Banner banner = getBanner();
		model.addAttribute("banner", banner);
		
		model.addAttribute("boards", boards);
		return "board/boardList";
	}
	
	@GetMapping("/searchBoardList")
	public String searchBoardList(@RequestParam(defaultValue = "1") int pageNo, String boardtitle, Model model) {
		int totalBoardNum = boardService.getTotalBoardCountBytitleContent(boardtitle);

		Pager pager = new Pager(20, 5, totalBoardNum, pageNo);
		model.addAttribute("pager", pager);

		List<Board> boards = boardService.getBoardsByTitleContent(boardtitle, pager);
		for(Board board : boards) {
			String userid = board.getBoardwriter();
			int commentcount = commentService.getTotalCommentCountByBoardno(board.getBoardno());
			
			//유저등급 중복 코드 제거
			String backgroundColor = getbackgroundColor(userid);
			board.setBackgroundColor(backgroundColor);
			
			board.setCommentcount(commentcount);
			
			if(board.getBimageoriginalfilename() != null) {
				board.setFilecount(true);
			}
			
		}
		
		//배너 중복 코드 제거
		Banner banner = getBanner();
		model.addAttribute("banner", banner);
		
		model.addAttribute("boards", boards);
		model.addAttribute("boardtitle", boardtitle);
		return "board/searchBoardList";
	}
	
	@GetMapping("/boardDetail") //여기에서 댓글도 같이 출력
	public String boardDetail(int boardno, @RequestParam(defaultValue = "1") int pageNo, Model model, HttpSession session) {
		Board board = boardService.getBoard(boardno);
		String boardUserid = board.getBoardwriter();
		int commentcount = commentService.getTotalCommentCountByBoardno(board.getBoardno());
		
		String backgroundColor = getbackgroundColor(boardUserid);
		board.setBackgroundColor(backgroundColor);
		board.setCommentcount(commentcount);
		
		model.addAttribute("board", board);
		
		if(board.getBimageoriginalfilename() != null) {
			board.setFilecount(true);
		}
		int totalCommentNum = commentService.getTotalCommentCountByBoardno(boardno);
		Pager pager = null;
		
		if(totalCommentNum == 0) {
			pager = null; 
		} else {
			pager = new Pager(5, 5, totalCommentNum, pageNo);
		}
		
		model.addAttribute("pager", pager);
		
		List<Comment> comments = commentService.getComments(boardno, pager);
		
		for(Comment comment : comments) {
			String commentUserid = comment.getCommentwriter();
			
			//유저등급 중복 코드 제거
			String commentbackgroundColor = getbackgroundColor(commentUserid);
			comment.setBackgroundColor(commentbackgroundColor);
			
		}
		//배너 중복 코드 제거
		Banner banner = getBanner();
		model.addAttribute("banner", banner);
		
		model.addAttribute("comments", comments);
		session.setAttribute("boardno", boardno);
		
		String userid = (String) session.getAttribute("sessionUserid");
		model.addAttribute("userid", userid);
		return "board/boardDetail";
	}
	
	@GetMapping(value="/boardDetailAttachedFile") //파일이 첨부된 게시글인 경우, 파일을 보여줌.
	public void boardDetailAttachedFile(
//			@RequestParam("boardno") int boardno
			@ModelAttribute("boardno") int boardno
			, @RequestHeader("User-Agent") String userAgent
			, HttpServletResponse response) throws Exception {//void: 직접 응답을 만들것.
		if(boardService.getBoard(boardno).getBimagesavedfilename() != null) {//게시물번호로 조회해서, 첨부된 파일이 있는지 조회. 있다면, 전송.
			log.info("실행");
			//DB에서 가져올 정보
			String originalFilename = boardService.getBoard(boardno).getBimageoriginalfilename();
			String saveFilename = boardService.getBoard(boardno).getBimagesavedfilename();
//			String userAgent = (String) model.get("userAgent");
			//응답 내용의 데이터 타입을 응답 헤더에 추가
			response.setContentType(boardService.getBoard(boardno).getBimagecontenttype());
			
			if(userAgent.contains("Trident") || userAgent.contains("MSIE")) {
				//IE 브라우저일 경우
				originalFilename = URLEncoder.encode(originalFilename, "UTF-8");
			} else {
				//크롬, 엣지, 사파리일 경우
				originalFilename = new String(originalFilename.getBytes("UTF-8"), "ISO-8859-1");
			}
			response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFilename + "\"");
			
			//파일 데이터를 응답 본문에 싣기
			File file = new File("/Users/choisukhee/Documents/2022/오스템 임플란트/중간 프로젝트/fileStorage/" + saveFilename);
			if(file.exists()) {
				FileCopyUtils.copy(
					new FileInputStream(file)
					, response.getOutputStream()
				);
			}
		}
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
		
		Banner banner = getBanner();
		model.addAttribute("banner", banner);
		return "board/boardUpdateForm";
	}
	
	@RequestMapping("/commentUpdateForm")
	public String commentUpdateForm(int commentno, Model model) {
		Comment comment = commentService.getComments(commentno);
		model.addAttribute("comment", comment);
		
		Banner banner = getBanner();
		model.addAttribute("banner", banner);
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
