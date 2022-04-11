<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${contextPath}/resources/user/css/available.css">
    <link rel="stylesheet" href="${contextPath}/resources/user/css/qna.css">
    <link rel="stylesheet" href="${contextPath}/resources/user/css/hotel.css">
    <link rel="stylesheet" href="${contextPath}/resources/user/css/reviewDialog.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script src="https://kit.fontawesome.com/d2826a4f92.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29b5f78cb856dc4d592f3c3f87388524"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>available</title>
</head>
<body>
    <jsp:include page="/WEB-INF/user/member/header.jsp"/>

    <div class="container" style="display:none;">
            <div class="details-corona">
                <a class="corona-icon"><i class="bi bi-info-circle"></i></a>
                <p class="sub-title">코로나19(COVID-19) 관련 안내</p>
            </div>
    </div>

    <div class="list-container">
        <div class="left-col">
            <div class="left-col-menu">
                <div>
                    <i class="fas fa-check"></i><span>최저가 맞춤</span>
                </div>    
            </div>

            <div class="left-col-search">
                <div class="left-col-search-frist">
                    <h2>검색</h2>
                    <div class="search-bar">
                        <form action="${contextPath}/hotelInfo.do#searchRoomLine" method="get">
                            <div class="location-input">
                                <label>여행자/숙소 이름</label>
                                <input type="text" value="${hotelInfo.hotelname}" disabled>
                            </div>
                            <div>
                                <label>체크인 날짜</label>
                                <input type="date" id="startdate">
                               	<input type="hidden" id="startdateParm" name="start_date">
                            </div>
                            <div>
                                <label>체크아웃 날짜</label>
                                <input type="date" id="enddate">
                                <input type="hidden" id="enddateParm" name="end_date">
                            </div>
                            <input type="hidden" name="serialNumber" value="${hotelInfo.serialnumber}">
                            <button type="submit">검색</button>
                        </form>
                    </div> <!-- end searchbar-->
                </div>
                <div onclick="on()" class="entry-point__container">
                    <button class=" show_map entry-point__map "></button>
                    <div class="entry-point__marker">
                        <div class="hotel-marker">
                            <div class="hotel-marker__pin">
                                <div class="hotel-marker__icon"></div>
                                <svg viewBox="-1 -1 26 32" class="hotel-marker__shape">
                                    <path
                                        d="M24 12.4286C24 19.2927 12 29 12 29C12 29 0 19.2927 0 12.4286C0 5.56446 5.37258 0 12 0C18.6274 0 24 5.56446 24 12.4286Z"></path>
                                </svg>
                            </div>
                            <svg class="hotel-marker__shadow" viewBox="0 0 12 4">
                                <ellipse cx="6" cy="2" rx="6" ry="2"></ellipse>
                            </svg>
                        </div>
                    </div>
                    <button class="entry-point__button" type="button">
                        <span class="bui-button__text">
                            지도에서 보기
                        </span>
                    </button>
                </div>
            </div>
        </div>
        <div class="right-col">
            <div class="right-col-menu">
                <a href="#booking-table">옵션 정보 & 요금</a>
                <a href="#surroundings">시설</a>
                <a href="#house-rule">하우스 롤</a>
                <a id="more-review">고객 후기(
                <c:if test="${reviewAvg.scoreAvg == 0.0 }">
                		0
                	</c:if>
                	<c:if test="${reviewAvg.scoreAvg != 0.0}">
                		${fn:length(reviewList)}
                	</c:if>
                		개)</a>
            </div>
            
            <div class="house-title">
                <div class="row">
                    <h2 id="hotelname">${hotelInfo.hotelname }</h2>
                    <c:set var="star" value="${hotelInfo.star*1}"/>
					<div>
					<c:forEach begin="1" end="${star }">
						<i class="fas fa-star fa-xs"></i>
					</c:forEach>
					</div>
					
					
                     <span>
                     <c:if test="${reviewAvg.scoreAvg == 0.0 }">
                		0
                	</c:if>
                	<c:if test="${reviewAvg.scoreAvg != 0.0}">
                		${fn:length(reviewList)}
                	</c:if>
                     리뷰</span>
                </div>
                <div>
<%--                 	<c:choose>
                	<c:when test="${isLogOn == true  && member!= null}">
                	 <fmt:parseDate value="${reservationVO.start_date}" var="start_date" pattern="yyyy-MM-dd"/>
                     
                    <p>고객님께서는 <fmt:formatDate value="${start_date}" pattern="yyyy년 MM월 dd일"/>에 이 호텔을 이용하셨습니다.</p>
                    </c:when>
                    </c:choose> --%>
                </div>
                <div style="position:relative;">
                    <i class="fas fa-map"></i>&nbsp;<span><span id="city" style="display: inline!important;">${hotelInfo.city }</span>,<span id="address1"> ${hotelInfo.address1 }</span><span id="address2"> ${hotelInfo.address2 }</span></span>
                    
                    <c:choose>
                    <c:when test="${!empty reviewList && reviewAvg.scoreAvg != 0.0}">
                    <div class="review_board_wrapper">    
                        <div class="review_board review_board1">
                            <div class="review-score">${reviewAvg.scoreAvg }</div>
                            <div>
                                <c:choose>
									<c:when test="${hotel.reviewAvgVO.scoreAvg >= 9}"><div class="review-title">최고</div></c:when>
									<c:when test="${hotel.reviewAvgVO.scoreAvg >= 8}"><div class="review-title">매우 좋음</div></c:when>
									<c:when test="${hotel.reviewAvgVO.scoreAvg >= 7}"><div class="review-title">좋음</div></c:when>
									<c:when test="${hotel.reviewAvgVO.scoreAvg >= 6}"><div class="review-title">만족</div></c:when>
									<c:when test="${hotel.reviewAvgVO.scoreAvg < 6}"><div class="review-title">보통</div></c:when>
								</c:choose>
											
                                <span>${fn:length(reviewList)}개 후기</h5>
                            </div>
                        </div>
                        <div class="review_board review_board2">
                            
                       		<div id="slider">
                                <a href="#" class="control_next">></a>
                                <a href="#" class="control_prev"><</a>
                                <ul>
                                	<c:forEach var="reviewProfileList" items="${reviewProfileList }">
                                    	<li>
                                    		<div class="review-box-top">
                                    			<span>${reviewProfileList.reviewVO.strength}</span>
                                    		</div>
                                    		<div class="review-box-bottom">
                                            	<img class="review-box-img" src="data:${reviewProfileList.memberProfileVO.profile_type};base64, ${reviewProfileList.memberProfileVO.profile_data}" >
                                    			<span>${reviewProfileList.reviewVO.username }</span>
                                    		</div>
                                    	</li>
                                    </c:forEach>              
                                </ul>  
                            </div>
                        </div>
                        <div class="review_board review_board3">
                            <div class="review-staff">${reviewAvg.staffAvg }</div>
                            <span>직원 친절도</span>
                        </div>
                    </div>
                    </c:when>
                    </c:choose>    
                </div>
                <div class="now-booking">
                    <a href="#booking-table"><button>지금 예약</button></a>
                </div>
                <div>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
            <div class="gallery">
                <div class="gallery-img-1">
                	<c:if test="${!empty hotelImg.file_url }">
						<img class="hotel_img_path" src="${hotelImg.file_url}">
					</c:if>
					<c:if test="${empty hotelImg.file_url }">
						<img class="hotel_img_path"  src="https://booqueen.s3.ap-northeast-2.amazonaws.com/hotel/default-hotel-img.png"></a>
					</c:if>
                </div>
                <c:choose>
                <c:when test="${empty hotelImg.file_url }">
                	<div class="gallery-img-2"><img src="https://booqueen.s3.ap-northeast-2.amazonaws.com/hotel/default-hotel-img.png"></div>
               		<div class="gallery-img-3"><img src="https://booqueen.s3.ap-northeast-2.amazonaws.com/hotel/default-hotel-img.png"></div>
                	<c:forEach begin="1" end="6">
                		<div><img src="https://booqueen.s3.ap-northeast-2.amazonaws.com/hotel/default-hotel-img.png"></div>
                	</c:forEach>
                </c:when>
                <c:otherwise>
                	<c:forEach var="roomImgsRandom" items="${roomImgsRandom}" begin="1" end="8" varStatus="status">
                		<c:choose>
                		<c:when test="${status.index == 2}">
                			<div class="gallery-img-2"><img src="${roomImgsRandom.file_url}"></div>
                		</c:when>
                		<c:when test="${status.index == 3}">
                			<div class="gallery-img-3"><img src="${roomImgsRandom.file_url}"></div>
                		</c:when>
                		<c:otherwise>
                			<div><img src="${roomImgsRandom.file_url}"></div>
                		</c:otherwise>
                		</c:choose>
                	</c:forEach>
	                
	            </c:otherwise>    
            	</c:choose>
            </div>
        </div>
    </div>

    <div class="details-hotel">
        <div class="description">
        	
            <p><strong>${hotelInfo.city}</strong>에 위치한 <strong>${hotelInfo.hotelname }</strong>에서 머물러보세요. 숙소는 에어컨, 위성 평면 TV 등이 구비된 객실을 보유하고 있습니다. 이 <strong>${hotelInfo.star}</strong>성급 호텔의 각 객실에는 도시 전망과 무료 Wi-Fi가 구비되어 있습니다. 숙소는 투숙객을 위한 24시간 프런트 데스크, 수하물 보관 서비스 등을 제공합니다.</p>
            <P><strong>${hotelInfo.hotelname }</strong>의 각 객실에는 책상 등이 마련되어 있습니다. 숙소의 일부 객실에는 안전 금고가 구비되어 있으며, 각 객실에는 비데, 목욕 가운 등을 갖춘 전용 욕실이 마련되어 있습니다. <strong>${hotelInfo.hotelname }</strong>의 모든 객실에는 침대 린넨, 수건 등이 마련되어 있습니다.</P>
            <p>근처에는 다음의 인기 관광지가 자리하고 있습니다: 
            
            	<c:forEach var="distanceVO" items="${distanceVO }" begin="1" end="5" varStatus="status">
                    <c:if test="${status.index == 5 }">
                    	<strong><span>${distanceVO.name }. </span></strong>
                    </c:if>
                    <c:if test="${status.index != 5 }">
                    	<strong><span>${distanceVO.name }, </span></strong>
                    </c:if>
                </c:forEach>
            
            </p>
        <p>평점 <strong>${reviewAvg.scoreAvg }</strong>점을 획득하였습니다.</p> 
             <!--    <p><span>Glue Hotel에서는 2019년 10월 15일부터 Booking.com 고객을 맞이하고 있습니다.</span></p>
            <p>숙소 설명에 표시된 거리는 © OpenStreetMap을 통해 산출되었습니다.</p>-->
           <div> 
                <h4 class="description-h4">호텔 시설</h4>
                <div class="description-popular">
	                    
	                    <c:if test="${hotelServiceVO.parking}">
		                    <div>
		                    	<i class="fas fa-parking"></i><span> 주차</span>
		                    </div>
	                    </c:if>
	                    <c:if test="${hotelServiceVO.wifi}">
		                    <div>
		                        <i class="fas fa-wifi"></i><span> 전구역 Wi-Fi</span>
		                    </div>
	                    </c:if>
	                    <c:if test="${!hotelServiceVO.smoking}">
		                    <div>
		                        <i class="fas fa-ban"></i><span> 금연 객실</span>
		                    </div>
		                </c:if>    
	                    <c:if test="${hotelServiceVO.restaurant}"> 
		                    <div>
		                        <i class="fas fa-utensils"></i><span> 식당</span>
		                    </div>
		                </c:if>
		                <c:if test="${hotelServiceVO.bar}">    
		                    <div>
		                        <i class="fas fa-wine-glass"></i><span> 라운지 바</span>
		                    </div>
		                </c:if>
		                <c:if test="${hotelServiceVO.front_desk}">     
		                    <div>
		                        <i class="fas fa-clock"></i><span> 24시간 프런트 데스크</span>
		                    </div>
		                </c:if>
		                <c:if test="${hotelServiceVO.swimming_pool}">    
		                    <div>
		                        <i class="fas fa-water"></i><span> 수영장</span>
		                    </div>
		                </c:if>
		                <c:if test="${hotelServiceVO.fitnesscenter}">    
		                    <div>
		                        <i class="fas fa-bicycle"></i><span> 피트니스 센터</span>
		                    </div>
		                </c:if>
		                    <div>
		                    	<i class="fas fa-wind"></i><span> 에어컨</span>
		                    </div>
                </div>
            </div>
        </div>
        <div class="reservation">
            <div class="highlight">
<!--                 <h4>숙소 매력 포인트</h4> -->
                <div>
                    <div>
<!--                         <h5>1박 투숙에 적합!</h5> -->
                    </div>
                    <div>
<!--                         <p class="highlight-p"> 
                            <span class="highlight-span">최고의 위치: 최근 고객들에게 높은 점수 획득</span>
                        </p>-->
                    </div>
                </div>
                <div class="highlight-footer">
                    <a href="#booking-table"><p><button class="button-blue"><span>지금 예약</span></button></p></a>
                    <p>
                    	<button onclick="mySnackbar()" id="mySnackbar" class="button-white">
                    		<i id="fheart" class="bi bi-heart"></i>
      						<span id="fsave"></span>
                    	</button>
                    </p>
<!--                     <p id="test">리스트에 6102회 저장됨</p> -->
                </div>
            </div>
        </div>
    </div>

    <div id="snackbar"></div>

    <hr class="line" id="searchRoomLine">

	<c:choose>
		<c:when test="${available_room == true }">
			<a name="booking-table"></a>
		    <div class="booking">
		        <div>
		            <h2>예약 가능 여부</h2>
		            <div class="booking-top-box">
		                    <div class="booking-top-box-first">
		                        <div>
		                            <h4>체크인 날짜</h4>
		                                <a>${hotelAvailableVO.start_date }</a>
		                        </div>
		                        <div>
		                            <h4>체크아웃 날짜</h4>
		                                <a>${hotelAvailableVO.end_date }</a>
		                        </div>
		                    </div>
		                
		                    <div class="booking-top-box-second">
		                        <div>
		                            <div>
		                                <h4>
		                                    투숙객
		                                </h4>
		                                <a>성인 2명</a>
		                            </div>
		                        </div>
		                    </div>
		                    <div>
		                        <div>
		                            <button class="change_search_data">검색변경</button>
		                        </div>
		                    </div>
		            </div>
		        </div>
		        
		        
		        <div class="booking-table">
		            <div class="booking-table-left">
		                <form id="reservation_form" action="${contextPath}/reservationProcess.do">
		                <table>
		                    <thead>
		                        <tr class="booking-row">
		                            <th style="width: 50%;">객실 유형</th>
		                            <th style="width: 10%;">정원</th>
		                            <th id="day-charge" style="width: 15%;">${hotelAvailableVO.diffDays }박 요금</th>
		                            <th style="width: 15%;">선택사항</th>
		                            <th style="width: 10%;">객실 선택</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                    
		                    	<c:forEach var="room" items="${roomList}" varStatus="varStatus">
			                        <tr>
			                            <td class="booking-table-frist-td">
			                                <div class="booking-table-tbody-div">
			                                    <div>
			                                        <a class="tbody-div-a" onclick="on_hotelroom('${room.type}')"><span>${room.type }</span></a>
			                                    </div>
