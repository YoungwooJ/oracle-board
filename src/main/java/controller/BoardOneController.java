package controller;

import java.io.IOException;

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

@WebServlet("/board/boardOne")
public class BoardOneController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * VIEW 메뉴구성
		 * 1) 글수정(로그인멤버 == 글쓴멤버)
		 * 2) 글삭제(로그인멤버 == 글쓴멤버)
		 */
		
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
		// System.out.println("boardNo: " + boardNo);
		
	    Board board = new Board();
		BoardService boardService = new BoardService();
		board = boardService.getBoardOne(boardNo);
	    
		request.setAttribute("board", board);
		
		// View
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/board/boardOne.jsp");
		
		rd.forward(request, response);
	}

}
