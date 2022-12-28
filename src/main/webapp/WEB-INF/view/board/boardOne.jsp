<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>boardOne.jsp</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<!-- 자바스크립트로 유효성 확인 -->
		<script>
			$(document).ready(function(){ // 페이지가 로드되고 나면 실행
				// 게시글 삭제 버튼 클릭시 확인 알람
				$('#deleteBtn').click(function(){
					if(!confirm("게시글을 삭제하시겠습니까?")){
    					return false;
					} else {
						$('#deleteBtn').submit();
					}
				});
			});
		</script>
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
		<a type="button" id="deleteBtn" href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${board.boardNo}">삭제</a>
	</div>
</body>
</html>