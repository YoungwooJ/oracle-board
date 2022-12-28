<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <meta name="author" content="">
		
	    <link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css" rel="stylesheet">
	    <link href="${pageContext.request.contextPath}/resources/assets/css/font-awesome.min.css" rel="stylesheet">
	    <link href="${pageContext.request.contextPath}/resources/assets/css/style.css" rel="stylesheet">
	    
		<title>loginForm</title>
		<!-- 부트스트랩5 CDN -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<!-- 자바스크립트로 유효성 확인 -->
		<script>
			$(document).ready(function(){ // 페이지가 로드되고 나면 실행
				let allCk = false;
				$('#memberId').focus();
				
				// 아이디 유효성 검사
				$('#memberId').blur(function(){
					if($('#memberId').val() == ''){
						$('#msg').text('아이디를 입력해주세요.');
						$('#memberId').focus();
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
						$('#loginBtn').focus();
						allCk = true;
					}
				});
				
				$('#loginBtn').click(function(){
					if(allCk == false){
    					$('#memberId').focus();
    					return false;
    				}
					$('#loginForm').submit();
				});
			});
		</script>
	</head>
<body>
    <section class="form-02-main">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="_lk_de">
              <div class="form-03-main">
                <div class="logo">
                  <img src="${pageContext.request.contextPath}/resources/assets/images/user.png">
                </div>
                <div class="form-group">
                  <input type="email" name="email" class="form-control _ge_de_ol" type="text" placeholder="Enter Email" required="" aria-required="true">
                </div>

                <div class="form-group">
                  <input type="password" name="password" class="form-control _ge_de_ol" type="text" placeholder="Enter Password" required="" aria-required="true">
                </div>

                <div class="checkbox form-group">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="">
                    <label class="form-check-label" for="">
                      Remember me
                    </label>
                  </div>
                  <a href="#">Forgot Password</a>
                </div>

                <div class="form-group">
                  <div class="_btn_04">
                    <a href="#">Login</a>
                  </div>
                </div>

                <div class="form-group nm_lk"><p>Or Login With</p></div>

                <div class="form-group pt-0">
                  <div class="_social_04">
                    <ol>
                      <li><i class="fa fa-facebook"></i></li>
                      <li><i class="fa fa-twitter"></i></li>
                      <li><i class="fa fa-google-plus"></i></li>
                      <li><i class="fa fa-instagram"></i></li>
                      <li><i class="fa fa-linkedin"></i></li>
                    </ol>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
	<h1>로그인</h1>
	<div>
		<span id="msg" style="color:red"></span>
	</div>
	<form method="post" action="${pageContext.request.contextPath}/member/login" id="loginForm">
		<table border="1">
			<tr>
				<th>아이디 : </th>
				<td>
					<input type="text" name="memberId" id="memberId">
				</td>
			</tr>
			<tr>
				<th>
					비밀번호 : 
				</th>
				<td>
					<input type="password" name="memberPw" id="memberPw">
				</td>
			</tr>
		</table>
		<a style="float:left" type="button" href="${pageContext.request.contextPath}/member/addMember">회원가입</a>
		<button type="submit" id="loginBtn">로그인</button>
	</form>
</body>
</html>