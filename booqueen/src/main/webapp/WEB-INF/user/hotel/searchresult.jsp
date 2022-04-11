<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>searchresults</title>
	<link rel="stylesheet" href="${contextPath}/resources/user/css/searchresults.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<script src="https://kit.fontawesome.com/fdb0bc6f32.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29b5f78cb856dc4d592f3c3f87388524&libraries=services"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/user/member/header.jsp"/>

	<div class="container">
		<!-- ------------------------- 검색 지역 -------------------------  -->
		<div class="search-result">
			<ul class="search-info">
				<li class="search"><a href="#" class="home">홈</a></li>
				<li class="search">
					<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#000" class="bi bi-chevron-right arrow" viewBox="0 0 16 16">
						<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
					</svg>
					<a href="#" class="region">
					<%--<c:choose> 
							<c:when test="${!empty hotelList }">
								${hotelList.get(0).city }
							</c:when>
							<c:otherwise>
								${unavailableHotelList.get(0).city }
							</c:otherwise>	
						</c:choose>--%>
						<span class="city_header"></span>
					</a>
				</li>
				<li class="search">
					<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#000" class="bi bi-chevron-right arrow" viewBox="0 0 16 16">
						<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
					</svg>
					<a href="#" class="result">검색결과</a>
				</li>
			</ul>
		</div>

		<div class="main-container">
			<!-- ------------------------- 검색 필터 -------------------------  -->
			<div class="container-left">
				<div class="searchbox">
					<form action="${contextPath}/searchResultInBox.do" class="searchbox-form">
						<div class="searchbox-search"><h2><span class="searchbox-title">검색</span></h2></div>
						<div class="searchbox-destination">
							<span class="label">여행지/숙소 이름:</span>
							<div class="searchbox-destination-field">
								<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
									<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
								</svg>
							<%-- <c:choose> 
									<c:when test="${!empty hotelList }">
										<input type="search" class="searchbox-destination-input" value="${hotelList.get(0).city }" name="keyword">
									</c:when>
									<c:otherwise>
										<input type="search" class="searchbox-destination-input" value="${unavailableHotelList.get(0).city }" name="keyword">
									</c:otherwise>	
								</c:choose> --%>
									<input type="search" class="searchbox-destination-input" value="" name="keyword">
							</div>
						</div>
						<div class="searchbox-date">
							<div class="checkin-checkout">
								<div class="checkin-date">
									<span class="label">체크인 날짜</span>
									<div class="checkin-field">
											<input class="startdate" id="startdate" type="date" name="daterange1" value="${date1 }">
									</div>
								</div>
								<div class="checkout-date">
									<span class="label">체크아웃 날짜</span>
									<div class="checkout-field">
											<input class="enddate" id="enddate" type="date" name="daterange2" value="${date2 }">
									</div>
								</div>
							</div>
						</div>
						
						<div class="searchbox-submit">
							<button class="submit-button" type="submit">
								<span class="submit-text">검색</span>
							</button>
						</div>
					</form>
				</div>
				
				<c:if test="${!empty hotelList}">
				<div class="map">
					<div class="map-back" style="background-image: url(${contextPath}/resources/user/images/searchresultmap.png)">
						<div class="map-pin"><i class="fas fa-map-marker-alt"></i></div>
						<button class="map-button" id="mapBtn1">
							<span class="map-text">지도에서 보기</span>
						</button>
					</div>
				</div>
				</c:if>
				
				<c:if test="${!empty hotelList}">
				<div class="filter">
					<div class="filter-by"><h2>필터링 기준:</h2></div>
					<!-- <div class="filters-group">
						<div class="filters">
							<button class="filters-button" id="filterBudgetBtn">
								<span class="filters-title">
									<h3>내 예산(1박 기준)</h3>
								</span>
								<span class="filter-icon">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-up" viewBox="0 0 16 16">
										<path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
									</svg>
								</span>
							</button>
							<div id="filterBudgetCheck">
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="" id="checkbudget1">
									<label class="filter-text" for="checkbudget1">
										\0 - \50,000
									</label>
									<label class="filter-count" for="checkbudget1">
										9
									</label>
								</div>
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="" id="checkbudget2">
									<label class="filter-text" for="checkbudget2">
										\50,000 - \100,000
									</label>
									<label class="filter-count" for="checkbudget2">
										9
									</label>
								</div>
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="" id="checkbudget3">
									<label class="filter-text" for="checkbudget3">
										\100,000 - \150,000
									</label>
									<label class="filter-count" for="checkbudget3">
										9
									</label>
								</div>
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="" id="checkbudget4">
									<label class="filter-text" for="checkbudget4">
										\150,000 - 200,000
									</label>
									<label class="filter-count" for="checkbudget4">
										9
									</label>
								</div>
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="" id="checkbudget5">
									<label class="filter-text" for="checkbudget5">
										\200,000 +
									</label>
									<label class="filter-count" for="checkbudget5">
										9
									</label>
								</div>
							</div>
						</div>
					</div>
					<hr>-->
					<div class="filters-group">
						<div class="filters">
							<button class="filters-button" id="filterGradeBtn">
								<span class="filters-title">
									<h3>성급</h3>
								</span>
								<span class="filter-icon">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-up" viewBox="0 0 16 16">
										<path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
									</svg>
								</span>
							</button>
							<div id="filterGradeCheck">
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="1" id="checkGrade1" onchange="makeFilter(this);">
									<label class="filter-text" for="checkGrade1">
										1성급
									</label>
									<label class="filter-count" for="checkGrade1">
										2
									</label>
								</div>
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="2" id="checkGrade2" onchange="makeFilter(this);">
									<label class="filter-text" for="checkGrade2">
										2성급
									</label>
									<label class="filter-count" for="checkGrade2">
										2
									</label>
								</div>
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="3" id="checkGrade3" onchange="makeFilter(this);">
									<label class="filter-text" for="checkGrade3">
										3성급
									</label>
									<label class="filter-count" for="checkGrade3">
										26
									</label>
								</div>
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="4" id="checkGrade4" onchange="makeFilter(this);">
									<label class="filter-text" for="checkGrade4">
										4성급
									</label>
									<label class="filter-count" for="checkGrade4">
										27
									</label>
								</div>
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="5" id="checkGrade5" onchange="makeFilter(this);">
									<label class="filter-text" for="checkGrade5">
										5성급
									</label>
									<label class="filter-count" for="checkGrade5">
										19
									</label>
								</div>
								
							</div>
						</div>
					</div>
					
					<hr>
					<div class="filters-group">
						<div class="filters">
							<button class="filters-button" id="filterReviewBtn">
								<span class="filters-title">
									<h3>후기 평점</h3>
								</span>
								<span class="filter-icon">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-up" viewBox="0 0 16 16">
										<path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
									</svg>
								</span>
							</button>
							<div id="filterReviewCheck">
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="9.0" id="checkReview1" onchange="makeScoreFilter(this);">
									<label class="filter-text" for="checkReview1">
										최고: 9 이상
									</label>
									<label class="filter-count" for="checkReview1">
										6
									</label>
								</div>
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="8.0" id="checkReview2" onchange="makeScoreFilter(this);">
									<label class="filter-text" for="checkReview2">
										매우 좋음: 8 이상
									</label>
									<label class="filter-count" for="checkReview2">
										60
									</label>
								</div>
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="7.0" id="checkReview3" onchange="makeScoreFilter(this);">
									<label class="filter-text" for="checkReview3">
										좋음: 7 이상
									</label>
									<label class="filter-count" for="checkReview3">
										79
									</label>
								</div>
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="6.0" id="checkReview4" onchange="makeScoreFilter(this);">
									<label class="filter-text" for="checkReview4">
										만족: 6 이상
									</label>
									<label class="filter-count" for="checkReview4">
										81
									</label>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="filters-group">
						<div class="filters">
							<button class="filters-button" id="filterFacilitiesBtn">
								<span class="filters-title">
									<h3>호텔 시설</h3>
								</span>
								<span class="filter-icon">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-up" viewBox="0 0 16 16">
										<path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
									</svg>
								</span>
							</button>
							<div id="filterFacilitiesCheck">
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="" id="checkFacilities1">
									<label class="filter-text" for="checkFacilities1">
										조식
									</label>
									<label class="filter-count" for="checkFacilities1">
										85
									</label>
								</div>
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="" id="checkFacilities2">
									<label class="filter-text" for="checkFacilities2">
										레스토랑
									</label>
									<label class="filter-count" for="checkFacilities2">
										48
									</label>
								</div>
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="" id="checkFacilities3">
									<label class="filter-text" for="checkFacilities3">
										셔틀
									</label>
									<label class="filter-count" for="checkFacilities3">
										1
									</label>
								</div>
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="" id="checkFacilities4">
									<label class="filter-text" for="checkFacilities4">
										수영장
									</label>
									<label class="filter-count" for="checkFacilities4">
										23
									</label>
								</div>
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="" id="checkFacilities5">
									<label class="filter-text" for="checkFacilities5">
										24시간 프런트 데스크
									</label>
									<label class="filter-count" for="checkFacilities5">
										48
									</label>
								</div>
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="" id="checkFacilities6">
									<label class="filter-text" for="checkFacilities6">
										wifi
									</label>
									<label class="filter-count" for="checkFacilities6">
										48
									</label>
								</div>
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="" id="checkFacilities7">
									<label class="filter-text" for="checkFacilities7">
										피트니스 센터
									</label>
									<label class="filter-count" for="checkFacilities7">
										48
									</label>
								</div>
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="" id="checkFacilities8">
									<label class="filter-text" for="checkFacilities8">
										흡연
									</label>
									<label class="filter-count" for="checkFacilities8">
										48
									</label>
								</div>
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="" id="checkFacilities9">
									<label class="filter-text" for="checkFacilities9">
										라운지 바
									</label>
									<label class="filter-count" for="checkFacilities9">
										48
									</label>
								</div>
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="" id="checkFacilities10">
									<label class="filter-text" for="checkFacilities10">
										스파
									</label>
									<label class="filter-count" for="checkFacilities10">
										48
									</label>
								</div>
								<div class="filter-checkbox">
									<input class="filter-checkbox-input" type="checkbox" value="" id="checkFacilities11">
									<label class="filter-text" for="checkFacilities11">
										주차
									</label>
									<label class="filter-count" for="checkFacilities11">
										48
									</label>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:if>
			</div>
			<!-- ------------------------- 호텔 목록 -------------------------  -->
			<div class="container-right">
				<div class="title">
				<%-- <c:choose> 
						<c:when test="${!empty hotelList }">
							<h2>${hotelList.get(0).city }: 검색된 숙소 
								<span id="number_hotel">${fn:length(hotelList)+fn:length(unavailableHotelList)}</span>개
							</h2>
						</c:when>
						<c:otherwise>
							<h2>${unavailableHotelList.get(0).city }: 검색된 숙소 
								<span id="number_hotel">${fn:length(unavailableHotelList)}</span>개
							</h2>
						</c:otherwise>	
					</c:choose>--%>
						<h2><span class="city_header"></span>: 검색된 숙소 
							<span id="number_hotel">${fn:length(hotelList)}</span>개
						</h2>
					
					<c:if test="${!empty hotelList}">
					<button class="mini-map" id="mapBtn2" style="background-image: url(${contextPath}/resources/user/images/searchresultmap.png)";>
						<i class="fas fa-map-marker-alt"></i>
					</button>
					</c:if>
					
				</div>
				<div class="content">
					<div class="orderby">
						<ul class="menubar">
							<li class="menuitem popularity" data-value="14">
								<input type="radio" class="filter_radio" id="popularity_filter" name="order_filter" >
								<label for="popularity_filter">리뷰(많은 순)</label>
							</li>
							<li class="menuitem price" data-value="15">
								<input type="radio" class="filter_radio" id="price_filter" name="order_filter">
								<label for="price_filter">요금(낮은 순)</label>
							</li>
							<li class="menuitem review-price" data-value="13">
								<input type="radio" class="filter_radio" id="review-price_filter" name="order_filter" >
								<label for="review-price_filter">평점(높은 순)</label>
							</li>
							<li class="menuitem star-highest" data-value="8">
								<input type="radio" class="filter_radio" id="star-highest_filter" name="order_filter" >
								<label for="star-highest_filter">성급(높은 순)</label>
							</li>
							
							<!--<li class="menuitem dropdown" onclick="myFunction()">
								<a href="#">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
										<path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
									</svg>
								</a>
								<div id="myDropdown" class="dropdown-content">
									<a href="#">성급(낮은 순)</a>
									<a href="#">성급 + 요금 순</a>
									<a href="#">도시 중심으로부터의 거리</a>
									<a href="#">고평점 후기가 많은 순</a>
									<a href="#">가장 가까운 해변까지의 거리</a>
									<a href="#">최다 예약</a>
								</div>
							</li>-->
						</ul>
					</div>

					<!-- 메인 -->
					<div class="hotel-list">
						<div class="ranking">
							<div class="ranking-content">
								<div class="ranking-text">
								<i class="bi bi-exclamation-octagon"></i>
									<span>리뷰가 없는 숙소의 경우 검색 우선순위가 낮아질 수 있습니다.</span>
								</div>
								<div class="ranking-button">
									<button id="rankingBtn">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="#6B6B6B" class="bi bi-x" viewBox="0 0 16 16">
											<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
										</svg>
									</button>
								</div>
							</div>
						</div>
						
					<%--<c:choose>
							<c:when test="${!empty hotelList || !empty unavailableHotelList}">
							<c:if test="${!empty hotelList }"> --%>
						<div id="content_from_ajax">
						
						<c:choose>
						<c:when test="${empty hotelList}">
						<div class="list list-none">
							<div class="list-none-info">
								<span><svg class="bk-icon -iconset-review_poor" fill="#383838" height="60" width="60" viewBox="0 0 128 128" role="presentation" aria-hidden="true" focusable="false"><path d="M64 8a56 56 0 1 0 56 56A56 56 0 0 0 64 8zm0 104a48 48 0 1 1 48-48 48 48 0 0 1-48 48zM44 64a8 8 0 1 1 8-8 8 8 0 0 1-8 8zm48-8a8 8 0 1 1-8-8 8 8 0 0 1 8 8zm-5.2 30.2a4 4 0 1 1-5.6 5.6c-10.5-10.4-24-10.4-34.4 0a4 4 0 0 1-5.6-5.6c13.6-13.7 32-13.7 45.6 0z"></path></svg></span>
								<div class="list-none-content">
									<div class="list-none-en">Not available</div>
									<div class="list-none-ko">검색 조건에 맞는 객실이 없습니다.</div>
								</div>
							</div>
						</div>
						</c:when>
						<c:otherwise>
						<c:set var="hotelAvailableVO" value="${hotelAvailableVO }"/>
						<c:forEach var="hotel" items="${hotelList}" varStatus="status">
						
						<!-- list start -->
						<a href="${contextPath}/hotelInfo.do?serialNumber=${hotel.serialnumber}&start_date=${hotelAvailableVO.start_date}&end_date=${hotelAvailableVO.end_date}" target="_blank">
						<div class="list">
							<div class="hotel-info">
								<div class="hotel-image">
									<a href="${contextPath}/hotelInfo.do?serialNumber=${hotel.serialnumber}&start_date=${hotelAvailableVO.start_date}&end_date=${hotelAvailableVO.end_date}" target="_blank">
									
									<c:if test="${!empty hotel.hotelImgVO.file_url }">
										<img class="s3-img" src="${hotel.hotelImgVO.file_url }">
									</c:if>
									<c:if test="${empty hotel.hotelImgVO.file_url }">
										<img class="s3-img" src="https://booqueen.s3.ap-northeast-2.amazonaws.com/hotel/default-hotel-img.png">
									</c:if>
									</a>
								</div>
								<div class="hotel-content">
									<div class="hotel-top">
										<div class="hotel-title">
											<div class="hotel-name">
												<a href="${contextPath}/hotelInfo.do?serialNumber=${hotel.serialnumber}&start_date=${hotelAvailableVO.start_date}&end_date=${hotelAvailableVO.end_date}" target="_blank"><h3>${hotel.hotelname }</h3></a>								
												<div class="star">
													<c:set var="star" value="${hotel.star*1}"/>
													<c:forEach begin="1" end="${star }">
														<span>
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
															<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
														</svg>
													</span>
													</c:forEach>
													
												</div>
											</div>
											<div class="hotel-location">
												<a href="#">
													<span>
														<span class="hotel-address">${hotel.city }</span>
														<span class="hotel-map">지도에서 표시</span>
													</span>
												</a>
											</div>
										</div>
										<div class="reviews">
											<div class="review">
											
											<c:choose>
												<c:when test="${hotel.reviewAvgVO.scoreAvg >= 9}"><div class="review-title">최고</div></c:when>
												<c:when test="${hotel.reviewAvgVO.scoreAvg >= 8}"><div class="review-title">매우 좋음</div></c:when>
												<c:when test="${hotel.reviewAvgVO.scoreAvg >= 7}"><div class="review-title">좋음</div></c:when>
												<c:when test="${hotel.reviewAvgVO.scoreAvg >= 6}"><div class="review-title">만족</div></c:when>
												<c:when test="${hotel.reviewAvgVO.scoreAvg < 6}"><div class="review-title">보통</div></c:when>
											</c:choose>
											
												<div class="review-subtitle">${hotel.reviewAvgVO.count }개 이용 후기</div>
											</div>
											<div class="grade">${hotel.reviewAvgVO.scoreAvg }</div>
										</div>
									</div>
									<div class="hotel-bottom">
										<div class="room">
											<div class="room-left">
												<div class="room-info">
													<div class="room-name">${hotel.address1 }</div>
