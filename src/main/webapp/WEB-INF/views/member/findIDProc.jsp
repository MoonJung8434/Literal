<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
	
<style>
.center-div {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 80vh; /* 화면의 세로 가운데 정렬을 위해 높이 설정 */
	flex-direction: column;
	text-align: center;
}

.message-box {
	width: 400px;
	padding: 40px;
	box-sizing: border-box;
	margin: 0 auto;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.message-box > h3 {
	font-size: 24px;
	color: #6A24FE;
	margin-bottom: 20px;
}

.message-box > p {
	font-size: 18px;
	color: #333;
	margin-bottom: 20px;
}

.message-box .account-info {
	padding: 20px;
	background-color: #f8f8f8;
	border-radius: 6px;
	margin-bottom: 20px;
}

.message-box .account-info p {
	margin: 5px 0;
	font-size: 16px;
	color: #555;
}

.message-box .button-wrapper {
	display: flex;
	justify-content: center;
	gap: 10px; /* 버튼 사이의 간격 조정 */
}

.message-box .button {
	padding: 10px 20px;
	font-size: 16px;
	color: #fff;
	background-color: #6A24FE;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	text-decoration: none;
	display: inline-block;
}

.message-box .button.secondary {
	background-color: #ccc;
	color: #333;
}

.message-box .button:hover {
	background-color: #4A18CE;
}

.message-box .button.secondary:hover {
	background-color: #999;
}
</style>

<div class="center-div">
	<div class="message-box">
	
		<c:choose>
	        <c:when test="${not empty message}">
			    <h3>환영합니다, ${foundMember.name}님!</h3>
				<p>본인인증정보와 일치하는 결과입니다.</p>
				<p>로그인 후 이용해 주세요.</p>
				<div class="account-info">
					<c:out value="${message}" escapeXml="false"/>
	        	</div>
	        </c:when>
	        <c:otherwise>
	        	<div class="account-info">
	            	<c:out value="${errorMessage}" escapeXml="false"/>
	            </div>
	        </c:otherwise>
    	</c:choose>
	
		<div class="button-wrapper">
			<a href="${pageContext.request.contextPath}/member/findID" class="button">이메일 찾기</a>
			<a href="${pageContext.request.contextPath}/member/findPW" class="button secondary">비밀번호 찾기</a>
		</div>
	</div>
</div>

<%@ include file="../footer.jsp"%>
