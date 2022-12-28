<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#rowPerPage').change(function(){
			$('#pageForm').submit();
			alert('change');
		});
	});
</script>
</head>
<body>
	<h1>게시판</h1>
	<form id="pageForm" method="get" action="${pageContext.request.contextPath}/board/boardList">
		<select name="rowPerPage" id="rowPerPage">
			<c:if test="${rowPerPage ==10}">
				<option value="10" selected="selected">10</option>
				<option value="20">20</option>
				<option value="30">30</option>
			</c:if>
			<c:if test="${rowPerPage ==20}">
				<option value="10">10</option>
				<option value="20" selected="selected">20</option>
				<option value="30">30</option>
			</c:if>
			<c:if test="${rowPerPage ==30}">
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="30" selected="selected">30</option>
			</c:if>
		</select>
	</form>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>생성날짜</th>
		</tr>
		<c:forEach var="b" items="${boardList}">
			<tr>
				<td>${b.boardNo}</td>
				<td><a href="${pageContext.request.contextPath}/board/boardOne?boardNo=${b.boardNo}">${b.boardTitle}</a></td>
				<td>${b.createdate}</td>
			</tr>
		</c:forEach>
	</table>
	<div>
		<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage-1}">이전</a>
		<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage+1}">다음</a>
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/board/addBoard?memberId=${member.memberId}">게시글 입력</a>
	</div>
	<!-- 검색창 -->
	<form method="get" action="${pageContext.request.contextPath}/board/boardList ">
		<c:if test="${search != null}">
			<input type="text" name="search" value="${search}">
		</c:if>
		<c:if test="${search == null}">
			<input type="text" name="search" placeholder="검색할 제목을 입력하세요.">
		</c:if>
		<button type="submit">검색</button>
	</form>
</body>
</html>