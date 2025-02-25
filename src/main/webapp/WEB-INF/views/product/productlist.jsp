<!-- productlist.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/side_menu.css">

<!--사이드 메뉴 시작  -->
<div class="contents_inner">
    <div class="sidebar">
        <h2> 국내도서 </h2>
        <ul>
            <li><a href="G_productlist">고전소설</a></li>
            <li><a href="#">공포/미스테리소설</a></li>
            <li><a href="#">역사소설</a></li>
            <li><a href="#">판타지/과학소설</a></li>
            <li><a href="#">로맨스소설</a></li>
            <li><a href="#">무협소설</a></li>
            <li><a href="#">청소년소설</a></li>
            <li><a href="#">웹/드라마/영화소설</a></li>
        </ul>
    </div> <!-- <div class="sidebar"> end -->
 <!--사이드 메뉴 끝  -->
 <!-- 본문 시작 -->
 	<style>
	/* Custom button style */
	.btn-newproduct {
	    background-color: #FA8072;
	    border: none;
	    color: black;
	    padding: 10px 20px;
	    cursor: pointer;
	    font-size: 16px;
	}
	
	.btn-newproduct:hover {
	    background-color: #FF4500;
	}
	</style>
	
	<div class="main-content">
		<div class="row">
			<div class="col-sm-12">
			<h3 class="productlist text-center"> [전 체 목 록] </h3>
			<p>
				<button type="button" class="btn btn-newproduct" onclick="location.href='productwrite'"> 상품 등록 </button>
			</p>
			</div>
  		</div> <!-- row end -->
	  
	  	<div class="row">
		<c:forEach items="${list}" var="row" varStatus="vs">
			<div class="col-sm-4 col-md-4">
				<a href="productdetail/${row.book_number}">
					<img src="/storage/images/${row.img}" class="img-responsive margin" style="width:100px">
				</a>
				<br>
				상품명 :
				<a href="productdetail/${row.book_number}"> ${row.book_title} </a>
	
				<br>
				상품가격 : <fmt:formatNumber value="${row.original_price}" pattern="#,###" /> 원 → 
						<fmt:formatNumber value="${row.sale_price}" pattern="#,###" /> 원
				
				<!-- 한줄에 3칸씩 -->
				<c:if test="${vs.count mod 3 == 0}">
				</div><!-- row end -->
					<div style="height: 50px;"> </div>
	  				<div class="row">
				</c:if>
				
			</div>
		</c:forEach>
	  </div><!-- row end -->
  	
	</div> <!-- <div class="main-content"> end -->
<!-- 본문 끝 -->
</div> <!-- <div class="contents_inner"> end -->
	
<%@ include file="../footer.jsp"%>