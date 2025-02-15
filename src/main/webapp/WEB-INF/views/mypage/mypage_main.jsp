<!-- mypage_main.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/side_menu.css">

<main>

	<!--사이드 메뉴 시작  -->
	<div class="contents_inner">
		<div class="sidebar">
			<h2>마이페이지</h2>
			<ul>
				<li><a href="${pageContext.request.contextPath}/member/editMember?email=${sessionScope.member.email}" class="button">회원정보수정/삭제</a></li>
				<li><a href="#">나의서점</a></li>
				<li><a href="#">리뷰</a></li>
				<li><a href="#">1:1문의</a></li>
			</ul>
		</div>
	<!--사이드 메뉴 끝  -->


	<!-- 본문 시작 -->


	<div class="main-content">
		<div class="content">
			<div class="header">
				<h1>주문배송조회</h1>
				<div class="order-status"></div>
			</div>
			<div class="section">
				<div class="section-title">나의 서점 관리</div>
				<p>관심있는 책을 등록해 주세요</p>
			</div>
		</div>
	</div> <!-- <div class="main-content"> end -->
	<!-- 본문 끝 -->
	</div> <!-- <div class="contents_inner"> end -->

</main>
<%@ include file="../footer.jsp"%>