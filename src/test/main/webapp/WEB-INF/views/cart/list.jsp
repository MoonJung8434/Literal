<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- cartlist.jsp -->

	<!-- 본문 시작 -->
	<div class="container text-center">
		<!-- 본문 시작 -->
		<div class="row">
	         <div class="col-sm-12">
	             <p><h2>장바구니</h2></p>
	         </div><!-- col end -->
		</div><!-- row end -->
		         
		    
		<table class="cart-table">
		    <thead>
		        <tr>
		            <th>선택</th>
		            <th>상품 정보</th>
		            <th>주문금액/수량</th>
		        </tr>
		    </thead>
		    <tbody>
		        <c:forEach items="${cartLtst}" var="item" >
	                <tr>
	                    <td>
	                    	<input type="checkbox" name="selected" id="cart-product"<c:if test="${item.select_yn}">checked</c:if>>
	                    	<label for="cart-product"></label>
	                    </td>
	                    <td>
	                        <img src="${item.book_image}" alt="${item.book_title}"><br>
	                        ${item.book_title}<br>
	                    </td>
	                    <td>
	                        <c:if test="${item.event_yn}">
	                            <span style="text-decoration: line-through;">${item.sale_price}</span><br>
	                            ${item.sale_price}
	                        </c:if>
	                        <c:if test="${!item.event_yn}">
	                            ${item.sale_price}
	                        </c:if>
	                        <br>
	                        수량: ${item.cart_amount}
	                    </td>
	               </tr>
          	  </c:forEach>
		    </tbody>
		</table>
		
		<div class="btn-area">
			<input type="button"  class="btn btn-primary" value="삭제">
			<input type="button"  class="btn btn-success"  value="쇼핑계속하기">
			<input type="button"  class="btn btn-warning"  value="주문하기">
		</div>


	</div>
	<!-- Content 끝 -->	
	<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>


<style>
	h2{
		color: #3d3c3f;
		text-align:left;
	}
	.cart-table {
		width: 100%;
		border-collapse: collapse;
		margin-top: 15px;
	}
	.cart-table th, .cart-table td {
		font-size: 14px;
	    color: #80888a;
	    font-weight: 400;
	    padding: 8px;
	    border-bottom:1px solid #ddd;
	}
	.cart-table th {
	    text-align: center;
	}
	.cart-table img {
	    max-width: 100px;
	}
	
	.btn-area{
		margin-top:20px;
	}
</style>