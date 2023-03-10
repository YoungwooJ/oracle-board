package controller;

import java.io.IOException;
import java.io.PrintWriter;

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

@WebServlet("/board/removeBoard")
public class RemoveBoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후에만 진입가능
		HttpSession session = request.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		
		request.setCharacterEncoding("UTF-8");
		
		int boardNo = 0;
		
		if(request.getParameter("boardNo")==null || request.getParameter("boardNo").equals("")){
			response.sendRedirect(request.getContextPath()+"/board/boardList");
			return;
		} else {
			boardNo = Integer.parseInt(request.getParameter("boardNo"));
		}
		// System.out.println(boardNo);
		
		// 작성자만 삭제할 수 있게
		Board board = new Board();
		BoardService boardService = new BoardService();
		board = boardService.getBoardOne(boardNo);
	    
		String boardMemberId = board.getMemberId();
		String loginMemberId = loginMember.getMemberId();
		
		// System.out.println("boardMemberId: " + boardMemberId);
		// System.out.println("loginMemberId: " + loginMemberId);
		
		if(boardMemberId.equals(loginMemberId)) {
			Board paramBoard = new Board();
			paramBoard.setBoardNo(boardNo);
			
			int row = boardService.removeBoard(paramBoard);
		    if(row == 1){
		    	System.out.println("삭제성공");
		    	
		    	response.setContentType("text/html; charset=UTF-8");
		    	
		    	PrintWriter out = response.getWriter();
		    	 
		    	out.println("<script>alert('게시글을 삭제하였습니다.'); location.href='boardList';</script>");
		    	
		    	out.flush();
		    } else {
		    	System.out.println("삭제실패");
		    	
		    	String msg = "삭제에 실패하였습니다.";
				
				// View
				RequestDispatcher rd = request.getRequestDispatcher("/board/boardOne?boardNo="+boardNo+"&msg="+msg);
				
				rd.forward(request, response);
		    }
		} else {
			String msg = "작성자만 삭제할 수 있습니다.";
			
			// View
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardOne?boardNo="+boardNo+"&msg="+msg);
			
			rd.forward(request, response);
		}
	}
}
