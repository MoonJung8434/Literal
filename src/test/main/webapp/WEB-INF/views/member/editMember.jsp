<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/side_menu.css">

<main>
	<!--사이드 메뉴 시작  -->
	<div class="contents_inner">
		<div class="sidebar">
			<h2>마이페이지</h2>
			<ul>
				<li><a href="#">회원 정보 수정</a></li>
				<li><a href="#">나의 서점</a></li>
				<li><a href="#">리뷰</a></li>
				<li><a href="#">1:1 문의</a></li>
			</ul>
		</div>
		<!--사이드 메뉴 끝  -->
		


		<!-- 본문 시작 -->
		<div class="main-content">

			<div class="member-form-wrapper">
				<h3>회원 정보 수정</h3>
				<form name="memberForm" id="memberForm" method="post" action="${pageContext.request.contextPath}/member/updateMember" onsubmit="return confirm('수정하시겠습니까?')">
				        <input type="hidden" name="email" value="${member.email}" />
				        <table class="table">
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" id="name" size="20"
								maxlength="10" value="${member.name}" required></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="password" id="password"
								size="20" maxlength="20" value="${member.password}" required></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="phone_number" id="phone_number"
								size="15" maxlength="15" value="${member.phone_number}" required></td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td><input type="text" name="zipcode" id="zipcode" size="5"
								value="${member.zipcode}" readonly required> <input
								type="button" value="주소찾기" onclick="DaumPostcode()"
								class="small-button"></td>
						</tr>
						<tr>
							<td colspan="2">
								<div id="wrap"></div>
							</td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text" name="address1" id="address1"
								size="45" value="${member.address1}" readonly required></td>
						</tr>
						<tr>
							<td>상세주소</td>
							<td><input type="text" name="address2" id="address2"
								size="45" value="${member.address2}" required></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><input type="date" name="birth_date" id="birth_date"
								value="${member.birth_date}" required></td>
						</tr>
						<tr>
							<td>은행</td>
							<td><select name="bank" id="bank" required>
									<option value="신한"
										<c:if test="${member.bank == '신한'}">selected</c:if>>신한</option>
									<option value="국민"
										<c:if test="${member.bank == '국민'}">selected</c:if>>국민</option>
									<option value="농협"
										<c:if test="${member.bank == '농협'}">selected</c:if>>농협</option>
									<option value="우리"
										<c:if test="${member.bank == '우리'}">selected</c:if>>우리</option>
									<option value="케이뱅크"
										<c:if test="${member.bank == '케이뱅크'}">selected</c:if>>케이뱅크</option>
									<option value="카카오뱅크"
										<c:if test="${member.bank == '카카오뱅크'}">selected</c:if>>카카오뱅크</option>
									<option value="토스뱅크"
										<c:if test="${member.bank == '토스뱅크'}">selected</c:if>>토스뱅크</option>
									<option value="기업"
										<c:if test="${member.bank == '기업'}">selected</c:if>>기업</option>
									<option value="우체국"
										<c:if test="${member.bank == '우체국'}">selected</c:if>>우체국</option>
							</select></td>
						</tr>
						<tr>
							<td>계좌번호</td>
							<td><input type="text" name="account_number"
								id="account_number" size="30" maxlength="30"
								value="${member.account_number}" required></td>
						</tr>
						<tr>
							<td colspan="2">
			                    <div class="button-wrapper">
			                        <input type="submit" value="수정">
			                        <input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/mypage_main'">
			                    </div>
							</td>
						</tr>
					</table>
				</form>
				
				<!-- 회원 탈퇴 링크 -->
				<div class="button-wrapper">
				    <a href="#" class="red-text" onclick="confirmDelete()">탈퇴하기</a>
				</div>
								
			</div>

			<!-- ----- DAUM 우편번호 API 시작 ----- -->
			<script
				src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        element_wrap.style.display = 'none';
    }//foldDaumPostcode() end

    function DaumPostcode() {
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("address2").value = extraAddr;
                } else {
                    document.getElementById("address2").value = '';
                }

                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address1").value = addr;
                document.getElementById("address2").focus();

                element_wrap.style.display = 'none';
                document.body.scrollTop = currentScroll;
            },
            onresize: function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width: '100%',
            height: '100%'
        }).embed(element_wrap);

        element_wrap.style.display = 'block';
    }//DaumPostcode() end

 	// 우편번호 입력 필드에 커서를 가져다 놓았을 때 자동으로 Daum Postcode 함수 호출
    document.getElementById('zipcode').addEventListener('focus', DaumPostcode);
    
