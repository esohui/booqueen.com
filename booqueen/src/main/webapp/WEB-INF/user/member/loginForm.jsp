<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/user/css/loginForm.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>Login</title>
</head>
<body>

	<jsp:include page="/WEB-INF/user/member/header.jsp"/>
	
	<div id="login" class="login">
		<div class="login-modal">
			<form class="login-modal-content" action="${contextPath}/member/login.do" method="post">
				<div class="login-modal-top"><h2>부퀸닷컴에 오신 것을 환영합니다.</h2></div>
				<div class="login-modal-center">
					<div class="login-modal-id">
						<div class="login-id"><span>아이디</span></div>	
						<div class="login-input-id">
							<input type="text" placeholder="booqueen@bq.com" id="loginId" name="userid">
						</div>
	              	</div>
					<div class="login-modal-pw">
						<div class="login-pw"><span>비밀번호</span></div>
						<div class="login-input-pw">
							<input type="password" placeholder="" id="loginPw" name="passwd">
						</div>
					</div>
				</div>
				<div class="login-modal-button">
					<button type="submit" class="login-btn-real" id="loginBtnReal">로그인</button>
				</div>
				<%-- 발표 이후 수정? --%>
				<%-- 
				<ul class="find-user">
	                <li class="find-user-id">
	                    <a id="id-search" href="#">아이디 찾기</a>
	                </li>
	                <li class="find-user-pw">
	                    <a id="pw-search" href="#">비밀번호 찾기</a>
	                </li>
                </ul>
                --%>
				<div class="social-login-sepa">
					<div class="social-login-line"></div>
					<span class="social-login-text">&nbsp;OR&nbsp;</span>
					<div class="social-login-line"></div>
				</div>
			</form>
			<div class="social-login-group">
				<div class="kakao-login-button">
					<a href="https://kauth.kakao.com/oauth/authorize?client_id=445c67c418c3533fd50992227666469c&redirect_uri=http://ec2-13-209-69-205.ap-northeast-2.compute.amazonaws.com/booqueen/member/klogin.do&response_type=code">
						<img class="kakao" src="${contextPath}/resources/user/images/kakaolink_btn_small.png">
					</a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 아이디 찾기 Modal -->
	<!-- 
   <div id="findUseridModal" class="find-userid-modal">
    -->

      <!-- Modal content -->
      <!-- 
      <form class="find-userid-modal" action="${contextPath }/findUserid.do" method="post">
         <span class="close findUseridClose">&times;</span>
         <div><h2 class="modal-title">아이디 찾기</h2></div>
         <div class="find-hr"><div></div></div>
         <div class="modal-input">
            <div class="input-name">
               <input type="text" placeholder="이름" name="name" id="name">
            </div>
         </div>
         <div class="modal-input">
            <div class="input-name">
               <input type="text" placeholder="휴대전화(-없이)" name="phone" id="phone">
            </div>
         </div>
         
         <div class="modal-find-button">
            <button type="submit" class="find-userid-btn-real" id="findUseridBtnReal">확인</button>
         </div>
      </form>
   </div>
   -->
</body>
</html>