<!-- 			                                    <div class="booking-warning"> -->
<!-- 			                                        <i class="bi bi-circle-half"></i><span id="booking-warning-span">우리 사이트에 남은 객실 단 3개</span> -->
<!-- 			                                    </div> -->
			                                    <div>
			                                        <ul class="booking-table-bed">
			                                            <li>
			                                                <span>침대</span>&nbsp;<i class="fas fa-bed fa-lg"></i> <span>x ${room.bed}</span>
			                                            </li>
			                                        </ul>
			                                    </div>
			                                    <div class="booking-table-tbody-div-third-row">	                                     
			                                        <ul class="booking-table-ul">
			                                        		<c:if test="${room.roomFacilitiesVO.ground_floor}"><li>1층</li></c:if>
															<c:if test="${room.roomFacilitiesVO.wheelchair}"><li>휠체어</li></c:if>
															<c:if test="${room.roomFacilitiesVO.elevator}"><li>엘리베이터</li></c:if>
															<c:if test="${room.roomFacilitiesVO.stair_only}"><li>계단</li></c:if>
															<c:if test="${room.roomFacilitiesVO.bathroom_handle}"><li>욕실 안전 손잡이</li></c:if>
															
															<c:if test="${room.roomFacilitiesVO.hanger}"><li>행거</li></c:if>
															<c:if test="${room.roomFacilitiesVO.drying_rack}"><li>건조대</li></c:if>
															<c:if test="${room.roomFacilitiesVO.folding_bed}"><li>접이식 침대</li></c:if>
															<c:if test="${room.roomFacilitiesVO.electric_kettle}"><li>전기 주전자</li></c:if>
															<c:if test="${room.roomFacilitiesVO.sofa_bed}"><li>소파침대</li></c:if>
															<c:if test="${room.roomFacilitiesVO.ac}"><li>에어컨</li></c:if>
															<c:if test="${room.roomFacilitiesVO.closet}"><li>옷장</li></c:if>
															<c:if test="${room.roomFacilitiesVO.carpet_floor}"><li>카페트</li></c:if>
															<c:if test="${room.roomFacilitiesVO.marble_floor}"><li>대리석</li></c:if>
															<c:if test="${room.roomFacilitiesVO.wooden_floor}"><li>나무 바닥</li></c:if>
															<c:if test="${room.roomFacilitiesVO.dress_room}"><li>드레스룸</li></c:if>
															<c:if test="${room.roomFacilitiesVO.fan}"><li>선풍기</li></c:if>
															<c:if test="${room.roomFacilitiesVO.heater}"><li>히터</li></c:if>
															<c:if test="${room.roomFacilitiesVO.private_entrance}"><li>전용 출입문</li></c:if>
															<c:if test="${room.roomFacilitiesVO.safety_box}"><li>금고</li></c:if>
															<c:if test="${room.roomFacilitiesVO.sofa}"><li>소파</li></c:if>
															<c:if test="${room.roomFacilitiesVO.sound_proof}"><li>방음</li></c:if>
															<c:if test="${room.roomFacilitiesVO.resting_area}"><li>휴게실</li></c:if>
															<c:if test="${room.roomFacilitiesVO.cleaning_tools}"><li>청소도구</li></c:if>
															
															<c:if test="${room.roomFacilitiesVO.restroom}"><li>화장실</li></c:if>
															<c:if test="${room.roomFacilitiesVO.bathtub}"><li>욕조</li></c:if>
															<c:if test="${room.roomFacilitiesVO.bidet}"><li>비데</li></c:if>
															<c:if test="${room.roomFacilitiesVO.bathrobe}"><li>가운</li></c:if>
															<c:if test="${room.roomFacilitiesVO.amenities}"><li>오락시설</li></c:if>
															<c:if test="${room.roomFacilitiesVO.hair_dryer}"><li>헤어드라이기</li></c:if>
															<c:if test="${room.roomFacilitiesVO.spabath}"><li>스파</li></c:if>
															<c:if test="${room.roomFacilitiesVO.public_bathroom}"><li>공중 화장실</li></c:if>
															<c:if test="${room.roomFacilitiesVO.slipper}"><li>실내화</li></c:if>
															
															<c:if test="${room.roomFacilitiesVO.dining_area}"><li>식사 공간</li></c:if>
															<c:if test="${room.roomFacilitiesVO.dining_table}"><li>식탁</li></c:if>
															<c:if test="${room.roomFacilitiesVO.barbeque}"><li>바베큐</li></c:if>
															<c:if test="${room.roomFacilitiesVO.cooktop}"><li>가스레인지</li></c:if>
															<c:if test="${room.roomFacilitiesVO.toaster}"><li>토스터</li></c:if>
															<c:if test="${room.roomFacilitiesVO.coffee_pot}"><li>커피 포트</li></c:if>
															<c:if test="${room.roomFacilitiesVO.outdoor_dining}"><li>야외 식사 공간</li></c:if>
															<c:if test="${room.roomFacilitiesVO.mini_bar}"><li>미니바</li></c:if>
															<c:if test="${room.roomFacilitiesVO.kitchenware}"><li>주방용품</li></c:if>
															<c:if test="${room.roomFacilitiesVO.microwave}"><li>전자레인지</li></c:if>
															<c:if test="${room.roomFacilitiesVO.refridge}"><li>냉장고</li></c:if>
															<c:if test="${room.roomFacilitiesVO.coffee_machine}"><li>커피머신기</li></c:if>
															
															<c:if test="${room.roomFacilitiesVO.computer}"><li>컴퓨터</li></c:if>
															<c:if test="${room.roomFacilitiesVO.game_console}"><li>게임기</li></c:if>
															<c:if test="${room.roomFacilitiesVO.laptop}"><li>노트북</li></c:if>
															<c:if test="${room.roomFacilitiesVO.tablet_pc}"><li>태블릿</li></c:if>
															<c:if test="${room.roomFacilitiesVO.cable_channel}"><li>케이블 채널</li></c:if>
															<c:if test="${room.roomFacilitiesVO.fax}"><li>팩스</li></c:if>
															<c:if test="${room.roomFacilitiesVO.ipad_docking_station}"><li>아이패드 도킹 스테이션</li></c:if>
															<c:if test="${room.roomFacilitiesVO.laptop_safebox}"><li>노트북 보관함</li></c:if>
															<c:if test="${room.roomFacilitiesVO.tv}"><li>텔레비전</li></c:if>
															<c:if test="${room.roomFacilitiesVO.pay_per_view}"><li>유료시청제</li></c:if>
															<c:if test="${room.roomFacilitiesVO.radio}"><li>라디오</li></c:if>
															<c:if test="${room.roomFacilitiesVO.satellite_channel}"><li>위성 뉴스 채널</li></c:if>
															<c:if test="${room.roomFacilitiesVO.telephone}"><li>전화기</li></c:if>
															<c:if test="${room.roomFacilitiesVO.video_game}"><li>비디오 게임</li></c:if>
															
															<c:if test="${room.roomFacilitiesVO.lounge}"><li>라운지</li></c:if>
															<c:if test="${room.roomFacilitiesVO.alarm_clock}"><li>알람시계</li></c:if>
															<c:if test="${room.roomFacilitiesVO.morning_call}"><li>모닝콜</li></c:if>
															<c:if test="${room.roomFacilitiesVO.towel}"><li>수건</li></c:if>
															<c:if test="${room.roomFacilitiesVO.bathing_sheet}"><li>목욕 타월</li></c:if>
															
															<c:if test="${room.roomFacilitiesVO.balcony}"><li>발코니</li></c:if>
															<c:if test="${room.roomFacilitiesVO.terras}"><li>테라스</li></c:if>
															<c:if test="${room.roomFacilitiesVO.city_view}"><li>시티뷰</li></c:if>
															<c:if test="${room.roomFacilitiesVO.garden_view}"><li>가든뷰</li></c:if>
															<c:if test="${room.roomFacilitiesVO.lake_view}"><li>호수</li></c:if>
															<c:if test="${room.roomFacilitiesVO.attractions_view}"><li>명소뷰</li></c:if>
															<c:if test="${room.roomFacilitiesVO.mountain_view}"><li>마운틴뷰</li></c:if>
															<c:if test="${room.roomFacilitiesVO.pool_view}"><li>수영장뷰</li></c:if>
															<c:if test="${room.roomFacilitiesVO.river_view}"><li>리버뷰</li></c:if>
															<c:if test="${room.roomFacilitiesVO.ocean_view}"><li>오션뷰</li></c:if>
			                                        </ul>
			                                    </div>
			                                </div>
			                            </td>
			                            <td class="booking-table-cell"><i class="bi bi-person-fill"></i><span>x ${room.quota }</span></td>
			                            <td class="booking-table-cell"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${room.price * hotelAvailableVO.diffDays}" /></td>
			                            <td class="booking-table-cell booking-cancel-cell" >무료취소</td>
			                            <td class="booking-table-cell">
			                                <select name="count_rooms" class="count_room_select">
			                                	<option value="0">0</option>
			                                	<c:set var="room_available" value="${room.roomAvailableVO.available }"/>
