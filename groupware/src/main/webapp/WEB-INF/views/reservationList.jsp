<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RESERVATION LIST</title>
<link href='css/main.min.css' rel='stylesheet' />
<link href='css/ko_calendar.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/rrule@2.6.4/dist/es5/rrule.min.js'></script>
<script src='js/main.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/rrule@5.11.5/main.global.min.js'></script>
<script src='js/ko.js'></script>
</head>
<%@ include file ="P_header.jsp" %>
<script src='https://code.jquery.com/jquery-Latest.js'></script>
<script src='js/reservation/reservationList.js'></script>
<body>
<div class='pageCalendar'>
	<div class='sideBar'>
		<h3 class="c_title" id="c_title" style="margin-left:0px;">예 약</h3>
		<button class="addPlanBtn" id="btnReservation">회의실 예약</button>
	</div>
	<div id='calendar' class="calendar"></div>
</div>
</body>
</html>