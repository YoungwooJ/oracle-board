package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import service.MemberService;
import vo.Board;
import vo.Member;

@WebServlet("/member/removeMember")
public class RemoveMemberController extends HttpServlet {
	// 회원 탈퇴 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * VIEW -> WEB-INF/view/member/removeMember.jsp
		 * 
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
		
		Member member = new Member();
		member.setMemberId(loginMember.getMemberId());
		
		MemberService memberService = new MemberService();
		member = memberService.getMember(member);
		
		request.setAttribute("member", member);
		
		// 3. V
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/member/removeMember.jsp");
		
		rd.forward(request, response);
	}

	// 회원 탈퇴 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * redirect -> get방식 /member/logout <- 컨트롤러 요청 
		 * 
		 */
		// 로그인 후에만 진입가능
		HttpSession session = request.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		
		request.setCharacterEncoding("UTF-8");
		
		String memberPw = null;
		
		if(request.getParameter("memberPw")==null || request.getParameter("memberPw").equals("")){
			response.sendRedirect(request.getContextPath()+"/WEB-INF/view/member/memberOne.jsp");
			return;
		} else {
			memberPw = request.getParameter("memberPw");
		}
		
		// System.out.println(memberPw);
		
		Member member = new Member();
		member.setMemberId(loginMember.getMemberId());
		member.setMemberPw(memberPw);
		
		// 2. M
		MemberService memberService = new MemberService();
	    int row = memberService.removeBoard(member);
	    if(row == 1){
	    	System.out.println("회원탈퇴 성공");    	
	    	
	    	response.setContentType("text/html; charset=UTF-8");
	    	
	    	PrintWriter out = response.getWriter();
	    	 
	    	out.println("<script>alert('회원탈퇴하였습니다.'); location.href='logout';</script>");
	    	 
	    	out.flush();
	    } else {
	    	System.out.println("회원탈퇴 실패");
	    	
	    	String msg = null;
	    	msg = URLEncoder.encode("비밀번호를 확인하세요.", "utf-8");
			
			// View
	    	response.sendRedirect(request.getContextPath()+"/member/removeMember?msg="+msg);
	    }
	}
}
