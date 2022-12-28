<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>modifyBoardForm.jsp</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<!-- 자바스크립트로 유효성 확인 -->
		<script>
			$(document).ready(function(){ // 페이지가 로드되고 나면 실행
				let allCk = false;
				$('#boardTitle').focus();
				
				// 제목 유효성 검사
				$('#boardTitle').blur(function(){
					if($('#boardTitle').val() == ''){
						$('#msg').text('제목을 입력해주세요.');
						$('#boardTitle').focus();
					} else {
						$('#msg').text('');
						$('#boardContent').focus();
					}
				});
				
				// 내용 유효성 검사
				$('#boardContent').blur(function(){
					if($('#boardContent').val() == ''){
						$('#msg').text('내용을 입력해주세요.');
						$('#boardContent').focus();
					} else {
						$('#msg').text('');
						$('#modifyBtn').focus();
						allCk = true;
					}
				});
				
				$('#modifyBtn').click(function(){
					if(allCk == false){
    					$('#boardContent').focus();
    					return false;
    				}
					$('#modifyForm').submit();
				});
			});
		</script>
	</head>
<body>
	<h1>게시글 수정</h1>
	<div id="msg" style="color:red">
	</div>
	<form method="post" action="${pageContext.request.contextPath}/board/modifyBoard" id="modifyForm">
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
					<input type="text" id="boardTitle" name="boardTitle" value="${board.boardTitle}">
				</td>
			</tr>	
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="5" cols="50" id="boardContent" name="boardContent">${board.boardContent}</textarea>
				</td>
			</tr>	
		</table>
		<button type="submit" id="modifyBtn">수정</button>
	</form>
</body>
</html>