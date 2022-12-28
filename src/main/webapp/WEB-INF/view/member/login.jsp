<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>loginForm</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<!-- 자바스크립트로 유효성 확인 -->
		<script>
			$(document).ready(function(){ // 페이지가 로드되고 나면 실행
				let allCk = false;
				$('#memberId').focus();
				
				// 아이디 유효성 검사
				$('#memberId').blur(function(){
					if($('#memberId').val() == ''){
						$('#msg').text('아이디를 입력해주세요.');
						$('#memberId').focus();
					} else {
						$('#msg').text('');
						$('#memberPw').focus();
					}
				});
				
				// 비밀번호 유효성 검사
				$('#memberPw').blur(function(){
					if($('#memberPw').val() == ''){
						$('#msg').text('비밀번호를 입력해주세요.');
						$('#memberPw').focus();
					} else {
						$('#msg').text('');
						$('#loginBtn').focus();
						allCk = true;
					}
				});
				
				$('#loginBtn').click(function(){
					if(allCk == false){
    					$('#memberId').focus();
    					return false;
    				}
					$('#loginForm').submit();
				});
			});
		</script>
	</head>
<body>
	<h1>로그인</h1>
	<div>
		<span id="msg" style="color:red"></span>
	</div>
	<form method="post" action="${pageContext.request.contextPath}/member/login" id="loginForm">
		<table border="1">
			<tr>
				<th>아이디 : </th>
				<td>
					<input type="text" name="memberId" id="memberId">
				</td>
			</tr>
			<tr>
				<th>
					비밀번호 : 
				</th>
				<td>
					<input type="password" name="memberPw" id="memberPw">
				</td>
			</tr>
		</table>
		<a style="float:left" type="button" href="${pageContext.request.contextPath}/member/addMember">회원가입</a>
		<button type="submit" id="loginBtn">로그인</button>
	</form>
</body>
</html>