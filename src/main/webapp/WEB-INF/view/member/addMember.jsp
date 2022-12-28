<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addMember.jsp</title>
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
						$('#memberName').focus();
					}
				});
				
				// 이름 유효성 검사
				$('#memberName').blur(function(){
					if($('#memberName').val() == ''){
						$('#msg').text('이름을 입력해주세요.');
						$('#memberName').focus();
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
						$('#addBtn').focus();
						allCk = true;
					}
				});
				
				$('#addBtn').click(function(){
					if(allCk == false){
    					$('#memberPw').focus();
    					return false;
    				}
					$('#addForm').submit();
					alert("회원가입에 성공했습니다.");
				});
			});
		</script>
	</head>
<body>
	<h1>회원정보 입력</h1>
	<div id="msg" style="color:red">
	</div>
	<form method="post" action="${pageContext.request.contextPath}/member/addMember" id="addForm">
		<table border="1">
			<tr>
				<th>회원 아이디</th>
				<td>
					<input type="text" id="memberId" name="memberId">
				</td>
			</tr>
			<tr>
				<th>회원 이름</th>
				<td>
					<input type="text" id="memberName" name="memberName">
				</td>
			</tr>
			<tr>
				<th>회원 비밀번호</th>
				<td>
					<input type="password" id="memberPw" name="memberPw">
				</td>
			</tr>
		</table>
		<button type="submit" id="addBtn">회원가입</button>
	</form>
</body>
</html>