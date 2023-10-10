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
<script>
let plan; // 이벤트를 담을 변수 선언

document.addEventListener('DOMContentLoaded', function() {
	$.get('/getPlan',{}, function(data){
		plan = data;

		var calendarEl = document.getElementById('calendar');  
		var calendar = new FullCalendar.Calendar(calendarEl, {
			googleCalendarApiKey : "AIzaSyCUK8ocVStSIhpAkkQPF2KXgRIilfprcnI",
			height: 810,
			aspectRatio: 1,
		  	locale: "ko",
		  	initialView: 'dayGridMonth',
		  	navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
		  	editable: true, // 수정 가능?
		  	nowIndicator: true, // 현재 시간 마크
		  	dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
		    eventSources: [
	            {
	            googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com',
	            className: 'koreanHoliday',
	            color:'#fa573c'
	            }
		    	],
		 	events : plan.map(function(item) {
		 		if(item.birthday==1){
			      	return {
			      		id: item.calendar_no,
			          	title: item.calendar_title,
			          	start: item.calendar_start,
			          	end: item.calendar_end,
			          	color: "#ffad46",
				        rrule: {
				            freq: 'yearly',
				            dtstart:item.calendar_start
				        }
			      	};
		 		}else if(item.reservation==1){
		 			return{
		 				id: item.calendar_no,
		 				title: item.calendar_title+" 예약",
		 				start: item.calendar_start,
		 				end: item.calendar_end,
		 				color:"#16a765",
		 				url: "/ko_reservationDetails?c_no="+item.connectionID
		 			};
		 		}else{
			      	return {
			      		id: item.calendar_no,
			          	title: item.calendar_title,
			          	start: item.calendar_start,
			          	end: item.calendar_end,
			          	color: "#cd74e6",
			          	url: "/ko_calendarDetails?c_no="+item.calendar_no
			      	};
		 		}
		  	}).concat({
		      	title: '생일',
		     	start: '2023-09-19',
		        rrule: {
		            freq: 'yearly',
		            dtstart:'2023-09-19'
		        }
		  	}),
		  	headerToolbar: {
			  	left: 'today',
			  	center: 'prev,title,next',
			  	right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
		  	},
		});
		calendar.render();
	},'json');
});
</script>
<body>
<div class='pageCalendar'>
	<div class='sideBar'>
		<h3 class="c_title" id="c_title" style="margin-left:15px;">캘린더</h3>
		<button class="addPlanBtn" id="addPlanBtn">일정등록</button>
		<table class="sideBarTbl">
			<tbody>
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
<script>
$(document)
.on('click','#addPlanBtn',function(){	//일정등록버튼을 클릭했을 때
	document.location="/ko_addPlan"
})
</script>
</html>