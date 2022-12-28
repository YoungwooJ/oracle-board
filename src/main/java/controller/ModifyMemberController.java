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
import service.MemberService;
import vo.Board;
import vo.Member;

@WebServlet("/member/modifyMember")
public class ModifyMemberController extends HttpServlet {
	// 회원수정 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * VIEW -> /WEB-INF/view/member/modifyMember.jsp
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
		
		// 3. V
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/member/modifyMember.jsp");
		
		rd.forward(request, response);
	}
	
	// 회원정보 수정 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * redirect -> get방식 /member/memberOne?key값 <- 컨트롤러 요청
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
		
		String memberId = null;
		String memberPw = null;
		String newMemberName = null;
		
		if(request.getParameter("memberId")==null || request.getParameter("memberId").equals("")){
			response.sendRedirect(request.getContextPath()+"/member/modifyMember");
			return;
		} else {
			memberId = request.getParameter("memberId");
		}
		if(request.getParameter("memberPw")==null || request.getParameter("memberPw").equals("")){
			response.sendRedirect(request.getContextPath()+"/member/modifyMember");
			return;
		} else {
			memberPw = request.getParameter("memberPw");
		}
		if(request.getParameter("memberName")==null || request.getParameter("memberName").equals("")){
			response.sendRedirect(request.getContextPath()+"/member/modifyMember");
			return;
		} else {
			newMemberName = request.getParameter("memberName");
		}
		
		System.out.println(memberId);
		System.out.println(memberPw);
		System.out.println(newMemberName);
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		
		// 2. M
		MemberService memberService = new MemberService();
		
	    int row = memberService.modifyMemberName(member, newMemberName);
	    if(row == 1){
	    	System.out.println("수정성공");
	    } else {
	    	System.out.println("수정실패");
	    }
		
		// View
		response.sendRedirect(request.getContextPath()+"/member/memberOne");
	}
}
