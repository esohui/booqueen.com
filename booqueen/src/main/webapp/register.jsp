<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>booqueen.com</title>
<link rel="stylesheet" href="${contextPath}/resources/partner/css/register.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
$(function(){
	$("email").on('keyup', emailcheck);
})

function emailcheck(){
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	var email = $("#email").val();
	if(!email){
		alert()
		$("#email").focus();
		return false;
	} else {
		if(re.test(email)){
			var sendData = {"email" : email}
			$.ajax({
				method : 'POST',
				url : 'emailCheck.pdo',
				data : sendData,
				success : function(resp){
					if(resp =='fail'){
						$('#email').css('border', '1px solid #e21111')
						$('#emailcheck').css('color', 'red')
						$('#emailcheck').html("이미 해당 이메일 주소로 등록된 계정이 있습니다.")
						flag=false;
					} else {
						$('#email').css('border', '1px solid #545454')
						$('#emailcheck').css('color', 'blue')
						$('#emailcheck').html("사용 가능한 이메일 주소입니다.")
						flag=true;
					}
				}
			})
			
		} else {
			$('#emailcheck').css('color', 'red')
			$('#emailcheck').html("잘못된 이메일 형식입니다.")
			$("#email").fucus();
			return false;
		}
	}	
}

function submitForm(){
	var email = $("#email").val()
	if(email == null || email == "" || email == undefined || email == "undefined") {
		alert("이메일 주소를 입력해 주세요.")
		return;
	}
	$("#myForm").submit();
}
</script>
</head>
<body>
<div class="container">
		<header>
			<span id="logo">
				<a href="${contextPath}/home.jsp"><img src="${contextPath}/resources/partner/images/logo.png" class="header_logo"></a>
			</span>
		</header>
	</div>
 	<main class="contents">
    	<h1>파트너 계정 등록</h1>
    	<h4>숙소를 등록하고 관리하려면 계정을 만들어주세요</h4><br/>
    	<h4>이메일 주소</h4>
    	<form id="myForm" action="register.pdo" method="post">
    	<input type="text" name="email" id="email" class="email" placeholder=" 이메일 주소를 입력하세요" onkeyup="emailcheck(this)"><br/>
    	<span id="emailcheck"></span>
    	</form>
    	<button type="button" name="continue" id="continue" onclick="submitForm()">계속</button>
    	<br><br>
    	<hr><br>
    	<h5>숙소 운영 및 엑스트라넷에 관한 질문이 있으신가요? <br><a href="#">파트너 지원 센터</a>에서 자세한 사항을 확인해보시기 바랍니다.</h5>
    	<br>
    	<a href="${contextPath}/login.jsp"><input type="button" name="login" id="login" value="로그인"></a>
		<br><br>
		<hr><br>
		<h5>로그인하거나 회원으로 가입하시면 당사 <a href="#">이용약관</a>및 <a href="#">개인정보 보호 정책</a>에 동의하시는 것으로 간주됩니다.</h5>
		<br>
		<hr><br>
		<h6>© All rights reserved. Booqueen.com 및 Booqueen.com 로고는 한국 및/또는 다른 국가에서 Booqueen.com, LP의 상표 또는 등록 상표입니다. 기타 모든 상표는 해당 소유권자의 자산입니다.</h6>
	</main>

</body>
</html>