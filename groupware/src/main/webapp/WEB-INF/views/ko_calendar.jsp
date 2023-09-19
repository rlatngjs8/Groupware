<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='css/main.min.css' rel='stylesheet' />
<script src="js/ko.js"></script>
<script src='js/main.min.js'></script>
</head>
<script src='https://code.jquery.com/jquery-Latest.js'></script>
<script>
let plan; // 이벤트를 담을 변수 선언

document.addEventListener('DOMContentLoaded', function() {
	$.get('/getPlan',{}, function(data){
		plan = data;
		console.log(plan);
		console.log(plan.length);
		console.log(plan[0].calendar_title);
var calendarEl = document.getElementById('calendar');  
var calendar = new FullCalendar.Calendar(calendarEl, {
  locale: "ko",
  initialView: 'dayGridMonth',
  events : plan.map(function(item) {
	  console.log(item.calendar_end)
      return {
          title: item.calendar_title,
          start: item.calendar_start,
          end: item.calendar_end
      };
  }).concat({
      title: '시간',
      start: '2023-09-28T08:00:00'
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
	<div id='calendar'></div>
</body>
</html>