<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='css/main.min.css' rel='stylesheet' />
<link href='css/ko_calendar.css' rel='stylesheet' />
<script src='js/ko.js'></script>
<script src='js/main.min.js'></script>
</head>
<%-- <%@ include file ="P_header.jsp" %> --%>
<script src='https://code.jquery.com/jquery-Latest.js'></script>
<script>
let plan; // 이벤트를 담을 변수 선언

document.addEventListener('DOMContentLoaded', function() {
	$.post('/getPlan',{}, function(data){
		plan = data;

		var calendarEl = document.getElementById('calendar');  
		var calendar = new FullCalendar.Calendar(calendarEl, {
			googleCalendarApiKey : "AIzaSyCUK8ocVStSIhpAkkQPF2KXgRIilfprcnI",
			height: 920,
			aspectRatio: 1,
		  	locale: "ko",
		  	initialView: 'dayGridMonth',
		  	navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
		  	editable: true, // 수정 가능?
		  	nowIndicator: true, // 현재 시간 마크
		  	dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
		    eventSources: [
		    	{
	            googleCalendarId : '30acb7adba3717dd139c468626b00a0d5228cd594c6a720658c1234ce7cc5499@group.calendar.google.com',
	            className: '일정'
	            },
	            {
	            googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com',
	            className: 'koreanHoliday',
	            color:'#fa573c'
	            }
		    	],
		 	events : plan.map(function(item) {
		      	return {
		      		id: item.calendar_no,
		          	title: item.calendar_title,
		          	start: item.calendar_start,
		          	end: item.calendar_end,
		          	color: "#cd74e6"
		      	};
		  	}).concat({
			  	id: '아이디',
		      	title: '회의실예약',
		     	start: '2023-09-28T08:00:00',
		      	end: '2023-09-28T12:00:00'
		  	}),

		  	headerToolbar: {
			  	left: 'prev today next',
			  	center: 'title',
			  	right: 'dayGridMonth, timeGridWeek, timeGridDay, listMonth'
		  	},
		});
		calendar.render();
	},'json');
});
</script>
<body>
<div class='pageCalendar'>
	<div class='sideBar'>
		<h2 class="c_title" id="c_title" style="margin-left:15px;">캘린더</h2>
		<button class="addPlanBtn" id="addPlanBtn">일정등록</button>
	</div>
	<div id='calendar' class="calendar"></div>
</div>
</body>
<script>
$(document)
.on('click','#addPlanBtn',function(){	//일정등록버튼을 클릭했을 때
	document.location="/ko_addPlan"
})

</script>
</html>