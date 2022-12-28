<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
</head>
<body>
	<div>${loginMember.memberName}님 환영합니다.</div>
	
	<a href="${pageContext.request.contextPath}/member/memberOne">내 정보</a>
	<a href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
	<br>
	<a href="${pageContext.request.contextPath}/board/boardList">게시판 바로가기</a>
</body>
</html>