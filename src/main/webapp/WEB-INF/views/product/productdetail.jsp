<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/side_menu.css">
 
 <!-- productdetail.jsp -->

<!--사이드 메뉴 시작  -->
<div class="contents_inner">
    <div class="sidebar">
        <h2> 국내도서 </h2>
        <ul>
            <li><a href="#">고전소설</a></li>
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
	<div class="main-content">  		
		<div class="row">
			<div class="col-sm-12">
			<h3 class="productlist text-center"> [상 품] </h3>
			<p>
				<button type="button" class="btn btn-newproduct" onclick="location.href='${pageContext.request.contextPath}/product/productlist'"> 상품 목록 </button>
			</p>
			</div> <!-- class="col-sm-12" end -->
			
        <div class="container">
            <div class="content-inner">
                <div class="book-img">
					<c:if test="${product.img != '-'}">
						<img src="/storage/images/${product.img}" width="100px">
					</c:if>                
                </div> <!-- <div class="book-img"> end -->
                			
				<div class="book-detail">
		            <div class="book-info">
		                <h2 class="book-title"> ${product.book_title} </h2>
		                <p class="book-info-item">
		                    <span class="author"> "${product.author}" </span>
		                    <span> 저자 </span>
		                </p>
		                <div class="price-area">
		                    <p>
								<span class="discount"> ${product.original_price} 원 </span>
		                        →
		                        <span class="price"> ${product.sale_price} 원 </span>
		                    </p>
		                </div>
		                <p class="book-info-item">
		                    <span> ${product.book_detail} </span>
		                </p>
		            </div>
		            <div class="price-box">
		                <p> 등록된 책 </p>
		                <form name="actionForm" id="actionForm" method="post" enctype="multipart/form-data">
			                <table class="price-box-tb table">
			                    <tbody>
			                    <tr>
				                    <td width="33.3%"></td>
				                    <td width="33.3%"></td>
				                    <td width="33.3%"></td>
			                    </tr>
								<tr>
									<td colspan="4" align="center">
										<input type="hidden" name="book_number" value="${product.book_number}">
										<input type="button" value="장바구니 담기" onclick="" class="btn btn-info">
									</td>
							    </tr> 	                    
			                    </tbody>
			                </table>
		                </form>
		            </div> <!-- class="price-box" end -->
				</div> <!-- class="book-detail" end -->		
			</div> <!-- class="content-inner" end -->
  		</div> <!-- class="container" end -->
	</div> <!-- class="row" end -->
</div> <!-- div class="main-content" end -->
<!-- 본문 끝 -->
</div> <!-- class="contents_inner" end -->

<%@ include file="../footer.jsp"%>


	<style>
	.container {
	    background-color: #fff;
	    border-radius: 8px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    overflow: hidden;
	    width: 80%;
	    max-width: 1200px;
	    height: 100vh;
	}
	
	.content-inner {
	    display: flex;
	    padding: 20px;
	}
	
	.book-img {
	    flex: 1;
	    padding-right: 20px;
	}
	
	.book-img img {
	    width: 100%;
	    height: auto;
	    border-radius: 8px;
	}
	
	.book-detail {
	    flex: 2;
	    padding-left:20px;
	    position:relative;
	}
	
	.book-info {
	    margin-bottom: 20px;
	    border-bottom: 1px solid #ccc;
	    padding-bottom: 20px;
	}
	
	.book-title {
	    font-size: 2em;
	    margin-bottom: 10px;
	    color: #333;
	}
	
	.book-info-item {
	    margin-bottom: 10px;
	}
	
	.author {
	    font-weight: bold;
	    color: #555;
	}
	
	.price {
	    font-size: 1.5em;
	    color: #e74c3c;
	    margin-right: 10px;
	}
	
	.discount {
	    text-decoration: line-through;
	    color: #888;
	}
	
	.price-area{
	    margin-top:20px;
	}
	
	.price-box p{
	    margin-bottom:20px;
	}
	
	.price-box-tb{
	    margin-top:50px;
	    margin-bottom:20px;
	    text-align:center;
	}
	
	.button-area{
	    position:absolute;
	    bottom:0;
	    left: 50%;
	    transform: translate(-50%);
	}
	
	.button-area input[type="button"]{
	    height:50px;
	}
	
	p {
	    margin: 0;
	    color: #333;
	}
	
	p + p {
	    margin-top: 10px;
	}
	
	@media (max-width: 768px) {
	    .content-inner {
	        flex-direction: column;
	    }
	
	    .book-img {
	        padding-right: 0;
	        margin-bottom: 20px;
	    }
	}
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