<!-- ----- DAUM 우편번호 API 종료----- -->
    
    
		// 유효성 검사 함수
		function validateForm() {
		    var name = document.getElementById("name").value;
		    var password = document.getElementById("password").value;
		    var repassword = document.getElementById("repassword").value;
		    var phone_number = document.getElementById("phone_number").value;
		    var account_number = document.getElementById("account_number").value;
		
		    if (name.length > 10) {
		        alert("이름은 10자 이하로 입력해주세요.");
		        return false;
		    }
		
		    if (password.length > 20) {
		        alert("비밀번호는 20자 이하로 입력해주세요.");
		        return false;
		    }
		
		    if (password !== repassword) {
		        alert("비밀번호가 일치하지 않습니다.");
		        return false;
		    }
		
		    if (phone_number.length > 15) {
		        alert("전화번호는 15자 이하로 입력해주세요.");
		        return false;
		    }
		
		    if (account_number.length > 30) {
		        alert("계좌번호는 30자 이하로 입력해주세요.");
		        return false;
		    }
		
		    return true; // 모든 유효성 검사를 통과한 경우 폼을 제출합니다.
		}//validateForm() end
		
		// 탈퇴확인문구
		function confirmDelete() {
        if (confirm('정말 탈퇴하시겠습니까?')) {
            document.getElementById('deleteMemberForm').submit();
        	}
   		}//confirmDelete() end	
</script>

		<form id="deleteMemberForm" action="${pageContext.request.contextPath}/member/deleteMember" method="post">
		    <input type="hidden" name="email" value="${member.email}">
		</form>
				


		</div>
		<!-- <div class="main-content"> end -->
		<!-- 본문 끝 -->
	</div>
	<!-- <div class="contents_inner"> end -->

</main>
<%@ include file="../footer.jsp"%>


<style>
/* memberForm.css */
.member-form-wrapper {
	width: 600px;
	padding: 40px;
	box-sizing: border-box;
	margin: 0 auto;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.member-form-wrapper>h3 {
	font-size: 24px;
	color: #6A24FE;
	text-align: center;
	margin-bottom: 20px;
}

#memberForm input[type="text"], #memberForm input[type="email"],
	#memberForm input[type="password"], #memberForm input[type="date"],
	#memberForm input[type="submit"], #memberForm input[type="button"],
	#memberForm select {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	background-color: #F8F8F8;
	border: 1px solid #ccc;
	transition: background-color 0.3s, color 0.3s;
}

#memberForm input::placeholder {
	color: #D2D2D2;
}

#memberForm input[type="submit"], #memberForm input[type="button"] {
	color: #fff;
	font-size: 16px;
	background-color: #6A24FE;
	cursor: pointer;
	width: auto; /* 버튼 너비 자동 조정 */
	padding: 10px 20px; /* 버튼 안쪽 여백 조정 */
	transition: background-color 0.3s, color 0.3s;
}

#memberForm input[type="button"] {
	background-color: #ccc;
}

#memberForm input[type="button"]:hover {
	background-color: #4A18CE; /* 호버 시 배경색 변경 */
	color: #fff; /* 호버 시 텍스트 색상 변경 */
}

.button-wrapper {
	text-align: center;
	display: flex;
	justify-content: center;
	gap: 10px; /* 버튼 사이의 간격 조정 */
}

#wrap {
	width: 100%;
	max-width: 600px; /* form의 최대 너비에 맞추기 */
	border: 1px solid #ccc;
	padding: 10px;
	margin-top: 10px;
	display: none;
	position: relative;
	z-index: 1000;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

#memberForm input[type="radio"] {
	margin-right: 10px;
}

#memberForm label {
	margin-right: 20px;
}

.red-text {
    color: red;
    text-decoration: none;
}

.red-text:hover {
    text-decoration: underline;
}

</style>