<%-- 													<div class="bed-count">${hotel.address2}</div> --%>
													<div class="cancel">
														<div class="cancel1">무료취소 • 선결제 필요 없음</div>
														<div class="cancel2">나중에 취소 가능한 최저가를 지금 잡아놓으세요.</div>
													</div>
													<div class="left">우리 사이트에 이 요금으로 남은 객실 단 ${hotel.available }개</div>
												</div>
											</div>
											<div class="room-right">
												<div class="price">
													<div class="option-info">1박, 성인 2명</div>
													<div class="option-price">
														<span class="fixed-price"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${hotel.roomVO.price*3.5 }" /></span>
														<span class="sale-price"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${hotel.roomVO.price }" /></span>
													</div>
													<div class="price-info">세금 및 기타 요금 포함</div>
												</div>
												<div class="see-availability">
													<a href="${contextPath}/hotelInfo.do?serialNumber=${hotel.serialnumber}&start_date=${hotelAvailableVO.start_date}&end_date=${hotelAvailableVO.end_date}" target="_blank">
														<span class="move-detail">예약 가능 옵션 보기</span>
														<span>
															<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
																<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
															</svg>
														</span>
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						</a>
						<!-- list end -->
						</c:forEach>
						</c:otherwise>
						</c:choose>
						</div><!-- end content_from_ajax -->
						
						<div id="content_from_ajax_available_without_review">
						</div>
						
						<%-- </c:if> 
							<c:if test="${!empty unavailableHotelList }"> 
						<div id="content_from_ajax_unavailable">
						<c:set var="hotelAvailableVO" value="${hotelAvailableVO }"/>
						<c:forEach var="unavilalbeHotel" items="${unavailableHotelList}" varStatus="status">
						
						<!-- list start -->
						<a href="${contextPath}/hotelInfo.do?serialNumber=${unavilalbeHotel.serialnumber}&start_date=${hotelAvailableVO.start_date}&end_date=${hotelAvailableVO.end_date}" target="_blank">
						<div class="list">
							<div class="hotel-info">
								<div class="hotel-image">
									<a href="${contextPath}/hotelInfo.do?serialNumber=${unavilalbeHotel.serialnumber}&start_date=${hotelAvailableVO.start_date}&end_date=${hotelAvailableVO.end_date}" target="_blank">
									
									<c:if test="${!empty unavilalbeHotel.hotelImgVO.file_url }">
										<img class="s3-img" src="${unavilalbeHotel.hotelImgVO.file_url }">
									</c:if>
									<c:if test="${empty unavilalbeHotel.hotelImgVO.file_url }">
										<img class="s3-img" src="https://booqueen.s3.ap-northeast-2.amazonaws.com/hotel/default-hotel-img.png">
									</c:if>
									</a>
								</div>
								<div class="hotel-content">
									<div class="hotel-top">
										<div class="hotel-title">
											<div class="hotel-name">
												<a href="${contextPath}/hotelInfo.do?serialNumber=${unavilalbeHotel.serialnumber}&start_date=${hotelAvailableVO.start_date}&end_date=${hotelAvailableVO.end_date}" target="_blank"><h3>${unavilalbeHotel.hotelname }</h3></a>								
												<div class="star">
													<c:if test="${unavilalbeHotel.star+0 == '5'}">
													<span>
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
															<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
														</svg>
													</span>
													<span>
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
															<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
														</svg>
													</span>
													<span>
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
															<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
														</svg>
													</span>
													<span>
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
															<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
														</svg>
													</span>
													<span>
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
															<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
														</svg>
													</span>
													</c:if>	
													<c:if test="${unavilalbeHotel.star+0 == '4'}">
													<span>
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
															<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
														</svg>
													</span>
													<span>
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
															<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
														</svg>
													</span>
													<span>
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
															<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
														</svg>
													</span>
													<span>
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
															<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
														</svg>
													</span>
													</c:if>
													<c:if test="${unavilalbeHotel.star+0 == '3'}">
													<span>
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
															<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
														</svg>
													</span>
													<span>
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
															<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
														</svg>
													</span>
													<span>
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
															<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
														</svg>
													</span>
													</c:if>
													<c:if test="${unavilalbeHotel.star+0 == '2'}">
													<span>
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
															<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
														</svg>
													</span>
													<span>
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
															<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
														</svg>
													</span>
													</c:if>
													<c:if test="${unavilalbeHotel.star+0 == '1'}">
													<span>
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
															<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
														</svg>
													</span>
													</c:if>
												</div>
											</div>
											<div class="hotel-location">
												<a href="#">
													<span>
														<span class="hotel-address">${unavilalbeHotel.city }</span>
														<span class="hotel-map">지도에서 표시</span>
													</span>
												</a>
											</div>
										</div>
										<div class="reviews">
											<div class="review">
											
											<c:if test="${unavilalbeHotel.reviewAvgVO.scoreAvg >= 9}"><div class="review-title">최고</div></c:if>
											<c:if test="${unavilalbeHotel.reviewAvgVO.scoreAvg >= 8}"><div class="review-title">매우 좋음</div></c:if>
											<c:if test="${unavilalbeHotel.reviewAvgVO.scoreAvg >= 7}"><div class="review-title">좋음</div></c:if>
											<c:if test="${unavilalbeHotel.reviewAvgVO.scoreAvg >= 6}"><div class="review-title">만족</div></c:if>
											<c:if test="${unavilalbeHotel.reviewAvgVO.scoreAvg < 6}"><div class="review-title">보통</div></c:if>
												
												<div class="review-subtitle">${unavilalbeHotel.reviewAvgVO.count }개 이용 후기</div>
											</div>
											<div class="grade">${unavilalbeHotel.reviewAvgVO.scoreAvg }</div>
										</div>
									</div>
									<div class="hotel-bottom">
										<div class="room">
											<div class="room-left">
												<div class="room-info">
													
													<div class="left">죄송합니다. 이 날짜에 이용 가능한 객실이 없습니다.</div>
												</div>
											</div>
											<div class="room-right">
												<div class="price">
													<div class="option-info">1박, 성인 2명</div>
													<div class="option-price">
														<span class="fixed-price">\500,000</span>
														<span class="sale-price"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${unavilalbeHotel.roomVO.price }" /></span>
													</div>
													<div class="price-info">세금 및 기타 요금 포함</div>
												</div>
												<div class="see-availability">
													<a href="#">
														<span class="move-detail">예약 가능한 날짜 보기</span>
														<span>
															<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
																<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
															</svg>
														</span>
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						</a>
						<!-- list end -->
						</c:forEach>
						
						</div><!-- end content_from_ajax_unavailable -->
						</c:if>
						</c:when>
						
						<c:otherwise>
							<div>죄송합니다. 해당 날짜에 이용 가능한 객실이 없습니다.</div>
						</c:otherwise>
						</c:choose>--%>
					</div>
				</div>

				<!-- 검색된 숙소, 번호 -->
				<%--<div class="container-bottom">
					<div class="found-room"><span class="city_header"></span>: 검색된 숙소 ${fn:length(hotelList)}개</div>
					 <div class="showing">
						<div class="pagination">
							<a href="#">&laquo;</a>
							<a class="active" href="#">1</a>
							<a href="#">2</a>
							<a href="#">3</a>
							<a href="#">4</a>
							<a href="#">5</a>
							<a href="#">6</a>
							<a href="#">&raquo;</a>
						</div>
						<div class="show-list">
							<span>1-25 페이지</span>
						</div>
					</div>
				</div>--%>
			</div>

			
		</div>
	</div>

	<!-- The Modal -->
	<div id="modalMap" class="modal-map">

		<div class="close_map">&times;</div>
		<!-- Modal Content -->
		<div class="modal-content">
			
			
			<!-- Modal List -->
			<div class="map-list">
				<!-- <div class="sorter-hotellist"> -->
				<div id="map_result"></div>
				<div class="map-sorter" style="display: none;">
					<div class="map-dropdown">
						<button class="dropdown-btn" id="dropdownBtn">
							<span>저희가 추천하는 숙소</span>
							<i class="bi bi-chevron-expand"></i>
						</button>
						<div class="map-dropdown-content">
							<div class="map-dropdown-menu">
								<ul>
									<li class="dropdown-item">
										<button><span>최다 예약</span></button>
										<button><span>요금(낮은 순)</span></button>
										<button><span>최고 평점 + 최저가</span></button>
										<button><span>성급(높은 순)</span></button>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				
				<div id="map_hotel_list">
