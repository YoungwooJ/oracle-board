<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>home</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 부트스트랩5 CDN -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
		
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/bootstrap.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/font/bootstrap-icons.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/themes/prism-okaidia.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/custom.min.css">
	    <!-- Global Site Tag (gtag.js) - Google Analytics -->
	    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23019901-1"></script>
	    <script>
	      window.dataLayer = window.dataLayer || [];
	      function gtag(){dataLayer.push(arguments);}
	      gtag('js', new Date());
		  
	      gtag('config', 'UA-23019901-1');
	    </script>
    </head>
	<style>
		table {
			border: 1px #BDBDBD solid;
			font-size: .9em;
			box-shadow: 0 2px 5px #BDBDBD;
			width: 100%;
			border-collapse: collapse;
			border-radius: 20px;
			overflow: hidden;
		}
		a {
			text-decoration: none;
		}
		.box:hover {
			outline: none !important;
			border-color: rgb(60, 179, 113);
			box-shadow: 0 0 10px rgb(60, 179, 113);
		}
		.container {
			display-inline : center;
		}
	</style>    
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	  <div class="container">
	    <a class="navbar-brand" href="#">게시판</a>
	    <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="navbar-collapse collapse" id="navbarColor02" style="">
	      <ul class="navbar-nav me-auto">
	        <li class="nav-item">
	          <a class="nav-link active" href="${pageContext.request.contextPath}/home">홈
	            <span class="visually-hidden">(current)</span>
	          </a>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="${pageContext.request.contextPath}/" role="button" aria-haspopup="true" aria-expanded="false">마이페이지</a>
	          <div class="dropdown-menu">
	            <a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberOne">내 정보</a>
	            <a class="dropdown-item" href="${pageContext.request.contextPath}/member/modifyMember">회원정보 수정</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
	          </div>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="${pageContext.request.contextPath}/board/boardList">게시판</a>
	        </li>
	      </ul>
	      <ul class="navbar-nav ms-md-auto">
	        <li class="nav-item">
	          <a target="_blank" rel="noopener" class="nav-link" href="https://github.com/YoungwooJ/oracle-board"> GitHub</a>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>
	<div class="container">
		<div class="alert alert-primary" role="alert">${loginMember.memberName}님 환영합니다.</div>
		
		<table class="table table-bordered">
			<tr>
				<th>설명: </th>
				<td>
					이번 프로젝트에서는 서비스할 수는 없지만 지금까지 배운 MVC구조로 Oracle을 사용해서 다른 DB와 SQL 쿼리문을 사용해보았습니다. 
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<img style="width:100%;" src="${pageContext.request.contextPath}/resources/static/img/oracle.jpg">
				</td>
			</tr>
		</table>
		<br><br>
		
		<a style="float:left;" type="button" class="btn btn-success" href="${pageContext.request.contextPath}/member/memberOne">내 정보</a>
		<a style="float:left;" type="button" class="btn btn-success" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
		
		<a style="float:right;" type="button" class="btn btn-success" href="${pageContext.request.contextPath}/board/boardList">게시판 바로가기</a>
	</div>
	
	<br><br>
	
	<!--Footer-->
	<div>
		<jsp:include page="../view/inc/footer.jsp"></jsp:include>
	</div>
	<!--Footer-->
</body>
</html>