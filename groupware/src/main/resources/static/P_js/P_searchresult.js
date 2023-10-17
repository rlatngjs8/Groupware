let plan; // 이벤트를 담을 변수 선언

document.addEventListener('DOMContentLoaded', function() {
	$.get('/getPlan',{}, function(data){
		plan = data;
		var calendarEl = document.getElementById('calendar');  
		var calendar = new FullCalendar.Calendar(calendarEl, {
			googleCalendarApiKey : "AIzaSyCUK8ocVStSIhpAkkQPF2KXgRIilfprcnI",
			height: 500,
			aspectRatio: 1,
		  	locale: "ko",
		  	initialView: 'listWeek',
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
		  	}),
		  	headerToolbar: {
		  		left: 'prev',
		  		center: 'title',
		  		right: 'next'
		  	},
		});
		calendar.render();
	},'json');
})
$(document).on('click','#btnLogout',function(){
    window.location.href = "/logout";
 })
.on('click','#seeMore',function(){
	document.location="/ko_calendar";
	return false;
})
.on('click','#goToMail',function(){
	document.location="/mailWrite";
	return false;
})
.on('click','#goToAddPlan',function(){
	document.location="/ko_addPlan";
	return false;
})
// div에 캘린더 불러오고싶은데 안됨
$(document).ready(function(){
	$('.tab-box li').on('click', function() {
        // 모든 탭의 'selected' 클래스 제거
        $('.tab-box li').removeClass('selected');
        // 클릭한 탭에 'selected' 클래스 추가
        $(this).addClass('selected');

        // 모든 탭뷰 숨기기
        $('.tab-view').hide();
        // 클릭한 탭의 데이터 속성 값을 가져와 해당 탭뷰 보이기
        $('#' + $(this).data('tab')).show();
    })
	
	
	$('.tab-box1 li').on('click', function() {
        // 모든 탭의 'selected' 클래스 제거
        $('.tab-box1 li').removeClass('selected1');
        // 클릭한 탭에 'selected' 클래스 추가
        $(this).addClass('selected1');

        // 모든 탭뷰 숨기기
        $('.tab-view1').hide();
        // 클릭한 탭의 데이터 속성 값을 가져와 해당 탭뷰 보이기
        $('#' + $(this).data('tab')).show();
    }).on('click','#goToAddPlan',function(){
    	document.location="/ko_addPlan";
    	return false;
    })
	$('.approval-row').on('click', function() {
        var link = $(this).data('link');
        if (link) {
            window.location.href = link;
        }
    });
	
// 	$('#calendarContainer').load('WEB-INF/views/ko_calendar.jsp #calendar');
	$.ajax({
		url:'/ko_calendar',
		type:'get',
		dataType:'html',
		success:function(response){
			var divContent = $(response).find('#calendar').html();
			
			$('#calendarContainer').html(divContent);
		},
		error:function(){
			console.error('ajax 요청 실패');
		}
	})
});