<%-- 			<c:choose> 
				<c:when test="${!empty hotelList || !empty unavailableHotelList}">
						
				<c:if test="${!empty hotelList }">--%>
				<c:forEach var="hotel" items="${hotelList}" varStatus="status">
				<div class="map-hotel-list">
					<div class="map-hotel-card">
						<div class="map-hotel-save">
							<button class="map-save-icon">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#000" class="bi bi-heart wishlist-heart" id="wishlist5" viewBox="0 0 16 16">
									<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
								</svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#c00" class="bi bi-heart-fill wishlist-heart-fill" id="wishlistFill5" viewBox="0 0 16 16">
									<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
								</svg>
							</button>
						</div>
						
						<c:if test="${!empty hotel.hotelImgVO.file_url }">
							<div class="map-hotel-image" style="background-image: url(${hotel.hotelImgVO.file_url })"></div>
						</c:if>
						<c:if test="${empty hotel.hotelImgVO.file_url }">
							<div class="map-hotel-image" style="background-image: url(https://booqueen.s3.ap-northeast-2.amazonaws.com/hotel/default-hotel-img.png)"></div>
						</c:if>
						
						<div class="map-hotel-container">
							<div class="map-hotel-title">
								<a href="${contextPath}/hotelInfo.do?serialNumber=${hotel.serialnumber}&start_date=${hotelAvailableVO.start_date}&end_date=${hotelAvailableVO.end_date}" target="_blank"><span class="map-hotel-title-link">${hotel.hotelname }</span></a>
								<div class="map-stars">
									<span>
									<c:set var="star" value="${hotel.star*1}"/>
										<c:forEach begin="1" end="${star }">
										<span>
											<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
												<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
										</span>
										</c:forEach>
									</span>		
								</div>
							</div>
							<div class="map-hotel-review">
								<div class="map-hotel-review-score">${hotel.reviewAvgVO.scoreAvg }</div>
								<div class="map-hotel-review-content">
								<c:choose>
					                <c:when test="${hotel.reviewAvgVO.scoreAvg >= 9}"><div class="map-hotel-review-title">최고</div></c:when>
									<c:when test="${hotel.reviewAvgVO.scoreAvg >= 8}"><div class="map-hotel-review-title">매우 좋음</div></c:when>
									<c:when test="${hotel.reviewAvgVO.scoreAvg >= 7}"><div class="map-hotel-review-title">좋음</div></c:when>
									<c:when test="${hotel.reviewAvgVO.scoreAvg >= 6}"><div class="map-hotel-review-title">만족</div></c:when>
									<c:when test="${hotel.reviewAvgVO.scoreAvg < 6}"><div class="map-hotel-review-title">보통</div></c:when>
					           </c:choose>
									
									<div class="map-hotel-review-text">${hotel.reviewAvgVO.count }개 이용 후기</div>
								</div>
							</div>
							<div class="map-hotel-content">
								<div class="map-hotel-content-info">
									<div class="map-hotel-content-info-name">${hotel.address1}</div>
