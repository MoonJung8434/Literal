<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/side_menu.css">

<main>
    <!-- 사이드 메뉴 시작 -->
    <div class="contents_inner">
        <div class="sidebar">
            <h2>열람실 예약</h2>
            <ul>
                <li><a href="<c:url value='/gn_reservationForm'><c:param name='branch_code' value='L01'/></c:url>">강남점</a></li>
                <li><a href="${pageContext.request.contextPath}/yh_reservationForm?branch_code=L02">연희점</a></li>
                <li><a href="${pageContext.request.contextPath}/jn_reservationForm?branch_code=L03">종로점</a></li>
            </ul>
        </div>
        <!-- 사이드 메뉴 끝 -->
        
        <!-- 본문 시작 -->
        <div class="reservation-form">
            <h1>강남점</h1> <!-- 나중에 지워도 됩니다. -->
            <h1>${branch.branch_code}</h1>
            <h1>${branch.branch_detail}</h1>
            <hr class="title-divider">
             <div class="seat">
                <form id="reservationForm" action="${pageContext.request.contextPath}/submitReservation" method="post">
                    <input type="hidden" name="branch" value="${branch.branch_code}">
                    <div class="seatArea">
                        <c:forEach var="seat" items="${seat}">
                            <c:if test="${seat.visible}">
                                <button type="button" class="seat" data-seat="${seat.seat_code}">${seat.seat_code}<br>남은 시간:</button>
                            </c:if>
                            <c:if test="${!seat.visible}">
                                <button type="button" class="seat seat_hidden">hidden</button>
                            </c:if>
                        </c:forEach>
                    </div>
                    <input type="hidden" name="seat" id="selectedSeat">
                    <button type="submit" class="btn-primary">예약하기</button>
                </form>
            </div>
        </div>
        <!-- 본문 끝 -->
    </div>
</main>
<%@ include file="../footer.jsp"%>

<!-- JavaScript 코드 -->
<script>
document.addEventListener("DOMContentLoaded", function() {
    const seats = document.querySelectorAll(".seat");
    let selectedSeat = null;

    seats.forEach(seat => {
        seat.addEventListener("click", function() {
            if (selectedSeat) {
                selectedSeat.classList.remove("selected");
            }
            selectedSeat = this;
            selectedSeat.classList.add("selected");
            document.getElementById("selectedSeat").value = selectedSeat.getAttribute("data-seat");
            console.log("Selected Seat:", selectedSeat.getAttribute("data-seat"));  // 디버깅용 로그
        });
    });

    document.getElementById("reservationForm").addEventListener("submit", function(event) {
        const selectedSeatValue = document.getElementById("selectedSeat").value;
        console.log("Selected Seat Value:", selectedSeatValue);  // 디버깅용 로그
        if (!selectedSeatValue) {
            event.preventDefault();
            alert("좌석을 선택해주세요.");
        }
    });
});
</script>