<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>boardOne.jsp</title>
	</head>
<body>
	<h1>게시글 내용</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<td>${board.boardNo}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${board.memberId}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${board.boardTitle}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${board.boardContent}</td>
		</tr>
		<tr>
			<th>생성날짜</th>
			<td>${board.createdate}</td>
		</tr>
		<tr>
			<th>수정날짜</th>
			<td>${board.updatedate}</td>
		</tr>
	</table>
	<div>
		<a href="${pageContext.request.contextPath}/board/modifyBoard?boardNo=${board.boardNo}">수정</a>
		<a href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${board.boardNo}">삭제</a>
	</div>
</body>
</html>