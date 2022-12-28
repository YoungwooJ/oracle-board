<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addMember</title>
	</head>
<body>
	<h1>회원정보 입력</h1>
	<form method="post" action="${pageContext.request.contextPath}/member/addMember">
		<table border="1">
			<tr>
				<th>회원 아이디</th>
				<td>
					<input type="text" name="memberId">
				</td>
			</tr>
			<tr>
				<th>회원 비밀번호</th>
				<td>
					<input type="password" name="memberPw">
				</td>
			</tr>
			<tr>
				<th>회원 이름</th>
				<td>
					<input type="text" name="memberName">
				</td>
			</tr>
		</table>
		<button type="submit">회원가입</button>
	</form>
</body>
</html>