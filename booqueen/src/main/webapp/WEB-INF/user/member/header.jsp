<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/user/css/index-copy.css">
<link rel="stylesheet" href="${contextPath}/resources/user/css/header-member.css">	
<link rel="stylesheet" href="${contextPath}/resources/user/css/loginForm.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- <script src="https://kit.fontawesome.com/d2826a4f92.js" crossorigin="anonymous"></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>  -->
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>
	<c:choose>
		<c:when test="${isLogOn == true  && member != null}">
			<header
				class="bui-header bui-header--logo-large bui-u-hidden-print bui-header--rounded-tabs">
				<nav class="bui-header__bar">
					<div class="bui-header__main">
						<div class="bui-header__logo">
							<a href="${contextPath}/index.do"> <img
								src="${contextPath}/resources/user/images/logo1.png">
							</a>
						</div>
					</div>

					<div class="bui-group">

						<div class="bui-group__item">
							<a href="${contextPath}/questions.do"><i class="bi bi-question-circle"></i></a>
						</div>

						<div class="bui-group__item" onclick="openChatting()">
							<i class="bi bi-chat"></i>
						</div>

						<div class="bui-group__item" style="position: relative;" id="alarm_btn">
							<i class="bi bi-bell"></i>
<!-- 							<div class="bell-alarm">1</div> -->
							<div class="header-dropdown-content" id="alarm_dropdown" style="top: 40px; left: 0; min-width: 300px;">