<%-- 									<div class="map-hotel-content-info-configuration">${hotel.address2}</div> --%>
								</div>
								<div class="map-hotel-content-price">
									<div class="map-hotel-content-price-option">1박, 성인 2명</div>
									<div class="map-hotel-content-price-price">
										<span class="map-hotel-content-price-fixed"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${hotel.roomVO.price *3.5 }" /></span>
										<span class="map-hotel-content-price-sale"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${hotel.roomVO.price }" /></span>
									</div>
									<div class="map-hotel-content-price-fees">
										세금 및 기타 요금 포함
									</div>
								</div>
								<div class="map-hotel-content-message">무료 취소</div>
								<div class="map-hotel-urgency-scarcity">우리 사이트에 이 요금으로 남은 옵션 단 ${hotel.available }개</div>
							</div>

						</div>
						<div class="map-hotel-card-arrow">
							<i class="bi bi-chevron-right"></i>
						</div>
					</div>
				</div>
				</c:forEach>
					<%--</c:if> 
				
					<c:if test="${!empty unavailableHotelList }"> 
		
						<c:forEach var="unavailableHotel" items="${unavailableHotelList}" varStatus="status">
						
						<div class="map-hotel-list">
					<div class="map-hotel-card">
						<div class="map-hotel-save">
							<button class="map-save-icon">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#000" class="bi bi-heart wishlist-heart" id="wishlist5" viewBox="0 0 16 16">
									<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
								</svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#c00" class="bi bi-heart-fill wishlist-heart-fill" id="wishlistFill5" viewBox="0 0 16 16">
									<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
								</svg>
							</button>
						</div>
						
						<c:if test="${!empty unavailableHotel.hotelImgVO.file_url }">
							<div class="map-hotel-image" style="background-image: url(${unavailableHotel.hotelImgVO.file_url })"></div>
						</c:if>
						<c:if test="${empty unavailableHotel.hotelImgVO.file_url }">
							<div class="map-hotel-image" style="background-image: url(https://booqueen.s3.ap-northeast-2.amazonaws.com/hotel/default-hotel-img.png)"></div>
						</c:if>
						
						<div class="map-hotel-container">
							<div class="map-hotel-title">
								<a href="${contextPath}/hotelInfo.do?serialNumber=${unavailableHotel.serialnumber}" target="_blank"><span class="map-hotel-title-link">${unavailableHotel.hotelname }</span></a>
								<div class="map-stars">
									<span>
										<c:if test="${unavailableHotel.star+0 == '5'}">
										<span>
											<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
												<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
										</span>
										<span>
											<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
												<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
										</span>
										<span>
											<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
												<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
										</span>
										<span>
											<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
												<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
										</span>
										<span>
											<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
												<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
										</span>
										</c:if>	
										<c:if test="${unavailableHotel.star+0 == '4'}">
										<span>
											<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
												<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
										</span>
										<span>
											<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
												<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
										</span>
										<span>
											<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
												<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
										</span>
										<span>
											<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
												<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
										</span>
										</c:if>
										<c:if test="${unavailableHotel.star+0 == '3'}">
										<span>
											<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
												<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
										</span>
										<span>
											<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
												<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
										</span>
										<span>
											<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
												<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
										</span>
										</c:if>
										<c:if test="${unavailableHotel.star+0 == '2'}">
										<span>
											<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
												<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
										</span>
										<span>
											<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
												<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
										</span>
										</c:if>
										<c:if test="${unavailableHotel.star+0 == '1'}">
										<span>
											<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#febb02" class="bi bi-star-fill" viewBox="0 0 16 16">
												<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
										</span>
										</c:if>
									</span>		
								</div>
							</div>
							<div class="map-hotel-review">
								<div class="map-hotel-review-score">${unavailableHotel.reviewAvgVO.scoreAvg }</div>
								<div class="map-hotel-review-content">
									<div class="map-hotel-review-title">매우 좋음</div>
									<div class="map-hotel-review-text">${unavailableHotel.reviewAvgVO.count }개 이용 후기</div>
								</div>
							</div>
							<div class="map-hotel-content">
								<div class="map-hotel-content-info">
									<div class="map-hotel-content-info-name">디럭스 더블룸</div>
									<div class="map-hotel-content-info-configuration">침대 1개</div>
								</div>
								<div class="map-hotel-content-price">
									<div class="map-hotel-content-price-option">1박, 성인 2명</div>
									<div class="map-hotel-content-price-price">
										<span class="map-hotel-content-price-fixed">\88,000</span>
										<span class="map-hotel-content-price-sale"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${unavailableHotel.roomVO.price }" /></span>
									</div>
									<div class="map-hotel-content-price-fees">
										세금 및 기타 요금 포함
									</div>
								</div>
								<div class="map-hotel-urgency-scarcity">죄송합니다. 현재 예약 가능한 방이 없습니다.</div>
							</div>

						</div>
						<div class="map-hotel-card-arrow">
							<i class="bi bi-chevron-right"></i>
						</div>
					</div>
				</div>
						</c:forEach>
						
				
				</c:if> 
				</c:when>
				<c:otherwise>
					<div>죄송합니다. 해당 날짜에 이용 가능한 객실이 없습니다.</div>
				</c:otherwise>
				</c:choose> --%>
				</div>
			</div>

			<!-- 접기  onclick="move()" map-show
			<div class="map-hide-button">
				<i class="bi bi-chevron-left" id="mapListCloseBtn"></i>
				<i class="bi bi-chevron-right" id="mapListOpenBtn"></i>
			</div>-->

			<!-- Modal Map -->
			<div class="map-api" id="mapApi">

			</div>
		</div>
	</div>
	
	<div class="wrap-loading display-none">
    	<div><img src="${contextPath }/resources/user/images/spinner2.gif" /></div>
	</div>

