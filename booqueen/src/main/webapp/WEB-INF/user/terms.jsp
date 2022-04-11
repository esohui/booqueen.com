<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>terms</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script src="https://kit.fontawesome.com/d2826a4f92.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style>
	body {
        font-size: 16px!important;
	    line-height: 25px!important;
	    color: #383838;
	}
	.tc-side-nav {
	    margin: 0 auto;
	}
	.page-top-margin {
	    margin-top: 55px;
	}
	.flex-between {
	    display: flex;
	    justify-content: space-between;
	}
	.text-black {
	    color: black;
	}
	.m-0 {
	    margin: 0 !important;
	}
	.mb-1 {
	    margin-bottom: 4px !important;
	}
	.mb-2 {
	    margin-bottom: 8px;
	}
	.mb-4 {
	    margin-bottom: 16px !important;
	}
	.p-0 {
	    padding: 0 !important;
	}
	.ml-4 {
	    margin-left: 36px;
	    margin-bottom: 8px;
	}
	.mt-4 {
	    margin-top: 8px;
	}
	.mt-8 {
	    margin-top: 16px;
	}
	.list-style-circle {
	    list-style: circle;
	}
	.decoration-none {
	    text-decoration: none !important;
	}
	.list-style-none {
	    list-style: none !important;
	}
	.table-of-contents {
	    margin-bottom: 8px;
	    margin-left: 0;
	}
	.font-normal {
	    font-weight: 400 !important;
	}
	.nav-list-item-link {
	    display: inline-block;
	    width: 100%;
	}
	.page-heading {
	    display: flex;
	    flex-direction: column;
	    align-items: flex-start;
	}
	.section-heading {
	    display: flex;
	    flex-direction: column;
	    align-items: flex-start;
	}
	@media screen and (min-width: 768px) {
	    .terms__navigation {
	        display: none;
	    }
	    .page-heading {
	        flex-direction: row;
	        justify-content: space-between;
	    }
	    .section-heading {
	        display: flex;
	        flex-direction: row-reverse;
	        justify-content: space-between;
	        align-items: center;
			}
	}
	a {
		color: #0071c2;
		text-decoration: none;
	}
	.move-top {
		color: #0071c2;
		border: 0;
		border-radius: 2px;
		padding: 12px 14px;
		font-size: 16px;
		background: none;
	}
	.move-top:hover {
		background-color: #f0f7fb;
	}
	.bui-text--variant-headline_3 {
		font-size: 20px;
		line-height: 28px;
		font-weight: 700;
		margin: 20px 0 10px;
	}
	.bui-text p {
		margin-bottom: 8px;
	}
	.bui-text--variant-body_1 {
		margin-bottom: 10px;
	    line-height: 26px;
	}
	.bui-text--variant-strong_1 {
		font-weight: bold;
		font-size: 18px;
		margin: 8px 0;
	}
	.bui-list__item {
		margin: 5px 0;
	}
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/user/member/header.jsp"/>
	
	<div style="padding: 40px 18%;">
		<div class="page-heading" id="tcs_s8" style="margin-bottom: 16px;">
			<div id="tcs_s2">
				<h1 class="bui-text bui-text--variant-headline_1 text-black" style="margin-bottom: 6px;">서비스 이용약관</h1>
				<p class="bui-text bui-text--variant-body_2 bui-text--color-neutral_alt m-0" style="color: #6b6b6b;font-size: 14px;">마지막 업데이트: 2022년 4월 6일</p>
			</div>
			<a href="javascript:window.print()" class="bui-group__item bui-button bui-button--tertiary bui-button--large bui-button--negative-inset-adjustment--start font-normal hide_this_for_print" role="button" data-bui-component="Button" style="color: #0071c2; text-decoration: none; gap: 10px;">
				<span class="bui-button__icon" style="vertical-align: middle;"><svg class="bk-icon -streamline-printer" height="20" width="20" fill="#0071c2" viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false"><path d="M5.25 16.499h-3a.75.75 0 0 1-.75-.75v-7.5a.75.75 0 0 1 .75-.75h19.5a.75.75 0 0 1 .75.75v7.5a.75.75 0 0 1-.75.75h-3a.75.75 0 0 0 0 1.5h3a2.25 2.25 0 0 0 2.25-2.25v-7.5a2.25 2.25 0 0 0-2.25-2.25H2.25A2.25 2.25 0 0 0 0 8.249v7.5a2.25 2.25 0 0 0 2.25 2.25h3a.75.75 0 0 0 0-1.5zm-1.5-6h1.5a.75.75 0 0 0 0-1.5h-1.5a.75.75 0 0 0 0 1.5zm1.5 3h13.5l-.75-.75v10.5l.75-.75H5.25l.75.75v-10.5l-.75.75zm0-1.5a.75.75 0 0 0-.75.75v10.5c0 .414.336.75.75.75h13.5a.75.75 0 0 0 .75-.75v-10.5a.75.75 0 0 0-.75-.75H5.25zm13.5-6H5.25l.75.75v-4.5a.75.75 0 0 1 .75-.75h10.5a.75.75 0 0 1 .75.75v4.5l.75-.75zm0 1.5a.75.75 0 0 0 .75-.75v-4.5a2.25 2.25 0 0 0-2.25-2.25H6.75a2.25 2.25 0 0 0-2.25 2.25v4.5c0 .414.336.75.75.75h13.5zm-10.5 9h7.5a.75.75 0 0 0 0-1.5h-7.5a.75.75 0 0 0 0 1.5zm0 3h5.25a.75.75 0 0 0 0-1.5H8.25a.75.75 0 0 0 0 1.5z"></path></svg></span>
				<span class="bui-button__text">인쇄</span>
			</a>
		</div>
		
		<!-- 목차 -->
		<h2 class="bui-text bui-text--variant-headline_2 text-black table-of-contents">목차</h2>
		<ul class="bui-list bui-list--text bui-text bui-text--variant-body_1 m-0 p-0 list-style-none">
			<c:set var="preTerms" value="Booqueen"/>
			<c:forEach var="termsList" items="${termsList}" varStatus="status">
				<c:if test="${termsList.category != preTerms}">
				<li class="bui-list__item mb-2">
					<a href="#terms_heading_${termsList.category}" class="bui-link decoration-none font-normal">${termsList.category}</a>
				</li>
				</c:if>
				<c:set var="preTerms" value="${termsList.category}"/>
			</c:forEach>
		</ul>
		
		<!-- 하나로 합치고 싶음 -->
		<!-- title -->
		<c:set var="preTerms" value="Booqueen"/>
		<c:forEach var="termsList" items="${termsList}" varStatus="status">
			<c:if test="${termsList.category != preTerms}">
			<c:set var="tempTerms" value="${termsList.category}"/>
			<div class="section-heading mt-8" id="terms_heading_${termsList.category}" style="margin-bottom: 8px;">
				<button type="button" class="bui-button bui-button--tertiary bui-button--large bui-button--negative-inset-adjustment--start font-normal move-top" onclick="window.scrollTo({ top: 0, behavior: 'smooth' })">맨 위로 돌아가기</button>
				<h2 class="bui-text bui-text--variant-headline_2 text-black m-0 mb-2 p-0">${termsList.category}</h2>
			</div>
			</c:if>
			<c:set var="preTerms" value="${termsList.category}"/>
			<ul class="bui-list bui-list--text bui-text bui-text--variant-body_1 m-0 p-0 list-style-none">
				<li class="bui-list__item mb-2">
					<a href="#terms_definitions_${termsList.title}" class="bui-link decoration-none font-normal">${termsList.title}</a>
				</li>
			</ul>
		</c:forEach>
		
		<!-- contents -->
		<c:set var="preTerms" value="Booqueen"/>
		<c:forEach var="termsList" items="${termsList}" varStatus="status">
			<c:if test="${termsList.category != preTerms}">
				<div class="text-black">
					<div id="tcs_s0">
						<p id="terms_definitions_${termsList.title}" class="bui-text bui-text--variant-headline_3">${termsList.title}</p>
					</div>
					<p class="bui-text bui-text--variant-body_1">${termsList.contents}</p>
				</div>
			</c:if>
		</c:forEach>
		<div class="terms-footer" style="margin-top: 25px; color: #6b6b6b; font-size: 14px;">
			<div>버전: 1.0</div>
			<div>날짜: 2022년 4월 06일</div>
			<div>본 서비스 약관은 정기적(연 1~2회)으로 갱신됩니다.</div>
		</div>
	</div>
</body>
</html>