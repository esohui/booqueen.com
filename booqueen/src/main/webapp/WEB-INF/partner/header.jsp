<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${contextPath}/resources/partner/css/header.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>${hotel.hotelname}</title>
<script type="text/javascript">

	$(function(){
		var serialnumber = $("#serial").val();
		var option = '';
		
		$("#roomOption").change(function(){
			option = $("#roomOption").val();
			
			var newRoomVO = {
					"serialnumber":serialnumber,
					"type":option
			}
			
			$.ajax({
				method:"POST",
				url:"selectHoldingRoom.pdo",
				contentType:"application/json",
				dataType:"json",
				data:JSON.stringify(newRoomVO),
				success:function(result){
					if(result.msg == "SUCCESS"){
						alert("선택한 유형의 객실이 이미 존재합니다.")
					} else {
						
					}
				},
				error:function(){
					console.log("통신 실패")
				}
			})
			
			
		})
	})

	$(document).ready(function(){
		$("#addNewRoom").click(function(){
			var room = document.getElementById("roomModal");
			if(room.style.display === "none") {
				room.style.display = "block";
			} else {
				room.style.display = "block";
			}
		})
	})

	function submitForm() {
		
		var serialnumber = $("#serial").val()
		var type = $("#roomOption").val()
		var price = $("#price").val()
		var smoking = $("#smoking").val()
		var available = $("#availableRoom").val()
		var quota = $("#quota").val()
		var bed = $("#bed").val()
		
		const newRoomVO = {
			"serialnumber":serialnumber,
			"type":type,
			"price":price,
			"smoking": smoking,
			"available": available,
			"quota":quota,
			"bed":bed
		}
		
		$.ajax({
			method:"POST",
			url:"insertNewRoom.pdo",
			contentType:"application/json",
			dataType:"json",
			data:JSON.stringify(newRoomVO),
			success:function(result){
				if(result.msg == "SUCCESS"){
					alert("새로운 객실이 추가되었습니다.")
					location.reload()
				} else {
					alert("다시 시도해 주세요.")
				}
			},
			error:function(){
				console.log("통신 실패")
			}
		})
		//$("#myForm").submit()
	}

	function closeModal(){
		var room = document.getElementById("roomModal");
		if(room.style.display === "block"){
			room.style.display = "none";
		}
	}

	function openModal(){
		var room = document.getElementById("roomModal");
		if(room.style.display === "none") {
			room.style.display = "block";
		} else {
			room.style.display = "block";
		}
	}

	function dropdown() {
    	var menu = document.getElementById("ext-action-dropdown__menu");
        if (menu.style.display === "none") {
        	menu.style.display = "block";
        } else {
        	menu.style.display = "none";
        }
	}
	
	
	function openSearchMenu() {
		var search = document.getElementById("searchList")
		if(search.style.display === "none") {
			search.style.display = "block";
			
			$("#searchList").empty();
			var searchWord = $("#searchKeyWord").val();
			
			if(searchWord.length > 3) {
				
				var path = '${contextPath}';
				
				$.ajax({
					method:"GET",
					url:"selectReservationByRSVN.pdo?searchKeyword=" + searchWord,
					contentType:"application.json",
					dataType:"json",
					error: function(){
						var noresult = '';
						noresult += "<ul class='submenu_list' style='z-index:999'>";
						noresult += "<li class='submenu_item'><span";
						noresult += " class='submenu_link'>검색 결과</span></li>";
						noresult += "<li class='submenu_item'>";
						noresult += "<span class='submenu_link'>검색 결과가 없습니다.</span>";
						noresult += "</li>";
						noresult += "</ul>";
						$('#searchList').html(noresult);
					},
					success: function(resp) {
						var result = '';
						result += "<ul class='submenu_list' style='z-index:999'>";
						result += "<li class='submenu_item'><span";
						result += " class='submenu_link'>검색 결과</span></li>";
						result += "<li class='submenu_item'>";
						result += "<a class='submenu_link' href='";
						result += path + "/details.pdo?reservation_number=";
						result += resp.reservation_number;
						result +="'><span>";
						result += resp.reservation_number;
						result += "</span></a></li>";
						result += "</ul>";
						$('#searchList').html(result);
					}
				})	//end ajax
				
			}
			
		} else {
			search.style.display = "none";
		}
	}