<script>
var isEmpty = function(value){ 
	if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ 
		return true;
	} else { 
		return false; 
	}
};

var isNumber = function(value){
	let text = "";
	for(let i = 0; i < value*1; i++){
		text += "<span><svg xmlns='http://www.w3.org/2000/svg' width='12' height='12' fill='#febb02' class='bi bi-star-fill' viewBox='0 0 16 16'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg></span>";	
	}
	return text;
}

var scoreText = function(value){
	if(value >= 9){ return "최고"}
	else if(value >= 8){ return "매우 좋음"}
	else if(value >= 7){ return "좋음"}
	else if(value >= 6){ return "만족"}
	else{return "보통"}
}

function getParameterByName(name) { 
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex.exec(location.search); 
	return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " ")); 
}

var dateArr = new Array();
var start_date_url, end_date_url;

function getDateFromUrl(){
	if(!isEmpty(getParameterByName('daterange'))){
		var dateRow = getParameterByName('daterange');
		dateArr = dateRow.split('-');
		
		var start_date_raw = dateArr[0].replace(/^\+|\s+$/gm,'');
		var end_date_raw = dateArr[1].replace(/^\s+|\s+$/gm,'');
		
		start_date_url = start_date_raw.replaceAll("/", "-");
		end_date_url = end_date_raw.replaceAll("/", "-");
	} else {
		start_date_url = getParameterByName('daterange1');
		end_date_url = getParameterByName('daterange2');
	}
}

var city_name_url;

function getCityFromUrl(){
	if(!isEmpty(getParameterByName('keyword'))){
		city_name_url = getParameterByName('keyword');
	} 
}

$(document).ready(function(){
	getDateFromUrl();
	$('#startdate').val(start_date_url);
	$('#enddate').val(end_date_url);
	getCityFromUrl();
	$('.searchbox-destination-input').val(city_name_url);
	$('.city_header').text(city_name_url);
			
    $(".filter_radio").click(function(){
		if($(this.parentNode.parentNode).children().hasClass("filter_radio_checked")){
          	$(this.parentNode.parentNode).children().removeClass("filter_radio_checked");
			$(this.parentNode).toggleClass("filter_radio_checked");
 	  	} else {
 		  	$(this.parentNode).toggleClass("filter_radio_checked");
 	  	}
    });
});
</script>

<script>
//필터 내용을 저장하는 배열
var starArr = new Array(); 
var cityArr = new Array();
var serviceArr = new Array();
var scoreArr = new Array();
var orderArr = new Array();
var datesArr = new Array();

function makeFilter(target) {     
 	 var ageVal = target.value; //check value
     var confirmCheck = target.checked; //check여부 확인
     
     if (confirmCheck == true) {           
     	starArr.push(ageVal); // check value filter 배열에 입력  check false
     } else {
     	starArr.splice(starArr.indexOf(ageVal), 1); // check value filter 배열내용 삭제
     }
}

function makeScoreFilter(target) {     
	var scoreVal = target.value; //check value
    var confirmCheck = target.checked; //check여부 확인
    
    if (confirmCheck == true) {           
    	scoreArr.push(scoreVal); // check value filter 배열에 입력  check false
    } else {
    	scoreArr.splice(scoreArr.indexOf(scoreVal), 1); // check value filter 배열내용 삭제
    }
}

$(function(){
	$(".filter-checkbox-input").on("change", getAvailableHotel);
	$('.menuitem').on("change", getAvailableHotel);
	
// 	$(".filter-checkbox-input").on("change", getUnavailableHotel);
// 	$('.menuitem').on("change", getUnavailableHotel);
})

var city = '';
var start_date = '${hotelAvailableVO.start_date}';
var end_date = '${hotelAvailableVO.end_date}';
var start_date_param = start_date.replaceAll("-", "");
var end_date_param = end_date.replaceAll("-", "");

