<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>modifyMember.jsp</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<!-- 자바스크립트로 유효성 확인 -->
		<script>
			$(document).ready(function(){ // 페이지가 로드되고 나면 실행
				let allCk = false;
				$('#memberName').focus();
				
				// 멤버 이름 유효성 검사
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
						$('#modifyBtn').focus();
						allCk = true;
					}
				});
				
				$('#modifyBtn').click(function(){
					if(allCk == false){
    					$('#memberPw').focus();
    					return false;
    				}
					$('#modifyForm').submit();
				});
			});
		</script>
	</head>
<body>
	<h1>내 정보</h1>
	<div id="msg" style="color:red">
	</div>
	<form method="post" action="${pageContext.request.contextPath}/member/modifyMember" id="modifyForm">
	<table border="1">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="memberId" value="${member.memberId}" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" id="memberName" name="memberName" value="${member.memberName}">
			</td>
		</tr>
		<tr>
			<th>가입날짜</th>
			<td>
				<input type="text" name="createdate" value="${member.createdate}" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>수정날짜</th>
			<td>
				<input type="text" name="updatedate" value="${member.updatedate}" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>비밀번호 입력</th>
			<td>
				<input type="password" id="memberPw" name="memberPw">
			</td>
		</tr>
	</table>
	<button type="submit" id="modifyBtn">수정</button>
	</form>
</body>
</html>