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

@WebServlet("/board/addBoard")
public class AddBoardController extends HttpServlet {
	// 글쓰기 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후에만 진입가능
		HttpSession session = request.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		
		String memberId = null;
			
		if(request.getParameter("memberId") != null){
			memberId = request.getParameter("memberId");
		}
		// System.out.println(memberId);
		
	    Member member = new Member();
	    member.setMemberId(memberId);
	    
		request.setAttribute("member", member);
		
		// View
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/board/addBoardForm.jsp");
		
		rd.forward(request, response);
	}
	// 글쓰기 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후에만 진입가능
		HttpSession session = request.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		
		request.setCharacterEncoding("UTF-8");
		
		String boardTitle = null;
		String boardContent = null;
		
		String memberId = null;
		
		// 방어코드
		if(request.getParameter("boardTitle")==null || request.getParameter("boardTitle").equals("")){
			response.sendRedirect(request.getContextPath()+"/WEB-INF/view/board/addBoardForm.jsp");
		} else {
			boardTitle = request.getParameter("boardTitle");
		}
		if(request.getParameter("boardContent")==null || request.getParameter("boardContent").equals("")){
			response.sendRedirect(request.getContextPath()+"/WEB-INF/view/board/addBoardForm.jsp");
		} else {
			boardContent = request.getParameter("boardContent");
		}
		// System.out.println(boardTitle);
		// System.out.println(boardContent);
		
		if(request.getParameter("memberId")==null || request.getParameter("memberId").equals("")){
			response.sendRedirect(request.getContextPath()+"/WEB-INF/view/board/addBoardForm.jsp");
		} else {
			memberId = request.getParameter("memberId");
		}
		// System.out.println(memberId);
		
		Board board = new Board();
		board.setBoardTitle(boardTitle);
		board.setBoardContent(boardContent);
		
		Member member = new Member();
		member.setMemberId(memberId);
		
		BoardService boardService = new BoardService();
	    int row = boardService.addBoard(board, member);
	    if(row == 1){
	    	System.out.println("입력성공");
	    } else {
	    	System.out.println("입력실패");
	    }
		
		// View
		response.sendRedirect(request.getContextPath()+"/board/boardList");
		
	}
}
