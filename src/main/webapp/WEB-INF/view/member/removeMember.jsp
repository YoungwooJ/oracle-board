<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>removeMember.jsp</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<!-- 자바스크립트로 유효성 확인 -->
		<script>
			$(document).ready(function(){ // 페이지가 로드되고 나면 실행
				let allCk = false;
				$('#memberPw').focus();
				
				// 비밀번호 유효성 검사
				$('#memberPw').blur(function(){
					if($('#memberPw').val() == ''){
						$('#msg').text('비밀번호를 입력해주세요.');
						$('#memberPw').focus();
					} else {
						$('#msg').text('');
						$('#deleteBtn').focus();
						allCk = true;
					}
				});
				
				$('#deleteBtn').click(function(){
					if(allCk == false){
    					$('#memberPw').focus();
    					return false;
    				}
					if(!confirm("회원탈퇴하시면 게시글도 전부 삭제됩니다.\n회원탈퇴하시겠습니까?")){
						$('#memberPw').focus();
    					return false;
					} else {
						$('#deleteForm').submit();
					}
				});
			});
		</script>
	</head>
<body>
	<h1>회원탈퇴</h1>
	<div id="msg" style="color:red">
	</div>
	<form method="post" action="${pageContext.request.contextPath}/member/removeMember" id="deleteForm">
	<table border="1">
		<tr>
			<th>아이디</th>
			<td>${member.memberId}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${member.memberName}</td>
		</tr>
		<tr>
			<th>가입날짜</th>
			<td>${member.createdate}</td>
		</tr>
		<tr>
			<th>비밀번호 입력</th>
			<td>
				<input type="password" id="memberPw" name="memberPw">
			</td>
		</tr>
	</table>
	<button type="submit" id="deleteBtn">삭제</button>
	</form>
</body>
</html>