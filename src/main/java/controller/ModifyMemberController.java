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

import service.MemberService;
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
	    	
	    	String msg = "회원정보를 수정하였습니다.";
			request.setAttribute("msg", msg);
			
			// View
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberOne");
			
			rd.forward(request, response);
	    	
	    } else {
	    	System.out.println("수정실패");
	    	
	    	String msg = null;
	    	msg = URLEncoder.encode("비밀번호를 확인하세요.", "utf-8");
			
			// View
			response.sendRedirect(request.getContextPath()+"/member/modifyMember?msg="+msg);
	    }
	}
}