</script>
</head>
<body>
    <div class="main-container">
        <div class="content">
            <div class="home">
                <header class="header">
                    <div class="header_container">
                        <section class="logo_container">
                            <a href="${contextPath}/main.pdo"><img src="${contextPath}/resources/partner/images/logo.png" class="header_logo"></a>
                            <div class="header_property">${hotel.hotelname} - ${hotel.serialnumber}</div>
                        </section>
                        <div class="side_items">
                            <div class="search_bar">
                                <div class="search_wrap">
                                    <div class="input_container">
                                        <div class="input wrap">
                                            <input class="search_input" id="searchKeyWord" type="text" placeholder="예약 번호를 입력하세요"
                                                autocomplete="off" onkeyup="openSearchMenu()">
                                            <button type="button" class="input_icon">
                                                <svg focusable="false" viewBox="0 0 24 24" role="presentation"
                                                    aria-hidden="true" width="16" height="16" fill="white"
                                                    class="ext-search-input__icon ext-search-input__icon--white bk-icon -streamline-magnifying_glass"
                                                    style="user-select: auto;">
                                                    <path
                                                        d="M17.464 6.56a8.313 8.313 0 1 1-15.302 6.504A8.313 8.313 0 0 1 17.464 6.56zm1.38-.586C16.724.986 10.963-1.339 5.974.781.988 2.9-1.337 8.662.783 13.65c2.12 4.987 7.881 7.312 12.87 5.192 4.987-2.12 7.312-7.881 5.192-12.87zM15.691 16.75l7.029 7.03a.75.75 0 0 0 1.06-1.06l-7.029-7.03a.75.75 0 0 0-1.06 1.06z"
                                                        style="user-select: auto;"></path>
                                                </svg>
                                            </button>
                                        </div>
                                        <div class="search_list" id="searchList">        
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="menu_wrap">
                                <div class="menu_item">
                                    <button class="menu_section">
                                        <div class="menu_avatar" style="background-image: url('${image}');">
                                        </div>
                                        <div class="menu_text">${hotel.hotelname}</div>
                                    </button>
                                </div>
                                <div class="menu_item">
                                    <button class="menu_section">
                                        <div class="menu_avatar">
                                            <svg height="20" fill="currentColor" width="20" aria-hidden="true"
                                                role="presentation" focusable="false" viewBox="0 0 24 24" slot="icon"
                                                class="ext-action-menu__avatar--icon bk-icon -streamline-question_mark_circle"
                                                style="user-select: auto;">
                                                <path
                                                    d="M9.75 9a2.25 2.25 0 1 1 3 2.122 2.25 2.25 0 0 0-1.5 2.122v1.006a.75.75 0 0 0 1.5 0v-1.006c0-.318.2-.602.5-.708A3.75 3.75 0 1 0 8.25 9a.75.75 0 1 0 1.5 0zM12 16.5a1.125 1.125 0 1 0 0 2.25 1.125 1.125 0 0 0 0-2.25.75.75 0 0 0 0 1.5.375.375 0 1 1 0-.75.375.375 0 0 1 0 .75.75.75 0 0 0 0-1.5zM22.5 12c0 5.799-4.701 10.5-10.5 10.5S1.5 17.799 1.5 12 6.201 1.5 12 1.5 22.5 6.201 22.5 12zm1.5 0c0-6.627-5.373-12-12-12S0 5.373 0 12s5.373 12 12 12 12-5.373 12-12z"
                                                    style="user-select: auto;"></path>
                                            </svg>
                                        </div>
                                        <div class="menu_text">
                                            <span>헬프</span>
                                        </div>
                                    </button>
                                </div>
                                <div class="menu_item">
                                    <button class="menu_section" onClick="dropdown()">
                                        <div class="menu_avatar">
                                            <svg fill="currentColor" height="20" aria-hidden="true" width="20"
                                                focusable="false" viewBox="0 0 24 24" role="presentation" slot="icon"
                                                class="ext-action-menu__avatar--icon bk-icon -streamline-account_user"
                                                style="user-select: auto;">
                                                <path
                                                    d="M16.5 9.75a4.5 4.5 0 1 1-9 0 4.5 4.5 0 0 1 9 0zm1.5 0a6 6 0 1 0-12 0 6 6 0 0 0 12 0zm1.445 10.597c-4.086-4.111-10.732-4.132-14.844-.046l-.046.046a.75.75 0 0 0 1.064 1.058l.04-.04a8.996 8.996 0 0 1 12.722.04.75.75 0 0 0 1.064-1.058zM22.5 12c0 5.799-4.701 10.5-10.5 10.5S1.5 17.799 1.5 12 6.201 1.5 12 1.5 22.5 6.201 22.5 12zm1.5 0c0-6.627-5.373-12-12-12S0 5.373 0 12s5.373 12 12 12 12-5.373 12-12z"
                                                    style="user-select: auto;"></path>
                                            </svg>
                                        </div>
                                        <div class="menu_text">
                                            <span>어카운트</span>
                                        </div>
                                    </button>
                                    <div class="ext-action-dropdown__menu" id="ext-action-dropdown__menu">
                                        <div>
                                            <ul class="ext-action-dropdown__content">
                                                <li><a href="${contextPath}/password.pdo" class="ext-action-dropdown__item"><span><svg width="20" height="20"
                                                                fill="currentColor" viewBox="0 0 24 24" role="presentation" aria-hidden="true"
                                                                focusable="false" class="ext-action-dropdown__icon bk-icon -streamline-key" slot="icon">
                                                                <path
                                                                    d="M13.348 15.047l2.545-2.545-.724.194 1.752.47a2.322 2.322 0 0 0 2.843-2.841l-.47-1.753-.195.724.784-.784-.724.194 1.752.47a2.321 2.321 0 0 0 2.842-2.842l-.468-1.752-.195.724A3.106 3.106 0 1 0 18.697.914l-9.741 9.74.823-.16a7.033 7.033 0 1 0 3.73 3.73l-.16.823zm-1.06-1.06a.75.75 0 0 0-.16.823 5.532 5.532 0 0 1-7.254 7.254 5.533 5.533 0 1 1 4.32-10.188.75.75 0 0 0 .822-.16l9.741-9.742a1.606 1.606 0 1 1 2.273 2.272.75.75 0 0 0-.195.724l.47 1.752a.821.821 0 0 1-1.006 1.006l-1.752-.47a.75.75 0 0 0-.724.194l-.784.784a.75.75 0 0 0-.194.724l.47 1.752a.822.822 0 0 1-1.007 1.005l-1.75-.47a.75.75 0 0 0-.725.195l-2.545 2.545zM6.743 18.08a.821.821 0 1 1-1.642 0 .821.821 0 0 1 1.642 0zm1.5 0a2.321 2.321 0 1 0-4.642 0 2.321 2.321 0 0 0 4.642 0z">
                                                                </path>
                                                            </svg>
                                                            비밀번호 변경
                                                        </span></a></li>
                                                <li><a href="#" class="ext-action-dropdown__item"><span><svg width="20" height="20"
                                                                fill="currentColor" viewBox="0 0 24 24" role="presentation" aria-hidden="true"
                                                                focusable="false" class="ext-action-dropdown__icon bk-icon -streamline-settings"
                                                                slot="icon">
                                                                <path
                                                                    d="M9.989 2.94a2.707 2.707 0 0 0 4.022 0l.943-1.035a1.21 1.21 0 0 1 2.107.87l-.071 1.4a2.708 2.708 0 0 0 2.837 2.841l1.401-.071a1.209 1.209 0 0 1 .87 2.105l-1.042.94a2.71 2.71 0 0 0 0 4.022l1.042.94a1.209 1.209 0 0 1-.873 2.104l-1.4-.071a2.708 2.708 0 0 0-2.843 2.843l.071 1.4a1.208 1.208 0 0 1-2.1.866l-.938-1.038a2.709 2.709 0 0 0-4.02 0l-.944 1.04a1.209 1.209 0 0 1-2.102-.87l.072-1.395a2.708 2.708 0 0 0-2.844-2.844l-1.399.071a1.208 1.208 0 0 1-.875-2.102l1.04-.94a2.71 2.71 0 0 0 0-4.022l-1.039-.943a1.208 1.208 0 0 1 .87-2.102l1.397.071a2.708 2.708 0 0 0 2.845-2.85l-.067-1.396a1.209 1.209 0 0 1 2.102-.87l.94 1.037zm1.113-1.005l-.94-1.038A2.71 2.71 0 0 0 5.45 2.845l.067 1.402a1.208 1.208 0 0 1-1.27 1.275l-1.401-.071a2.71 2.71 0 0 0-1.95 4.71l1.04.945a1.21 1.21 0 0 1 .001 1.797l-1.04.94a2.708 2.708 0 0 0 1.957 4.713l1.399-.071a1.208 1.208 0 0 1 1.269 1.268l-.072 1.4a2.709 2.709 0 0 0 4.71 1.951l.945-1.04a1.209 1.209 0 0 1 1.796-.002l.942 1.04a2.71 2.71 0 0 0 4.708-1.946l-.072-1.404a1.208 1.208 0 0 1 1.268-1.269l1.401.071a2.709 2.709 0 0 0 1.954-4.715l-1.043-.94a1.21 1.21 0 0 1 0-1.795l1.042-.941a2.71 2.71 0 0 0-1.949-4.716l-1.401.071a1.208 1.208 0 0 1-1.264-1.267l.071-1.4A2.709 2.709 0 0 0 13.843.897L12.9 1.933a1.207 1.207 0 0 1-1.796.003zM15.75 12a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0zm1.5 0a5.25 5.25 0 1 0-10.5 0 5.25 5.25 0 0 0 10.5 0z">
                                                                </path>
                                                            </svg>
                                                            설정
                                                        </span></a></li>
                                                <li><a href="${contextPath}/logout.pdo" class="ext-action-dropdown__item"><span><svg width="20" height="20"
                                                                fill="currentColor" viewBox="0 0 128 128" role="presentation" aria-hidden="true"
                                                                focusable="false" class="ext-action-dropdown__icon bk-icon -streamline-check_out"
                                                                slot="icon">
                                                                <path
                                                                    d="M111.33 66.22c.06-.1.11-.2.16-.3.05-.1.15-.25.21-.39s.08-.27.12-.41c.039-.112.073-.225.1-.34.1-.515.1-1.045 0-1.56a3.352 3.352 0 0 0-.1-.34c0-.14-.07-.28-.12-.41-.05-.13-.14-.26-.21-.39-.07-.13-.1-.2-.16-.3a4.886 4.886 0 0 0-.5-.61l-24-24a4.002 4.002 0 1 0-5.66 5.66L98.34 60H44a4 4 0 0 0 0 8h54.34L81.17 85.17a4.002 4.002 0 1 0 5.66 5.66l24-24c.183-.19.35-.394.5-.61zM44 120h-8c-6.627 0-12-5.373-12-12V20c0-6.627 5.373-12 12-12h8a4 4 0 0 0 0-8h-8C24.954 0 16 8.954 16 20v88c0 11.046 8.954 20 20 20h8a4 4 0 0 0 0-8z">
                                                                </path>
                                                            </svg>
                                                            로그아웃
                                                        </span></a></li>
                                            </ul>
                                            <hr class="bui-divider">
                                            <h4 class="ext-action-dropdown__paragraph"><span>계정에 숙소 추가하기</span></h4>
                                            <ul class="ext-action-dropdown__content">
                                                <li><a id="addNewRoom" class="ext-action-dropdown__item"><svg width="20" height="20"
                                                            fill="currentColor" viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false"
                                                            class="ext-action-dropdown__icon bk-icon -streamline-plus_circle" slot="icon">
                                                            <path
                                                                d="M11.25 7.5v9a.75.75 0 0 0 1.5 0v-9a.75.75 0 0 0-1.5 0zM7.5 12.75h9a.75.75 0 0 0 0-1.5h-9a.75.75 0 0 0 0 1.5zm15-.75c0 5.799-4.701 10.5-10.5 10.5S1.5 17.799 1.5 12 6.201 1.5 12 1.5 22.5 6.201 22.5 12zm1.5 0c0-6.627-5.373-12-12-12S0 5.373 0 12s5.373 12 12 12 12-5.373 12-12z">
                                                            </path>
                                                        </svg> <span>새로운 객실 추가</span></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="header_navigation">
                        <nav class="navigation">
                            <div class="navigation_inner">
                                <div class="navigation_inner_container">
                                    <ul class="item_list">
                                        <li class="navigation_item">
                                            <a class="item_link" href="${contextPath}/main.pdo">
                                                <span class="navigation_icon">
                                                    <svg height="24" fill="currentColor" width="24" aria-hidden="true"
                                                        role="presentation" viewBox="0 0 24 24" focusable="false"
                                                        class="bk-icon -streamline-house" style="user-select: auto;">
                                                        <path
                                                            d="M3 18v3.75A2.25 2.25 0 0 0 5.25 24h4.5a.75.75 0 0 0 .75-.75v-6a.75.75 0 0 1 .75-.75h1.5a.75.75 0 0 1 .75.75v6c0 .414.336.75.75.75h4.5A2.25 2.25 0 0 0 21 21.75V18a.75.75 0 0 0-1.5 0v3.75a.75.75 0 0 1-.75.75h-4.5l.75.75v-6A2.25 2.25 0 0 0 12.75 15h-1.5A2.25 2.25 0 0 0 9 17.25v6l.75-.75h-4.5a.75.75 0 0 1-.75-.75V18A.75.75 0 0 0 3 18zm-1.72-.97L11.47 6.841a.75.75 0 0 1 1.06 0l10.19 10.19a.75.75 0 1 0 1.06-1.061L13.591 5.78a2.25 2.25 0 0 0-3.182 0L.219 15.97a.75.75 0 1 0 1.061 1.06zm15.97-7.28v-1.5L16.5 9h3.75l-.75-.75v5.25a.75.75 0 0 0 1.5 0V8.25a.75.75 0 0 0-.75-.75H16.5a.75.75 0 0 0-.75.75v1.5a.75.75 0 0 0 1.5 0zM16.522.3l-.407.543a1.793 1.793 0 0 0 .279 2.461c.12.102.14.28.045.406l-.411.548a.75.75 0 1 0 1.2.9l.407-.543a1.793 1.793 0 0 0-.279-2.461.295.295 0 0 1-.045-.406l.411-.548a.75.75 0 1 0-1.2-.9zm3.75 0l-.407.543a1.793 1.793 0 0 0 .279 2.461c.12.102.14.28.045.406l-.411.548a.75.75 0 1 0 1.2.9l.407-.543a1.793 1.793 0 0 0-.279-2.461.295.295 0 0 1-.045-.406l.411-.548a.75.75 0 1 0-1.2-.9z"
                                                            style="user-select: auto;"></path>
                                                    </svg>
                                                </span>
                                                <span class="navigation_title">
                                                    <span class="title_text">홈</span>
                                                </span>
                                            </a>
                                        </li>
                                        <li class="navigation_item">
                                            <a class="item_link" href="${contextPath}/calendar.pdo">
                                                <span class="navigation_icon">
                                                    <svg viewBox="0 0 24 24" focusable="false" width="24"
                                                        aria-hidden="true" height="24" fill="currentColor"
                                                        role="presentation" class="bk-icon -streamline-calendar"
                                                        style="user-select: auto;">
                                                        <path
                                                            d="M22.502 13.5v8.25a.75.75 0 0 1-.75.75h-19.5a.75.75 0 0 1-.75-.75V5.25a.75.75 0 0 1 .75-.75h19.5a.75.75 0 0 1 .75.75v8.25zm1.5 0V5.25A2.25 2.25 0 0 0 21.752 3h-19.5a2.25 2.25 0 0 0-2.25 2.25v16.5A2.25 2.25 0 0 0 2.252 24h19.5a2.25 2.25 0 0 0 2.25-2.25V13.5zm-23.25-3h22.5a.75.75 0 0 0 0-1.5H.752a.75.75 0 0 0 0 1.5zM7.502 6V.75a.75.75 0 0 0-1.5 0V6a.75.75 0 0 0 1.5 0zm10.5 0V.75a.75.75 0 0 0-1.5 0V6a.75.75 0 0 0 1.5 0z"
                                                            style="user-select: auto;"></path>
                                                    </svg>
                                                </span>
                                                <span class="navigation_title">
                                                    <span class="title_text">캘린더</span>
                                                </span>
                                            </a>
                                            <div class="submenu" id="submenu">
                                                <ul class="submenu_list">
                                                    <li class="submenu_item"><a class="submenu_link"
                                                            href="${contextPath}/calendar.pdo"><span>캘린더</span></a></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="navigation_item">
                                            <a class="item_link" href="${contextPath}/reservation.pdo">
                                                <span class="navigation_icon">
                                                    <svg viewBox="0 0 24 24" focusable="false" height="24"
                                                        aria-hidden="true" width="24" fill="currentColor"
                                                        role="presentation" class="bk-icon -streamline-list"
                                                        style="user-select: auto;">
                                                        <path
                                                            d="M4.5 2.998a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm1.5 0a3 3 0 1 0-6 0 3 3 0 0 0 6 0zm-1.5 9a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm1.5 0a3 3 0 1 0-6 0 3 3 0 0 0 6 0zm-1.5 9a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm1.5 0a3 3 0 1 0-6 0 3 3 0 0 0 6 0zm2.25-16.5h15a.75.75 0 0 0 0-1.5h-15a.75.75 0 0 0 0 1.5zm0 9h15a.75.75 0 0 0 0-1.5h-15a.75.75 0 0 0 0 1.5zm0 9h15a.75.75 0 0 0 0-1.5h-15a.75.75 0 0 0 0 1.5z"
                                                            style="user-select: auto;"></path>
                                                    </svg>
                                                </span>
                                                <span class="navigation_title">
                                                    <span class="title_text">예약</span>
                                                </span>
                                            </a>
                                        </li>
                                        <li class="navigation_item">
                                            <a class="item_link" href="#">
                                                <span class="navigation_icon">
                                                    <svg fill="currentColor" role="presentation" focusable="false"
                                                        viewBox="0 0 24 24" width="24" height="24" aria-hidden="true"
                                                        class="bk-icon -streamline-edit" style="user-select: auto;">
                                                        <path
                                                            d="M22.72 1.279a4.389 4.389 0 0 0-6.208.013l-.028.029L1.99 15.815a.75.75 0 0 0-.197.344l-1.77 6.905a.75.75 0 0 0 .913.913l6.905-1.771a.75.75 0 0 0 .344-.197l14.5-14.5a4.385 4.385 0 0 0 .067-6.197l-.03-.031zm-1.061 1.06l.02.02a2.887 2.887 0 0 1-.048 4.083L7.125 20.95l.344-.197-6.905 1.771.913.913 1.77-6.905-.197.344 14.5-14.5.025-.025a2.89 2.89 0 0 1 4.086-.009zm-5.583.451l5.134 5.134a.75.75 0 1 0 1.06-1.06L17.136 1.73a.75.75 0 1 0-1.06 1.06zM1.99 16.875l5.14 5.13a.75.75 0 0 0 1.059-1.062l-5.14-5.13a.75.75 0 0 0-1.059 1.062z"
                                                            style="user-select: auto;"></path>
                                                    </svg>
                                                </span>
                                                <span class="navigation_title">
                                                    <span class="title_text">숙소</span>
                                                    <span class="dropdown_indicator">
                                                        <svg viewBox="0 0 24 24" focusable="false" height="15"
                                                            aria-hidden="true" width="15" fill="currentColor"
                                                            role="presentation"
                                                            class="bk-icon -streamline-arrow_nav_down"
                                                            style="user-select: auto;">
                                                            <path
                                                                d="M18 9.45c0 .2-.078.39-.22.53l-5 5a1.08 1.08 0 0 1-.78.32 1.1 1.1 0 0 1-.78-.32l-5-5a.75.75 0 0 1 0-1.06.74.74 0 0 1 1.06 0L12 13.64l4.72-4.72a.74.74 0 0 1 1.06 0 .73.73 0 0 1 .22.53zm-5.72 4.47zm-.57 0z"
                                                                style="user-select: auto;"></path>
                                                        </svg>
                                                    </span>
                                                </span>
                                            </a>
                                            <div class="submenu" id="submenu">
                                                <ul class="submenu_list">
                                                    <li class="submenu_item"><a class="submenu_link"
                                                            href="${contextPath}/update-picture.pdo"><span>사진</span></a></li>
                                                    <li class="submenu_item"><a class="submenu_link"
                                                            href="${contextPath}/set-policies.pdo"><span>정책</span></a></li>
                                                    <li class="submenu_item"><a class="submenu_link" href="${contextPath}/roomlist.pdo"><span>객실
                                                                관리</span></a></li> 
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="navigation_item">
                                            <a class="item_link" href="#">
                                                <span class="navigation_icon">
                                                    <svg role="presentation" fill="currentColor" width="24" height="24"
                                                        aria-hidden="true" focusable="false" viewBox="0 0 24 24"
                                                        class="bk-icon -streamline-email" style="user-select: auto;">
                                                        <path
                                                            d="M22.5 12v6a.75.75 0 0 1-.75.75H2.25A.75.75 0 0 1 1.5 18V6a.75.75 0 0 1 .75-.75h19.5a.75.75 0 0 1 .75.75v6zm1.5 0V6a2.25 2.25 0 0 0-2.25-2.25H2.25A2.25 2.25 0 0 0 0 6v12a2.25 2.25 0 0 0 2.25 2.25h19.5A2.25 2.25 0 0 0 24 18v-6zm-8.822-1.474l3.813 3.525a.75.75 0 1 0 1.018-1.102l-3.813-3.525a.75.75 0 1 0-1.018 1.102zM7.804 9.424L3.99 12.95a.75.75 0 1 0 1.018 1.102l3.813-3.525a.75.75 0 1 0-1.018-1.102zm14.65-5.027l-9.513 6.56a1.656 1.656 0 0 1-1.882 0l-9.513-6.56A.75.75 0 1 0 .694 5.63l9.513 6.56a3.156 3.156 0 0 0 3.586 0l9.513-6.56a.75.75 0 1 0-.852-1.234z"
                                                            style="user-select: auto;"></path>
                                                    </svg>
                                                </span>
                                                <span class="navigation_title">
                                                    <span class="title_text">메시지</span>
                                                    <span class="dropdown_indicator">
                                                        <svg viewBox="0 0 24 24" focusable="false" height="15"
                                                            aria-hidden="true" width="15" fill="currentColor"
                                                            role="presentation"
                                                            class="bk-icon -streamline-arrow_nav_down"
                                                            style="user-select: auto;">
                                                            <path
                                                                d="M18 9.45c0 .2-.078.39-.22.53l-5 5a1.08 1.08 0 0 1-.78.32 1.1 1.1 0 0 1-.78-.32l-5-5a.75.75 0 0 1 0-1.06.74.74 0 0 1 1.06 0L12 13.64l4.72-4.72a.74.74 0 0 1 1.06 0 .73.73 0 0 1 .22.53zm-5.72 4.47zm-.57 0z"
                                                                style="user-select: auto;"></path>
                                                        </svg>
                                                    </span>
                                                </span>
                                            </a>
                                            <div class="submenu" id="submenu">
                                                <ul class="submenu_list">
                                                    <li class="submenu_item"><a class="submenu_link" href="${contextPath}/message.pdo"><span>예약
                                                                관련 메시지</span></a></li>
                                                    <li class="submenu_item"><a class="submenu_link" href="${contextPath}/inquiry.pdo"><span>숙소
                                                                관련 문의</span></a></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="navigation_item">
                                            <a class="item_link" href="#">
                                                <span class="navigation_icon">
                                                    <svg role="presentation" fill="currentColor" aria-hidden="true"
                                                        height="24" width="24" viewBox="0 0 24 24" focusable="false"
                                                        class="bk-icon -streamline-heart_outline"
                                                        style="user-select: auto;">
                                                        <path
                                                            d="M12.541 21.325l-9.588-10a4.923 4.923 0 1 1 6.95-6.976l1.567 1.566a.75.75 0 0 0 1.06 0l1.566-1.566a4.923 4.923 0 0 1 6.963 6.962l-9.6 10.014h1.082zm-1.082 1.038a.75.75 0 0 0 1.082 0l9.59-10.003a6.418 6.418 0 0 0-.012-9.07 6.423 6.423 0 0 0-9.083-.001L11.47 4.854h1.06l-1.566-1.566a6.423 6.423 0 1 0-9.082 9.086l9.577 9.99z"
                                                            style="user-select: auto;"></path>
                                                    </svg>
                                                </span>
                                                <span class="navigation_title">
                                                    <span class="title_text">이용 후기</span>
                                                    <span class="dropdown_indicator">
                                                        <svg viewBox="0 0 24 24" focusable="false" height="15"
                                                            aria-hidden="true" width="15" fill="currentColor"
                                                            role="presentation"
                                                            class="bk-icon -streamline-arrow_nav_down"
                                                            style="user-select: auto;">
                                                            <path
                                                                d="M18 9.45c0 .2-.078.39-.22.53l-5 5a1.08 1.08 0 0 1-.78.32 1.1 1.1 0 0 1-.78-.32l-5-5a.75.75 0 0 1 0-1.06.74.74 0 0 1 1.06 0L12 13.64l4.72-4.72a.74.74 0 0 1 1.06 0 .73.73 0 0 1 .22.53zm-5.72 4.47zm-.57 0z"
                                                                style="user-select: auto;"></path>
                                                        </svg>
                                                    </span>
                                                </span>
                                            </a>
                                            <div class="submenu" id="submenu">
                                                <ul class="submenu_list">
                                                    <li class="submenu_item"><a class="submenu_link" href="${contextPath}/reviews.pdo"><span>고객
                                                                이용 후기</span></a></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="navigation_item">
                                            <a class="item_link" href="#">
                                                <span class="navigation_icon">
                                                    <svg role="presentation" fill="currentColor" height="24"
                                                        aria-hidden="true" width="24" viewBox="0 0 24 24"
                                                        focusable="false" class="bk-icon -streamline-page"
                                                        style="user-select: auto;">
                                                        <path
                                                            d="M13.629 22.5H2.25a.75.75 0 0 1-.75-.75V2.25a.75.75 0 0 1 .75-.75h19.5a.75.75 0 0 1 .75.75v11.379a.75.75 0 0 1-.22.53L14.16 22.28a.75.75 0 0 1-.53.219zm0 1.5a2.25 2.25 0 0 0 1.59-.659l8.122-8.122A2.25 2.25 0 0 0 24 13.63V2.25A2.25 2.25 0 0 0 21.75 0H2.25A2.25 2.25 0 0 0 0 2.25v19.5A2.25 2.25 0 0 0 2.25 24h11.379zM15 23.115V15.75a.75.75 0 0 1 .75-.75h7.365a.75.75 0 0 0 0-1.5H15.75a2.25 2.25 0 0 0-2.25 2.25v7.365a.75.75 0 0 0 1.5 0zM6.75 7.5h12a.75.75 0 0 0 0-1.5h-12a.75.75 0 0 0 0 1.5zm0 4.5H12a.75.75 0 0 0 0-1.5H6.75a.75.75 0 0 0 0 1.5z"
                                                            style="user-select: auto;"></path>
                                                    </svg>
                                                </span>
                                                <span class="navigation_title">
                                                    <span class="title_text">재무</span>
                                                    <span class="dropdown_indicator">
                                                        <svg viewBox="0 0 24 24" focusable="false" height="15"
                                                            aria-hidden="true" width="15" fill="currentColor"
                                                            role="presentation"
                                                            class="bk-icon -streamline-arrow_nav_down"
                                                            style="user-select: auto;">
                                                            <path
                                                                d="M18 9.45c0 .2-.078.39-.22.53l-5 5a1.08 1.08 0 0 1-.78.32 1.1 1.1 0 0 1-.78-.32l-5-5a.75.75 0 0 1 0-1.06.74.74 0 0 1 1.06 0L12 13.64l4.72-4.72a.74.74 0 0 1 1.06 0 .73.73 0 0 1 .22.53zm-5.72 4.47zm-.57 0z"
                                                                style="user-select: auto;"></path>
                                                        </svg>
                                                    </span>
                                                </span>
                                            </a>
                                            <div class="submenu" id="submenu">
                                                <ul class="submenu_list">
                                                    <li class="submenu_item"><a class="submenu_link"
                                                            href="${contextPath}/invoice.pdo"><span>청구서</span></a></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="navigation_item">
                                            <a class="item_link" href="#">
                                                <span class="navigation_icon">
                                                    <svg focusable="false" viewBox="0 0 24 24" height="24"
                                                        aria-hidden="true" width="24" fill="currentColor"
                                                        role="presentation" class="bk-icon -streamline-chart"
                                                        style="user-select: auto;">
                                                        <path
                                                            d="M.75 22.5h22.5a.75.75 0 0 0 0-1.5H.75a.75.75 0 0 0 0 1.5zM6 10.5H3A1.5 1.5 0 0 0 1.5 12v9.75c0 .414.336.75.75.75h4.5a.75.75 0 0 0 .75-.75V12A1.5 1.5 0 0 0 6 10.5zM6 12v9.75l.75-.75h-4.5l.75.75V12h3zm7.5-10.5h-3A1.5 1.5 0 0 0 9 3v18.75c0 .414.336.75.75.75h4.5a.75.75 0 0 0 .75-.75V3a1.5 1.5 0 0 0-1.5-1.5zm0 1.5v18.75l.75-.75h-4.5l.75.75V3h3zM21 6h-3a1.5 1.5 0 0 0-1.5 1.5v14.25c0 .414.336.75.75.75h4.5a.75.75 0 0 0 .75-.75V7.5A1.5 1.5 0 0 0 21 6zm0 1.5v14.25l.75-.75h-4.5l.75.75V7.5h3z"
                                                            style="user-select: auto;"></path>
                                                    </svg>
                                                </span>
                                                <span class="navigation_title">
                                                    <span class="title_text">분석</span>
                                                </span>
                                            </a>
                                            <div class="submenu" id="submenu">
                                                <ul class="submenu_list">
                                                    <li class="submenu_item"><a class="submenu_link" href="${contextPath}/analysis.pdo"><span>분석
                                                                게시판</span></a></li>
                                                </ul>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </nav>
                    </div>
                </header>
            </div>
        </div>
    </div>
    <div class="bui-modal" id="roomModal">
    	<div class="bui-modal__wrapper">
            <div class="bui-modal__align">
                <aside class="bui-modal__content bui-f-depth-1">
                    <div class="bui-modal__body">
                        <div>
                            <h3 class="policy-form-title">신규 객실 추가</h3>
                            <div>
                                <div class="policy-form-section">
                                    <h4 class="policy-form-section-title">
                                        <span>객실 유형</span>
                                    </h4>
                                    <ul class="list-unstyled row clearfix list-smp-customized-condition">
                                        <li class="col-xs-12 col-sm-6">
                                            <div>
                                                <div class="form-group">
                                                    <label>객실 유형을 선택하십시오.</label>
                                                    <select class="form-control" id="roomOption" name="free_cancel_allowed">
                                                        <option value="디럭스싱글">디럭스 싱글룸</option>
                                                        <option value="수페리어싱글">수페리어 싱글룸</option>
                                                        <option value="디럭스더블">디럭스 더블룸</option>
                                                        <option value="수페리어더블">수페리어 더블룸</option>
                                                        <option value="디럭스트리플">디럭스 트리플룸</option>
                                                        <option value="수페리어트리플">수페리어 트리플룸</option>
                                                        <option value="주니어스위트">주니어 스위트룸</option>
                                                        <option value="이그제큐티브스위트">이그제큐티브 스위트룸</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>흡연 정책</label>
                                                    <select class="form-control" id="smoking" name="refund_policy">
                                                        <option value="0">금연</option>
                                                        <option value="1">흡연</option>
                                                        <option value="2">이 객실유형은 흡연/금연 둘 다 설정 가능합니다.</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>이 유형에 해당하는 객실 수</label>
                                                    <input type="number" class="form-control" id="availableRoom">
                                                </div>
                                                <div class="form-group">
                                                    <label>객실 정원</label>
                                                    <input type="number" class="form-control" id="quota">
                                                </div>
                                                <div class="form-group">
                                                    <label>침대 수</label>
                                                    <input type="number" class="form-control" id="bed">
                                                </div>
                                                <div class="form-group">
                                                    <label>1박 최저가</label>
                                                    <input type="number" class="form-control" id="price">
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div><input type="hidden" id="serial" value="${hotel.serialnumber}"></div>
                        </div>
                    </div>
                    <div class="bui-modal__footer">
                        <div class="bui-group bui-group--inline">
                            <button type="button" class="bui-button bui-button--primary" onclick="submitForm()">
                                <span class="bui-button__text"><span>저장</span></span>
                            </button>
                            <button type="button" class="bui-button bui-button--secondary" onclick="closeModal()">
                                <span class="bui-button__text"><span>취소</span></span>
                            </button>
                        </div>
                    </div>
                    <button type="button" class="bui-modal__close" onclick="closeModal()">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                            <path
                                d="M13 12l6.26-6.26a.73.73 0 0 0-1-1L12 11 5.74 4.71a.73.73 0 1 0-1 1L11 12l-6.29 6.26a.73.73 0 0 0 .52 1.24.73.73 0 0 0 .51-.21L12 13l6.26 6.26a.74.74 0 0 0 1 0 .74.74 0 0 0 0-1z">
                            </path>
                        </svg>
                    </button>
                </aside>
            </div>
            <div class="bui-modal__overlay"></div>
        </div>
	</div>
</body>
</html>