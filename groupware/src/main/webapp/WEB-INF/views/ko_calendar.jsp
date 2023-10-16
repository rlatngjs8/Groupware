<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CALENDAR</title>
<link href='css/main.min.css' rel='stylesheet' />
<link href='css/ko_calendar.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/rrule@2.6.4/dist/es5/rrule.min.js'></script>
<script src='js/main.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/rrule@5.11.5/main.global.min.js'></script>
<script src='js/ko.js'></script>
</head>
<%@ include file ="P_header.jsp" %>
<script src='https://code.jquery.com/jquery-Latest.js'></script>
<script src='js/calendar/ko_calendar.js'></script>
<body>
<div class='pageCalendar'>
	<div class='sideBar'>
		<h3 class="c_title" id="c_title" style="margin-left:0px;">캘린더</h3>
		<button class="addPlanBtn" id="addPlanBtn">일정등록</button>
		<table class="sideBarTbl">
			<tbody>
			<tr>
				<td class="planTd">공휴일</td><td><div class="circle" style="background-color:#fa573c;"></div></td>
			</tr>
			<tr>
				<td class="planTd">일정</td><td><div class="circle" style="background-color:#cd74e6;"></div></td>
			</tr>
			<tr>
				<td class="planTd">직원 생일</td><td><div class="circle" style="background-color:#ffad46;"></div></td>
			</tr>
			<tr>
				<td class="planTd">회의실 예약</td><td><div class="circle" style="background-color:#16a765;"></div></td>
			</tr>
			</tbody>
		</table>
	</div>
	<div id='calendar' class="calendar"></div>
</div>
</body>
</html>