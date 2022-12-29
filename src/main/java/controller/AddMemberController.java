package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import vo.Member;

@WebServlet("/member/addMember")
public class AddMemberController extends HttpServlet {
	// 회원가입 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * VIEW -> /WEB-INF/view/member/addMember.jsp
		 * 
		 */
		// 로그인 전에만 진입가능
		HttpSession session = request.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember != null) { // 로그인 상태
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/member/addMember.jsp");
		
		rd.forward(request, response);
	}
	// 회원가입 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * redirect -> get방식 /member/login <- 컨트롤러 요청
		 * 
		 */
		// 로그인 전에만 진입가능
		HttpSession session = request.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember != null) { // 로그인 상태
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		request.setCharacterEncoding("UTF-8");
		
		String memberId = null;
		String memberPw = null;
		String memberName = null;
		
		// 방어코드
		if(request.getParameter("memberId")==null || request.getParameter("memberId").equals("")){
			response.sendRedirect(request.getContextPath()+"/WEB-INF/view/member/login.jsp");
		} else {
			memberId = request.getParameter("memberId");
		}
		if(request.getParameter("memberPw")==null || request.getParameter("memberPw").equals("")){
			response.sendRedirect(request.getContextPath()+"/WEB-INF/view/member/login.jsp");
		} else {
			memberPw = request.getParameter("memberPw");
		}
		if(request.getParameter("memberName")==null || request.getParameter("memberName").equals("")){
			response.sendRedirect(request.getContextPath()+"/WEB-INF/view/member/login.jsp");
		} else {
			memberName = request.getParameter("memberName");
		}
		// System.out.println(memberId);
		// System.out.println(memberPw);
		// System.out.println(memberName);
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		member.setMemberName(memberName);
		
		// 2. M
		MemberService memberService = new MemberService();
	    int row = memberService.addMember(member);
	    if(row == 1){
	    	System.out.println("회원가입 성공");
	    	
	    	String msg = "새로운 아이디로 로그인하세요.";
			request.setAttribute("msg", msg);
			
			// View
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/member/login.jsp");
			
			rd.forward(request, response);
	    } else {
	    	System.out.println("회원가입 실패");
	    }
	}
}
