<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/contact/company.js"></script>
<link href='css/contact/company.css' rel='stylesheet' />
<title>주소록</title>
</head>
<body>
	<input type="hidden" id="user_id" value="${sessionScope.userid}">
	<%@ include file="/WEB-INF/views/P_header.jsp"%>

	<aside>
		<div class="sidebar">
			<section id="attendance_section">
				<h2 style="font-size: 28px;">
					<img src="/img/contact-book.png" alt="로고 이미지" class="contact-img">연락처
				</h2>
				<p id="date_info"></p>
				<p id="time_info">
					<span id="current_time"></span>
				</p>
				<a href="/company">사내 주소록</a> <a href="/personal">개인 주소록</a>
			</section>
		</div>
	</aside>

	<main class="main">
		<div class="header">
			<h1>사내 주소록</h1>
		</div>

		<!-- 주소록 목록을 나타내는 테이블 예시 -->
		<table class="styled-table">
			<thead>
				<tr>
					<th class="name-col" onclick="sort('name', currentPage)">이름</th>
					<th class="department-col"
						onclick="sort('department', currentPage)">부서</th>
					<th class="position-col" onclick="sort('position', currentPage)">직위</th>
					<th class="phone-col" onclick="sort('phone', currentPage)">휴대폰</th>
					<th class="email-col" onclick="sort('email', currentPage)">Email</th>
				</tr>
			</thead>
			<tbody id="contactListBody">
				<!-- 이 부분에 주소록 데이터를 동적으로 추가합니다. -->
			</tbody>
		</table>

		<!-- 페이지네이션을 원하는 위치에 배치합니다. -->
		<div id="pagination"></div>
	</main>
</body>
</html>
