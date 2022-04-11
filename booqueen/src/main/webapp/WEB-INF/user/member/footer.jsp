<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="footer-top1">
        <p><button onclick="location.href='${contextPath}/login.jsp';">내 숙소 등록</button></p>
    </div>

    <div class="footer-top2">
        <div>
            <ul>
<!--             	<li> -->
<%--             		<img src="${contextPath}/resources/user/images/logo_color.png" width="100px"> --%>
<!--             	</li> -->
                <li>
                    <a href="${contextPath}/member/loginForm.do">로그인</a>
                </li>
                <li>
	                <c:choose>
					<c:when test="${isLogOn == true  && member!= null}">
	            		<a href="${contextPath}/bookingPage.do">내 예약 관리</a>
	            	</c:when>
	            	<c:otherwise>
                    	<a onclick="login_check_btn()">내 예약 관리</a>
	            	</c:otherwise>
	            	</c:choose>
                </li>
                <li>
                    <a href="${contextPath}/questions.do">고객 서비스팀 문의</a>
                </li>
                <li>
                    <a href="${contextPath}/terms.do">이용약관</a>
                </li>
                <li>
                    <a href="${contextPath}/login.jsp">Booqueen.com 비즈니스 계정</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="section" style="display: none;">
        <div>
            <div class="footer-inner-box">
               <div class="ul-wrapper-box">
                    <ul>
                       <li><a>지역</a></li>
                       <li><a>도시</a></li>
                       <li><a>공항</a></li>
                       <li><a>호텔</a></li>
                       <li><a>관광 명소</a></li>
                   </ul>
               </div>
               <div class="ul-wrapper-box">
                    <ul>
                        <li><a>지역</a></li>
                        <li><a>도시</a></li>
                        <li><a>공항</a></li>
                        <li><a>호텔</a></li>
                        <li><a>관광 명소</a></li>
                    </ul>
                </div>
                <div class="ul-wrapper-box">
                    <ul>
                        <li><a>지역</a></li>
                        <li><a>도시</a></li>
                        <li><a>공항</a></li>
                        <li><a>호텔</a></li>
                        <li><a>관광 명소</a></li>
                    </ul>
                </div>
                <div class="ul-wrapper-box">
                    <ul>
                        <li><a>지역</a></li>
                        <li><a>도시</a></li>
                        <li><a>공항</a></li>
                        <li><a>호텔</a></li>
                        <li><a>관광 명소</a></li>
                    </ul>
                </div>
                <div class="ul-wrapper-box">
                    <ul>
                        <li><a>지역</a></li>
                        <li><a>도시</a></li>
                        <li><a>공항</a></li>
                        <li><a>호텔</a></li>
                        <li><a>관광 명소</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="section">&nbsp;</div>
    
    <script>
    function login_check_btn(){
// 		alert('로그인을 하시면 고객님의 예약 현황을 확인할 수 있습니다!');
		swal({
//			   title: "타이틀",
			   text: "로그인을 하시면 고객님의 예약 현황을 확인할 수 있습니다!",
			   icon: "info" //"info,success,warning,error" 중 택1
			});
	}
    </script>
</body>
</html>