<!-- mypage_main.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_admin.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">


	<!-- 본문 시작 -->

	<div class="main-content">
		<div class="content">
			<div class="header">
				<a href="admin/memberList"><h1>회원정보관리</h1></a>
				<a href="admin/productlist_admin"><h1>상품관리</h1></a>
				<a href="#"><h1>지점관리</h1></a>
				<a href="#"><h1>공지사항관리</h1></a>
				<a href="#"><h1>이벤트관리</h1></a>
			
				<div class="order-status"></div>
			</div>
		</div>
	</div> <!-- <div class="main-content"> end -->
	<!-- 본문 끝 -->
	</div> <!-- <div class="contents_inner"> end -->

</main>
<%@ include file="../footer.jsp"%>