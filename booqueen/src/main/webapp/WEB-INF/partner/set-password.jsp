<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/partner/css/set-password.css">
</head>
<body>
<form action="set-password.pdo" method="POST">
   <div class="container">
      <header>
         <span id="logo"> <a href="#"> <img alt=""
               src="https://s3.ap-northeast-2.amazonaws.com/booqueen.com/Booqueen.com.png"></a>
         </span>
         <nav>
            <ul id="topMenu">
               <li><a href="/register/Register.jsp">로그인</a></li>
               <li><a href="/register/Register.jsp">회원가입</a></li>
            </ul>
         </nav>

      </header>
   </div>
   <main class="contents">
      <h1>비밀번호 설정</h1>
      <h4>비밀번호는 대문자, 소문자, 숫자를 포함하여 10자 이상이어야 합니다.</h4>
      <br />
      <h4>비밀번호</h4>
      <input type="hidden" name="email" value="${email}">
      <input type="hidden" name="firstName" value="${firstName}">
      <input type="hidden" name="lastName" value="${lastName}">
      <input type="hidden" name="telephone" value="${telephone}">
      <input type="password" name="password" id="text"><br>
      <h4>비밀번호 확인</h4>
      <input type="password" name="repass" id="text"><br />
      <input type="submit" name="register" id="continue" value="회원가입"></a> <br>
      <br>
      <hr>
      <br>
      <h5>
         로그인하거나 회원으로 가입하시면 당사 <a href="#">이용약관</a>및 <a href="#">개인정보 보호 정책</a>에
         동의하시는 것으로 간주됩니다.
      </h5>
      <br>
      <br>
      <hr>
      <br>
      <H6>© All rights reserved. Booqueen.com 및 Booqueen.com 로고는 한국 및/또는 다른
         국가에서 Booqueen.com, LP의 상표 또는 등록 상표입니다. 기타 모든 상표는 해당 소유권자의 자산입니다.</H6>

   </main>
</form>
</body>
</html>