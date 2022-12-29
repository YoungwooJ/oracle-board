<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    	<meta http-equiv="x-ua-compatible" content="ie=edge" />
		
		<title>addMember.jsp</title>
		
		<!-- 부트스트랩5 CDN -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
		
		<!-- Font Awesome -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
		<!-- Google Fonts Roboto -->
	    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
		<!-- MDB -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/login/css/mdb.min.css" />
		<!-- Custom styles -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/login/css/style.css" />
		
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
						$('#memberName').focus();
					}
				});
				
				// 이름 유효성 검사
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
						$('#addBtn').focus();
						allCk = true;
					}
				});
				
				$('#addBtn').click(function(){
					if(allCk == false){
    					$('#memberPw').focus();
    					return false;
    				}
					$('#addForm').submit();
					alert("회원가입에 성공했습니다.");
				});
			});
		</script>
	</head>
<body>
      <!--Main Navigation-->
  <header>
    <style>
      #intro {
        background-image: url(${pageContext.request.contextPath}/resources/static/login/img/bg.jpg);
        height: 100vh;
      }

      /* Height for devices larger than 576px */
      @media (min-width: 992px) {
        #intro {
          margin-top: -58.59px;
        }
      }

      .navbar .nav-link {
        color: #fff !important;
      }
    </style>

    <!-- Background image -->
    <div id="intro" class="bg-image shadow-2-strong">
      <div class="mask d-flex align-items-center h-100" style="background-color: rgba(0, 0, 0, 0.8);">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-xl-5 col-md-8">    
              <form class="bg-white rounded shadow-5-strong p-5" method="post" action="${pageContext.request.contextPath}/member/addMember" id="addForm">             
                <h4>회원가입</h4>
				<div>
					<span id="msg" style="color:red;">${msg}</span>
				</div>
                <!-- ID input -->
                <div class="form-outline mb-4">
                  <input type="text" name="memberId" id="memberId" id="form1Example1" class="form-control" />
                  <label class="form-label" for="form1Example1">회원 아이디</label>
                </div>

				<!-- Name input -->
                <div class="form-outline mb-4">
                  <input type="text" name="memberName" id="memberName" id="form1Example2" class="form-control" />
                  <label class="form-label" for="form1Example2">회원 이름</label>
                </div>

                <!-- Password input -->
                <div class="form-outline mb-4">
                  <input type="password" name="memberPw" id="memberPw" id="form1Example3" class="form-control" />
                  <label class="form-label" for="form1Example3">회원 비밀번호</label>
                </div>

                <!-- 2 column grid layout for inline styling -->
                <div class="row mb-4">
                  <div class="col d-flex justify-content-center">
                    <!-- Checkbox -->
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" value="" id="form1Example3" checked />
                      <label class="form-check-label" for="form1Example3">
                        자동 로그인 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      </label>
                    </div>
                  </div>

                  <div class="col text-center">
                    <!-- Simple link -->
                    <a href="#!">ID와 비밀번호 찾기</a>
                  </div>
                </div>

                <!-- Submit button -->            
                <button style="float:right;" type="button" id="addBtn" class="btn btn-primary">회원가입</button>
                <div>
                <a style="float:left;" type="button" class="btn btn-primary" href="${pageContext.request.contextPath}/member/login">이전</a>
	            </div>  
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Background image -->
  </header>
  <!--Main Navigation-->

  <!--Footer-->
  <div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
  </div>
  <!--Footer-->
  
    <!-- MDB -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/login/js/mdb.min.js"></script>
    <!-- Custom scripts -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/login/js/script.js"></script>
</body>
</html>