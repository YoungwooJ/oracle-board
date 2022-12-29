<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>modifyMember.jsp</title>
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
	    
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<!-- 자바스크립트로 유효성 확인 -->
		<script>
			$(document).ready(function(){ // 페이지가 로드되고 나면 실행
				let allCk = false;
				$('#memberName').focus();
				
				// 멤버 이름 유효성 검사
				$('#memberName').blur(function(){
					if($('#memberName').val() == ''){
						$('#msg').text('이름을 입력해주세요.');
						$('#memberName').focus();
					} else {
						$('#msg').text('');
						$('#memberPw').focus();
					}
				});
				
				// 비밀번호 유효성 검사
				$('#memberPw').blur(function(){
					if($('#memberPw').val() == ''){
						$('#msg').text('비밀번호를 입력해주세요.');
						$('#memberPw').focus();
					} else {
						$('#msg').text('');
						$('#modifyBtn').focus();
						allCk = true;
					}
				});
				
				$('#modifyBtn').click(function(){
					if(allCk == false){
    					$('#memberPw').focus();
    					return false;
    				}
					$('#modifyForm').submit();
				});
			});
		</script>
		<style>
		th {
			text-align: center;
		}
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
			border-color: #747474;
			box-shadow: 0 0 10px #747474;
		}
		.container {
			display-inline : center;
		}
		</style>	
	</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	  <div class="container">
	    <a class="navbar-brand" href="${pageContext.request.contextPath}/home">게시판</a>
	    <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="navbar-collapse collapse" id="navbarColor02" style="">
	      <ul class="navbar-nav me-auto">
	        <li class="nav-item">
	          <a class="nav-link" href="${pageContext.request.contextPath}/home">홈
	            <span class="visually-hidden">(current)</span>
	          </a>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle active" data-bs-toggle="dropdown" href="${pageContext.request.contextPath}/" role="button" aria-haspopup="true" aria-expanded="false">마이페이지</a>
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
	<br>
	<div class="container">
		<h3>내 정보</h3>
		<div id="msg" style="color:red;">
			${msg}
		</div>
		<form method="post" action="${pageContext.request.contextPath}/member/modifyMember" id="modifyForm">
		<table class="table table-bordered">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" class="box" name="memberId" value="${member.memberId}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" class="box" id="memberName" name="memberName" value="${member.memberName}">
				</td>
			</tr>
			<tr>
				<th>가입날짜</th>
				<td>
					<input type="text" class="box" name="createdate" value="${member.createdate}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>수정날짜</th>
				<td>
					<input type="text" class="box" name="updatedate" value="${member.updatedate}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>비밀번호 입력</th>
				<td>
					<input type="password" class="box" id="memberPw" name="memberPw">
				</td>
			</tr>
		</table>
		<a style="float:left;" type="button" class="btn btn-success" href="${pageContext.request.contextPath}/member/memberOne">이전</a>
		<button style="float:right;" class="btn btn-warning" type="button" id="modifyBtn">수정</button>
		</form>
	</div>
	
	<br><br>
	
	<!--Footer-->
	<div>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</div>
	<!--Footer-->	
</body>
</html>