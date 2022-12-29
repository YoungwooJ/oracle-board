package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import vo.Board;
import vo.Member;

@WebServlet("/board/modifyBoard")
public class ModifyBoardController extends HttpServlet {
	// 글 수정 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후에만 진입가능
		HttpSession session = request.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		
		request.setCharacterEncoding("UTF-8");
		String msg = null;
		if(request.getParameter("msg") != null) {
			msg = request.getParameter("msg");
		}
		request.setAttribute("msg", msg);
		
		int boardNo = 0;
		
		if(request.getParameter("boardNo") != null){
			boardNo = Integer.parseInt(request.getParameter("boardNo"));
		}
		//System.out.println(boardNo);
		
		// 작성자만 수정할 수 있게
	    Board board = new Board();
		BoardService boardService = new BoardService();
		board = boardService.getBoardOne(boardNo);
	    
		String boardMemberId = board.getMemberId();
		String loginMemberId = loginMember.getMemberId();
		
		// System.out.println("boardMemberId: " + boardMemberId);
		// System.out.println("loginMemberId: " + loginMemberId);
		
		if(boardMemberId.equals(loginMemberId)) {
			request.setAttribute("board", board);
			
			// View
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/board/modifyBoardForm.jsp");
			
			rd.forward(request, response);
		} else {
			msg = "작성자만 수정할 수 있습니다.";
			
			// View
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardOne?boardNo="+boardNo+"&msg="+msg);
			
			rd.forward(request, response);
			return;
		}
	}
	
	// 글 수정 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후에만 진입가능
		HttpSession session = request.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		
		request.setCharacterEncoding("UTF-8");
		
		int boardNo = 0;
		String boardTitle = null;
		String boardContent = null;
		
		if(request.getParameter("boardNo")==null || request.getParameter("boardNo").equals("")){
			response.sendRedirect(request.getContextPath()+"/board/modifyBoard?boardNo="+boardNo);
			return;
		} else {
			boardNo = Integer.parseInt(request.getParameter("boardNo"));
		}
		if(request.getParameter("boardTitle")==null || request.getParameter("boardTitle").equals("")){
			response.sendRedirect(request.getContextPath()+"/board/modifyBoard?boardNo="+boardNo);
			return;
		} else {
			boardTitle = request.getParameter("boardTitle");
		}
		if(request.getParameter("boardContent")==null || request.getParameter("boardContent").equals("")){
			response.sendRedirect(request.getContextPath()+"/board/modifyBoard?boardNo="+boardNo);
			return;
		} else {
			boardContent = request.getParameter("boardContent");
		}
		
		System.out.println(boardNo);
		System.out.println(boardTitle);
		System.out.println(boardContent);
		
		Board board = new Board();
		board.setBoardNo(boardNo);
		board.setBoardTitle(boardTitle);
		board.setBoardContent(boardContent);
		
		BoardService boardService = new BoardService();
	    int row = boardService.modifyBoard(board);
	    if(row == 1){
	    	System.out.println("수정성공");
	    	
	    	String msg = null;
	    	msg = URLEncoder.encode("게시글을 수정하였습니다.", "utf-8");
			
			// View
			response.sendRedirect(request.getContextPath()+"/board/boardOne?boardNo="+boardNo+"&msg="+msg);
	    } else {
	    	System.out.println("수정실패");
	    	
	    	String msg = null;
	    	msg = URLEncoder.encode("게시글 수정에 실패하였습니다.", "utf-8");
	    	
	    	// View
			response.sendRedirect(request.getContextPath()+"/board/modifyBoard?boardNo="+boardNo+"&msg="+msg);
	    }
		
		
	}
}
