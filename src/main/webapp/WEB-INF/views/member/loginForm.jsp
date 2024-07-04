<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<!-- 본문 시작 -->

<style>
.center-div {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;  /* 화면의 세로 가운데 정렬을 위해 높이 설정 */
	width: 100%;
}

.login-form-wrapper {
  	width: 100%;
    max-width: 600px;
	width: 400px;
	padding: 40px;
	box-sizing: border-box;
	margin: 0 auto;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.login-form-wrapper>h3 {
	font-size: 24px;
	color: #6A24FE;
	text-align: center;
	margin-bottom: 20px;
}

#loginfrm input[type="email"], #loginfrm input[type="password"],
	#loginfrm input[type="submit"] {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	background-color: #F8F8F8;
	border: 1px solid #ccc;
}

#loginfrm input::placeholder {
	color: #D2D2D2;
}

#loginfrm input[type="submit"] {
	color: #fff;
	font-size: 16px;
	background-color: #6A24FE;
	margin-top: 20px;
	cursor: pointer;
}

#loginfrm input[type="checkbox"] {
	margin-right: 8px;
}

.login-links {
	text-align: center;
	margin-top: 10px;
}

.login-links a {
	color: #6A24FE;
	text-decoration: none;
	margin: 0 5px;
}

.login-links a:hover {
	text-decoration: underline;
}

.alert {
	text-align: center;
	margin-top: 10px;
	padding: 10px;
	border-radius: 6px;
}

.alert-danger {
	color: #721c24;
	background-color: #f8d7da;
	border-color: #f5c6cb;
}

.alert-success {
	color: #155724;
	background-color: #d4edda;
	border-color: #c3e6cb;
}


</style>

<div class="center-div">
	<div class="login-form-wrapper">
		<h3>로그인</h3>
		<form name="loginfrm" id="loginfrm" action="${pageContext.request.contextPath}/member/login" method="post">
			<table class="table" style="width: 100%; margin: 0 auto;">
				<tr>
					<td colspan="2"><input type="email" name="email" id="email" placeholder="이메일" maxlength="50" required></td><!-- required 속성으로 지정되어 있어서 빈칸이 나올경우 보여짐 -->
				</tr>
				<tr>
					<td colspan="2"><input type="password" name="password" id="passwd" placeholder="비밀번호" maxlength="50" required></td>
				</tr>
				<tr>
					<td colspan="2"><label> <input type="checkbox" name="c_email" value="SAVE"> 이메일 저장
					</label></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="로그인"></td>
				</tr>
			</table>
			<div class="login-links">
				<a href="${pageContext.request.contextPath}/member/agreement">[회원가입]</a>
				<a href="${pageContext.request.contextPath}/member/findID">[이메일/비밀번호찾기]</a>
			</div>
			
			<div class="wrap">
			     <a class="kakao" href="https://kauth.kakao.com/oauth/authorize?client_id=1d2c6fcb1c84e26382b93490500af756&redirect_uri=http://localhost:8080/kakao_callback&response_type=code">

			        
			      	<div class="kakao_i"></div>
			      	<div class="kakao_txt">카카오톡으로 간편로그인 </div>
			   	</a>
			</div>
			
		</form>
		<!-- 에러 메시지를 출력할 영역 -->
		<c:if test="${not empty errorMessage}">
            <div class="alert alert-danger"><c:out value="${errorMessage}" escapeXml="false"/></div>
        </c:if>
	</div>
</div>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>


<script>
	// DOMContentLoaded 이벤트는 HTML 문서의 초기 구문 분석이 완료되었을 때 발생합니다.
	document.addEventListener("DOMContentLoaded", function() {
		// 쿠키 값을 읽어오는 함수
		function getCookie(name) {
			let cookieValue = ""; // 쿠키 값을 저장할 변수 초기화
			// document.cookie가 존재하면 세미콜론으로 구분된 쿠키 문자열을 배열로 변환
			let cookies = document.cookie ? document.cookie.split(';') : [];
			// 쿠키 배열을 순회하면서
			for (let i = 0; i < cookies.length; i++) {
				// 각 쿠키 문자열의 앞뒤 공백을 제거
				let cookie = cookies[i].trim();
				// 쿠키 이름이 일치하는지 확인
				if (cookie.substring(0, name.length + 1) === (name + '=')) {
					// 쿠키 값을 디코딩하여 cookieValue에 저장
					cookieValue = decodeURIComponent(cookie
							.substring(name.length + 1));
					break; // 일치하는 쿠키를 찾으면 반복 종료
				}
			}
			return cookieValue; // 쿠키 값을 반환
		}

		// 쿠키에서 'c_email' 값을 읽어서 이메일 입력란에 설정
		const emailInput = document.getElementById('email'); // 이메일 입력란 요소 가져오기
		const c_email = getCookie('c_email'); // 'c_email' 쿠키 값 가져오기
		if (c_email) {
			emailInput.value = c_email; // 'c_email' 쿠키 값이 있으면 이메일 입력란에 설정
			document.querySelector('input[name="c_email"]').checked = true; // '이메일 저장' 체크박스를 체크 상태로 설정
		}
	});
	
	
	
	//아이디 비밀번호 유효성검사   -> required 속성 지정되어 있으면 빈칸일 경우 작성해달라는 문구 나옴
/*     function validate_loginForm() {
        var email = document.getElementById("email").value;
        var password = document.getElementById("passwd").value;
        if (!email) {
            alert("이메일을 입력해 주세요.");
            return false; // 폼 제출 중단
        }
        if (!password) {
            alert("비밀번호를 입력해 주세요.");
            return false; // 폼 제출 중단
        }
        return true; // 폼 제출 진행
    }//validate_loginForm() end
 */
</script>