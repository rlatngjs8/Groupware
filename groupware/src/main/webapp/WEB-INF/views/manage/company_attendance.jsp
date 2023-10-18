<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
			</section>
			<hr>
			<section id="my_attendance_section">
				<br>
				<br>
				<br>
				<br>
				<h2>전사 근태관리</h2>
				<ul>
							<li><a href="/company_attendance" style="font-size: 15px;">개인 근태 누적 현황 조회</a></li>
              <li><a href="/manage_attendance" style="font-size: 15px;">전사 근태 현황 조회</a></li>
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
		<div id="pagination">
		
		</div>
	</main>
	<c:forEach items="${time}" var="item">
		<input type="hidden" id="start_time" value="${item.startTime}">
		<input type="hidden" id="end_time" value="${item.endTime}">
		<input type="hidden" id="date" value="${item.date}">
	</c:forEach>
</body>
</html>