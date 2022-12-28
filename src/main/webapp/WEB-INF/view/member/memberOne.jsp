<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>memberOne.jsp</title>
	</head>
<body>
	<h1>내 정보</h1>
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
	</table>
	<div>
		<a href="${pageContext.request.contextPath}/member/modifyMember">회원이름 수정</a>
		<a href="${pageContext.request.contextPath}/member/removeMember">회원탈퇴</a>
	</div>
</body>
</html>