<%-- 			                                	<c:set var = "total" value = "0" /> --%>
			                                	<c:forEach begin="1" end="${room_available }" varStatus="status">
			                                		<option value="${status.count}">${status.count }<span>&nbsp;&nbsp;&nbsp;&nbsp;(<fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${room.price * hotelAvailableVO.diffDays * status.count }" />)</span></option> 
<%-- 													<c:set var= "total" value="${total + (room.price*room_available)}"/> --%>
<%-- 			                                		<input type="hidden" name="prices" value="${room.price}"> --%>
			                                	</c:forEach>
			                                </select>
			                            </td>    
			                        </tr>
<%-- 			                        <input type="hidden" name="total" value="${total }"> --%>
			                        <input type="hidden" name="sequence" value="${room.sequence }">
			                        <input type="hidden" name="room_id" value="${room.room_id }">
			                        <input type="hidden" name="serialnumber" value="${room.serialnumber }">
			                        <input type="hidden" name="type" value="${room.type }">
			                        <input type="hidden" name="start_date" value="${hotelAvailableVO.start_date }">
			                        <input type="hidden" name="end_date" value="${hotelAvailableVO.end_date }">
			                        <input type="hidden" name="prices" value="${room.price }">
			                        <input type="hidden" name="diffDays" value="${hotelAvailableVO.diffDays}">
		                        </c:forEach>
		                                 
		                                       
		                    </tbody>
		                </table>
		                </form>
		            </div>
		            <div class="booking-table-right">
		                <div class="fake-header"></div>
		                <div class="fake-header-bottom">&nbsp;</div>
		                <div class="following-booking">
		                    
		                    <c:choose>
		                    <c:when test="${isLogOn == true  && member != null}">
		                    	<c:if test="${!blocked}">
		                    		<button id="reservation_btn" form="reservation_form" type="submit">예약하기</button>
		                    	</c:if>
		                    	<c:if test="${blocked}">
		                    		<button id="reservation_btn" onclick="blocked_btn('${blockedUser.whyblock}')">예약하기</button>
		                    	</c:if>
		                    </c:when>
		                    <c:otherwise>
		                    	<button id="reservation_btn" onclick="disabled_btn()">예약하기</button>
		                    </c:otherwise>
		                    </c:choose>
		                    <ul>
		                        <li>단 2분이면 예약 완료</li>
		                        <li>즉시 예약 확정</li>    
		                        <li>예약 수수료, 신용카드 수수료 없음!</li>
		                    </ul>
		                </div>
		            </div>
		        </div>
		    </div>
		
		</c:when>

		<c:when test="${available_room == false }">
			<h2 style="padding: 10px 18%; margin-bottom: 10px;">검색 변경</h2>
			<div class="add" style="position: relative; margin-top: 0px;">
		        <i class="bi bi-info-circle"></i>
		        <div>
		            <span style="font-size: 18px;font-weight: 700;">
		            	<fmt:parseDate var="start_date" value="${hotelAvailableVO.start_date }" pattern="yyyyMMdd"/>
		            	<fmt:parseDate var="end_date" value="${hotelAvailableVO.end_date }" pattern="yyyyMMdd"/>
		                <fmt:formatDate value="${start_date }" pattern="yyyy년 M월 dd일"/>(${hotelAvailableVO.start_date_day}) ~ <fmt:formatDate value="${end_date }" pattern="yyyy년 M월 dd일"/>(${hotelAvailableVO.end_date_day})에 예약 가능한 객실 없음
		            </span>
		            <p style="font-size: 16px;">
		                죄송합니다. 선택된 기간에 이 호텔에 예약 가능한 객실이 없습니다
		            </p>
		        </div>
		        <c:if test="${!empty availableRooms}">
		        <div class="now-booking" style="right: 40px;top: 26px;">
                    <button style="width: 300px;background: #fc5454; border: 0.5px solid #fc5454; height: 40px;" class="change_search_data">검색 변경</button>
               	</div>
               	</c:if>
		    </div>
		    
		    <div class="change-date">
		    	
		        <h4 style="display: none;">날짜 바꾸기</h4>
		        <form class="change-date-form" style="display: none;">
		            
		                <div class="form-col form-col-1">
		                    <label>체크인 날짜</label>
		                </div>
		                <div class="form-col form-col-2">
		                    <i class="fas fa-calendar" aria-hidden="true"></i><span class="change-date-span">2022년 1월 14일</span><i class="fas fa-angle-down" aria-hidden="true"></i>
		                </div>
		                <div class="form-col form-col-3">
		                    
		                </div>
		                <div class="form-col form-col-4">
		                    <label>체크아웃 날짜</label>
		                </div>
		                <div class="form-col form-col-5">
		                    <i class="fas fa-calendar" aria-hidden="true"></i><span class="change-date-span">2022년 1월 14일</span><i class="fas fa-angle-down" aria-hidden="true"></i>
		                </div>
		                <div class="form-col form-col-6">
		                    <button class="button-blue"><span>객실 확인</span></button>
		                </div>
		        </form>
		
		        <div class="u-clearfix" data-render="" style="display: none;">
		            <div class="sb-group__field sb-group__field-rooms">
		                <label class="sb-searchbox__label sb-group__field__label -inline -small " for="no_rooms">객실</label>
		                <select name="no_rooms" id="no_rooms" data-group-rooms-count="" aria-label="객실 수">
		                    <option value="1" selected="selected">1</option>
		                    <option value="2">2</option>
		                    <option value="3">3</option>
		                    <option value="4">4</option>
		                    <option value="5">5</option>
		                    <option value="6">6</option>
		                    <option value="7">7</option>
		                    <option value="8">8</option>
		                    <option value="9">9</option>
		                    <option value="10">10</option>
		                    <option value="11">11</option>
		                    <option value="12">12</option>
		                    <option value="13">13</option>
		                    <option value="14">14</option>
		                    <option value="15">15</option>
		                    <option value="16">16</option>
		                    <option value="17">17</option>
		                    <option value="18">18</option>
		                    <option value="19">19</option>
		                    <option value="20">20</option>
		                    <option value="21">21</option>
		                    <option value="22">22</option>
		                    <option value="23">23</option>
		                    <option value="24">24</option>
		                    <option value="25">25</option>
		                    <option value="26">26</option>
		                    <option value="27">27</option>
		                    <option value="28">28</option>
		                    <option value="29">29</option>
		                    <option value="30">30</option>
		                </select>
		            </div>
		
		            <div class="sb-group__field sb-group__field-adults">
		                <label class="sb-searchbox__label sb-group__field__label -inline -small " for="group_adults">성인</label>
		                <select name="group_adults" aria-label="성인 수" id="group_adults" data-group-adults-count="">
		                    <option value="1">1</option>
		                    <option value="2" selected="selected">2</option>
		                    <option value="3">3</option>
		                    <option value="4">4</option>
		                    <option value="5">5</option>
		                    <option value="6">6</option>
		                    <option value="7">7</option>
		                    <option value="8">8</option>
		                    <option value="9">9</option>
		                    <option value="10">10</option>
		                    <option value="11">11</option>
		                    <option value="12">12</option>
		                    <option value="13">13</option>
		                    <option value="14">14</option>
		                    <option value="15">15</option>
		                    <option value="16">16</option>
		                    <option value="17">17</option>
		                    <option value="18">18</option>
		                    <option value="19">19</option>
		                    <option value="20">20</option>
		                    <option value="21">21</option>
		                    <option value="22">22</option>
		                    <option value="23">23</option>
		                    <option value="24">24</option>
		                    <option value="25">25</option>
		                    <option value="26">26</option>
		                    <option value="27">27</option>
		                    <option value="28">28</option>
		                    <option value="29">29</option>
		                    <option value="30">30</option>
		                </select>    
		            </div>
		
		            <div class="sb-group__field sb-group-children ">
		                <label class="sb-searchbox__label sb-group__field__label -inline -small " for="group_children">어린이</label>
		                <select name="group_children" aria-label="아동 수" id="group_children" data-group-children-count="" data-component="search/group/children-ages-tooltip search/group/add-children-tooltip" data-add-children-tooltip="">
		                    <option value="0" selected="selected">0</option>
		                    <option value="1">1</option>
		                    <option value="2">2</option>
		                    <option value="3">3</option>
		                    <option value="4">4</option>
		                    <option value="5">5</option>
		                    <option value="6">6</option>
		                    <option value="7">7</option>
		                    <option value="8">8</option>
		                    <option value="9">9</option>
		                    <option value="10">10</option>
		                </select>
		            </div>
		            </div>
					
					<c:if test="${!empty availableRooms}">
		            <div class="bui-text">다음 날짜는 아직 예약 가능하지만 금방 매진될 수 있어요</div>
		
		            <div>
		                <ul class="reservation-date">
		                    <c:forEach var="availableRooms" items="${availableRooms}">
		                    <c:set var="open_date" value="${availableRooms.open_date}"/>
		                    <c:set var="close_date" value="${availableRooms.close_date}"/>
		                    
		                    <li>
		                        <a href="${contextPath}/hotelInfo.do?start_date=${fn:substring(open_date, 0, 4)}${fn:substring(open_date, 5, 7)}${fn:substring(open_date, 8, 10)}&end_date=${fn:substring(close_date, 0, 4)}${fn:substring(close_date, 5, 7)}${fn:substring(close_date, 8, 10)}&serialNumber=${hotelInfo.serialnumber}#searchRoomLine">
		                        <div class="reservation-flex">
		                            <div>${availableRooms.open_date} ~ ${availableRooms.close_date}</div>
		                            <div>1박</div>
		                            <div style="font-weight: 600;"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${availableRooms.standard_price}" />~</div>
		                        </div>
		                        </a>
		                    </li>
		                    </c:forEach>
		                </ul>
		            </div>
		            </c:if>
		            <c:if test="${empty availableRooms }">
		            	<div class="bui-text">죄송합니다. 해당 호텔은 현재 준비중이므로 예약 가능한 객실이 존재하지 않습니다. 다른 호텔을 이용 부탁드립니다.</div>
		            </c:if>
		    </div>
		
			<div class="add" style="display: none;">
		        <i class="bi bi-alarm"></i>
		        <div>
		            <span>선택 날짜에 서울 숙소 완판 임박:  </span>
		            <span>이곳과 비슷한 3성급 호텔 4개가 저희 사이트에서 이미 판매 완료되었어요</span>
		        </div>
		    </div>
		
		</c:when>

	</c:choose>


   <div class="hospital">
        <a>
            <div>
                <span class="hospital-span"><i class="fas fa-hospital fa-4x"></i></span>
                <div class="hospital-inner">
                    <div><h3>보건 & 안전 관련 특별 조치</h3></div>
                    <div>이 숙소는 투숙객의 안전을 최우선에 두고 보건 및 위생에 관해 특별한 조치를 취하고 있습니다.</div>
<!--                     <span>자세히 알아보기</span> -->
                </div>
            </div>
        </a>
   </div>

	<c:choose>
	<c:when test="${!empty reviewList && reviewAvg.scoreAvg != 0.0}">
   <div class="review">
        <h2>이용후기</h2>
        <div class="now-booking">
            <a href="#booking-table"><button>지금 예약</button></a>
        </div>
        
        <div class="review-text2">
            <div id="score" class="review-score">${reviewAvg.scoreAvg }</div>
            <div>
            <c:choose>
                <c:when test="${reviewAvg.scoreAvg >= 9}"><span style="font-size: 18px;">최고</span></c:when>
				<c:when test="${reviewAvg.scoreAvg >= 8}"><span style="font-size: 18px;">매우 좋음</span></c:when>
				<c:when test="${reviewAvg.scoreAvg >= 7}"><span style="font-size: 18px;">좋음</span></c:when>
				<c:when test="${reviewAvg.scoreAvg >= 6}"><span style="font-size: 18px;">만족</span></c:when>
				<c:when test="${reviewAvg.scoreAvg < 6}"><span style="font-size: 18px;">보통</span></c:when>
           </c:choose>     
                <span id="reviewcount" style="margin-left: 10px;">
                	<c:if test="${reviewAvg.scoreAvg == 0.0 }">
                		0
                	</c:if>
                	<c:if test="${reviewAvg.scoreAvg != 0.0}">
                		${fn:length(reviewList)}
                	</c:if>
                	</span><span>개 이용 후기</span>
            </div>
            <div class="reveiw-text-smaller">
<!--                 <span>이용후기 모두 보기</span> -->
            </div>
        </div>
        <h3>항목별 점수</h3>
        <div class="itemized-score">
            <div>
                <div class="itemized-score-detail"><span class="itemized-score-text">직원 친절도</span><span id="staff_span">${reviewAvg.staffAvg }</span></div>
                <div class="c-score-bar"><span class="c-score-bar__value" id="staff" style="width:91%">&nbsp;</span></div>
            </div>
            <div>
                <div class="itemized-score-detail"><span class="itemized-score-text">서비스</span><span id="service_span">${reviewAvg.serviceAvg }</span></div>
                <div class="c-score-bar"><span class="c-score-bar__value" id="service" style="width:82%">&nbsp;</span></div>
            </div>
            <div>
                <div class="itemized-score-detail"><span class="itemized-score-text">청결도</span><span id="cleanness_span">${reviewAvg.cleannessAvg }</span></div>
                <div class="c-score-bar"><span class="c-score-bar__value" id="cleanness" style="width:80%">&nbsp;</span></div>
            </div>
            <div>
                <div class="itemized-score-detail"><span class="itemized-score-text">편안함</span><span id="comfort_span">${reviewAvg.comfortAvg }</span></div>
                <div class="c-score-bar"><span class="c-score-bar__value" id="comfort" style="width:60%">&nbsp;</span></div>
            </div>
            <div>
                <div class="itemized-score-detail"><span class="itemized-score-text">가성비</span><span id="effectiveness_span">${reviewAvg.effectivenessAvg }</span></div>
                <div class="c-score-bar"><span class="c-score-bar__value" id="effectiveness" style="width:70%">&nbsp;</span></div>
            </div>
            <div>
                <div class="itemized-score-detail"><span class="itemized-score-text">위치</span><span id="place_span">${reviewAvg.placeAvg }</span></div>
                <div class="c-score-bar"><span class="c-score-bar__value" id="place" style="width:70%">&nbsp;</span></div>
            </div>
        </div>
        <h3>투숙객이 뽑은 최고의 장점</h3>
        <div>
            <ul class="touriest-pick">
                
                <c:forEach var="reviewProfileList" items="${reviewProfileList }" varStatus="status">
                <li>
                    <div>
                        <div class="review-block-detail">
                            <div class="bui-group__item">
                                <div class="bui-dropdown bui-dropdown--end">
                                    <a href="https://secure.booking.com/mydashboard.ko.html?label=gen173nr-1BCAEoggI46AdIM1gEaH2IAQGYARe4ARfIAQzYAQHoAQGIAgGoAgO4ArKx-I4GwAIB0gIkODdkZTBiOTktZmQ5Ni00MzhiLTgzOWQtY2MwZDFkYjBiNDZi2AIF4AIB&amp;sid=badb6cdf6bf9a7560d24fbf6f1c9e986" type="button">
                                        <span class="bui-button__text">
                                            <div class="bui-avatar-block">
                                                <div class="bui-avatar bui-avatar--accent bui-avatar--outline-accent">
                                                   <img class="bui-avatar__image" src="data:${reviewProfileList.memberProfileVO.profile_type};base64, ${reviewProfileList.memberProfileVO.profile_data}" style="height: 50px; width: 50px;">
                                                </div>
                                                <div class="bui-avatar-block__text">
                                                    <span class="touriest-block__title" id="profile-menu-trigger--title">
                                                        ${reviewProfileList.reviewVO.username }
                                                    </span>
                                                    <span class="bui-avatar-block__subtitle" id="profile-menu-trigger--content">
                                                        <span class="touriest-block-complement">
                                                            ${reviewProfileList.reviewVO.writing }
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                                        </span>
                                    </a>
                                </div>  
                            </div>
                            <div class="review-score1">${reviewProfileList.reviewVO.score }</div>
                        </div>
                    </div>
                    
                    <div class="more-review-detail">
                  		<div class="bui-grid__column-9 c-review-block__right">
		                    <div class="c-review-block__row">
							    <div class="c-review">
						            <div class="c-review__row">
						                <div class="c-review__inner ">
											<span class="c-review__prefix c-review__prefix--color-green"><svg class="-iconset-review_great c-review__icon" viewBox="0 0 128 128"><path d="M64 8a56 56 0 1 0 56 56A56 56 0 0 0 64 8zm0 104a48 48 0 1 1 48-48 48 48 0 0 1-48 48zM44 64a8 8 0 1 1 8-8 8 8 0 0 1-8 8zm48-8a8 8 0 1 1-8-8 8 8 0 0 1 8 8zm-4.8 21.6a4 4 0 0 1 .6 3.6A24.3 24.3 0 0 1 64 97c-9.7 0-15.7-4.2-19-7.8a22.7 22.7 0 0 1-4.8-8A4 4 0 0 1 44 76h40a4 4 0 0 1 3.2 1.6z"></path></svg>
											
											<span id="c-review-strenght" class="c-review__body" lang="ko">${reviewProfileList.reviewVO.strength }</span>
						                </div>
						            </div>
						            <div class="c-review__row lalala">
						                <div lang="ko" class="c-review__inner ">
											<span class="c-review__prefix">
												<svg class="-iconset-review_poor c-review__icon" viewBox="0 0 128 128">
													<path d="M64 8a56 56 0 1 0 56 56A56 56 0 0 0 64 8zm0 104a48 48 0 1 1 48-48 48 48 0 0 1-48 48zM44 64a8 8 0 1 1 8-8 8 8 0 0 1-8 8zm48-8a8 8 0 1 1-8-8 8 8 0 0 1 8 8zm-5.2 30.2a4 4 0 1 1-5.6 5.6c-10.5-10.4-24-10.4-34.4 0a4 4 0 0 1-5.6-5.6c13.6-13.7 32-13.7 45.6 0z"></path></svg>
											</span>
											<span class="c-review__body" lang="ko">${reviewProfileList.reviewVO.weakness }</span>
						                </div>
					           	 	</div>
							    </div>
                    		</div>
			            </div>
                    </div>
                    <!-- 자세히 보기 -->
                </li>
                </c:forEach> 
            </ul>
        </div>
        <p><button class="button-white" id="view-review"><span>후기 모두 보기</span></button></p>
    </div>
    </c:when>
    <c:otherwise>
    	<div class="review-empty-container">
            <div class="review-empty-box" style="margin: 0 18%; border: 1px solid #0071c2;" >
               <h3>아직 이용 후기 평점이 없습니다 😭</h3>
               <p>정확한 평점 계산을 위해서는 최소 3개의 이용 후기가 필요합니다. 이 숙소를 예약하고 후기를 남기셔서 ${hotelInfo.hotelname } 호텔 평가에 도움을 주세요.</p>
<!--                <button class="empty-write-review">후기쓰기</button> -->
            </div>
         </div>
    </c:otherwise>
    </c:choose>

	<div id="question_board">
		<c:choose>
		<c:when test = "${!empty boardList }">
		 <div class="question">
	        <h2>궁금하신 점이 있나요?</h2>
	        <p>Q&A에서 더 많은 정보를 찾아보세요. 원하는 정보가 없다면 아래에서 숙소에 직접 질문을 남기세요.</p>
	        <div class="now-booking" id="question-booking">
	            <a href="#booking-table"><button>지금 예약</button></a>
	        </div>
	        <div>
	            <div class="question-third">
	                <div class="question-third-left">
	                    <div>
	                        <p><strong>${hotelInfo.hotelname }</strong></p>
	                        <div>보통 몇 시간 안에 답변을 드려요</div>
	                    </div>
	                    <p><button class="button-white" id="question_button"><span>질문 남기기</span></button></p>
	                </div>
	                <div class="question-third-right">
	                    
	                    <c:forEach var="boardList" items="${boardList }" varStatus="status" begin="0" end="3">
	                    
	                    <c:choose>
	                    <c:when test="${!boardList.partner}">
	                    <div class="question-third-right-row">
	                        <div class="icon-text">
	                            <i class="bi bi-person"></i>&nbsp;&nbsp;
	                            <div>
	                            <p class="question-inner-text">${boardList.content}</p>
	                            <span class="board_send_date">${boardList.send_date }</span></div>
	                        </div>
	                    </c:when>
	                    <c:when test="${boardList.partner}">
	                        <div class="icon-text">
	                            <i class="bi bi-chat"></i>&nbsp;&nbsp;
	                            <div>
	                            <p class="question-inner-text">${boardList.content}</p>
	                        	<span class="board_send_date">${boardList.send_date }</span></div>
	                        </div>
	                        </div>
	                    </c:when>
	                    </c:choose>
                         </c:forEach>
                         <c:set value="${fn:length(boardList)/2 }" var="boardList_length"/>
	                    <p class="question-more"><button class="button-white" id="more_board"><span>답변이 완료된 게시글 전체 보기(<fmt:formatNumber type="number" maxFractionDigits="0"  value="${boardList_length}" />개)</span></button></p> <!-- (<fmt:formatNumber type="number" maxFractionDigits="0"  value="${fn:length(boardList)/2}"/>개) -->
	                </div>
	            </div>
	        </div>
	    </div>
	    </c:when>
	    
    	<c:otherwise>
	    <div class="question-answer">
			<div class="qna-card">
				<div class="qna-icon">
					<svg class="bk-icon -streamline-chat_bubbles" fill="#0071C2" height="36" width="36" viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false"><path d="M24 13.5a6 6 0 0 0-6-6h-3a6 6 0 0 0 0 12h.75l-.53-.22 4.5 4.5a.75.75 0 0 0 1.28-.53v-5.024l-.43.678A5.989 5.989 0 0 0 24 13.502zm-1.5-.002a4.489 4.489 0 0 1-2.57 4.05.75.75 0 0 0-.43.678v5.024l1.28-.53-4.5-4.5a.75.75 0 0 0-.53-.22H15a4.5 4.5 0 1 1 0-9h3a4.5 4.5 0 0 1 4.5 4.5zM6.22 12.22l-3 3 1.28.53v-5.024a.75.75 0 0 0-.43-.678A4.489 4.489 0 0 1 5.998 1.5H9a4.502 4.502 0 0 1 4.313 3.214.75.75 0 0 0 1.438-.428A6.002 6.002 0 0 0 9 0H6a5.988 5.988 0 0 0-2.57 11.404L3 10.726v5.024a.75.75 0 0 0 1.28.53l3-3a.75.75 0 1 0-1.06-1.06z"></path></svg>
				</div>
				<div class="qna-text">
					<h3>숙소 관련 Q&A</h3>
					<div>더 알고 싶은 정보가 있으신가요? 숙소에 질문을 남겨보세요.</div>
				</div>
				<button class="make-question" id="makeQuestion">문의하기</button>
			</div>
		</div>
		</c:otherwise>
		</c:choose>
	</div>

	<a name="surroundings"></a>
    <div class="surroundings">
        <div>
            <h2>호텔 주변 지역</h2>
            <span>투숙객들이 숙소 근처 산책이 좋았다고 답했어요!</span>
            <div class="now-booking">
                <a href="#booking-table"><button>지금 예약</button></a>
            </div>
        </div>
        <div class="list-columns">
            <div>
                <div><i class="bi bi-shop"></i>&nbsp;&nbsp;<h3 class="list-columns-title">주변 장소</h3></div>
                <ul>
                	<c:forEach var="distanceVO" items="${distanceVO }" begin="1" end="23">
                    <li><div class="list-columns-li-inner"><div>${distanceVO.name }</div><div><fmt:formatNumber value="${distanceVO.distance }" pattern="0.0"/>km</div></div></li>
                    </c:forEach> 
                </ul>
            </div>
<!--             <div> 
                <div><i class="bi bi-egg-fried"></i>&nbsp;&nbsp;<h3 class="list-columns-title2">인기 명소</h3></div>
                <ul>
                    <li><div class="list-columns-li-inner"><div>남포동건어물도매시장</div><div>0.6km</div></div></li>
                    <li><div class="list-columns-li-inner"><div>광복동</div><div>0.8 km</div></div></li>
                    <li><div class="list-columns-li-inner"><div>자갈치 시장</div><div>0.8 km</div></div></li>
                    <li><div class="list-columns-li-inner"><div>신동아시장</div><div>0.9 km</div></div></li>
                    <li><div class="list-columns-li-inner"><div>용두산 공원</div><div>1 km</div></div></li>
                    <li><div class="list-columns-li-inner"><div>충무공동상</div><div>1 km</div></div></li>
                    <li><div class="list-columns-li-inner"><div>부산영화체험박물관</div><div>1 km</div></div></li>
                    <li><div class="list-columns-li-inner"><div>부산 타워</div><div>1 km</div></div></li>
                    <li><div class="list-columns-li-inner"><div>갤러리604</div><div>1 km</div></div></li>
                    <li><div class="list-columns-li-inner"><div>BIFF 광장</div><div>0.6km</div></div></li>
                </ul>
            </div>-->
<!--             <div> 
                <div>&nbsp;</div>
                <div><i class="bi bi-geo-alt"></i>&nbsp;&nbsp;<h3 class="list-columns-title">근처 해변</h3></div>
                <ul>
                    <li><div class="list-columns-li-inner"><div>Songdo Beach</div><div>0.6km</div></div></li>
                    <li><div class="list-columns-li-inner"><div>Songdo Beach</div><div>0.6km</div></div></li>
                    <li><div class="list-columns-li-inner"><div>Dadaepo Beach</div><div>0.8 km</div></div></li>
                    <li><div class="list-columns-li-inner"><div>Gwangalli Beach</div><div>0.8 km</div></div></li>
                    <li><div class="list-columns-li-inner"><div>Songdo Beach</div><div>0.6km</div></div></li>
                </ul>
            </div>-->
<!--             <div> 
                <div><i class="bi bi-flag"></i>&nbsp;&nbsp;<h3 class="list-columns-title">가장 가까운 공항</h3></div>
                <ul>
                    <li><div class="list-columns-li-inner"><div>김해국제공항</div><div>0.6km</div></div></li>
                    <li><div class="list-columns-li-inner"><div>울산공항</div><div>0.8 km</div></div></li>
                    <li><div class="list-columns-li-inner"><div>사천공항</div><div>0.8 km</div></div></li>
                    <li><div class="list-columns-li-inner"><div>김해국제공항</div><div>0.6km</div></div></li>
                    <li><div class="list-columns-li-inner"><div>김해국제공항</div><div>0.6km</div></div></li>
                </ul>
            </div>-->
        </div>
    </div>

	<a name="house-rule"></a>
    <div class="house-rule">
        <div class="house-rule-div">
            <h2>하우스 룰</h2>
            <div class="now-booking">
                <a href="#booking-table"><button>지금 예약</button></a>
            </div>
        </div>

		<div id="hotelPoliciesInc"
			class="descriptionsContainer clearfix hp-section hp-policies-block">
			<div class="description js-timebar-parent timebar-wrapper" style="margin-bottom: 0px;"
				id="checkin_policy">
				<p class="policy_name">
					<span class="policy_name_icon"> <svg
							class="bk-icon -experiments-calendar_checkin hp-policies-calendar-icon"
							height="20" width="20" viewBox="0 0 128 128" role="presentation"
							aria-hidden="true" focusable="false">
							<path
								d="m112 16h-16v-8h-8v8h-48v-8h-8v8h-16c-4.4 0-8 3.9-8 8.7v86.6c0 4.8 3.6 8.7 8 8.7h96c4.4 0 8-3.9 8-8.7v-86.6c0-4.8-3.6-8.7-8-8.7zm0 95.3a1.1 1.1 0 0 1 -.2.7h-95.6a1.1 1.1 0 0 1 -.2-.7v-71.3h96zm-80-27.3h12v12h-12zm38-16h-12v-12h12zm0 28h-12v-12h12zm26 0h-12v-12h12zm0-28h-12v-12h12zm-48-16h-20v20h20zm-6 14h-8v-8h8z"></path></svg>
					</span> <span> 체크인 </span>
				</p>
				<p>
					<span data-component="prc/timebar" class="u-display-block" data-from="15:00" data-from-label="15:00" data-caption="
					15:00 이후
					">
					    <span class="timebar   ">
					        <span class="timebar__core">
					            <span class="timebar__base">
					                <span class="timebar__bar" style="left:${100/24*(hotelPolicy.check_in_start)}%; width:${(100/24*(hotelPolicy.check_in_end)) - (100/24*(hotelPolicy.check_in_start))}%"></span>
					            </span>
					            
					                <span class="timebar__label" style="left: ${100/24*(hotelPolicy.check_in_start)}%; margin-left: -14.5px;">${hotelPolicy.check_in_start }:00</span>
					            	<span class="timebar__label" style="left: ${100/24*(hotelPolicy.check_in_end)}%; margin-left: -14.5px;">${hotelPolicy.check_in_end }:00</span>
					            
					            
					                <span class="timebar__caption" style="left: ${100/24*(hotelPolicy.check_in_start)}%; margin-left: -0px;">
					${hotelPolicy.check_in_start }:00 - ${hotelPolicy.check_in_end }:00
					<span class="timebar__caption-pointer"></span></span>
					            
					        </span>
					    </span>
					</span>
				</p>
			</div>
			<div class="description js-timebar-parent timebar-wrapper"
				id="checkout_policy">
				<p class="policy_name">
					<span class="policy_name_icon"> <svg
							class="bk-icon -experiments-calendar_checkout hp-policies-calendar-icon"
							height="20" width="20" viewBox="0 0 128 128" role="presentation"
							aria-hidden="true" focusable="false">
							<path
								d="m112 16h-16v-8h-8v8h-48v-8h-8v8h-16c-4.4 0-8 3.9-8 8.7v86.6c0 4.8 3.6 8.7 8 8.7h96c4.4 0 8-3.9 8-8.7v-86.6c0-4.8-3.6-8.7-8-8.7zm0 95.3a1.1 1.1 0 0 1 -.2.7h-95.6a1.1 1.1 0 0 1 -.2-.7v-71.3h96zm-68-43.3h-12v-12h12zm0 28h-12v-12h12zm26-28h-12v-12h12zm0 28h-12v-12h12zm26-28h-12v-12h12zm4 12h-20v20h20zm-6 14h-8v-8h8z"></path></svg>
					</span> <span> 체크아웃 </span>
				</p>
				<p>
					<span data-component="prc/timebar" class="u-display-block" data-until="12:00" data-until-label="12:00" data-caption="
					12:00 이전
					">
					    <span class="timebar   ">
					        <span class="timebar__core">
					            <span class="timebar__base">
					                <span class="timebar__bar" style="left:${(100/24*(hotelPolicy.check_out_start))}%; width:${(100/24*(hotelPolicy.check_out_end)) - (100/24*(hotelPolicy.check_out_start))}%;"></span>
					            </span>
					            
					            	<span class="timebar__label" style="left: ${100/24*(hotelPolicy.check_out_start)}%; margin-left: -14.5px;">${(hotelPolicy.check_out_start)}:00</span>
					                <span class="timebar__label" style="left: ${100/24*(hotelPolicy.check_out_end)}%; margin-left: -14.5px;">${(hotelPolicy.check_out_end)}:00</span>
					            
					                <span class="timebar__caption" style="left: ${100/24*(hotelPolicy.check_out_start)}%; margin-left: 0px;">
					${(hotelPolicy.check_out_start)}:00 - ${(hotelPolicy.check_out_end)}:00
					<span class="timebar__caption-pointer"></span></span>
					            
					        </span>
					    </span>
					</span>
				</p>
				<div style="clear: both"></div>
			</div>
			<div id="cancellation_policy" class="description tracked">
				<a name="hotel_cancellation_policy"></a>
				<p class="policy_name">
					<span class="policy_name_icon"> <i class="bi bi-info-circle"></i>
					</span> <span> 취소/선결제 </span>
				</p>
				<div>
				<p>
					숙소 유형에 따라 취소 및 선결제 정책이 달라집니다.</p> <p><a style="color: blue;text-decoration: underline;" onclick="window.scrollTo(0, 0)">숙박 날짜를 입력</a> 한 다음 원하는 객실 조건을
					확인하십시오.
				</p>
				</div>
				<div style="clear: both"></div>
			</div>
			<div class="description description_smp-children-policy"
				id="smp_children_policy" data-et-view="">
				<p class="policy_name">
					<span class="policy_name_icon"> <i
						class="bi bi-person-check-fill"></i>
					</span> <span>아동 요금 정책</span>
				</p>
				<div class="child-policies-table-wrapper"
					data-et-view="INLGPZPfECIAEKKUHAbECHTeYT:2">
					<div class="c-child-policies bui-f-font-body">
					
						<c:choose>
						<c:when test="${hotelPolicy.kid_allowed }">
						<div class="c-child-policies__general bui-spacer--large">
							<p>모든 연령의 아동이 투숙 가능합니다.</p>
							<p class="child-policies-table__info">정확한 요금과 투숙 정원 정보를 확인하려면
								호텔 측에 연락하여 확인 부탁드립니다.</p>
						</div>
						</c:when>
						<c:otherwise>
							<div class="c-child-policies__general bui-spacer--large">
							<p>죄송합니다. 저희 호텔은 아동이 투숙 불가능합니다.</p>
							</div>
						</c:otherwise>
						</c:choose>
						<!--
						<h3 class="bui-f-font-heading bui-spacer--large">아동 정책</h3> 
						<h3 class="bui-f-font-heading bui-spacer--large">유아용 침대 및
							엑스트라 베드 정책</h3>
						<div class="c-child-policies__supplements">
							<p>이 숙소에서는 유아용 침대를 이용하실 수 없습니다.</p>
							<p>이 숙소에서는 엑스트라 베드를 이용하실 수 없습니다.</p>
						</div> -->
					</div>
				</div>
			</div>
			<div class="description" id="age_restriction_policy">
				<p class="policy_name">
					<span class="policy_name_icon"> <i
						class="bi bi-slash-circle"></i>
					</span> <span> 연령 제한 </span>
				</p>
				<p>만 19세 이상만 체크인 가능합니다</p>
			</div>
			<div class="description description--house-rule">
				<p class="policy_name">
					<span class="policy_name_icon"> <i class="bi bi-asterisk"></i>
					</span> <span>반려동물</span>
				</p>
				
				<c:choose>
				<c:when test="${hotelPolicy.pet_allowed }">
					<p>애완동물 동반이 불가능합니다.</p>
				</c:when>
				<c:otherwise>
				<p>애완동물 동반이 불가능합니다.</p>
				</c:otherwise>
				</c:choose>
				<div style="clear: both"></div>
			</div>
		</div>
	</div>

    <jsp:include page="/WEB-INF/user/member/footer.jsp"/>

    <div id="overlay">
        <i class="bi bi-x-lg" onclick="off()"></i>
        <div id="map" style="width:90%; height:80%; margin:100px auto;">
            <div class="map-info">
                <div class="info-inner">
                    <div class="info-top">
<!--                         <button class="maps_iw__close js-maps_iw__close iw-close" aria-label="Close info window"> 
                            <svg width="128" height="128" viewBox="0 0 128 128" class="bk-icon -iconset-close_bold"><path d="M75.3 64l26.4-26.3a8 8 0 0 0-11.4-11.4L64 52.7 37.7 26.3a8 8 0 0 0-11.4 11.4L52.7 64 26.3 90.3a8 8 0 0 0 11.3 11.4L64 75.3l26.3 26.4a8 8 0 0 0 11.4-11.4z"></path></svg>
                        </button>-->
                        <div class="top-header">
                            <div class="picture-wrapper">
                            <c:if test="${!empty hotelImg.file_url }">
								<div class="header_element--picture" style="background-image: url(${hotelImg.file_url});"></div>
							</c:if>
							<c:if test="${empty hotelImg.file_url }">
								<div class="header_element--picture" style="background-image: url(https://booqueen.s3.ap-northeast-2.amazonaws.com/hotel/default-hotel-img.png);"></div>
							</c:if>
                                
                            </div>
                            <div>
                                <div class="maps_iw__header_element"> 
                                    <div>
                                        <a class="maps_iw__header--link js-map-hotel__link">
                                            ${hotelInfo.hotelname }
                                        </a>
                                        <span class="c-accommodation-classification-rating">
                                            <span class="c-accommodation-classification-rating__badge c-accommodation-classification-rating__badge--stars ">
                                                <span class="bui-rating bui-rating--smaller" role="img" aria-label="3 out of 5">
                                                    <c:set var="star" value="${hotelInfo.star*1}"/>
													<c:forEach begin="1" end="${star }">
													<span aria-hidden="true" class="bui-icon bui-rating__item bui-icon--medium" role="presentation">
                                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" focusable="false" aria-hidden="true" role="img">
                                                            <path d="M23.555,8.729a1.505,1.505,0,0,0-1.406-.98H16.062a.5.5,0,0,1-.472-.334L13.405,1.222a1.5,1.5,0,0,0-2.81,0l-.005.016L8.41,7.415a.5.5,0,0,1-.471.334H1.85A1.5,1.5,0,0,0,.887,10.4l5.184,4.3a.5.5,0,0,1,.155.543L4.048,21.774a1.5,1.5,0,0,0,2.31,1.684l5.346-3.92a.5.5,0,0,1,.591,0l5.344,3.919a1.5,1.5,0,0,0,2.312-1.683l-2.178-6.535a.5.5,0,0,1,.155-.543l5.194-4.306A1.5,1.5,0,0,0,23.555,8.729Z"></path>
                                                        </svg>
                                                    </span>
													</c:forEach>
                                                </span>
                                            </span>
                                        </span>
                                    </div>
<!--                                    <div class="maps_iw__header_wishlist_heart js-wishlist-container">
                                        <button type="button" data-hotel-id="5663963" data-ga-label="small" data-sr-comparison-mode="true" class="map_wishlist-heart-button js-wl-dropdown-handle wl_improvement " role="button" aria-live="assertive">
                                            <svg aria-hidden="true" focusable="false" role="presentation" size="large" width="17" height="17" viewBox="0 0 24 24" class="bk-icon -streamline-heart_outline"><path d="M12.541 21.325l-9.588-10a4.923 4.923 0 1 1 6.95-6.976l1.567 1.566a.75.75 0 0 0 1.06 0l1.566-1.566a4.923 4.923 0 0 1 6.963 6.962l-9.6 10.014h1.082zm-1.082 1.038a.75.75 0 0 0 1.082 0l9.59-10.003a6.418 6.418 0 0 0-.012-9.07 6.423 6.423 0 0 0-9.083-.001L11.47 4.854h1.06l-1.566-1.566a6.423 6.423 0 1 0-9.082 9.086l9.577 9.99z"></path></svg>
                                        </button>
                                    </div> -->
                                </div>
                                <div class="detail-bottom">
                                    <div class="score-box">
                                        ${reviewAvg.scoreAvg}
                                    </div>
                                    <div class="review-row">
                                        <c:choose>
							                <c:when test="${reviewAvg.scoreAvg >= 9}"><div>최고</div></c:when>
											<c:when test="${reviewAvg.scoreAvg >= 8}"><div>매우 좋음</div></c:when>
											<c:when test="${reviewAvg.scoreAvg >= 7}"><div>좋음</div></c:when>
											<c:when test="${reviewAvg.scoreAvg >= 6}"><div>만족</div></c:when>
											<c:when test="${reviewAvg.scoreAvg < 6}"><div>보통</div></c:when>
							           </c:choose>     
                                        <div><c:if test="${reviewAvg.scoreAvg == 0.0 }">
						                		0
						                	</c:if>
						                	<c:if test="${reviewAvg.scoreAvg != 0.0}">
						                		${fn:length(reviewList)}
						                	</c:if>
              								개 이용 후기</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="maps_iw__price_container">
                            <div class="
                                txp-map-cta-contain txp-map-cta-contain__extend">
                                <a href="#booking-table" class="txp-map-cta" onclick="off()">
                                    <span class="bui-button__text2">호텔 요금 확인하기</span>
                                    <span class="bui-button__icon">
                                        <svg class="txp-btn-arr" fill="#FFFFFF" height="16" width="16" viewBox="0 0 128 128"><path d="M48 104a8 8 0 0 1-5.7-13.7L68.7 64 42.3 37.7a8 8 0 0 1 11.4-11.4L91.3 64l-37.6 37.7A8 8 0 0 1 48 104z"></path></svg>
                                    </span>
                                </a>
                            </div>
                        </div>   
                        <div class="maps_iw__address maps_iw_text_style__light">
                            ${hotelInfo.city}, ${hotelInfo.address1}
                        </div>
                    </div>
                    <div class="info-bottom">
                        <div class="maps_iw__container_scroll_block">
                            <div class="maps_iw_landmarks__container">
                                <div class="maps_iw_landmarks__header">
                                    인기 명소
                                </div>
                                <ul class="maps_iw_landmarks__list-container">
                                   <c:forEach var="distanceVO" items="${distanceVO }" begin="1" end="5">
				                   <li class="maps_iw_landmarks__list-item">
                                            <div class="maps_iw_landmarks__landmark">
                                               ${distanceVO.name }
                                            </div>
                                            <div class="maps_iw_landmarks__distance">
                                                <fmt:formatNumber value="${distanceVO.distance }" pattern="0.0"/> km
                                            </div>
                                    </li>
				                   </c:forEach>  
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    
    <div class="modal-mask" id="modalMask" >
		<div class="modal-detail" id="modalDetail">
		
		<div class="modal-container">
			<span class="modal-close" id="modalClose" onclick="off_hotelroom()">×</span>	

		<div class="modal-wrapper">
			<div class="modal-container-top">
				<div id="hotel-slides"></div>
				
				
				<a class="prev" onclick="plusSlides(-1)">❮</a>
  				<a class="next" onclick="plusSlides(1)">❯</a>

				<div class="image-list">
					<div id="hotel-image"></div>
					
				</div>
			</div>


			<div class="modal-container-bottom" style="display: none;">
				<div class="room-info room-info-first">
					<h1 class="room-name">스탠다드 더블룸</h1>
					<div class="room-facility">
						<span>
							<svg class="bk-icon -streamline-room_size" fill="" size="medium" width="16" height="16" viewBox="0 0 24 24"><path d="M3.75 23.25V7.5a.75.75 0 0 0-1.5 0v15.75a.75.75 0 0 0 1.5 0zM.22 21.53l2.25 2.25a.75.75 0 0 0 1.06 0l2.25-2.25a.75.75 0 1 0-1.06-1.06l-2.25 2.25h1.06l-2.25-2.25a.75.75 0 0 0-1.06 1.06zM5.78 9.22L3.53 6.97a.75.75 0 0 0-1.06 0L.22 9.22a.75.75 0 1 0 1.06 1.06l2.25-2.25H2.47l2.25 2.25a.75.75 0 1 0 1.06-1.06zM7.5 3.75h15.75a.75.75 0 0 0 0-1.5H7.5a.75.75 0 0 0 0 1.5zM9.22.22L6.97 2.47a.75.75 0 0 0 0 1.06l2.25 2.25a.75.75 0 1 0 1.06-1.06L8.03 2.47v1.06l2.25-2.25A.75.75 0 1 0 9.22.22zm12.31 5.56l2.25-2.25a.75.75 0 0 0 0-1.06L21.53.22a.75.75 0 1 0-1.06 1.06l2.25 2.25V2.47l-2.25 2.25a.75.75 0 0 0 1.06 1.06zM10.5 13.05v7.2a2.25 2.25 0 0 0 2.25 2.25h6A2.25 2.25 0 0 0 21 20.25v-7.2a.75.75 0 0 0-1.5 0v7.2a.75.75 0 0 1-.75.75h-6a.75.75 0 0 1-.75-.75v-7.2a.75.75 0 0 0-1.5 0zm13.252 2.143l-6.497-5.85a2.25 2.25 0 0 0-3.01 0l-6.497 5.85a.75.75 0 0 0 1.004 1.114l6.497-5.85a.75.75 0 0 1 1.002 0l6.497 5.85a.75.75 0 0 0 1.004-1.114z"></path></svg>
							23 제곱미터
						</span>
					</div>
					<div class="room-facility">
						<span>
							<svg class="bk-icon -streamline-city" fill="" size="medium" width="16" height="16" viewBox="0 0 24 24"><path d="M2.75 6h9.5a.25.25 0 0 1-.25-.25v17.5l.75-.75H2.25l.75.75V5.75a.25.25 0 0 1-.25.25zm0-1.5c-.69 0-1.25.56-1.25 1.25v17.5c0 .414.336.75.75.75h10.5a.75.75 0 0 0 .75-.75V5.75c0-.69-.56-1.25-1.25-1.25h-9.5zm3-1.5h3.5A.25.25 0 0 1 9 2.75v2.5l.75-.75h-4.5l.75.75v-2.5a.25.25 0 0 1-.25.25zm0-1.5c-.69 0-1.25.56-1.25 1.25v2.5c0 .414.336.75.75.75h4.5a.75.75 0 0 0 .75-.75v-2.5c0-.69-.56-1.25-1.25-1.25h-3.5zM5.25 9h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zM7.5.75v1.5a.75.75 0 0 0 1.5 0V.75a.75.75 0 0 0-1.5 0zM15.75 24h6a.75.75 0 0 0 .75-.75V10.5A1.5 1.5 0 0 0 21 9h-4.5a1.5 1.5 0 0 0-1.5 1.5v12.75a.75.75 0 0 0 1.5 0V10.5H21v12.75l.75-.75h-6a.75.75 0 0 0 0 1.5zM19.5 8.25v1.5a.75.75 0 0 0 1.5 0v-1.5a.75.75 0 0 0-1.5 0zM.75 24h22.5a.75.75 0 0 0 0-1.5H.75a.75.75 0 0 0 0 1.5z"></path></svg>
							도시 전망
						</span>
					</div>
					<div class="room-facility">
						<span>
							<svg class="bk-icon -streamline-weather_snowflake" fill="" size="medium" width="16" height="16" viewBox="0 0 24 24"><path d="M11.25.75v7.5a.75.75 0 0 0 1.5 0V.75a.75.75 0 0 0-1.5 0zm4.031.914l-3.75 3h.938l-3.75-3a.75.75 0 1 0-.938 1.172l3.75 3a.75.75 0 0 0 .938 0l3.75-3a.75.75 0 1 0-.938-1.172zM1.883 7.024l6.495 3.75a.75.75 0 0 0 .75-1.299l-6.495-3.75a.75.75 0 1 0-.75 1.3zM4.69 3.99l.723 4.748.468-.812-4.473 1.748a.75.75 0 0 0 .546 1.398l4.473-1.748a.75.75 0 0 0 .468-.812l-.723-4.748a.75.75 0 1 0-1.482.226zM2.632 18.274l6.495-3.75a.75.75 0 1 0-.75-1.298l-6.495 3.75a.75.75 0 1 0 .75 1.299zm-1.224-3.948l4.473 1.748-.468-.812-.723 4.748a.75.75 0 0 0 1.482.226l.723-4.748a.75.75 0 0 0-.468-.812l-4.473-1.748a.75.75 0 0 0-.546 1.398zM12.75 23.25v-7.5a.75.75 0 0 0-1.5 0v7.5a.75.75 0 0 0 1.5 0zm-4.031-.914l3.75-3h-.938l3.75 3a.75.75 0 0 0 .937-1.172l-3.75-3a.75.75 0 0 0-.937 0l-3.75 3a.75.75 0 0 0 .938 1.172zm13.399-5.36l-6.495-3.75a.75.75 0 0 0-.75 1.298l6.495 3.75a.75.75 0 0 0 .75-1.299zm-2.807 3.034l-.724-4.748-.468.812 4.473-1.748a.75.75 0 0 0-.546-1.398l-4.473 1.748a.75.75 0 0 0-.468.812l.723 4.748a.75.75 0 0 0 1.483-.226zm2.057-14.285l-6.495 3.75a.75.75 0 0 0 .75 1.3l6.495-3.75a.75.75 0 0 0-.75-1.3zm1.224 3.95l-4.473-1.749.468.812.724-4.748a.75.75 0 0 0-1.483-.226l-.723 4.748a.75.75 0 0 0 .468.812l4.473 1.748a.75.75 0 0 0 .546-1.398zM11.625 7.6L8.377 9.475a.75.75 0 0 0-.375.65v3.75a.75.75 0 0 0 .375.65l3.248 1.874a.75.75 0 0 0 .75 0l3.248-1.875a.75.75 0 0 0 .375-.649v-3.75a.75.75 0 0 0-.375-.65L12.375 7.6a.75.75 0 0 0-.75 0zm.75 1.3h-.75l3.248 1.874-.375-.649v3.75l.375-.65-3.248 1.876h.75l-3.248-1.876.375.65v-3.75l-.375.65L12.375 8.9z"></path></svg>
							에어컨
						</span>
					</div>
					<div class="room-facility">
						<span>
							<svg class="bk-icon -streamline-shower" fill="" size="medium" width="16" height="16" viewBox="0 0 24 24"><path d="M15.375 10.875a1.875 1.875 0 1 1-3.75 0 1.875 1.875 0 0 1 3.75 0zm1.5 0a3.375 3.375 0 1 0-6.75 0 3.375 3.375 0 0 0 6.75 0zm.375 12.375V18.7l-.667.745C20.748 18.98 24 15.925 24 10.5a2.25 2.25 0 0 0-4.5 0c0 1.945-.609 3.154-1.64 3.848a3.973 3.973 0 0 1-2.132.652H9a3.75 3.75 0 1 0 0 7.5h3a2.25 2.25 0 0 0 0-4.5H9a.75.75 0 0 0 0 1.5h3a.75.75 0 0 1 0 1.5H9a2.25 2.25 0 0 1 0-4.5h6.74a5.426 5.426 0 0 0 2.957-.908C20.154 14.613 21 12.932 21 10.5a.75.75 0 0 1 1.5 0c0 4.6-2.628 7.069-6.083 7.455a.75.75 0 0 0-.667.745v4.55a.75.75 0 0 0 1.5 0zm-7.5-1.5v1.5a.75.75 0 0 0 1.5 0v-1.5a.75.75 0 0 0-1.5 0zM.75 1.5h1.5l-.53-.22 1.402 1.402a.75.75 0 0 0 1.06-1.06L2.78.22A.75.75 0 0 0 2.25 0H.75a.75.75 0 1 0 0 1.5zm2.983 3.754a.01.01 0 0 1 .016.002c-.542-1.072-.1-2.426 1.008-2.988a2.25 2.25 0 0 1 2.037 0c-.041-.022-.043-.029-.04-.034l.002-.002-3.013 3.012zm1.07 1.05l3.002-3A1.489 1.489 0 0 0 7.51.951 3.766 3.766 0 0 0 4.079.929 3.75 3.75 0 0 0 2.43 5.971a1.49 1.49 0 0 0 2.382.323zm3.408-.968l1.116.62a.75.75 0 1 0 .728-1.312l-1.116-.62a.75.75 0 1 0-.728 1.312zm1.964-2.233l1.615.44a.75.75 0 1 0 .394-1.448l-1.615-.44a.75.75 0 1 0-.394 1.448zm4.217 1.15l1.615.44a.75.75 0 0 0 .396-1.447l-1.615-.44a.75.75 0 0 0-.396 1.447zM5.697 7.388l.577 1.038a.75.75 0 1 0 1.312-.728L7.009 6.66a.75.75 0 1 0-1.312.728zM3.284 8.94l.44 1.615a.75.75 0 1 0 1.448-.394l-.44-1.615a.75.75 0 1 0-1.448.394zm1.15 4.219l.246.896a.75.75 0 1 0 1.446-.396l-.245-.896a.75.75 0 1 0-1.446.396z"></path></svg>
							객실 내 전용 욕실
						</span>
					</div>
					<div class="room-facility">
						<span>
							<svg class="bk-icon -streamline-tv_flat_screen" fill="" size="medium" width="16" height="16" viewBox="0 0 24 24"><path d="M22.5 10.375v6.5a.25.25 0 0 1-.25.25H1.75a.25.25 0 0 1-.25-.25v-13a.25.25 0 0 1 .25-.25h20.5a.25.25 0 0 1 .25.25v6.5zm1.5 0v-6.5a1.75 1.75 0 0 0-1.75-1.75H1.75A1.75 1.75 0 0 0 0 3.875v13c0 .966.784 1.75 1.75 1.75h20.5a1.75 1.75 0 0 0 1.75-1.75v-6.5zm-16.5 12h9a.75.75 0 0 0 0-1.5h-9a.75.75 0 0 0 0 1.5zm3.75-4.5v3.75a.75.75 0 0 0 1.5 0v-3.75a.75.75 0 0 0-1.5 0z"></path></svg>
							평면 TV
						</span>
					</div>
					<div class="room-facility">
						<span>
							<svg class="bk-icon -streamline-wifi" fill="" size="medium" width="16" height="16" viewBox="0 0 24 24"><path d="M14.25 18.75a2.25 2.25 0 1 1-4.5 0 2.25 2.25 0 0 1 4.5 0zm1.5 0a3.75 3.75 0 1 0-7.5 0 3.75 3.75 0 0 0 7.5 0zm2.08-5.833a8.25 8.25 0 0 0-11.666 0 .75.75 0 0 0 1.06 1.06 6.75 6.75 0 0 1 9.546 0 .75.75 0 0 0 1.06-1.06zm3.185-3.182c-4.979-4.98-13.051-4.98-18.03 0a.75.75 0 1 0 1.06 1.06c4.394-4.393 11.516-4.393 15.91 0a.75.75 0 1 0 1.06-1.06zm2.746-3.603C17.136-.043 6.864-.043.24 6.132A.75.75 0 1 0 1.26 7.23c6.05-5.638 15.429-5.638 21.478 0a.75.75 0 0 0 1.022-1.098z"></path></svg>
							무료 Wi-Fi
						</span>
					</div>
					<div class="room-facility">
						<span>
							<svg class="bk-icon -streamline-parking_sign_paid" fill="" size="medium" width="16" height="16" viewBox="0 0 128 128"><path d="M127.75 55.27C122.884 20.221 90.527-4.247 55.478.62 20.43 5.484-4.039 37.841.828 72.89 4.996 102.925 29.648 125.923 59.9 128h.28a4.002 4.002 0 1 0 .27-8C29.556 117.884 6.226 91.124 8.342 60.23 10.458 29.336 37.22 6.006 68.112 8.122 94.594 9.936 116.175 30.07 119.82 56.36a4.003 4.003 0 0 0 7.93-1.1zM68.28 38.71h-12a4 4 0 0 0-4 4v48.06a4 4 0 0 0 8 0v-20h8c8.837 0 16-7.163 16-16s-7.163-16-16-16zm0 24h-8v-16h8a8 8 0 1 1 0 16zm36.04 29.39h8a4 4 0 0 0 0-8h-4v-4a4 4 0 0 0-8 0v4a8 8 0 0 0-8 8c0 6.48 5.91 9.43 10.22 11.59 3.4 1.7 5.8 3 5.8 4.43h-12a4 4 0 0 0 0 8h4v4a4 4 0 0 0 8 0v-4a8 8 0 0 0 8-8c0-6.48-5.91-9.43-10.22-11.59-3.39-1.69-5.8-3-5.79-4.43h4z"></path></svg>
							주차(유료)
						</span>
					</div>
				</div>
				
				<div class="room-info">
					<div class="room-name">객실 크기 <span>23 m²</span></div>
					<div class="roomtype">더블침대 1개</div>
					<div class="bed-review">침대가 편안함 (후기 평점: 8.3) – 308개 후기 기반</div>
					<p class="room-description">이 더블룸에는 에어컨과 목욕 가운이 마련되어 있습니다.</p>
				</div>

				<div class="room-info">
					<div class="roomdiv">
						<div class="roomdiv-inner">
							<div class="room-inner">
								<div class="room-filter">전용욕실:</div>
								<div class="more-facilities">
										<div class="room-facilities">
										<span class="facility-text">
											<svg class="bk-icon -streamline-checkmark" fill="" size="small" width="14" height="14" viewBox="0 0 128 128"><path d="M56.33 100a4 4 0 0 1-2.82-1.16L20.68 66.12a4 4 0 1 1 5.64-5.65l29.57 29.46 45.42-60.33a4 4 0 1 1 6.38 4.8l-48.17 64a4 4 0 0 1-2.91 1.6z"></path></svg>
											무료 세면도구
										</span>
									</div>
									<div class="room-facilities">
										<span class="facility-text">
											<svg class="bk-icon -streamline-checkmark" fill="" size="small" width="14" height="14" viewBox="0 0 128 128"><path d="M56.33 100a4 4 0 0 1-2.82-1.16L20.68 66.12a4 4 0 1 1 5.64-5.65l29.57 29.46 45.42-60.33a4 4 0 1 1 6.38 4.8l-48.17 64a4 4 0 0 1-2.91 1.6z"></path></svg>
											무료 세면도구
										</span>
									</div>
									<div class="room-facilities">
										<span class="facility-text">
											<svg class="bk-icon -streamline-checkmark" fill="" size="small" width="14" height="14" viewBox="0 0 128 128"><path d="M56.33 100a4 4 0 0 1-2.82-1.16L20.68 66.12a4 4 0 1 1 5.64-5.65l29.57 29.46 45.42-60.33a4 4 0 1 1 6.38 4.8l-48.17 64a4 4 0 0 1-2.91 1.6z"></path></svg>
											무료 세면도구
										</span>
									</div>
								</div>
							</div>
								
							<div class="room-inner">
								<div class="room-filter">전망:</div>
								<div class="room-facilities">
									<span class="facility-text">
										<svg class="bk-icon -streamline-checkmark" fill="" size="small" width="14" height="14" viewBox="0 0 128 128"><path d="M56.33 100a4 4 0 0 1-2.82-1.16L20.68 66.12a4 4 0 1 1 5.64-5.65l29.57 29.46 45.42-60.33a4 4 0 1 1 6.38 4.8l-48.17 64a4 4 0 0 1-2.91 1.6z"></path></svg>
										도시 전망
									</span>
								</div>
							</div>
						</div>
						<div class="roomdiv-inner">
							<div class="room-inner">
								<div class="room-filter">객실 시설:</div>
								<div class="more-facilities">
									<div class="room-facilities">
									<span class="facility-text">
										<svg class="bk-icon -streamline-checkmark" fill="" size="small" width="14" height="14" viewBox="0 0 128 128"><path d="M56.33 100a4 4 0 0 1-2.82-1.16L20.68 66.12a4 4 0 1 1 5.64-5.65l29.57 29.46 45.42-60.33a4 4 0 1 1 6.38 4.8l-48.17 64a4 4 0 0 1-2.91 1.6z"></path></svg>
										옷장
									</span>
									</div>
									<div class="room-facilities">
										<span class="facility-text">
											<svg class="bk-icon -streamline-checkmark" fill="" size="small" width="14" height="14" viewBox="0 0 128 128"><path d="M56.33 100a4 4 0 0 1-2.82-1.16L20.68 66.12a4 4 0 1 1 5.64-5.65l29.57 29.46 45.42-60.33a4 4 0 1 1 6.38 4.8l-48.17 64a4 4 0 0 1-2.91 1.6z"></path></svg>
											에어컨
										</span>
									</div>
									<div class="room-facilities">
										<span class="facility-text">
											<svg class="bk-icon -streamline-checkmark" fill="" size="small" width="14" height="14" viewBox="0 0 128 128"><path d="M56.33 100a4 4 0 0 1-2.82-1.16L20.68 66.12a4 4 0 1 1 5.64-5.65l29.57 29.46 45.42-60.33a4 4 0 1 1 6.38 4.8l-48.17 64a4 4 0 0 1-2.91 1.6z"></path></svg>
											안전 금고
										</span>
									</div>
								</div>
							</div>
							<div class="room-inner">
								<div class="room-filter">흡연 가능 여부: </div><span>금연</span>
							</div>
						</div>	
						<div class="room-inner room-inner-last">
							<div class="room-filter">주차: </div><span>호텔 내 (사전 예약 불필요) 공영 주차장이 숙박당 ₩5,000(으)로 이용 가능합니다.</span>
						</div>	
					</div> <!-- roomdiv -->
				</div> <!-- room-info -->
			</div> <!-- modal-container-bottom -->
			</div>
			<div class="lightbox-book" style="display: none;">
				<div class="lightbox-book-top">
					<div class="lightbox-book-conditions">
						<div class="lightbox-title">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16"><path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/></svg>
							<strong>스탠다드 더블룸</strong>
						</div>
						<div class="lightbox-list">
							<div class="lightbox-item green-item">
								<svg class="bk-icon -streamline-checkmark_fill" fill="#008009" height="16" width="16" viewBox="0 0 128 128" role="presentation" aria-hidden="true" focusable="false"><path d="M56.33 102a6 6 0 0 1-4.24-1.75L19.27 67.54A6.014 6.014 0 1 1 27.74 59l27.94 27.88 44-58.49a6 6 0 1 1 9.58 7.22l-48.17 64a5.998 5.998 0 0 1-4.34 2.39z"></path></svg>
								<span>무료 취소 (2022년 3월 14일 PM 11:59까지)</span>
							</div>
							<div class="lightbox-item">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#262626" class="bi bi-dot" viewBox="0 0 16 16"><path d="M8 9.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/></svg>
								<span>선결제</span>
							</div>
						</div>
						<div class="roomtype-bed">더블침대 1개</div>
					</div>
					
					<div class="lightbox-book-price">
						<strong class="green-condition">총 ₩192,139 (3박 요금)</strong>
					</div>
				</div>

					<div class="lightbox-book-button">
						<a href="#" class="lightbox-reserve-button">지금예약</a>
					</div>

					<div class="lightbox-cta-ticker">
						<div class="lightbox-cta-ticker-item">단 2분이면 예약 완료</div>
						<div class="lightbox-cta-ticker-item">즉시 예약 확정</div>
						<div class="lightbox-cta-ticker-item">예약 수수료, 신용카드 수수료 없음!</div>
					</div>
			</div>
		</div>
		</div>
	</div>
	
	<div class="review-list" id="reviewPanel">
		<div class="review-list-panel">
			<div class="review-list-panel-close" id="reviewClose">
				<span>x</span>
			</div>

			<div class="review-list-panel-content">
				
				<c:choose>
				<c:when test="${!empty reviewList && reviewAvg.scoreAvg != 0.0}">
				<div class="review-list-container">
					
					<div class="review-list-score">
						<div class="review-header-score">
							<button class="write-review">후기쓰기</button>
							<div class="review-total">
								<span class="review-score-badge">${reviewAvg.scoreAvg }</span>
								<span class="review-score-widget">
									
										<c:choose>
										<c:when test="${reviewAvg.scoreAvg >= 9}"><span class="review-score-widget-text">최고</span></c:when>
										<c:when test="${reviewAvg.scoreAvg >= 8}"><span class="review-score-widget-text">매우 좋음</span></c:when>
										<c:when test="${reviewAvg.scoreAvg >= 7}"><span class="review-score-widget-text">좋음</span></c:when>
										<c:when test="${reviewAvg.scoreAvg >= 6}"><span class="review-score-widget-text">만족</span></c:when>
										<c:when test="${reviewAvg.scoreAvg < 6}"><span class="review-score-widget-text">보통</span></c:when>
										</c:choose>	
									
									<span class="review-score-widget-subtext">${fn:length(reviewList)}개 이용 후기</span>
								</span>
							</div>
						</div>
						<div class="review-score-detail">
							<div class="review-score-header">
								<span class="review-heading">항목별 점수</span>
							</div>
							<div class="review-score-container">
								<div class="review-subscore">
									<span class="scorebar-title">직원 친절도</span>
									<span class="scorebar-score" >${reviewAvg.staffAvg }</span>
									<div class="scorebar-bar">
										<span class="scorebar-value" id="staff2"></span>
									</div>
								</div>
								<div class="review-subscore">
									<span class="scorebar-title">서비스</span>
									<span class="scorebar-score" >${reviewAvg.serviceAvg }</span>
									<div class="scorebar-bar">
										<span class="scorebar-value" id="service2"></span>
									</div>								</div>
								<div class="review-subscore">
									<span class="scorebar-title">청결도</span>
									<span class="scorebar-score" >${reviewAvg.cleannessAvg }</span>
									<div class="scorebar-bar">
										<span class="scorebar-value" id="cleanness2"></span>
									</div>
								</div>
								<div class="review-subscore">
									<span class="scorebar-title">편안함</span>
									<span class="scorebar-score" >${reviewAvg.comfortAvg }</span>
									<div class="scorebar-bar">
										<span class="scorebar-value" id="comfort2"></span>
									</div>
								</div>
								<div class="review-subscore">
									<span class="scorebar-title">가성비</span>
									<span class="scorebar-score" >${reviewAvg.effectivenessAvg }</span>
									<div class="scorebar-bar">
										<span class="scorebar-value" id="effectiveness2"></span>
									</div>
								</div>
								<div class="review-subscore">
									<span class="scorebar-title">위치</span>
									<span class="scorebar-score">${reviewAvg.placeAvg }</span>
									<div class="scorebar-bar">
										<span class="scorebar-value" id="place2"></span>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 이용후기 -->
					<div class="review-list-page">
						<div class="reviewlist-header">
							<span class="review-heading">이용후기</span>
							<span class="review-array">
								<label class="review-array-label" for="">정렬 기준:</label>
								<span class="review-array-select">
									<select name="" id="" class="review-sort">
										<option value="">가장 적합한 후기부터</option>
										<option value="">가장 최근 후기부터</option>
										<option value="">가장 오래된 후기부터</option>
										<option value="">평점이 높은 후기부터</option>
										<option value="">평점이 낮은 후기부터</option>
									</select>
									<svg class="bk-icon -streamline-arrow_menu bui-input-select__icon" height="16" width="16" viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false"><path d="M12 20.09a1.24 1.24 0 0 1-.88-.36L6 14.61a.75.75 0 1 1 1.06-1.06L12 18.49l4.94-4.94A.75.75 0 0 1 18 14.61l-5.12 5.12a1.24 1.24 0 0 1-.88.36zm6-9.46a.75.75 0 0 0 0-1.06l-5.12-5.11a1.24 1.24 0 0 0-1.754-.006l-.006.006L6 9.57a.75.75 0 0 0 0 1.06.74.74 0 0 0 1.06 0L12 5.7l4.94 4.93a.73.73 0 0 0 .53.22c.2 0 .39-.078.53-.22z"></path></svg>
								</span>
							</span>
						</div>
						<div class="reviewlist">
						
						<c:forEach var="reviewProfileList" items="${reviewProfileList }" varStatus="status">
							<!-- 후기 1개 -->
							<div class="reviewlist-item" id="reviewlist-item${status.count }">
								<div class="reviewlist-left">
									<div class="review-guest">
										<div class="review-avatar"><img class="review-box-img" src="data:${reviewProfileList.memberProfileVO.profile_type};base64, ${reviewProfileList.memberProfileVO.profile_data}" ></div>
										<div class="review-avatar-text">
											<span class="avatar-title">${reviewProfileList.reviewVO.username }</span>
											<span class="avatar-subtitle">${reviewProfileList.reviewVO.userid }</span>
										</div>
									</div>
									<div class="review-room-info">
										<a href="#" class="review-room-link">
											<span class="review-icon">
												<svg class="bk-icon -streamline-bed_double" height="16" width="16" fill="#6b6b6b" viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false"><path d="M3.75 11.25V9a.75.75 0 0 1 .75-.75h6a.75.75 0 0 1 .75.75v2.25a.75.75 0 0 0 1.5 0V9a2.25 2.25 0 0 0-2.25-2.25h-6A2.25 2.25 0 0 0 2.25 9v2.25a.75.75 0 0 0 1.5 0zm9 0V9a.75.75 0 0 1 .75-.75h6a.75.75 0 0 1 .75.75v2.25a.75.75 0 0 0 1.5 0V9a2.25 2.25 0 0 0-2.25-2.25h-6A2.25 2.25 0 0 0 11.25 9v2.25a.75.75 0 0 0 1.5 0zm-10 .75h18.5c.69 0 1.25.56 1.25 1.25V18l.75-.75H.75l.75.75v-4.75c0-.69.56-1.25 1.25-1.25zm0-1.5A2.75 2.75 0 0 0 0 13.25V18c0 .414.336.75.75.75h22.5A.75.75 0 0 0 24 18v-4.75a2.75 2.75 0 0 0-2.75-2.75H2.75zM0 18v3a.75.75 0 0 0 1.5 0v-3A.75.75 0 0 0 0 18zm22.5 0v3a.75.75 0 0 0 1.5 0v-3a.75.75 0 0 0-1.5 0zm-.75-6.75V4.5a2.25 2.25 0 0 0-2.25-2.25h-15A2.25 2.25 0 0 0 2.25 4.5v6.75a.75.75 0 0 0 1.5 0V4.5a.75.75 0 0 1 .75-.75h15a.75.75 0 0 1 .75.75v6.75a.75.75 0 0 0 1.5 0z"></path></svg>
											</span>
											<div class="review-text">스탠다드 더블룸 - 욕조</div>
										</a>
									</div>
									<div class="review-booking-date">
										<span class="review-icon">
											<svg class="bk-icon -streamline-calendar" height="16" width="16" fill="#6b6b6b" viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false"><path d="M22.502 13.5v8.25a.75.75 0 0 1-.75.75h-19.5a.75.75 0 0 1-.75-.75V5.25a.75.75 0 0 1 .75-.75h19.5a.75.75 0 0 1 .75.75v8.25zm1.5 0V5.25A2.25 2.25 0 0 0 21.752 3h-19.5a2.25 2.25 0 0 0-2.25 2.25v16.5A2.25 2.25 0 0 0 2.252 24h19.5a2.25 2.25 0 0 0 2.25-2.25V13.5zm-23.25-3h22.5a.75.75 0 0 0 0-1.5H.752a.75.75 0 0 0 0 1.5zM7.502 6V.75a.75.75 0 0 0-1.5 0V6a.75.75 0 0 0 1.5 0zm10.5 0V.75a.75.75 0 0 0-1.5 0V6a.75.75 0 0 0 1.5 0z"></path></svg>
										</span>
										<div class="review-text">1박 · &nbsp;<span class="review-text-date">2022년 2월</span></div>
									</div>
									<div class="review-guest-info">
										<span class="review-icon">
											<svg class="bk-icon -streamline-couple" height="16" width="16" fill="#6b6b6b" viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false"><path d="M8.25 3.75a2.25 2.25 0 1 1-4.5 0 2.25 2.25 0 0 1 4.5 0zm1.5 0a3.75 3.75 0 1 0-7.5 0 3.75 3.75 0 0 0 7.5 0zM12 13.5a6 6 0 0 0-12 0v2.25c0 .414.336.75.75.75H3l-.746-.675.75 7.5A.75.75 0 0 0 3.75 24h4.5a.75.75 0 0 0 .746-.675l.75-7.5L9 16.5h2.25a.75.75 0 0 0 .75-.75V13.5zm-1.5 0v2.25l.75-.75H9a.75.75 0 0 0-.746.675l-.75 7.5.746-.675h-4.5l.746.675-.75-7.5A.75.75 0 0 0 3 15H.75l.75.75V13.5a4.5 4.5 0 1 1 9 0zm9.75-9.75a2.25 2.25 0 1 1-4.5 0 2.25 2.25 0 0 1 4.5 0zm1.5 0a3.75 3.75 0 1 0-7.5 0 3.75 3.75 0 0 0 7.5 0zM13.5 16.5H15l-.746-.675.75 7.5a.75.75 0 0 0 .746.675h4.5a.75.75 0 0 0 .746-.675l.75-7.5L21 16.5h2.25a.75.75 0 0 0 .75-.75V13.5a6 6 0 0 0-11.143-3.086.75.75 0 0 0 1.286.772 4.5 4.5 0 0 1 8.357 2.315v2.249l.75-.75H21a.75.75 0 0 0-.746.675l-.75 7.5.746-.675h-4.5l.746.675-.75-7.5A.75.75 0 0 0 15 15h-1.5a.75.75 0 0 0 0 1.5z"></path></svg>
										</span>
										<div class="review-text">커플 여행객</div>
									</div>
								</div>
								<div class="reviewlist-right">
									<div class="review-row">
										<div class="review-date">후기 작성: ${reviewProfileList.reviewVO.writing }</div>
										<div class="review-grid">
											<div class="grid-left">
												<h3 class="reviewlist-title">${reviewProfileList.reviewVO.title }</h3>
											</div>
											<div class="grid-right">
												<div class="reviewlist-score">
													<div class="reviewlist-score-text">${reviewProfileList.reviewVO.score }</div>
												</div>
											</div>
										</div>
									</div>
									<div class="review-row">
										<div class="review-text-row">
											<p class="review-text-inner">
												<span class="review-prefix">
													<svg class="-iconset-review_great c-review__icon" height="20" width="20" fill="#008009" viewBox="0 0 128 128" role="presentation" aria-hidden="true" focusable="false"><path d="M64 8a56 56 0 1 0 56 56A56 56 0 0 0 64 8zm0 104a48 48 0 1 1 48-48 48 48 0 0 1-48 48zM44 64a8 8 0 1 1 8-8 8 8 0 0 1-8 8zm48-8a8 8 0 1 1-8-8 8 8 0 0 1 8 8zm-4.8 21.6a4 4 0 0 1 .6 3.6A24.3 24.3 0 0 1 64 97c-9.7 0-15.7-4.2-19-7.8a22.7 22.7 0 0 1-4.8-8A4 4 0 0 1 44 76h40a4 4 0 0 1 3.2 1.6z"></path></svg>
												</span>
												<span>&nbsp;·&nbsp;</span>
												<span class="review-body">${reviewProfileList.reviewVO.strength }</span>
											</p>
										</div>
										<div class="review-text-row">
											<p class="review-text-inner">
												<span class="review-prefix">
													<svg class="bk-icon -iconset-review_poor c-review__icon" height="20" width="20" viewBox="0 0 128 128" role="presentation" aria-hidden="true" focusable="false"><path d="M64 8a56 56 0 1 0 56 56A56 56 0 0 0 64 8zm0 104a48 48 0 1 1 48-48 48 48 0 0 1-48 48zM44 64a8 8 0 1 1 8-8 8 8 0 0 1-8 8zm48-8a8 8 0 1 1-8-8 8 8 0 0 1 8 8zm-5.2 30.2a4 4 0 1 1-5.6 5.6c-10.5-10.4-24-10.4-34.4 0a4 4 0 0 1-5.6-5.6c13.6-13.7 32-13.7 45.6 0z"></path></svg>
												</span>
												<span>&nbsp;·&nbsp;</span>
												<span class="review-body">${reviewProfileList.reviewVO.weakness }</span>
											</p>
										</div>
									</div>
								</div>
							</div>
							<!-- 후기 1개 끝-->
							</c:forEach>
						</div>
					</div>
				</div><!--  -->
				</c:when>
				<c:otherwise>
		            <!-- 리뷰 없을 때 -->
		            <div class="review-empty-container">
		               <div class="review-empty-box">
		                  <h3>아직 이용 후기 평점이 없습니다 😭</h3>
		                  <p>정확한 평점 계산을 위해서는 최소 3개의 이용 후기가 필요합니다. 이 숙소를 예약하고 후기를 남기셔서 ${hotelInfo.hotelname } 호텔 평가에 도움을 주세요.</p>
<!-- 		                  <button class="empty-write-review">후기쓰기</button> -->
		               </div>
		            </div>
				</c:otherwise>
				</c:choose>
			</div>
			
			
		</div>
	</div>
	
	<div class="board-list" id="boardPanel">
		<div class="board-list-panel" id="boardClose">
			<div class="board-list-panel-close" id="reviewClose">
				<span>x</span>
			</div>
		
			<div class="board-list-panel-content">
				<div id="question_board2">
		<c:choose>
		<c:when test = "${!empty boardList }">
		 <div class="question2">
	        <h2>궁금하신 점이 있나요?</h2>
	        <p>Q&A에서 더 많은 정보를 찾아보세요. 원하는 정보가 없다면 아래에서 숙소에 직접 질문을 남기세요.</p>
	       	<c:set value="${fn:length(boardList)/2 }" var="boardList_length"/>
            <div class="question-more2">답변이 완료된 게시글: <fmt:formatNumber type="number" maxFractionDigits="0"  value="${boardList_length}" />개</div> <!-- (<fmt:formatNumber type="number" maxFractionDigits="0"  value="${fn:length(boardList)/2}"/>개) -->
	                
	        <div>
	            <div class="question-third2">

	                <div class="question-third-right2">
	                    
	                    <c:forEach var="boardList" items="${boardList }" varStatus="status">
	                    
	                    <c:choose>
	                    <c:when test="${!boardList.partner}">
	                    <div class="question-third-right-row2">
	                        <div class="icon-text">
	                            <i class="bi bi-person"></i>&nbsp;&nbsp;
	                            <div>
	                            <p class="question-inner-text2">${boardList.content}</p>
	                            <span class="board_send_date">${boardList.send_date }</span></div>
	                        </div>
	                    </c:when>
	                    <c:when test="${boardList.partner}">
	                        <div class="icon-text">
	                            <i class="bi bi-chat"></i>&nbsp;&nbsp;
	                            <div>
	                            <p class="question-inner-text2">${boardList.content}</p>
	                        	<span class="board_send_date">${boardList.send_date }</span></div>
	                        </div>
	                        </div>
	                    </c:when>
	                    </c:choose>
                         </c:forEach>
                    </div>
	            </div>
	        </div>
	    </div>
	    </c:when>
	    
    	<c:otherwise>
	    <div class="question-answer">
			<div class="qna-card">
				<div class="qna-icon">
					<svg class="bk-icon -streamline-chat_bubbles" fill="#0071C2" height="36" width="36" viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false"><path d="M24 13.5a6 6 0 0 0-6-6h-3a6 6 0 0 0 0 12h.75l-.53-.22 4.5 4.5a.75.75 0 0 0 1.28-.53v-5.024l-.43.678A5.989 5.989 0 0 0 24 13.502zm-1.5-.002a4.489 4.489 0 0 1-2.57 4.05.75.75 0 0 0-.43.678v5.024l1.28-.53-4.5-4.5a.75.75 0 0 0-.53-.22H15a4.5 4.5 0 1 1 0-9h3a4.5 4.5 0 0 1 4.5 4.5zM6.22 12.22l-3 3 1.28.53v-5.024a.75.75 0 0 0-.43-.678A4.489 4.489 0 0 1 5.998 1.5H9a4.502 4.502 0 0 1 4.313 3.214.75.75 0 0 0 1.438-.428A6.002 6.002 0 0 0 9 0H6a5.988 5.988 0 0 0-2.57 11.404L3 10.726v5.024a.75.75 0 0 0 1.28.53l3-3a.75.75 0 1 0-1.06-1.06z"></path></svg>
				</div>
				<div class="qna-text">
					<h3>숙소 관련 Q&A</h3>
					<div>더 알고 싶은 정보가 있으신가요? 숙소에 질문을 남겨보세요.</div>
				</div>
				<button class="make-question" id="makeQuestion">문의하기</button>
			</div>
		</div>
		</c:otherwise>
		</c:choose>
	</div>
			</div>
		</div>
	</div>
	
	<div id="overlay-review">
		<div class="bui-overlay__content" data-bui-ref="overlay-content"><div class="bui-modal bui-modal--size-large bui-modal--active" id="review-snippet-drawer">
	        <div class="bui-modal__inner">
	            
	            <div class="bui-modal__slot" data-bui-ref="modal-content-wrapper" role="dialog" aria-modal="true">
	            	<button onclick="off_review()" type="button" class="bui-modal__close" aria-label="Close dialog" data-bui-ref="modal-close">
					    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" role="presentation">
					      <path d="M13 12l6.26-6.26a.73.73 0 0 0-1-1L12 11 5.74 4.71a.73.73 0 1 0-1 1L11 12l-6.29 6.26a.73.73 0 0 0 .52 1.24.73.73 0 0 0 .51-.21L12 13l6.26 6.26a.74.74 0 0 0 1 0 .74.74 0 0 0 0-1z"></path>
					    </svg>
					  </button>
				    <div class="bui-drawer__content featured_reviews-modal-content">
					    <div class="c-review-block" itemprop="review" itemscope="" itemtype="http://schema.org/Review">
					        <div itemprop="publisher" itemscope="" itemtype="http://schema.org/Organization">
					            <meta itemprop="name" content="Booking.com B.V.">
					        </div>
					        <div class="bui-grid">
					            <div class="bui-grid__column-3 c-review-block__left">
								    <div class="c-review-block__row c-review-block__guest">
								        <div class="c-guest bui-avatar-block"><div class="c-avatar bui-avatar ">
								        	<img class="bui-avatar__image" src="https://cf.bstatic.com/static/img/identity/profile.svg" data-component="image-fallback" data-fallback-src="https://cf.bstatic.com/static/img/identity/profile.svg" alt="" aria-hidden="true">
								        	</div>
											<div class="bui-avatar-block__text">
								                <span class="bui-avatar-block__title_review">username</span><span class="bui-avatar-block__subtitle">
								                <span class="bui-flag bui-avatar-block__flag">
				                                    <img src="https://cf.bstatic.com/static/img/flags/16/kr.png" alt="">
		                                		</span>userid</span>
			                                </div>
								        </div>
								    </div>
					            </div>
					            <div class="bui-grid__column-9 c-review-block__right">
					                <div class="c-review-block__row">
									        <span class="c-review-block__date">
									            writing
									        </span>
									         <div class="bui-grid">
						                        <div class="recommandation_text">
									            	<h3 lang="ko" class=" c-review-block__title c-review__title--ltr  ">강력 추천</h3>
						                        </div>
						                        <div class="bui-grid__column-2 bui-u-text-right">
						                             <div class="bui-review-score c-score">
						                             	<div class="bui-review-score__badge" aria-label="">score</div>
						                             </div>  
						                        </div>
						                    </div>	
						                </div>
					                    <div class="c-review-block__row">
										    <div class="c-review">
									            <div class="c-review__row">
									                <p class="c-review__inner ">
														<span class="c-review__prefix c-review__prefix--color-green"><svg class="-iconset-review_great c-review__icon" viewBox="0 0 128 128"><path d="M64 8a56 56 0 1 0 56 56A56 56 0 0 0 64 8zm0 104a48 48 0 1 1 48-48 48 48 0 0 1-48 48zM44 64a8 8 0 1 1 8-8 8 8 0 0 1-8 8zm48-8a8 8 0 1 1-8-8 8 8 0 0 1 8 8zm-4.8 21.6a4 4 0 0 1 .6 3.6A24.3 24.3 0 0 1 64 97c-9.7 0-15.7-4.2-19-7.8a22.7 22.7 0 0 1-4.8-8A4 4 0 0 1 44 76h40a4 4 0 0 1 3.2 1.6z"></path></svg>
														<span class="bui-u-sr-only">좋았던 점</span> </span><span aria-hidden="true">&nbsp;·&nbsp;</span>
														<span id="c-review-strenght" class="c-review__body" lang="ko">strength</span>
									                </p>
									            </div>
									            <div class="c-review__row lalala">
									                <p lang="ko" class="c-review__inner ">
														<span class="c-review__prefix">
															<svg class="-iconset-review_poor c-review__icon" viewBox="0 0 128 128">
																<path d="M64 8a56 56 0 1 0 56 56A56 56 0 0 0 64 8zm0 104a48 48 0 1 1 48-48 48 48 0 0 1-48 48zM44 64a8 8 0 1 1 8-8 8 8 0 0 1-8 8zm48-8a8 8 0 1 1-8-8 8 8 0 0 1 8 8zm-5.2 30.2a4 4 0 1 1-5.6 5.6c-10.5-10.4-24-10.4-34.4 0a4 4 0 0 1-5.6-5.6c13.6-13.7 32-13.7 45.6 0z"></path></svg>
																<span class="bui-u-sr-only">아쉬웠던 점</span>
														</span>
														<span aria-hidden="true">&nbsp;·&nbsp;</span>
														<span class="c-review__body" lang="ko">weakness</span>
									                </p>
								           	 	</div>
										    </div>
			                    		</div>
						            </div> 
						        </div> 
						    </div> 
					    </div>
					</div>
					
		        </div>
		    </div>
    	</div>
	</div>
	
	<!-- 문의하기 클릭 시 -->
	<div class="qna-overlay" id="qnaPanel">
		<div class="qna-modal">
			<button class="qna-modal-close" id="qnaClose">
				<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
				</svg>
			</button>
			<div class="qna-modal-content">
				<div class="qna-modal-header">
					<h3>원하는 내용을 찾지 못했나요? 숙소에 대해 궁금한 점을 물어보세요.</h3>
					<div class="qna-form">
						<label for="">여기에 질문을 입력하세요</label>
						<textarea class="qna-textarea" name="" id="qnaTextarea" cols="30" rows="5" placeholder="예: 룸서비스가 제공되나요?"></textarea>
						<div class="question-count-down" id="countDown">남은 글자수 300자</div>
						<div class="question-form-error" id="formError">10~300자 분량으로 자세히 남겨주세요. 질문 내용에 개인 정보가 포함되지 않도록 주의해주시기 바랍니다.</div>
					</div>
				</div>
				<div class="qna-modal-footer">
					<button class="submit-question" id="questionSubmitBtn">질문 전송</button>
					<div class="qna-text">
						고객님의 문의사항은 승인 및 답변이 완료된 후 Booqueen.com상에 공개됩니다.</div>
				</div>
			</div>
		</div>
	</div>

	<script>
	var path = '${contextPath}';
	
	function getParameterByName(name) { 
		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex.exec(location.search); 
		return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " ")); 
	}
	
	$(document).ready(function(){
		var start_date_raw = getParameterByName('start_date');
		var end_date_raw = getParameterByName('end_date');
		var start_date_url = start_date_raw.slice(0, 4) + '-' + start_date_raw.slice(4, 6) + '-' + start_date_raw.slice(6);
		var end_date_url = end_date_raw.slice(0, 4) + '-' + end_date_raw.slice(4, 6) + '-' + end_date_raw.slice(6);
		$('#startdate').val(start_date_url);
		$('#enddate').val(end_date_url);
		
		var startdate = $('#startdate').val().replaceAll('-','');
	    $('#startdateParm').val(startdate);
		
	    var enddate = $('#enddate').val().replaceAll('-','');
	    $('#enddateParm').val(enddate);
	    
		$('#startdate').on('change', function(){
		    var startdate = this.value.replaceAll('-','');
		    $('#startdateParm').val(startdate);
		});
		$('#enddate').on('change', function(){
		    var enddate = this.value.replaceAll('-','');
		    $('#enddateParm').val(enddate);
		});
	});
	
	
	</script>
	<script>
	function disabled_btn(){
// 		alert('로그인 후 예약을 진행해주세요!');
		swal({
// 			   title: "타이틀",
			   text: "로그인 후 예약을 진행해주세요!",
			   icon: "info" //"info,success,warning,error" 중 택1
			});
	}
	function blocked_btn(reason){
// 		alert('죄송합니다.\n\n고객님은 다음과 같은 사유로 해당 호텔을 예약하실 수 없습니다.\n\n사유: ' + reason);
		swal({
			   title: "죄송합니다.",
			   text: '\n\n고객님은 다음과 같은 사유로\n해당 호텔을 예약하실 수 없습니다.\n\n사유: ' + reason,
			   icon: "info" //"info,success,warning,error" 중 택1
			});
	}
	
	$(document).ready(function () {
		$('.see-closer').on("click", more_review);
		$('#reviewClose').click(function() {
			$('#reviewPanel').css("display", "none");
		});
		$('#more-review').click(function(){
			$('#reviewPanel').css("display", "block");
		});
		$('#view-review').click(function(){
			$('#reviewPanel').css("display", "block");
		});
		$('#more_board').click(function(){
			$('.board-list').css('display', 'block');
		});	
		$('#boardClose').click(function(){
			$('.board-list').css('display', 'none');
		});
		$('.change_search_data').click(function(){
			 window.scrollTo(0, 0);
		});
	 });
	 
 	function more_review() {
		var more_strength = $(this).children('.more-strength').val();
		$('#c-review-strenght').html("");
		$('#c-review-strenght').html(more_strength);
	}
    </script>
	
	<script>
	
		const contextPath = '${contextPath}';
		const hotel_latitude = '${hotelInfo.latitude}';
		const hotel_longitude = '${hotelInfo.longitude}';
		const hotel_latitude_plus = '${hotelInfo.latitude+0.00365817254223}';
		const hotel_longitude_plus = '${hotelInfo.longitude-0.0083004425474}';
			
		var MapArray = new Array();
		var positions = [];
		
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(hotel_latitude_plus, hotel_longitude_plus),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);

        var markerPosition = new kakao.maps.LatLng(hotel_latitude, hotel_longitude);

        var imageSrc = contextPath + '/resources/user/images/internet.png', // 마커이미지의 주소입니다    
		    imageSize = new kakao.maps.Size(64, 64), // 마커이미지의 크기입니다
		    imageOption = {offset: new kakao.maps.Point(27, 69)};
			
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		
		
		var city = '${hotelInfo.city}';
		
		function getAttractions(){
			$.ajax({
				method: "POST",
				url: contextPath + "/getAttractions.do",
				data: {city: city},
				dataType: "JSON",
				success: function(data){
					
					$.each(data, function(index, attraction){
						
						var contents = {
								content: '<div>' + attraction.name + '</div>',
								latlng: new kakao.maps.LatLng(attraction.latitude, attraction.longitude) 
						};
						
						MapArray.push(contents);
						
						positions[index] = MapArray[index];
						
				        var imageSrc = contextPath + '/resources/user/images/attractionMaker.png', // 마커이미지의 주소입니다    
						    imageSize = new kakao.maps.Size(36, 36), // 마커이미지의 크기입니다
						    imageOption = {offset: new kakao.maps.Point(27, 69)};
							
						var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
						
						var marker = new kakao.maps.Marker({
							map: map, // 마커를 표시할 지도
							position: positions[index].latlng,
							image: markerImage
						});
						
						var infowindow = new kakao.maps.InfoWindow({
					        content: positions[index].content // 인포윈도우에 표시할 내용
					    });

					    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
					    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
					    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
					    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
					    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
						
					});
				}
			})
		}
		
		var marker = new kakao.maps.Marker({
			map: map, // 마커를 표시할 지도
			position: markerPosition,
			image: markerImage
		});

		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		