<!-- 							<div class="bui-popover__arrow"></div> -->
								<ul class="header-dropdown-menu-items">
									<li class="header-dropdown-menu-item" style="display: flex; gap: 10px; padding: 10px;">
										<div class="bui-inline-container__start">
											<div class="bui-avatar bui-avatar--large">
												<span role="presentation" class="bui-icon bui-avatar__icon bui-icon--medium" style="display: inline-block; fill: currentColor;">
													<svg class="bk-icon -streamline-bell_normal" height="24" width="24" viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false"><path d="M9.28 21.961a2.837 2.837 0 0 0 5.445 0 .75.75 0 1 0-1.44-.422 1.337 1.337 0 0 1-2.565 0 .75.75 0 1 0-1.44.422zM12.75 3V.75a.75.75 0 0 0-1.5 0V3a.75.75 0 0 0 1.5 0zm-.75.75a6.75 6.75 0 0 1 6.75 6.75c0 3.154.29 5.436.785 6.994.323 1.02.684 1.59.995 1.84L21 18H3l.59 1.212c.248-.315.572-.958.88-2 .49-1.66.78-3.872.78-6.712A6.75 6.75 0 0 1 12 3.75zm0-1.5a8.25 8.25 0 0 0-8.25 8.25c0 2.702-.272 4.772-.72 6.288-.254.864-.493 1.336-.62 1.5A.75.75 0 0 0 3 19.5h18c.708 0 1.022-.892.47-1.335.019.016-.008-.015-.07-.113-.14-.223-.29-.553-.435-1.012-.443-1.396-.715-3.529-.715-6.54A8.25 8.25 0 0 0 12 2.25z"></path></svg>
												</span>
											</div>
										</div>
										<div style="justify-content: center; display: flex;">
											<div>
											<a href="#" style="text-decoration: none; color: black;">	
												<span class="header-dropdown-menu-text">새로운 소식이 없습니다.</span>
											</a>
											</div>
										</div>	
									</li>
									
								</ul>
							</div>
						</div>

						<div class="bui-group__item">
							<a class="bui-button bui-button--light bui-traveller-header__product-action" href="#">
								<button class="header-button" onclick="location.href='${contextPath}/login.jsp';">내 숙소 등록</button>
							</a>
						</div>

						<div id="dropdown" class="bui-group__item">
							<div class="bui-dropdown bui-dropdown--end">
								<a type="button"> <span class="bui-button__text">
										<div class="bui-avatar-block">
											<div class="bui-avatar bui-avatar--accent bui-avatar--outline-accent">
												<img class="bui-avatar__image" img src="data:${user_profile.profile_type};base64, ${user_profile.profile_data}" style="height: 50px; width: 50px;">
											</div>
											<div class="bui-avatar-block__text">
												<span class="bui-avatar-block__title"
													id="profile-menu-trigger--title"> ${member.name} </span> <span
													class="bui-avatar-block__subtitle"
													id="profile-menu-trigger--content"> <span
													class="bui-f-color-complement" id="userid_wishlist"> ${member.userid} </span>
												</span>
											</div>
										</div>
								</span>
								</a>
							</div>
						</div>
					</div>
					<div class="header-dropdown-content" id="myAccount">
					<ul class="header-dropdown-menu-items">
						<li class="header-dropdown-menu-item">
							<a href="${contextPath}/mypage.do" class="header-dropdown-item">
								<span class="header-dropdown-menu-icon">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#6B6B6B" class="bi bi-person" viewBox="0 0 16 16">
										<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
									</svg>
								</span>
								<span class="header-dropdown-menu-text">계정 관리</span>
							</a>
						</li>
						<li class="header-dropdown-menu-item">
							<a href="${contextPath}/bookingPage.do" class="header-dropdown-item">
								<span class="header-dropdown-menu-icon">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#6B6B6B" class="bi bi-building" viewBox="0 0 16 16">
										<path fill-rule="evenodd" d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694 1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z"/>
										<path d="M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z"/>
									</svg>
								</span>
								<span class="header-dropdown-menu-text">예약 & 이용후기</span>
							</a>
						</li>
						<li class="header-dropdown-menu-item">
							<a href="${contextPath}/wishlistPage.do" class="header-dropdown-item">
								<span class="header-dropdown-menu-icon">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#6B6B6B" class="bi bi-heart" viewBox="0 0 16 16">
										<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
									</svg>
								</span>
								<span class="header-dropdown-menu-text">위시리스트</span>
							</a>
						</li>
						<li class="header-dropdown-menu-item">
							<a href="${contextPath}/logout.do" class="header-dropdown-item">
								<span class="header-dropdown-menu-icon">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#6B6B6B" class="bi bi-arrow-bar-left" viewBox="0 0 16 16">
										<path fill-rule="evenodd" d="M12.5 15a.5.5 0 0 1-.5-.5v-13a.5.5 0 0 1 1 0v13a.5.5 0 0 1-.5.5zM10 8a.5.5 0 0 1-.5.5H3.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L3.707 7.5H9.5a.5.5 0 0 1 .5.5z"/>
									</svg>
								</span>
								<span class="header-dropdown-menu-text">로그아웃</span>
							</a>
						</li>
					</ul>
				</div>
				</nav>
			</header>
			   <!-- 채팅 -->
			   <div class="chatting-list" id="myChatting">
			      <div class="chatting-list-panel">
			         <div class="chatting-list-panel-close" onclick="closeChatting()"><i class="bi bi-x-lg"></i></div>
			         <!-- 채팅 목록 -->
			         <div class="chatting-list-panel-content" id="chattingList">
			            <div class="msg-list-header">
			               <div class="msg-list-header-title">메시지</div>
			            </div>
			            <div class="msg-index-list">
			               <h2>숙소에 메시지 보내기</h2>
			               <p>다가오는 숙박에 대해 질문을 남기시면 숙소 호스트나 직원으로부터 답변을 받으실 수 있습니다</p>
			               <ul class="msg-entry-points">
			                  <c:if test="${!empty reservationList }">
			                  <c:forEach var="reservationList" items="${reservationList}">	
			                  <li class="msg_li">
			                  <input class="input_for_reservation_number" type="hidden" value="${reservationList.reservation_number }">
			                  <input class="input_for_hotelname" type="hidden" value="${reservationList.hotelname}">
			             	  <input class="input_for_start_date" type="hidden" value="${reservationList.start_date}">
			             	  <input class="input_for_end_date" type="hidden" value="${reservationList.end_date}">
			             	  <input class="input_for_serialnumber" type="hidden" value="${reservationList.serialnumber}">
			                     <div class="msg-entry-point">
			                        <div class="msg-entry-point-link" id="${reservationList.reservation_number}" onclick="entryChatting()">
			                           <img src="${reservationList.file_url}" alt="" class="msg-entry-point-image">
			                           <div class="msg-entry-point-thumbnail">
			                              <div class="msg-title">${reservationList.hotelname}</div>
			                              <div class="msg-trip-dates">${reservationList.start_date} | ${reservationList.end_date}</div>
			                              <c:if test="${!reservationList.status}">
			                              	<span class="meg-status">취소됨</span>
			                              </c:if>
			                           </div>
			                        </div>
			                     </div>
			                  </li>
			                  </c:forEach>
			                  </c:if>
			               </ul>
				<!-- 취소됨 <ul> 
               				<li>
		                     	<div class="msg-entry-point msg-cancel-point">
			                        <div class="msg-entry-point-link">
			                           <img src="images/hotel1.jpg" alt="" class="msg-entry-point-image msg-cancel-image">
			                           <div class="msg-entry-point-thumbnail">
			                              <div class="msg-title">Best Western Hotel Gunsan</div>
			                              <div class="msg-trip-dates">1월 30일 | 2월 1일</div>
			                              <span class="msg-cancel">취소됨</span>
			                           </div>
			                        </div>
			                     </div>
			                  </li>
			               </ul>-->
			            </div>
			         	</div>
	         			<!-- 채팅창 -->
				         <div class="chatting" id="chatting">
				            <div class="msg-app-header">
				               <div class="msg-header">
				                  <button class="msg-header-left" onclick="exitChatting()"><i class="fas fa-arrow-left"></i></button>
				                  <div class="msg-header-title">
				                     <div class="msg-header-title-heading"></div>
				                     <div class="msg-header-title-caption"></div>
				                  </div>
				                  <button class="msg-header-right">도움말</button>
				               </div>
				            </div>
				            <div class="msg-app-content">
				               <div class="msg-messages-list">
				                  <div class="msg-messages-list-scrollview">
				                     <!-- 채팅 내용 -->
				                     <div class="msg-messages-container">
				                        <!-- 날짜 -->
				                        <div class="msg-separator">
				                        </div>
				                        <!-- 내용 -->
				                        <div class="presentation-message">
				                           <div class="msg-footprint">대개 24시간 내로 숙소에서 답변합니다. 답변이 오는 즉시 고객님께 알려드리겠습니다.
				                              여기서 모든 대화 내용을 확인하실 수 있습니다.</div>
				                        </div>
				                     </div>
				                     <!-- 채팅 내용 -->
				                     <div class="msg-messages-container">
				                   		<!-- 채팅 -->
				                        <div id="chat_content">
				                        
				                        </div>
			                  		</div>
				               		</div>
				            	</div>
				            <!-- 도움말 -->
				            <div class="msg-help" id="msgHelp">
				               <div class="msg-help-background" onclick="exitHelp()"></div>
				               <div class="msg-help-content">
				                  <div class="help-menu">
				                     <div class="help-header">
				                        <div class="help-header-left"></div>
				                        <div class="help-header-title">연락처</div>
				                        <div class="help-header-right" onclick="exitHelp()"><i class="bi bi-x-lg help-x"></i></div>
				                     </div>
				                     <div class="help-content">
				                        <div class="content-card">
				                           <div class="card-hotel-image"><img src="#" alt=""></div>
				                           <div class="card-hotel-description">
				                              <div class="hotel-name"></div>
				                              <div class="hotel-dates"></div>
				                           </div>
				                        </div>
				                        <div class="content-button">
				                           <a href="#" class="hotel-call">
				                              <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="#07c" class="bi bi-telephone-fill" viewBox="0 0 16 16">
				                                 <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
				                              </svg>
				                              숙소에 전화하기
				                           </a>
				                           <a href="#" class="booking-management">
				                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#07c" class="bi bi-journal-bookmark-fill" viewBox="0 0 16 16">
				                                 <path fill-rule="evenodd" d="M6 1h6v7a.5.5 0 0 1-.757.429L9 7.083 6.757 8.43A.5.5 0 0 1 6 8V1z"/>
				                                 <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"/>
				                                 <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"/>
				                              </svg>
				                              예약 관리하기
				                           </a>
				                        </div>
				                     </div>
				                  </div>
				               </div>
				            </div>
				         </div>
				      </div>
				      <div class="msg-footer-wrap_1" id="msg-footer-wrap">
	                       <div class="msg-footer-container">
	                          <form id="chat_form" class="msg-input-form" method="post">
	                             
	                             <div class="msg-text">
	                                <textarea id="chat_content" name="content" class="msg-text-input" name="text" rows="1"></textarea>
	                             </div>
	                             <input class="msg-send" value="전송" id="chat_send_button" type="button">
	                          </form>
	                       </div>
	                  </div>
			  	</div>
			  </div>
		</c:when>
		<c:otherwise>
			<div class="header">
				<nav class="navbar">
				<a href="${contextPath}/index.do">
					<img src="${contextPath}/resources/user/images/logo1.png" class="logo"></a>
					<div class="nav-links">
						<div class="nav-top question">
							<a href="${contextPath}/questions.do"><span><i class="bi bi-question-circle"></i></span></a>
						</div>
						<div class="nav-top">
							<a href="#" class="register-btn">내 숙소 등록</a>
						</div>
						<div class="nav-top">
							<a href="${contextPath}/member/registerForm.do" class="signup-btn">가입하기</a>
						</div>
						<!-- 페이지 이동 -->
						<div class="nav-top">
							<a href="${contextPath}/member/loginForm.do" class="login-btn"
								id="loginBtn">로그인</a>
						</div>
						<!-- 창 띄우기 -->
					</div>
				</nav>
			</div>
		</c:otherwise>
	</c:choose>
	
	
	
	<script>
    $(function(){
    	var reservation_number = 0;
    	var hotelname;
    	var reservation_days;
    	var start_date;
    	var end_date;
    	var serialnumber = 0;
    	
    	$('.msg_li').click(function(){
    		reservation_number = $(this).children('.input_for_reservation_number').val();
    		serialnumber = $(this).children('.input_for_serialnumber').val();
    		reqList(reservation_number, serialnumber);
    		hotelname = $(this).children('.input_for_hotelname').val();
    		start_date = $(this).children('.input_for_start_date').val();
    		end_date = $(this).children('.input_for_end_date').val();
    		reservation_days = start_date + " | " + end_date;
    		
    		
    		$('.hotel-name').text(hotelname);
    		$('.msg-header-title-heading').text(hotelname);
    		$('.hotel-dates').text(reservation_days);
    		$('.msg-header-title-caption').text(reservation_days);
    		
    	});
    	$("#chat_send_button").click(function(){
    		insertChat(reservation_number, serialnumber);
    	});
    	
    	$('#alarm_btn').click(function(){
    		$('#alarm_dropdown').toggle();
    		$('#myAccount').css("display", "none");
    	});
    	
    	$('#dropdown').click(function(){
    		$('#myAccount').toggle();
    		$('#alarm_dropdown').css("display", "none");
    	})
    	
    });
    
    var path = '${contextPath}';
    
    function reqList(reservation_number, serialnumber) {    
    	
    	var sendReply = {"userid": '${member.userid}', "reservation_number": reservation_number, "serialnumber": serialnumber}
    	
	    $.ajax({
	        url: path + '/chat.do'
	        , method : 'POST'
	        , data: JSON.stringify(sendReply)
	        , dataType: 'json'
	        , contentType: 'application/json'
	        , success : function(data) {
	        	$("#chat_content").empty();      	
	        
	        	var pre_date = 0;
	        	
	        	$.each(data, function(index, item){
	        
	        		if(index === 0){
	        			const d = new Date(item.send_date);
		        		let text = d.toLocaleDateString();
		        		
		        		var date_text = '';
		        		date_text += "<div class='msg-separator'><div class='msg-separator-text'>";
		        		date_text += text;
		        		date_text += "</div></div>";
		        
		        		$("#chat_content").append(date_text);
		        		
	        		} else if(pre_date < item.send_date){
	        			console.log(index + "item.send_date = " + item.send_date);
	        			const d = new Date(item.send_date);
		        		let text = d.toLocaleDateString();
		        		
		        		var date_text = '';
		        		date_text += "<div class='msg-separator'><div class='msg-separator-text'>";
		        		date_text += text;
		        		date_text += "</div></div>";
		        
		        		$("#chat_content").append(date_text);
	        		}
	        		
	        		
	        		if(!item.partner){
	        			var result = '';
	        			result += "<div class='presentation-message-right'><div class='msg-guest'><div class='msg-guest-inner'><p>";
	        			result += item.content;
	        			result += "</p></div></div><div class='msg-guest-status'>";
	        			result += item.send_time;
	        			result += "</div>";
	        		} else {
	        			var result = '';
	        			result += "<div class='presentation-message-left'><div class='msg-partner'><div class='msg-partner-inner'><p>";
	        			result += item.content
	        			result += "</p><div id='partner_chat'></div></div></div><div class='msg-partner-status'>"
	        			result += item.send_time;
	        			result += "</div></div></div>"
	        		}
	        		
	        		$("#chat_content").append(result);
	        		
	        		pre_date = item.send_date;
	        		console.log(index + "pre_date = " + pre_date);
	           })
	        },
	       	error : function() {
// 				alert('error');			
				swal({
//		 			   title: "타이틀",
					   text: "시스템 오류가 발생했습니다. 다시 시도해주세요",
					   icon: "error" //"info,success,warning,error" 중 택1
					});
			}
	   })
	}
    
    function insertChat(reservation_number, serialnumber){
    	
    	var content_val = $('.msg-text-input').val();
    	var chatVO = {"userid": '${member.userid}', "reservation_number": reservation_number, "content": content_val, "partner": false, "serialnumber": serialnumber}
    	
    	$.ajax({
    		url: path + "/insertChat.do"
   			, method : 'POST'
		    , data: JSON.stringify(chatVO)
		    , dataType: 'json'
		    , contentType: 'application/json'
		    , success : function(data) {
		    	$("#chat_content").empty();
		    	var pre_date = 0;
		    	
	        	$.each(data, function(index,item){
	        		
	        		if(index === 0){
	        			const d = new Date(item.send_date);
		        		let text = d.toLocaleDateString();
		        		
		        		var date_text = '';
		        		date_text += "<div class='msg-separator'><div class='msg-separator-text'>";
		        		date_text += text;
		        		date_text += "</div></div>";
		        
		        		$("#chat_content").append(date_text);
		        		
	        		} else if(pre_date < item.send_date){
	        			console.log(index + "item.send_date = " + item.send_date);
	        			const d = new Date(item.send_date);
		        		let text = d.toLocaleDateString();
		        		
		        		var date_text = '';
		        		date_text += "<div class='msg-separator'><div class='msg-separator-text'>";
		        		date_text += text;
		        		date_text += "</div></div>";
		        
		        		$("#chat_content").append(date_text);
	        		}
	        		
	        		if(!item.partner){
	        			var result = '';
	        			result += "<div class='presentation-message-right'><div class='msg-guest'><div class='msg-guest-inner'><p>";
	        			result += item.content;
	        			result += "</p></div></div><div class='msg-guest-status'>";
	        			result += item.send_time;
	        			result += "</div>";
	        		} else {
	        			var result = '';
	        			result += "<div class='presentation-message-left'><div class='msg-partner'><div class='msg-partner-inner'><p>";
	        			result += item.content
	        			result += "</p><div id='partner_chat'></div></div></div><div class='msg-partner-status'>"
	        			result += item.send_time;
	        			result += "</div></div></div>"
	        		}
	        		$("#chat_content").append(result);
	        		$('.msg-text-input').val('');
	        		$('.msg-messages-list-scrollview').scrollTop($('.msg-messages-list-scrollview').height());
	           
	        		pre_date = item.send_date;
	        	})
   	     	},
   	    	error : function() {
// 				alert('error');
				swal({
//		 			   title: "타이틀",
					   text: "시스템 오류가 발생했습니다. 다시 시도해주세요",
					   icon: "error" //"info,success,warning,error" 중 택1
					});
			}
    	})
    }
  
    </script>
		
	<script>
	// 채팅 열기
    function openChatting() {
       
// 		$.ajax({
// 			url: path + "/getReservationList.do",
// 			method: 'POST',
// 			success: function(data){
// 				console.log(data);
// 			}
// 		});
		
	   document.getElementById("myChatting").style.display = "block";
       document.getElementById("msg-footer-wrap").style.zIndex = -1;
    }
    // 채팅 닫기
    function closeChatting() {
       document.getElementById("myChatting").style.display = "none";
       document.getElementById("chattingList").style.zIndex = 100;
       document.getElementById("chatting").style.zIndex = -1;
       document.getElementById("msgHelp").style.display = "none";
    }

    // 채팅목록 -> 채팅방
    function entryChatting() {
       document.getElementById("chattingList").style.zIndex = -1;
       document.getElementById("chatting").style.zIndex = 100;
       document.getElementById("msg-footer-wrap").style.zIndex = 100;
    }
    // 채팅방 -> 채팅목록
    function exitChatting() {
       document.getElementById("chattingList").style.zIndex = 100;
       document.getElementById("chatting").style.zIndex = -1;
       document.getElementById("msg-footer-wrap").style.zIndex = -1;
    }
 	// 도움말 클릭
    function entryHelp() {
       document.getElementById("msgHelp").style.display = "block";
       document.getElementById("msgHelp").style.zIndex = 200;
    }
    // 도움말 X
    function exitHelp() {
       document.getElementById("msgHelp").style.display = "none";
    }
	</script>
</body>
</html>