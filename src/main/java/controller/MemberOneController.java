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


@WebServlet("/member/memberOne")
public class MemberOneController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * VIEW -> /WEB-INF/view/member/memberOne.jsp
		 * 메뉴구성
		 * 1) 회원정보수정
		 * 2) 회원탈퇴
		 * 
		 */
		// 로그인 후에만 진입가능
		HttpSession session = request.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		
		Member member = new Member();
		member.setMemberId(loginMember.getMemberId());
		
		MemberService memberService = new MemberService();
		member = memberService.getMember(member);
		
		request.setAttribute("member", member);
		
		// View
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/member/memberOne.jsp");
		
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후에만 진입가능
		HttpSession session = request.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		
		Member member = new Member();
		member.setMemberId(loginMember.getMemberId());
		
		MemberService memberService = new MemberService();
		member = memberService.getMember(member);
		
		request.setAttribute("member", member);
		
		// View
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/member/memberOne.jsp");
		
		rd.forward(request, response);
	}
}
