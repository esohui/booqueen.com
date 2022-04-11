<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Cancel</title>
	<link rel="stylesheet" href="${contextPath}/resources/user/css/cancel.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
	<script src="https://kit.fontawesome.com/fdb0bc6f32.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/user/member/header.jsp"/>
	
	<div class="container">
		<div class="container-inner">
			<div class="cancellation-head">
				<div class="cancellation-header">
					<button class="cancellation-head-btn" id="goBackMyReservation">
						<svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="#262626" class="bi bi-chevron-left" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
						</svg>
						<span>내 예약으로 돌아가기</span>
					</button>
					<button class="cancellation-head-btn" id="PreviousStep">
						<svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="#262626" class="bi bi-chevron-left" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
						</svg>
						<span>이전 단계</span>
					</button>
				</div>
			</div>
			<div class="container-main">
				<!-- 왼쪽 -->
				<!-- 1단계 -->
				<div class="container-main-left" id="stepOne">
					<div class="main-left">
						<div class="main-left-title">
							<div class="title-step">1/2단계</div>
							<h2 class="title-reason">취소 이유</h2>
							<div class="title-reason-sub">예약 내용 변경이 필요하신 경우 다른 방법을 안내해드릴 수 있습니다.</div>
						</div>
						<div class="main-left-content">
						
							<label for="" class="content-reason-label">이유</label>
							<div class="content-reason">
								<form action="${contextPath}/cancelReservation.do" id="cancel_reservation" method="post">
									<select name="cancel_reason" id="cancel_reason" class="content-reason-select">
										<option value="선택안함">이유를 선택하세요(필수)</option>
										<option value="여행 인원, 또는 필요한 사항이 변경됨">여행 인원, 또는 필요한 사항이 변경됨</option>
										<option value="일정 또는 여행지 변경">일정 또는 여행지 변경</option>
										<option value="개인 사정 / 여행이 취소됨">개인 사정 / 여행이 취소됨</option>
										<option value="같은 날짜에 중복된 예약이 있어 필요 없는 예약 건을 취소해야 함">같은 날짜에 중복된 예약이 있어 필요 없는 예약 건을 취소해야 함</option>
										<option value="코로나19(COVID-19) 관련 제한 조치로 인해 여행이 불가능함">코로나19(COVID-19) 관련 제한 조치로 인해 여행이 불가능함</option>
										<option value="다른 대체 숙소를 찾았음">다른 대체 숙소를 찾았음</option>
										<option value="해당 사항 없음">해당 사항 없음</option>
									</select>
									<input type="hidden" name="reservation_number" value="${reservationVO.reservation_number}">
									<fmt:parseDate value="${reservationVO.start_date }" var="start_date_p" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${start_date_p}" var="start_date" pattern="yyyyMMdd"/>
									<input type="hidden" name="start_date" value="${start_date}">
									<input type="hidden" name="room_id" value="${reservationVO.room_id }">
								</form>
								<span class="reason-icon">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#262626" class="bi bi-chevron-expand" viewBox="0 0 16 16">
										<path fill-rule="evenodd" d="M3.646 9.146a.5.5 0 0 1 .708 0L8 12.793l3.646-3.647a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 0-.708zm0-2.292a.5.5 0 0 0 .708 0L8 3.207l3.646 3.647a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 0 0 0 .708z"/>
									</svg>
								</span>
							</div>
						</div>
					</div>
				</div>
				<!-- 2단계 -->
				<div class="container-main-left" id="stepTwo">
					<div class="main-left">
						<div class="main-left-title">
							<div class="title-step">2/2단계</div>
							<h2 class="title-reason">취소 확정</h2>
							<div class="title-reason-sub">예약 전체가 취소됩니다. 취소를 진행하기 전에 아래 내용을 검토해 주세요.</div>
						</div>
						<div class="main-left-content">
							<div class="booking-room-info">
								<div class="bedroom-icon">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">
										<path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
									</svg>
								</div>
								<div class="room-info">
									<div class="room-information">${reservationVO.type}</div>
									
									<div class="room-price"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${reservationVO.price}" /> · 정원: 성인 2명</div>
									<div class="room-cancel">무료 취소</div>
								</div>
							</div>
							<hr class="cancel-hr">
							<div class="booking-price-title">요금 상세 내역</div>
							<div class="booking-price-left">
								<div class="booking-price-thin">
									<div class="price-left">예약 요금</div>
									<div class="price-right" id="reservation_price"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${reservationVO.price}" /></div>
								</div>
								<div class="booking-price-thin">
									<div class="price-left">취소 위약금</div>
									<div class="price-right"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="0" /></div>
								</div>
								<div class="booking-price-bold">
									<div class="total-price-left">청구되는 금액</div>
									<div class="total-price-right"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="0" /></div>
								</div>
							</div>
							<hr class="cancel-hr">
							<div class="contact">
								모든 결제 건은 숙소에서 처리합니다. 궁금하신 점이 있을 경우
								<a onclick="sendMsgToHotel()" class="contact-link" >숙소로 직접 문의</a>
								하시기 바랍니다.
							</div>
						</div>
					</div>
				</div>

				<!-- 오른쪽 -->
				<div class="container-main-right">
					<div class="main-right-box">
						<div class="booking-info">
							<div class="booking-hotel-img">
								<img src="${reservationVO.file_url}" alt="">
							</div>
							<div class="booking-hotel-info">
								<fmt:parseDate value="${reservationVO.start_date}" var="start_date" pattern="yyyy-MM-dd"/>
								<fmt:parseDate value="${reservationVO.end_date}" var="end_date" pattern="yyyy-MM-dd"/>
								<h3 class="booking-hotel-name">${reservationVO.hotelname}</h3>
								<div class="booking-hotel-date"><fmt:formatDate value="${start_date}" pattern="MM월 dd일"/> ~ <fmt:formatDate value="${end_date}" pattern="MM월 dd일"/></div>
							
							</div>
						</div>
						<hr class="box-hr">
						<div class="booking-price">
							<div class="booking-price-thin">
								<div class="price-left">예약 요금</div>
								<div class="price-right"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${reservationVO.price}" /></div>
							</div>
							<div class="booking-price-thin">
								<div class="price-left">취소 위약금</div>
								<div class="price-right"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="0" /></div>
							</div>
							<div class="booking-price-bold">
								<div class="total-price-left">청구되는 금액</div>
								<div class="total-price-right"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="0" /></div>
							</div>
						</div>
						<div class="booking-button">
							<div class="booking-cancel">
								<button class="booking-cancel-btn" id="cancelBtn">
									<span>계속 진행하기</span>
								</button>
								<button class="booking-cancel-btn" id="realCancelBtn">
									<span>예약 취소하기</span>
								</button>
							</div>
							<div class="booking-keep">
								<button class="booking-keep-btn" id="keepBtn">
									<span>예약 유지하기</span>
								</button>
							</div>
						</div>
					</div>
					<div class="main-right-box">
						<div class="cancel-policy">
							<h3 class="policy-title">취소 정책</h3>
							<div class="policy-content">
								<div class="policy-text">도착 1일 전까지 예약 취소 또는 변경 시 부과되는 수수료가 없습니다.</div>
								<div class="policy-view">
									<a href="${contextPath}/terms.do#terms_definitions_B6.%20변경,%20취소%20및%20환불" target="blank"><button class="policy-btn">취소 정책 보기</button></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="exit-cancel-page" id="cancelModal">
		<div class="exit-cancel-page-modal">
			<div class="exit-cancel-page-content">
				<div class="exit-page-header">
					<div class="exit-page-title">
						<h2>이 페이지에서 나가시겠습니까?</h2>
					</div>
					<div class="exit-page-x">
						<button class="exit-x-btn" id="exitXBtn">
							<svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="#6b6b6b" class="bi bi-x" viewBox="0 0 16 16">
								<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
							</svg>
						</button>
					</div>
				</div>
				<div class="exit-page-main">
					<div class="exit-page-text">취소 절차가 완료되지 않았습니다. 이 페이지에서 정말 나가시겠습니까?</div>
					<div class="exit-page-button">
						<button class="view-page" id="viewPage">이 페이지 계속 보기</button>
						<a href="${contextPath}/bookingPage.do"><button class="exit-page">나가기</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
	$(document).ready(function() {
		$("#cancelBtn").click(function() {
			$("#stepOne").css('display', 'none');
			$("#stepTwo").show();
			$("#cancelBtn").css('display', 'none');
			$("#realCancelBtn").show();
			$("#goBackMyReservation").css('display', 'none');
			$("#PreviousStep").show();
		});
		$("#PreviousStep").click(function() {
			$("#stepOne").show();
			$("#stepTwo").css('display', 'none');
			$("#cancelBtn").show();
			$("#realCancelBtn").css('display', 'none');
			$("#goBackMyReservation").show();
			$("#PreviousStep").css('display', 'none');
		});
		$("#keepBtn").click(function() {
			$("#cancelModal").css('display', 'flex');
		});
	
		$("#exitXBtn").click(function() {
			$("#cancelModal").css('display', 'none');
		});
		$("#viewPage").click(function() {
			$("#cancelModal").css('display', 'none');
		});

	});
	
	var reservation_number = '${reservationVO.reservation_number}';
	function sendMsgToHotel(){
		openChatting();
		document.getElementById(reservation_number).click();
	}
	</script>
	<script>
	$(document).ready(function() {
	const path = '${contextPath}';
	var merchant_number = '${reservationVO.merchant}';
	
// 	var amount = '${reservationVO.price}';
	var amount = 100;
	var imp_uid = '${reservationVO.imp_uid}';
	var cancel_reason_s = '';
	
	$('#cancel_reason').on("change", function(){
		cancel_reason_s = $('#cancel_reason option:selected').text();
	});
	
	var paymentVO = {"imp_uid" : imp_uid, "price" : amount, "cancel_reason" : cancel_reason_s, "merchant" : merchant_number, "payment_status" : 'canceled'}
	
	function cancelPay(){
		$.ajax({
			url: path + "/cancelPayment.do",
			type: "post",
			contentType: "application/json",
			data: JSON.stringify(paymentVO),
			success: function(data){
				
				if(data === 'success'){
// 					alert("정상적으로 결제가 취소되었습니다.");
					swal({
//			 			   title: "타이틀",
						   text: "정상적으로 결제가 취소되었습니다.",
						   icon: "info" //"info,success,warning,error" 중 택1
						});
					$('#cancel_reservation').submit();
				} else{
// 					alert("결제 취소가 정상적으로 이루어지지 않았습니다.");
					swal({
//			 			   title: "타이틀",
						   text: "결제 취소가 정상적으로 이루어지지 않았습니다.",
						   icon: "info" //"info,success,warning,error" 중 택1
						});
				}
				
			}
		})
	}
	
	$('#realCancelBtn').on("click", cancelPay);
	
	});
	/* 아임포트 환불(version2)
	function cancelPay() {
	    $.ajax({
	      url: path + "/checkPayment.do", // 예: http://www.myservice.com/payments/cancel
	      type: "POST",
	      dataType: 'json', 
	      data: {
	        "merchant_uid": merchant_number
	      }
	    }).done(function(data){
	    	merchant_number = data.merchant;
	    	alert(data.merchant);
	    	
	    	$.ajax({
	    	    url: path + "/getImportToken.do",
	    	    method: "post", // POST method
	    	    dataType: 'json'
	    	  }).done(function(res){
	    		
	    		alert(res.response.token);
	    		var access_token = res.response.token;
	    		
	    		$.ajax({
   			 		url: "http://www.myservice.com/payments/cancel",
    	         	method: "post",
    	         	headers: {
    	         		"Authorization": access_token,
    	         		"Content-Type": 'application/json',
    	         		 "Access-Control-Allow-Origin": '*'
    	         	},
	    	        data: {
	    	            reason: "단순변심", // 가맹점 클라이언트로부터 받은 환불사유
	    	            imp_uid : 'imp_203813554072',
	    	            merchant_id : merchant_number, // imp_uid를 환불 `unique key`로 입력
	    	            amount: amount, // 가맹점 클라이언트로부터 받은 환불금액
	    	            checksum: amount // [권장] 환불 가능 금액 입력 
	    	          }
	    		}).done(function(item){
	    			alert(item.getCancelData.data);
	    			$.ajax({
	    				url: path + "/insertCancel.do",
	    				method: "post",
	    				data: {
	    					message: "성공"
	    				}
	    			}).done(function(value){
	    				alert(value);
	    			});
	    		});
	    	});
	    });
	}
	*/
	<!--  $('#cancel_reservation').submit(); -->
	</script>
	
	
	
</body>
</html>