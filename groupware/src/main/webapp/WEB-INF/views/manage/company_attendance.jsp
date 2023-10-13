<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
<link href="css/manage/company_attendance.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- jQuery 라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/manage/company_attendance.js"></script>
<meta charset="UTF-8">
<title>근태관리</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/P_header.jsp"%>
	<input type="hidden" id="user_id" value="${sessionScope.userid}">
	<input type="hidden" id="user_name" value="${name}">

	<aside>
		<div class="sidebar">
			<section id="attendance_section">
				<h2>
					<a href="/attendance_management/attendance">근태관리</a>
				</h2>
				<p id="date_info">1</p>
				<p id="time_info">
					<span id="current_time"></span>
				</p>
				<!--       		<button class="btn btn-success m-2" id="btnCheckIn">출근하기</button>
			<button class="btn btn-warning m-2" id="btnCheckOut" disabled>퇴근하기</button> -->
				<!--             <label for="status_select">근무상태 변경:</label> -->

				<!--    <select id="status_select">
        <option value="업무상태변경" selected disabled hidden>근무상태변경</option>
        <option value="업무">업무</option>
        <option value="업무종료">업무종료</option>
        <option value="외근">외근</option>
        <option value="출장">출장</option>
        <option value="반차">반차</option>
    </select> -->

			</section>
			<hr>

			<!--         <p id="checkin_time">출근시간: <span id="start_time"></span></p>
        <p id="checkout_time">퇴근시간: <span id="end_time"></span></p> -->

			<section id="my_attendance_section">
				<br>
				<br>
				<br>
				<br>
				<h2>전사 근태관리</h2>
				<ul>
					<li><a href="/manage/company_attendance">전사 근태현황</a></li>
				</ul>
			</section>
		</div>
	</aside>

	<main class="main">
		<div class="header">
			<h1>전체 사원 근태 현황</h1>
		</div>

		<div class="month-navigation">
			<button id="prevMonthButton">&lt;</button>
			<span id="current_month"></span>
			<button id="nextMonthButton">&gt;</button>
		</div>

		<div class="attendance-summary">
			<!-- 	    <div>
	        <span id="accumulated_month"></span>
	        <p id="accumulated_time"></p>
	    </div>
	    <div>
	        <span>이번달 초과:</span>
	        <p>Y 시간</p>
	    </div>
	    <div>
	        <span id="remaining_month"></span>
	        <p id="remaining_time"></p>
	    </div> -->
		</div>




		<table>
			<thead>
				<tr>
					<th class="name-col" onclick="sort('name', currentPage)">부서원</th>
					<th class="department-col"
						onclick="sort('department', currentPage)">부서명</th>
					<th>누적 근무 시간</th>
					<th>잔여 근무 시간</th>
				</tr>
			</thead>
			<tbody id="attendanceListBody">

			</tbody>

		</table>
		<div id="pagination"></div>

	</main>

	<c:forEach items="${time}" var="item">
		<input type="hidden" id="start_time" value="${item.startTime}">
		<input type="hidden" id="end_time" value="${item.endTime}">
		<input type="hidden" id="date" value="${item.date}">
	</c:forEach>


</body>
</html>