function getAvailableHotel() {    

	var contextPath = '${contextPath}';
	
	city = $('.searchbox-destination-input').val();
	cityArr.push(city);
	
	var breakfast = $('#checkFacilities1').is(":checked");
	var restaurant = $('#checkFacilities2').is(":checked");
	var shuttle = $('#checkFacilities3').is(":checked");
	var swimming_pool = $('#checkFacilities4').is(":checked");
	var front_desk = $('#checkFacilities5').is(":checked");
	var wifi = $('#checkFacilities6').is(":checked");
	var fitnesscenter = $('#checkFacilities7').is(":checked");
	var smoking = $('#checkFacilities8').is(":checked");
	var bar = $('#checkFacilities9').is(":checked");
	var spa = $('#checkFacilities10').is(":checked");
	var parking = $('#checkFacilities11').is(":checked");
	serviceArr.push(breakfast, restaurant, shuttle, swimming_pool, front_desk, wifi, fitnesscenter, smoking, bar, spa, parking);
	
	if(isEmpty(starArr)){
   	 starArr = ['1', '2', '3', '4', '5'];
    }
	
// 	scoreArr.push(0);
	var check_scoreArr;
	if(isEmpty(scoreArr)){
		check_scoreArr = 'false';
	} else {
		check_scoreArr = 'true';
	}

	
	orderArr.push('1');
	var orderText = $('.filter_radio_checked').data('value');
	if(!isEmpty(orderText)){
		orderArr.splice(0, 1);
		orderArr.push(orderText);
	}
		
	datesArr.push(start_date_param);
	datesArr.push(end_date_param);
	
    $.ajax({
        url:contextPath + '/availableHotelByFilter.do'
        , type : 'POST'
        , async:false
        , traditional : true
        , dataType: "JSON"
        , data: {starArr: starArr, cityArr: cityArr, serviceArr: serviceArr, scoreArr: scoreArr, orderArr : orderArr, datesArr: datesArr, check_scoreArr : check_scoreArr}
        , success : function(data) {
        	
        	$('#content_from_ajax').empty();
        	$('#content_from_ajax_available_without_review').empty();
        	
    		$.each(data, function(index, hotel){
    			if(hotel.reviewAvgVO.count > 0){
	    			var text = '';
	        		text += "<a href='";
	        		text +=	contextPath;
	        		text += "/hotelInfo.do?serialNumber=";
	       			text += hotel.serialnumber;
	   				text += "' target='_blank'><div class='list'><div class='hotel-info'><div class='hotel-image'><a href='";
					text += contextPath;
					text += "/hotelInfo.do?serialNumber=";
					text += hotel.serialnumber;
	        		text +=	"&start_date=";
	        		text += start_date;
	        		text += "&end_date=";
	        		text += end_date;
	        		text +=	"' target='_blank'><img class='s3-img' src='";
		       		
	        		if(isEmpty(hotel.hotelImgVO)){
	        			text += "https://booqueen.s3.ap-northeast-2.amazonaws.com/hotel/default-hotel-img.png";
	        		} else{
	        			text += hotel.hotelImgVO.file_url;
	        		}
	        		
	        		text += "'></a></div><div class='hotel-content'><div class='hotel-top'><div class='hotel-title'><div class='hotel-name'><a href='";
	   				text += contextPath;
					text += "/hotelInfo.do?serialNumber=";
					text +=	hotel.serialnumber;
					text +=	"&start_date=";
	        		text += start_date;
	        		text += "&end_date=";
	        		text += end_date;
					text +=	"' target='_blank'><h3>";
					text += hotel.hotelname;
					text += "</h3></a><div class='star'>";
					text += isNumber(hotel.star);
					text += "</div></div><div class='hotel-location'><a href='#'><span><span class='hotel-address'>";
					text +=	hotel.city;
					text += "</span><span class='hotel-map'>지도에서 표시</span></span></a></div></div><div class='reviews'><div class='review'><div class='review-title'>";
					text += scoreText(hotel.reviewAvgVO.scoreAvg);
					text +=	"</div><div class='review-subtitle'>";
					text +=	hotel.reviewAvgVO.count;
					text += "개 이용 후기 </div></div><div class='grade'>";
					text +=	hotel.reviewAvgVO.scoreAvg;
					text += "</div></div></div><div class='hotel-bottom'><div class='room'><div class='room-left'><div class='room-info'><div class='room-name'>";
					text += hotel.address1;
					text += "</div><div class='bed-count'>";
// 					text += "더블침대 2개";
					text += "</div><div class='cancel'><div class='cancel1'>";
					text += "무료취소 • 선결제 필요 없음";
					text += "</div><div class='cancel2'>나중에 취소 가능한 최저가를 지금 잡아놓으세요.</div></div><div class='left'>";
					text += "우리 사이트에 이 요금으로 남은 객실 단 "
					text += hotel.available;
					text += "개</div></div></div><div class='room-right'><div class='price'><div class='option-info'>";
					text += "1박, 성인 2명";
					text += "</div><div class='option-price'><span class='fixed-price'>\\";
					var fixed_price = hotel.roomVO.price*3.5;
					text += fixed_price.toLocaleString('ko-KR');
					text += "  </span><span class='sale-price'>\\";
					text += hotel.roomVO.price.toLocaleString('ko-KR');
					text += "</span></div><div class='price-info'>세금 및 기타 요금 포함</div></div><div class='see-availability'><a href='#'><span class='move-detail'>예약 가능 옵션 보기</span><span>";
	    		 	text += "<svg xmlns='http://www.w3.org/2000/svg' width='12' height='12' fill='currentColor' class='bi bi-chevron-right' viewBox='0 0 16 16'><path fill-rule='evenodd' d='M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z'/></svg></span></a></div></div></div></div></div></div></div></a>";
	    			
	        		$('#content_from_ajax').append(text);
    			} else {
    				var text = '';
	        		text += "<a href='";
	        		text +=	contextPath;
	        		text += "/hotelInfo.do?serialNumber=";
	       			text += hotel.serialnumber;
	   				text += "' target='_blank'><div class='list'><div class='hotel-info'><div class='hotel-image'><a href='";
					text += contextPath;
					text += "/hotelInfo.do?serialNumber=";
					text += hotel.serialnumber;
	        		text +=	"&start_date=";
	        		text += start_date;
	        		text += "&end_date=";
	        		text += end_date;
	        		text +=	"' target='_blank'><img class='s3-img' src='";
    	    		
	        		if(isEmpty(hotel.hotelImgVO)){
	        			text += "https://booqueen.s3.ap-northeast-2.amazonaws.com/hotel/default-hotel-img.png";
	        		} else{
	        			text += hotel.hotelImgVO.file_url;
	        		}
	        		
	        		text += "'></a></div><div class='hotel-content'><div class='hotel-top'><div class='hotel-title'><div class='hotel-name'><a href='";
	   				text += contextPath;
					text += "/hotelInfo.do?serialNumber=";
					text +=	hotel.serialnumber;
					text +=	"&start_date=";
	        		text += start_date;
	        		text += "&end_date=";
	        		text += end_date;
					text +=	"' target='_blank'><h3>";
					text += hotel.hotelname;
					text += "</h3></a><div class='star'>";
					text += isNumber(hotel.star);
					text += "</div></div><div class='hotel-location'><a href='#'><span><span class='hotel-address'>";
					text +=	hotel.city;
					text += "</span><span class='hotel-map'>지도에서 표시</span></span></a></div></div><div class='reviews'><div class='review'><div class='review-title'>";
					text += scoreText(hotel.reviewAvgVO.scoreAvg);
					text +=	"</div><div class='review-subtitle'>";
					text +=	hotel.reviewAvgVO.count;
					text += "개 이용 후기 </div></div><div class='grade'>";
					text +=	hotel.reviewAvgVO.scoreAvg;
					text += "</div></div></div><div class='hotel-bottom'><div class='room'><div class='room-left'><div class='room-info'><div class='room-name'>";
					text += hotel.address1;
					text += "</div><div class='bed-count'>";
// 					text += "더블침대 2개";
					text += "</div><div class='cancel'><div class='cancel1'>";
					text += "무료취소 • 선결제 필요 없음";
					text += "</div><div class='cancel2'>나중에 취소 가능한 최저가를 지금 잡아놓으세요.</div></div><div class='left'>";
					text += "우리 사이트에 이 요금으로 남은 객실 단 "
					text += hotel.available;
					text += "개</div></div></div><div class='room-right'><div class='price'><div class='option-info'>";
					text += "1박, 성인 2명";
					text += "</div><div class='option-price'><span class='fixed-price'>\\";
					var fixed_price = hotel.roomVO.price*3.5;
					text += fixed_price.toLocaleString('ko-KR');
					text += "  </span><span class='sale-price'>\\";
					text += hotel.roomVO.price.toLocaleString('ko-KR');
					text += "</span></div><div class='price-info'>세금 및 기타 요금 포함</div></div><div class='see-availability'><a href='#'><span class='move-detail'>예약 가능 옵션 보기</span><span>";
	    		 	text += "<svg xmlns='http://www.w3.org/2000/svg' width='12' height='12' fill='currentColor' class='bi bi-chevron-right' viewBox='0 0 16 16'><path fill-rule='evenodd' d='M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z'/></svg></span></a></div></div></div></div></div></div></div></a>";
	    		 	$('#content_from_ajax_available_without_review').append(text);
    			}	
    		});
        }
       	, error : function() {
// 			alert('error');
			swal({
//	 			   title: "타이틀",
				   text: "시스템 오류가 발생했습니다. 다시 시도해주세요",
				   icon: "error" //"info,success,warning,error" 중 택1
				});
		}
		
    });
    
    if(starArr.length == 5){
    	starArr = [];	
    }
    cityArr.splice(0, 1);
    serviceArr = [];
    for(let i = 0; i < scoreArr.length; i++) {
    	  if(scoreArr[i] === 0)  {
    		  scoreArr.splice(i, 1);
    	    i--;
    	  }
    	}
    orderArr = [];
    datesArr = [];
    $('#number_hotel').text($('.list').length);
 }

/* 선택된 날짜에 이용 불가능한 호텔 조회 
function getUnavailableHotel() {    

	var contextPath = '${contextPath}';
	
	city = $('.searchbox-destination-input').val();
	cityArr.push(city);
	
	var breakfast = $('#checkFacilities1').is(":checked");
	var restaurant = $('#checkFacilities2').is(":checked");
	var shuttle = $('#checkFacilities3').is(":checked");
	var swimming_pool = $('#checkFacilities4').is(":checked");
	var front_desk = $('#checkFacilities5').is(":checked");
	var wifi = $('#checkFacilities6').is(":checked");
	var fitnesscenter = $('#checkFacilities7').is(":checked");
	var smoking = $('#checkFacilities8').is(":checked");
	var bar = $('#checkFacilities9').is(":checked");
	var spa = $('#checkFacilities10').is(":checked");
	var parking = $('#checkFacilities11').is(":checked");
	serviceArr.push(breakfast, restaurant, shuttle, swimming_pool, front_desk, wifi, fitnesscenter, smoking, bar, spa, parking);
	
	if(isEmpty(starArr)){
   	 starArr = ['1', '2', '3', '4', '5'];
    }
	
	scoreArr.push(0);
	
	orderArr.push('1');
	var orderText = $('.filter_radio_checked').data('value');
	if(!isEmpty(orderText)){
		orderArr.splice(0, 1);
		orderArr.push(orderText);
	}
		
	datesArr.push(start_date_param);
	datesArr.push(end_date_param);
	
    $.ajax({
        url:contextPath + '/unavailableHotelByFilter.do'
        , type : 'POST'
        , async:false
        , traditional : true
        , dataType: "JSON"
        , data: {starArr: starArr, cityArr: cityArr, serviceArr: serviceArr, scoreArr: scoreArr, orderArr : orderArr, datesArr: datesArr}
        , success : function(data) {
        	
        	$('#content_from_ajax_unavailable').empty();
        	
    		$.each(data, function(index, hotel){
    		
    			var text = '';
        		text += "<a href='";
        		text +=	contextPath;
        		text += "/hotelInfo.do?serialNumber=";
       			text += hotel.serialnumber;
   				text += "' target='_blank'><div class='list'><div class='hotel-info'><div class='hotel-image'><a href='";
				text += contextPath;
				text += "/hotelInfo.do?serialNumber=";
				text += hotel.serialnumber;
        		text +=	"' target='_blank'><img class='s3-img' src=";
         		text += "https://booqueen.s3.ap-northeast-2.amazonaws.com/hotel/default-hotel-img.png";
        		text += hotel.hotelImgVO.file_url;
        		text += "></a></div><div class='hotel-content'><div class='hotel-top'><div class='hotel-title'><div class='hotel-name'><a href='";
   				text += contextPath;
				text += "/hotelInfo.do?serialNumber=";
				text +=	hotel.serialnumber;
				text +=	"' target='_blank'><h3>";
				text += hotel.hotelname;
				text += "</h3></a><div class='star'>";
				text += isNumber(hotel.star);
				text += "</div></div><div class='hotel-location'><a href='#'><span><span class='hotel-address'>";
				text +=	hotel.city;
				text += "</span><span class='hotel-map'>지도에서 표시</span></span></a></div></div><div class='reviews'><div class='review'><div class='review-title'>";
				text += scoreText(hotel.reviewAvgVO.scoreAvg);
				text +=	"</div><div class='review-subtitle'>";
				text +=	hotel.reviewAvgVO.count;
				text += "개 이용 후기 </div></div><div class='grade'>";
				text +=	hotel.reviewAvgVO.scoreAvg;
				text += "</div></div></div><div class='hotel-bottom'><div class='room'><div class='room-left'><div class='room-info'><div class='room-name'>";
				text += "프리미어 트윈룸";
				text += "</div><div class='bed-count'>더블침대 2개</div><div class='cancel'><div class='cancel1'>무료취소 • 선결제 필요 없음</div><div class='cancel2'>나중에 취소 가능한 최저가를 지금 잡아놓으세요.</div></div><div class='left'>죄송합니다. 이 날짜에는 가능한 방이 없습니다.</div></div></div><div class='room-right'><div class='price'><div class='option-info'>1박, 성인 2명</div><div class='option-price'><span class='fixed-price'>";
				text += "'\402,770</span><span class='sale-price'>'\145,000</span></div><div class='price-info'>세금 및 기타 요금 포함</div></div><div class='see-availability'><a href='#'><span class='move-detail'>예약 가능 옵션 보기</span><span>";
				text += "<svg xmlns='http://www.w3.org/2000/svg' width='12' height='12' fill='currentColor' class='bi bi-chevron-right' viewBox='0 0 16 16'><path fill-rule='evenodd' d='M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z'/></svg></span></a></div></div></div></div></div></div></div></a>";
    			
    		 	$('#content_from_ajax_unavailable').append(text); 
    		});
        }
       	, error : function() {
			alert('error');			
		}
		
    });
    
    if(starArr.length == 5){
    	starArr = [];	
    }
    cityArr.splice(0, 1);
    serviceArr = [];
    for(let i = 0; i < scoreArr.length; i++) {
    	  if(scoreArr[i] === 0)  {
    		  scoreArr.splice(i, 1);
    	    i--;
    	  }
    	}
    orderArr = [];
    datesArr = [];
    $('#number_hotel').text($('.list').length);
 }*/ 
