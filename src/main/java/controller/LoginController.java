package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import vo.Member;


@WebServlet("/member/login")
public class LoginController extends HttpServlet {
	private MemberService memberService;
	// 로그인 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * VIEW -> /WEB-INF/view/member/login.jsp
		 */
		// 로그인 전에만 진입가능
		HttpSession session = request.getSession();
		// 로그인 전 : loginMember -> null
		// 로그인 후 : loginMember -> not null
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember != null) { // 이미 로그인 상태
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		// 회원가입 폼 View
		request.getRequestDispatcher("/WEB-INF/view/member/login.jsp").forward(request, response);
	}
	
	// 로그인 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 로그인 세션 정보 : ex) session.setAttribute("loginMember", Member타입)
		 * redirect -> get방식 home <- 컨트롤러 요청
		 * 
		 */
		request.setCharacterEncoding("UTF-8");
		
		// 로그인 전에만 진입가능
		HttpSession session = request.getSession();
		// 로그인 전 : loginMember -> null
		// 로그인 후 : loginMember -> not null
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember != null) { // 이미 로그인 상태
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		String memberId = null;
		String memberPw = null;
		
		// 방어코드
		if(request.getParameter("memberId")==null || request.getParameter("memberId").equals("")){
			response.sendRedirect(request.getContextPath()+"/WEB-INF/view/member/login.jsp");
			return;
		} else {
			memberId = request.getParameter("memberId");
		}
		if(request.getParameter("memberPw")==null || request.getParameter("memberPw").equals("")){
			response.sendRedirect(request.getContextPath()+"/WEB-INF/view/member/login.jsp");
			return;
		} else {
			memberPw = request.getParameter("memberPw");
		}
		
		// 디버깅 코드
		System.out.println(memberId);
		System.out.println(memberPw);
		
		Member paramMember = new Member();
		paramMember.setMemberId(memberId);
		paramMember.setMemberPw(memberPw);
		
		this.memberService = new MemberService();
		
		Member returnMember = memberService.login(paramMember);
		
		if(returnMember == null) { // 로그인 실패
			System.out.println("로그인 실패");
			response.sendRedirect(request.getContextPath()+"/WEB-INF/view/member/login/jsp");
			return;
		}
		
		session.setAttribute("loginMember", returnMember);
		response.sendRedirect(request.getContextPath()+"/home");
	}
}
