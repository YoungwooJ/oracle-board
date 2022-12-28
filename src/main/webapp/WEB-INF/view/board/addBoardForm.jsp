<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addBoardForm</title>
	</head>
<body>
	<h1>게시글 입력</h1>
	<form method="post" action="${pageContext.request.contextPath}/board/addBoard">
		<table border="1">
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="boardTitle">
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="memberId" value="${member.memberId}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="5" cols="50" name="boardContent"></textarea>
				</td>
			</tr>
		</table>
		<button type="submit">글입력</button>
	</form>
</body>
</html>