</script>

<script>
	$(document).ready(function(){
		// 필터
		$("#filterPreviousBtn").click(function(){
			$("#filterPreviousCheck").toggle();
		});
		$("#filterBudgetBtn").click(function(){
			$("#filterBudgetCheck").toggle();
		});
		$("#filterPopularityBtn").click(function(){
			$("#filterPopularityCheck").toggle();
		});
		$("#filterSafetyBtn").click(function(){
			$("#filterSafetyCheck").toggle();
		});
		$("#filterSustainabilityBtn").click(function(){
			$("#filterSustainabilityCheck").toggle();
		});
		$("#filterGradeBtn").click(function(){
			$("#filterGradeCheck").toggle();
		});
		$("#filterFunBtn").click(function(){
			$("#filterFunCheck").toggle();
		});
		$("#filterDealBtn").click(function(){
			$("#filterDealCheck").toggle();
		});
		$("#checkCancellationBtn").click(function(){
			$("#checkCancellationCheck").toggle();
		});
		$("#filterAccessibilityBtn").click(function(){
			$("#filterAccessibilityCheck").toggle();
		});
		$("#filterMealBtn").click(function(){
			$("#filterMealCheck").toggle();
		});
		$("#filterEntireBtn").click(function(){
			$("#filterEntireCheck").toggle();
		});
		$("#filterLandmarkBtn").click(function(){
			$("#filterLandmarkCheck").toggle();
		});
		$("#filterReviewBtn").click(function(){
			$("#filterReviewCheck").toggle();
		});
		$("#filterFacilitiesBtn").click(function(){
			$("#filterFacilitiesCheck").toggle();
		});
		$("#filterRoomBtn").click(function(){
			$("#filterRoomCheck").toggle();
		});
		$("#filterCityBtn").click(function(){
			$("#filterCityCheck").toggle();
		});
		$("#filterBrandBtn").click(function(){
			$("#filterBrandCheck").toggle();
		});
		$("#filterLevelBtn").click(function(){
			$("#filterLevelCheck").toggle();
		});

		// 더 알아보기 닫기
		$("#rankingBtn").click(function() {
			$(".ranking").remove();
		});

		// 위시리스트
		$("#wishlist").click(function() {
			$("#wishlist").css('display', 'none');
			$("#wishlistFill").css('display', 'block');
		});
		$("#wishlistFill").click(function() {
			$("#wishlist").css('display', 'block');
			$("#wishlistFill").css('display', 'none');
		});
		$("#wishlist1").click(function() {
			$("#wishlist1").css('display', 'none');
			$("#wishlistFill1").css('display', 'block');
		});
		$("#wishlistFill1").click(function() {
			$("#wishlist1").css('display', 'block');
			$("#wishlistFill1").css('display', 'none');
		});
		$("#wishlist2").click(function() {
			$("#wishlist2").css('display', 'none');
			$("#wishlistFill2").css('display', 'block');
		});
		$("#wishlistFill2").click(function() {
			$("#wishlist2").css('display', 'block');
			$("#wishlistFill2").css('display', 'none');
		});
		$("#wishlist3").click(function() {
			$("#wishlist3").css('display', 'none');
			$("#wishlistFill3").css('display', 'block');
		});
		$("#wishlistFill3").click(function() {
			$("#wishlist3").css('display', 'block');
			$("#wishlistFill3").css('display', 'none');
		});
		$("#wishlist4").click(function() {
			$("#wishlist4").css('display', 'none');
			$("#wishlistFill4").css('display', 'block');
		});
		$("#wishlistFill4").click(function() {
			$("#wishlist4").css('display', 'block');
			$("#wishlistFill4").css('display', 'none');
		});
		$("#wishlist5").click(function() {
			$("#wishlist5").css('display', 'none');
			$("#wishlistFill5").css('display', 'block');
		});
		$("#wishlistFill5").click(function() {
			$("#wishlist5").css('display', 'block');
			$("#wishlistFill5").css('display', 'none');
		});

		// 맵 호텔 필터 열고 닫기
		$("#dropdownBtn").click(function(){
			$(".map-dropdown-menu").toggle();
		});
		$("#mapListCloseBtn").click(function() {
			$('.map-list').animate({left: -130}, 500);
			$('.map-hide-button').animate({left: 265}, 500);
			$("#mapListCloseBtn").css('display', 'none');
			$("#mapListOpenBtn").css('display', 'block');
		});
		$("#mapListOpenBtn").click(function() {
			$('.map-list').animate({left: 265}, 500);
			$('.map-hide-button').animate({left: 645}, 500);
			$("#mapListOpenBtn").css('display', 'none');
			$("#mapListCloseBtn").css('display', 'block');
		});
	});


	// 검색 필터
	function myFunction() {
		document.getElementById("myDropdown").classList.toggle("show");
	}
	window.onclick = function(event) {
		if (!event.target.matches('.dropdown')) {
			var dropdowns = document.getElementsByClassName("dropdown-content");
			var i;
			for (i = 0; i < dropdowns.length; i++) {
				var openDropdown = dropdowns[i];
				if (openDropdown.classList.contains('show')) {
				openDropdown.classList.remove('show');
				}
			}
		}
	}

