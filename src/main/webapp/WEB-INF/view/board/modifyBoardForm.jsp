<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>modifyBoardForm.jsp</title>
	</head>
<body>
	<h1>게시글 수정</h1>
	<form method="post" action="${pageContext.request.contextPath}/board/modifyBoard">
		<table border="1">
			<tr>
				<th>번호</th>
				<td>
					<input type="number" name="boardNo" value="${board.boardNo}" readonly="readonly">
				</td>
			</tr>	
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="memberId" value="${board.memberId}" readonly="readonly">
				</td>
			</tr>	
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="boardTitle" value="${board.boardTitle}">
				</td>
			</tr>	
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="5" cols="50" name="boardContent">${board.boardContent}</textarea>
				</td>
			</tr>	
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>