// 		marker.setMap(map);
		
		
	</script>
	
   	<script>
   	
       function on() {
    	 getAttractions();
         document.getElementById("overlay").style.display = "block";
         map.relayout();
       }

       function off() {
         document.getElementById("overlay").style.display = "none";
       }
	    function on_hotelroom(type) {
	    	
	    	$.ajax({
	    		url: path + '/selectRoomImgs.do',
	    		method: 'POST',
	    		data: {type: type},
	    		dataType: 'JSON',
	    		success: function(data){
	    			$('#hotel-slides').empty();
	    			$('#hotel-image').empty();
	    			
	    			$.each(data, function(index, room){
	    				var text = '';
	    				text += "<div class='hotel-slides'><img src='";
	    				text += room.file_url;
	    				text += "'></div>";
	    				$('#hotel-slides').append(text);
	    		
	    				var str = '';
	    				str += "<div class='hotel-image'><img class='demo cursor' src='";
	    				str += room.file_url;
	    				str += "' onclick='currentSlide("
    					str += index + 1;
	    				str += ")' ></div>";
	    				$('#hotel-image').append(str);
	    			});
	    			currentSlide(1);
	    		}
	    	});
	    	
	        document.getElementById("modalMask").style.display = "block";
	        document.getElementById("modalDetail").style.display = "block";
	      }
	
	    function off_hotelroom() {
	        document.getElementById("modalMask").style.display = "none";
	     }
	     function on_review() {
	         document.getElementById('overlay-review').style.display = "block";
	       }
	      function off_review() {
	        document.getElementById('overlay-review').style.display = "none";
	      }
      
          
    </script>

	<script>
		var isEmpty = function(value){ 
			if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ 
				return true 
			} else { 
				return false 
			}
		};
	
	 	$(document).ready(function () {
	
	 		var a = '${wishlistVO2}'
	 		if(!isEmpty(a) && a !== 'wishlistVO2'){
	 			$("#mySnackbar").children("i").removeClass("bi-heart");
	 			$("#mySnackbar").children("i").addClass("bi-heart-fill");
	 		}
	 	});
	</script>

	<script>
		// progressbar
    	var staff_score = document.getElementById('staff_span').textContent;
    	var service_score = document.getElementById('service_span').textContent;
    	var cleanness_score = document.getElementById('cleanness_span').textContent;
    	var comfort_score = document.getElementById('comfort_span').textContent;
    	var effectiveness_score = document.getElementById('effectiveness_span').textContent;
    	var place_score = document.getElementById('place_span').textContent;
    	   	
    	 $(document).ready(function () {
             $(function () {
            	 $('#staff').css("width", staff_score*10+"%");
            	 $('#service').css("width", service_score*10+"%"); 
            	 $('#cleanness').css("width", cleanness_score*10+"%"); 
            	 $('#comfort').css("width", comfort_score*10+"%"); 
            	 $('#effectiveness').css("width", effectiveness_score*10+"%"); 
            	 $('#place').css("width", place_score*10+"%");
            	 $('#staff2').css("width", staff_score*10+"%");
            	 $('#service2').css("width", service_score*10+"%"); 
            	 $('#cleanness2').css("width", cleanness_score*10+"%"); 
            	 $('#comfort2').css("width", comfort_score*10+"%"); 
            	 $('#effectiveness2').css("width", effectiveness_score*10+"%"); 
            	 $('#place2').css("width", place_score*10+"%"); 
             });
    	 });
    </script>
    
    <script>
        // mySnackbar
        var x = document.getElementById("snackbar");
		var fsave = document.getElementById("fsave");
        
        function mySnackbar() {
            if($("#fheart").hasClass("bi-heart-fill")){
                x.innerHTML = "";
                x.innerHTML = "위시리스트에서 제거되었습니다.";
                fsave.innerHTML = "";
                fsave.innerHTML = "이 숙소 저장하기";
                x.className = "show";
                setTimeout(function(){ x.className = x.className.replace("show", ""); }, 2000);
            } else{
                x.innerHTML = "";
                x.innerHTML = "위시리스트에서 추가되었습니다.";
                fsave.innerHTML = "";
                fsave.innerHTML = "저장됨!";
                x.className = "show";
                setTimeout(function(){ x.className = x.className.replace("show", ""); }, 2000);
            }
        }

        $(document).ready(function(){
        	
        	if($("#fsave").siblings().hasClass("bi-heart-fill")){
        		$("#fsave").text("저장됨!");
        	} else {
        		$("#fsave").text("이 숙소 저장하기");
        	}
        	
            $("#mySnackbar").click(function(){
                if($(this).children("i").hasClass("bi-heart")){
                    $(this).children("i").removeClass("bi-heart");
                    $(this).children("i").addClass("bi-heart-fill");
                } else {
                    $(this).children("i").removeClass("bi-heart-fill");
                    $(this).children("i").addClass("bi-heart");
                }
            });
        });

    </script>
    
    <script>
    $(function(){
    	$("#mySnackbar").on("click", wishlist);
    })
    
        function wishlist(){
            var userid = '${member.userid}' //$("#userid_wishlist").text().trim();
            var serialnumber = '${hotelInfo.serialnumber }' //$("#serialnumber_hidden").val();
            var hotelname = '${hotelInfo.hotelname }' //$("#hotelname").text();
            var address1 = '${hotelInfo.address1 }' // $("#address1").text();
            var address2 = '${hotelInfo.address2 }' // $("#address2").text();
            var star = '${hotelInfo.star }' // 4;
            var hotelimgpath = $(".hotel_img_path").attr('src');
            var score = '${hotelInfo.star }' // $("#score").text()*1;
            var city = '${hotelInfo.city }' // $("#city").text();
            var reviewcount = $("#reviewcount").text().trim();

            var sendData = {"userid" : userid,
                            "serialnumber" : serialnumber,
                            "hotelname" : hotelname}
                            
            			/*	"address1" : address1,
                            "address2" : address2,
                            "star" : star,
                            "hotelimgpath" : hotelimgpath,
                            "score" : score,
                            "city" : city,
                            "reviewcount" : reviewcount */
           	
            if(userid != ''){
            	$.ajax({
                    method : "POST",
                    url : path + "/wishlist.do",
                    data : sendData,
                    success : function(resp){
                    
                    }
                })
            } else {
//             	alert("로그인을 하시면 저장된 위시리스트를 활용하실 수 있어요!");
            	swal({
//      			   title: "죄송합니다.",
     			   text: "로그인을 하시면 저장된 위시리스트를 활용하실 수 있어요!",
     			   icon: "info" //"info,success,warning,error" 중 택1
     			});
            } 
        }
    </script>
    <script>
    jQuery(document).ready(function() {
   
    	var mover = setInterval(function () {
            moveRight();
        }, 3000);

        $('#slider').mouseover(function(){
            clearInterval(mover);
        });

        $('#slider').mouseout(function(){
            mover = setInterval(function () {
                moveRight();
            }, 3000);
        });
      
        var slideCount = $('#slider ul li').length;
        var slideWidth = $('#slider ul li').width();
        var slideHeight = $('#slider ul li').height();
        var sliderUlWidth = slideCount * slideWidth;

        $('#slider').css({ width: slideWidth, height: slideHeight });

        $('#slider ul').css({ width: sliderUlWidth, marginLeft: - slideWidth });

        $('#slider ul li:last-child').prependTo('#slider ul');

        function moveLeft() {
            $('#slider ul').animate({
                left: + slideWidth
            }, 200, function () {
                $('#slider ul li:last-child').prependTo('#slider ul');
                $('#slider ul').css('left', '');
            });
        };

        function moveRight() {
            $('#slider ul').animate({
                left: - slideWidth
            }, 200, function () {
                $('#slider ul li:first-child').appendTo('#slider ul');
                $('#slider ul').css('left', '');
            });
        };

        $('a.control_prev').click(function () {
            moveLeft();
        });

        $('a.control_next').click(function () {
            moveRight();
        });

    });
	</script>
	<script>
		// hotel room viewer
		var slideIndex = 1;
		showSlides(slideIndex);
		
		function plusSlides(n) {
			showSlides(slideIndex += n);
		}
		
		function currentSlide(n) {
			showSlides(slideIndex = n);
		}
		
		function showSlides(n) {
			var i;
			var slides = document.getElementsByClassName("hotel-slides");
			var dots = document.getElementsByClassName("demo");
			// var captionText = document.getElementById("caption");
			if (n > slides.length) {slideIndex = 1}
			if (n < 1) {slideIndex = slides.length}
			for (i = 0; i < slides.length; i++) {
					slides[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
					dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex-1].style.display = "block";
			dots[slideIndex-1].className += " active";
		// 	captionText.innerHTML = dots[slideIndex-1].alt;
		}

		$('#modalClose').click(function() {
			$('#modalMask').css("display", "none");
			$('#modalDetail').css("display", "none");
		});

		// $(document).ready(function(){
		// 	$('#modalClose').click(function(){
		// 		$("#modalMask").css('display', 'none');
		// 		$("#modalDetail").css('display', 'none');
		// 	});
		// });
		</script>

	<script>
	var image_path = '${contextPath}';
	
	function test(imageName) {
	    LoadingWithMask(image_path/resources/user/images/spinner.gif);
	    setTimeout("closeLoadingWithMask()", 3000);
	}
	 
	function LoadingWithMask(gif) {
	    //화면의 높이와 너비를 구합니다.
	    var maskHeight = $(document).height();
	    var maskWidth  = window.document.body.clientWidth;
	     
	    //화면에 출력할 마스크를 설정해줍니다.
	    var mask       ="<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
	    var loadingImg ='';
	      
	    loadingImg +=" <img src='"+ gif +"' style='position: absolute; display: block; margin: 0px auto;'/>";
	 
	    //화면에 레이어 추가
	    $('body')
	        .append(mask)
	 
	    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다.
	    $('#mask').css({
	            'width' : maskWidth,
	            'height': maskHeight,
	            'opacity' :'0.3'
	    });
	  
	    //마스크 표시
	    $('#mask').show();
	  
	    //로딩중 이미지 표시
	    $('#loadingImg').append(loadingImg);
	    $('#loadingImg').show();
	}
	 
	function closeLoadingWithMask() {
	    $('#mask, #loadingImg').hide();
	    $('#mask, #loadingImg').empty(); 
	}
	</script>
	
	<script>

		var qnaClose = document.getElementById('qnaClose');
		var qnaPanel = document.getElementById('qnaPanel');
		var makeQuestion = document.getElementById('makeQuestion');
		var question_button = document.getElementById('question_button');
		var userCheck = '${member.userid}';
		
		$('#qnaClose').click(function() {
			qnaPanel.style.display = 'none';
			$('#qnaTextarea').css('border', '1px solid #bdbdbd');
		});
		
		$('#makeQuestion').click(function() {
			if(!isEmpty(userCheck)){
				qnaPanel.style.display = 'block';	
			} else {
// 				alert('로그인 후 이용해주세요!');
				swal({
//		 			   title: "타이틀",
					   text: "로그인 후 이용해주세요!",
					   icon: "info" //"info,success,warning,error" 중 택1
					});
			}
		});
		
		$('#question_button').click(function(){
			if(!isEmpty(userCheck)){
				qnaPanel.style.display = 'block';	
			} else {
// 				alert('로그인 후 이용해주세요!');
				swal({
//		 			   title: "타이틀",
					   text: "로그인 후 이용해주세요!",
					   icon: "info" //"info,success,warning,error" 중 택1
					});
			}
		});
		
		$(document).ready(function(){
			
			// 글자수에 따른 css
			$('#questionSubmitBtn').click(function() {
				var qText = document.getElementById('qnaTextarea').value;
				if (qText == "" || qText == null) {
					$('#countDown').css('display', 'none');
					$('#formError').css('display', 'block');
					$('#qnaTextarea').css('border-color', '#c00')
					$('#qnaTextarea').css('box-shadow', '0 0 0 3px rgb(204 0 0 / 24%)')
					$('#qnaTextarea').css('outline', '0')
				} else {
					// ?
				}
			});
			$('#qnaTextarea').keypress(function() {
				$('#countDown').css('display', 'block');
				$('#formError').css('display', 'none');
				$('#qnaTextarea').css('border-color', '#0071c2')
				$('#qnaTextarea').css('box-shadow', '0 0 0 3px rgb(0 113 194 / 24%)')
				$('#qnaTextarea').css('outline', '0')
			})

			// 남은 글자 수
      $('#qnaTextarea').keyup(function (e){
        var qnaTextarea = $(this).val();
				var remain = 300 - qnaTextarea.length
        $('#countDown').html('남은 글자수 ' + remain + '자');
				if (remain < 0) {
					$('#countDown').css('display', 'none');
					$('#formError').css('display', 'block');
					$('#qnaTextarea').css('border-color', '#c00')
					$('#qnaTextarea').css('box-shadow', '0 0 0 3px rgb(204 0 0 / 24%)')
					$('#qnaTextarea').css('outline', '0')
				} else {
					// ??
				}
      });
      $('#qnaTextarea').keyup();
		});
		
	</script>
	
	<script>
	$(document).ready(function(){
		$('#questionSubmitBtn').on("click", sendBoard);
	});
	
	function sendBoard(){
    	
    	var content_val = $('#qnaTextarea').val();
    	var BoardVO = {"userid": '${member.userid}', "serialnumber": '${hotelInfo.serialnumber }', "content": content_val, "partner": false}
    	var path = '${contextPath}';
    	
    	$.ajax({
    		url: path + "/insertBoard.do"
   			, method : 'POST'
		    , data: JSON.stringify(BoardVO)
		    , dataType: 'json'
		    , contentType: 'application/json'
		    , success : function(data) {
// 		    	alert(data + '개의 문의가 정상적으로 전송되었습니다!');
		    	swal({
//		 			   title: "타이틀",
					   text: '1개의 문의가 정상적으로 전송되었습니다!',
					   icon: "info" //"info,success,warning,error" 중 택1
					});
		    	$('#qnaPanel').css("display", "none");
   	     	},
   	    	error : function() {
// 				alert('다시 시도해주세요!');
				swal({
//		 			   title: "타이틀",
					   text: "다시 시도해주세요!",
					   icon: "info" //"info,success,warning,error" 중 택1
					});
			}
    	})
    }
	
	/*
	$(document).ready(function(){
		$('#questionSubmitBtn').on("load", reqBoardList);
	});
	
	function reqBoardList() {
		
		var sendReply = {"serialnumber": '${hotelInfo.serialnumber}'}
		var hotelname = '${hotelInfo.hotelname}';
		
	    $.ajax({
	        url: path + '/getBoardList.do'
	        , method : 'POST'
	        , data: JSON.stringify(sendReply)
	        , dataType: 'json'
	        , contentType: 'application/json'
	        , success : function(data) {  	
	
	        	if(isEmpty(data)){
	                var result = '';
	                result += "<div class='question-answer'><div class='qna-card'><div class='qna-icon'><svg class='bk-icon -streamline-chat_bubbles' fill='#0071C2' height='36' width='36' viewBox='0 0 24 24' role='presentation' aria-hidden='true' focusable='false'><path d='M24 13.5a6 6 0 0 0-6-6h-3a6 6 0 0 0 0 12h.75l-.53-.22 4.5 4.5a.75.75 0 0 0 1.28-.53v-5.024l-.43.678A5.989 5.989 0 0 0 24 13.502zm-1.5-.002a4.489 4.489 0 0 1-2.57 4.05.75.75 0 0 0-.43.678v5.024l1.28-.53-4.5-4.5a.75.75 0 0 0-.53-.22H15a4.5 4.5 0 1 1 0-9h3a4.5 4.5 0 0 1 4.5 4.5zM6.22 12.22l-3 3 1.28.53v-5.024a.75.75 0 0 0-.43-.678A4.489 4.489 0 0 1 5.998 1.5H9a4.502 4.502 0 0 1 4.313 3.214.75.75 0 0 0 1.438-.428A6.002 6.002 0 0 0 9 0H6a5.988 5.988 0 0 0-2.57 11.404L3 10.726v5.024a.75.75 0 0 0 1.28.53l3-3a.75.75 0 1 0-1.06-1.06z'></path></svg></div><div class='qna-text'><h3>숙소 관련 Q&A</h3><div>더 알고 싶은 정보가 있으신가요? 숙소에 질문을 남겨보세요.</div></div><button class='make-question' id='makeQuestion'>문의하기</button></div></div>";
	                $("#question_board").append(result);
	            } else {
	                
	                var result = '';
	                        result += "<div class='question'><h2>궁금하신 점이 있나요?</h2><p>Q&A에서 더 많은 정보를 찾아보세요. 원하는 정보가 없다면 아래에서 숙소에 직접 질문을 남기세요.</p>";
	                        result += "<div class='now-booking' id='question-booking'><a href="#booking-table"><button>지금 예약</button></a></div><div><div class='question-third'><div class='question-third-left'><div><p><strong>소개</strong></p><p>반갑습니다.";
	                        result += hotelname;
	                        result += "입니다.</p>";
	                        result += "<div>보통 몇 시간 안에 답변을 드려요</div></div><p><button class='button-white' id='question_button'><span>질문 남기기</span></button></p></div>";
	                        
	                        result += "<div class='question-third-right'>";
	                        result += "<div class='question-third-right-row'>";
	
	                $.each(data, function(index, item){
	
	                        if(!item.partner){
	                            result += "<i class='bi bi-person'></i>"
	                            result += "<div class='icon-text'>";        
	                            result += "&nbsp;&nbsp;<p class='question-inner-text'>";
	                            result += item.content;
	                            result += "</p></div>";
	                        } else {
	                            result += "<i class='bi bi-chat'></i>"
	                            result += "<div class='icon-text'>";
	                            result += "&nbsp;&nbsp;<p class='question-inner-text'>";
	                            result += item.content;
	                            result += "</p></div>";
	                        }    
	               })
	
	                result += "</div><p class='question-more'><button class='button-white'><span>질문 더 보기(";
	                result += 15;
	                result += "개)</span></button></p></div></div></div></div>";
	            
	                $("#question_board").append(result);
	           }
	        },
	       	error : function() {
				alert('error');		
				swal({
//		 			   title: "타이틀",
					   text: "시스템 오류가 발생했습니다. 다시 시도해주세요",
					   icon: "error" //"info,success,warning,error" 중 택1
					});
			}
	   })
	}
	*/
	</script>

</body>
</html>