</script>
<script>
	// 지도보기, 닫기
	var modalMap = document.getElementById("modalMap");
	var mapBtn1 = document.getElementById("mapBtn1");
	var mapBtn2 = document.getElementById("mapBtn2");
	var close = document.getElementsByClassName("close_map")[0];

	mapBtn1.onclick = function () {
		modalMap.style.display = "block";
		map.relayout();
	}
	mapBtn2.onclick = function () {
		modalMap.style.display = "block";
		map.relayout();
	}
	close.onclick = function () { // When the user clicks on <span> (x), close the modal
		modalMap.style.display = "none";
	}
	window.onclick = function (event) { // When the user clicks anywhere outside of the modal, close it
    if (event.target == modalMap) {
			modalMap.style.display = "none";
    }
	}

	var cityLat = '${cityVO.latitude+0.00365817254223}';
	var cityLong = '${cityVO.longitude-0.0083004425474}';
	
	// 지도 불러오기
	var container = document.getElementById('mapApi');
	var options = {
		center: new kakao.maps.LatLng(cityLat, cityLong),
		level: 2
	};
	var map = new kakao.maps.Map(container, options);
	
	var MapArray = new Array();
	var positions = [];
	
	kakao.maps.event.addListener(map, 'dragend', selectMap);
	
	// 지도 함수
	function selectMap(){
        
		var bounds = map.getBounds();
		
		var wLatitude = bounds.qa;
		var eLatitude = bounds.pa;
		var sLongitude = bounds.ha;
		var nLongitude = bounds.oa;
		
		var contextPath = '${contextPath}';
		
        var sendData = {
	        				"wLatitude" : wLatitude,
	                        "eLatitude" : eLatitude,
	                        "sLongitude" : sLongitude,
	                        "nLongitude" : nLongitude,
                        	"start_date" : start_date_param,
                        	"end_date" : end_date_param
                        }
       	
        	$.ajax({
                method : "POST",
                url : contextPath + "/getMap.do",
                async: false,
                data : sendData,
                dataType : "JSON",
                success : function(data){
                	
                	positions = [];
                	$('#map_hotel_list').empty();
                	
                	$.each(data, function(index, hotel){
                		                		
                		var text = '';
                		text += "<div class='map-hotel-list'><div class='map-hotel-card'><div class='map-hotel-save'><button class='map-save-icon'><svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='#000' class='bi bi-heart wishlist-heart' id='wishlist5' viewBox='0 0 16 16'>";
                		text += "<path d='m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z'/>";
                		text += "</svg><svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='#c00' class='bi bi-heart-fill wishlist-heart-fill' id='wishlistFill5' viewBox='0 0 16 16'>";
                		text += "<path fill-rule='evenodd' d='M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z'/></svg></button></div>";
                		text += "<div class='map-hotel-image' style='background-image: url(";
//     		       		text += "https://booqueen.s3.ap-northeast-2.amazonaws.com/hotel/default-hotel-img.png";
                		text += hotel.hotelImgVO.file_url;
                		text += ")'></div><div class='map-hotel-container'><div class='map-hotel-title'><a href='";
                		text += contextPath;
                		text += "/hotelInfo.do?serialNumber=";
                		text += hotel.serialnumber;
    	        		text +=	"&start_date=";
    	        		text += start_date;
    	        		text += "&end_date=";
    	        		text += end_date;
                		text += "' target='_blank'><span class='map-hotel-title-link'>";
                		text += hotel.hotelname;
                		text += "</span></a><div class='map-stars'><span>";
               			text += isNumber(hotel.star);
                		text += "</span></div></div><div class='map-hotel-review'><div class='map-hotel-review-score'>";
                		text += hotel.reviewAvgVO.scoreAvg;
                		text += "</div><div class='map-hotel-review-content'><div class='map-hotel-review-title'>";
                		text += scoreText(hotel.reviewAvgVO.scoreAvg);
                		text += "</div><div class='map-hotel-review-text'>";
                		text += hotel.reviewAvgVO.count;
                		text += "개 이용 후기</div></div></div><div class='map-hotel-content'><div class='map-hotel-content-info'><div class='map-hotel-content-info-name'>";
                		text += hotel.address1;
                		text += "</div><div class='map-hotel-content-info-configuration'></div></div><div class='map-hotel-content-price'><div class='map-hotel-content-price-option'>1박, 성인 2명</div><div class='map-hotel-content-price-price'><span class='map-hotel-content-price-fixed'>"
               			var fixed_price = hotel.roomVO.price*3.5;
    					text += fixed_price.toLocaleString('ko-KR');
                		text += "</span><span class='map-hotel-content-price-sale'>\\";
                		text += hotel.roomVO.price.toLocaleString('ko-KR');
                		text += "</span></div><div class='map-hotel-content-price-fees'>세금 및 기타 요금 포함</div></div><div class='map-hotel-content-message'>무료 취소</div><div class='map-hotel-urgency-scarcity'>";
                		text += "우리 사이트에 이 요금으로 남은 객실 단 "
       					text += hotel.available;
                		text += "개</div></div></div><div class='map-hotel-card-arrow'><i class='bi bi-chevron-right'></i></div></div></div>";
            		 	
                		$('#map_hotel_list').append(text);
                		
                		var contents = {
                			content: '<div class="map-hotel-card" style="width: 300px; display: flex; margin: 0; flex-direction: row-reverse; border: 1px solid #000;"> <div class="map-hotel-image" style="background-image: url(' + hotel.hotelImgVO.file_url + ')"></div> <div class="map-hotel-container" style="padding: 10px;"> <div class="map-hotel-title"><span class="map-hotel-title-link">' + hotel.hotelname + '</span><div class="map-stars">' + isNumber(hotel.star) + '</div></div><div class="map-hotel-review"><div class="map-hotel-review-score">' + hotel.reviewAvgVO.scoreAvg + '</div><div class="map-hotel-review-content"><div class="map-hotel-review-title">' + scoreText(hotel.reviewAvgVO.scoreAvg) + '</div><div class="map-hotel-review-text">' + hotel.reviewAvgVO.count + '개 이용 후기' + '</div></div></div><div class="map-hotel-content"><div class="map-hotel-content-price"><div class="map-hotel-content-price-option">' + 1 + '박,' + 2 + '명</div><div class="map-hotel-content-price-price"><span class="map-hotel-content-price-fixed">\\' + fixed_price.toLocaleString('ko-KR') + '</span><span class="map-hotel-content-price-sale">\\' + hotel.roomVO.price.toLocaleString('ko-KR') + '</span></div></div><div class="map-hotel-urgency-scarcity">우리 사이트에 이 요금으로 남은 옵션 단 ' + hotel.available + '개</div></div></div></div>',
               				latlng: new kakao.maps.LatLng(hotel.latitude, hotel.longitude)
               			};
                		
               			MapArray.push(contents);
               			
               			positions[index] = MapArray[index];

               			var imageSrc = contextPath + '/resources/user/images/hotelMaker.png', // 마커이미지의 주소입니다    
               		    imageSize = new kakao.maps.Size(40, 40), // 마커이미지의 크기입니다
               		    imageOption = {offset: new kakao.maps.Point(27, 69)};
               			
               			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
               			
               			var marker = new kakao.maps.Marker({
               				map: map, // 마커를 표시할 지도
               				position: positions[index].latlng,
               				image: markerImage
               			});

               			// 마커에 표시할 인포윈도우를 생성합니다 
               			var infowindow = new kakao.maps.InfoWindow({
               				content: positions[index].content // 인포윈도우에 표시할 내용
               			});

               			var serialnumber = hotel.serialnumber;
               			
               			// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
               			// 이벤트 리스너로는 클로저를 만들어 등록합니다 
               			// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
               			kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
               			kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
               			kakao.maps.event.addListener(marker, 'click', function() {
               				window.open(contextPath + '/hotelInfo.do?serialNumber=' +  serialnumber + '&start_date=' + start_date + '&end_date=' + end_date, '_blank');
               			});
               			
               			// 명소 등록
               			
               			// 장소 검색 객체를 생성합니다
               			var ps = new kakao.maps.services.Places(map); 

               			// 카테고리로 은행을 검색합니다
               			ps.categorySearch('AT4', placesSearchCB, {useMapBounds:true}); 

               			// 키워드 검색 완료 시 호출되는 콜백함수 입니다
               			function placesSearchCB (data, status, pagination) {
               			    if (status === kakao.maps.services.Status.OK) {
               			        for (var i=0; i<data.length; i++) {
               			            displayMarker(data[i]);    
               			        }       
               			    }
               			}
						
               			
               			var imageSrc_attr = contextPath + '/resources/user/images/attractionMaker.png', // 마커이미지의 주소입니다    
               		    imageSize_attr = new kakao.maps.Size(36, 36), // 마커이미지의 크기입니다
               		    imageOption_attr = {offset: new kakao.maps.Point(27, 69)};
               			
               			var markerImage_for_attraction = new kakao.maps.MarkerImage(imageSrc_attr, imageSize_attr, imageOption_attr);
               			
               			// 지도에 마커를 표시하는 함수입니다
               			function displayMarker(place) {
               			    // 마커를 생성하고 지도에 표시합니다
               			    var marker = new kakao.maps.Marker({
               			        map: map,
               			        position: new kakao.maps.LatLng(place.y, place.x),
               			        image : markerImage_for_attraction
               			    });

               			    // 마커에 클릭이벤트를 등록합니다
               			    kakao.maps.event.addListener(marker, 'mouseover', function() {
               			        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
               			        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
               			        infowindow.open(map, marker);
               			    });
               			 	kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
               			}
               			
                	});
                	positions = [];
                	MapArray = [];
                },
                error : function(){
//                 	alert('error');
                	swal({
//     	 			   title: "타이틀",
     				   text: "시스템 오류가 발생했습니다. 다시 시도해주세요",
     				   icon: "error" //"info,success,warning,error" 중 택1
     				});
                }
            });
       
    } // end selectMap()
 	
	// 지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'center_changed', function() {

	    // 지도의  레벨을 얻어옵니다
	    var level = map.getLevel();

	    // 지도의 중심좌표를 얻어옵니다 
	    var latlng = map.getCenter(); 
	});
	   
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 

	for (var i = 0; i < positions.length; i ++) {
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			map: map, // 마커를 표시할 지도
			position: positions[i].latlng // 마커의 위치
		});

		// 마커에 표시할 인포윈도우를 생성합니다 
		var infowindow = new kakao.maps.InfoWindow({
			content: positions[i].content // 인포윈도우에 표시할 내용
		});

		// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		// 이벤트 리스너로는 클로저를 만들어 등록합니다 
		// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}

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
</script>

</body>
</html>