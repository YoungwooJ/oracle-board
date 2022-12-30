<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>boardList.jsp</title>
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
		<script>
			$(document).ready(function(){
				$('#rowPerPage').change(function(){
					$('#pageForm').submit();
					alert('페이지당 게시글 개수가 바뀌었습니다.');
				});
			});
		</script>
		<style>
		th,td {
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
	          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="${pageContext.request.contextPath}/" role="button" aria-haspopup="true" aria-expanded="false">마이페이지</a>
	          <div class="dropdown-menu">
	            <a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberOne">내 정보</a>
	            <a class="dropdown-item" href="${pageContext.request.contextPath}/member/modifyMember">회원정보 수정</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
	          </div>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link active" href="${pageContext.request.contextPath}/board/boardList">게시판</a>
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
		<h3>게시판</h3>
		<br>
		<form style="float:left;" id="pageForm" method="get" action="${pageContext.request.contextPath}/board/boardList">
			보기 : 
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
			개 씩	
		</form>
		
		<!-- 검색창 -->
		<form style="float:right;" method="get" action="${pageContext.request.contextPath}/board/boardList ">
			<c:if test="${search != null}">
				<input class="box" type="text" name="search" value="${search}">
			</c:if>
			<c:if test="${search == null}">
				<input class="box" type="text" name="search" placeholder="검색할 제목을 입력하세요.">
			</c:if>
			<button class="btn btn-success" type="submit">검색</button>
		</form>
		<br><br>
		<table class="table table-bordered">
			<tr class="text-white bg-success">
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
		<!-- 페이징 코드 -->
		<ul class="pagination justify-content-center">
		<c:choose>
			<c:when test="${serach == null || empty search}">
				<li class="page-item"><a class="page-link text-success" href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=1">처음</a></li>
				<c:if test="${currentPage > 1}">
					<li class="page-item"><a class="page-link text-success" href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage-1}">이전</a></li>
				</c:if>
				<li class="page-item"><span class="page-link text-success">${currentPage}</span></li>
				<c:if test="${currentPage < lastPage}">
					<li class="page-item"><a class="page-link text-success" href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage+1}">다음</a></li>
				</c:if>
				<li class="page-item"><a class="page-link text-success" href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${lastPage}">마지막</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link text-success" href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=1&search=${search}">처음</a>
				<c:if test="${currentPage > 1}">
					<li class="page-item"><a class="page-link text-success" href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage-1}&search=${search}">이전</a>
				</c:if>
				<li class="page-item"><span class="page-link text-success">${currentPage}</span></li>
				<c:if test="${currentPage < lastPage}">
					<li class="page-item"><a class="page-link text-success" href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage+1}&search=${search}">다음</a>
				</c:if>
				<li class="page-item"><a class="page-link text-success" href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${lastPage}&search=${search}">마지막</a>
			</c:otherwise>
		</c:choose>	
		</ul>
		<a style="float:left;" type="button" class="btn btn-success" href="${pageContext.request.contextPath}/home">이전</a>
		<a style="float:right;" type="button" class="btn btn-info" href="${pageContext.request.contextPath}/board/addBoard?memberId=${member.memberId}">게시글 입력</a>
	</div>
	
	<br><br>
	
	<!--Footer-->
	<div>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</div>
	<!--Footer-->
</body>
</html>