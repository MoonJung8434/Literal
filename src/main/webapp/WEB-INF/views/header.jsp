<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">  <!-- 구글이모티콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <title>header.jsp</title>
</head>


<body>
    <div class="wrap">
        <!-- header -->
        <header>
            <div class="header-container">
               <div class="logo">
                   <a href="/"><h1>LITERAL</h1></a>
               </div>
               
               <!-- 검색 (검색 그림 수정예정 a태그) -->
			  <div class="row">
			  	<div class="col-sm-12">
					<!-- 검색 -->
					<form method="get" action="search">
						<input type="text" name="book_title" value="${book_title}">
						<input type="submit" value="검색" class="btn">
					</form>
			  	</div><!-- col end -->
			  </div><!-- row end -->

                
                <!-- header 수정 6/27애경-->   
       
				<!-- 세션에 member 속성이 있는지 확인하여 LOGIN/LOGOUT 링크를 선택적으로 표시 -->
                <div class="header-links user-actions">
				    <c:choose>
				        <c:when test="${not empty sessionScope.member}">
				        	<p>${sessionScope.member.name} 님</p> <!-- 로그인한 사람의 이름 출력 -->
				            <a href="/member/logout"><i class="fas fa-user"></i> LOGOUT</a>
				             <c:if test="${sessionScope.member.type_code == 0}">
					            <a href="/admin"><i class="fas fa-user-shield"></i> 관리자 화면</a>
					        </c:if>
				        </c:when>
				        <c:otherwise>
				            <a href="/member/login"><i class="fas fa-user"></i> LOGIN</a>
				        </c:otherwise>
				    </c:choose>
				    
				    
  					<c:choose>
				        <c:when test="${not empty sessionScope.member}">
				        	<a href="/mypage_main"><i class="fas fa-user-circle"></i> MYPAGE</a>
				        </c:when>
				        <c:otherwise>
				            <a href="/member/login"><i class="fas fa-user-circle"></i> MYPAGE</a>
				        </c:otherwise>
				    </c:choose>
                 	<a href="/cart/list"><i class="fas fa-shopping-cart"></i> CART</a>
				</div>
            </div>
        </header>

       <!-- nav 카테고리 시작 -->
	   <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	       <div class="container-fluid">
	           <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	               <span class="navbar-toggler-icon"></span>
	           </button>
	           <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
	               <ul class="navbar-nav">
	                   <li class="nav-item">
	                       <a class="navbar-brand" href="/index"><i class="fas fa-home home-icon"></i></a>
	                   </li>
	                   <li class="nav-item">
	                       <a class="nav-link font-weight-bold" href="/product/productlist">서점</a>
	                   </li>
	                   <li class="nav-item">
	                       <a class="nav-link font-weight-bold" href="/notice/notice_list">공지사항</a>
	                   </li>
	                   <li class="nav-item">
	                       <a class="nav-link font-weight-bold" href="#">열람실</a>
	                   </li>
	                   <li class="nav-item">
	                       <a class="nav-link font-weight-bold" href="#">지점안내</a>
	                   </li>
	                   <li class="nav-item">
	                       <a class="nav-link font-weight-bold" href="#">이벤트</a>
	                   </li>
	               </ul>
	           </div>
	       </div>
	   </nav>
	   <!-- nav 카테고리 끝 -->
	   
        <!-- container -->
        <div class="main">   
        