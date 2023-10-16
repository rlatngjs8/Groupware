let plan; // 이벤트를 담을 변수 선언

document.addEventListener('DOMContentLoaded', function() {
	$.get('/getPlan',{}, function(data){
		plan = data;

		var calendarEl = document.getElementById('calendar');  
		var calendar = new FullCalendar.Calendar(calendarEl, {
			height: 810,
			aspectRatio: 1,
		  	locale: "ko",
		  	initialView: 'listWeek',
		  	navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
		  	editable: true, // 수정 가능?
		  	nowIndicator: true, // 현재 시간 마크
		  	dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
		 	events : plan.map(function(item) {
				if(item.reservation==1){
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
			      	};
		 		}
		  	}),
		  	headerToolbar: {
		  	    left: 'today',
		  	    center: 'prev,title,next',
		  	    right: 'listWeek,listMonth'
		  	},
		  	views: {
		  	    listWeek: {
		  	        buttonText: '주간'
		  	    },
		  	    listMonth: {
		  	        buttonText: '월간'
		  	    }
		  	},
		});
		calendar.render();
	},'json');
});

$(document)
.on('click','#btnReservation',function(){	//회의실 예약버튼을 클릭했을 때
	document.location="/ko_reservation"
})