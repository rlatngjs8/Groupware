<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GroupNexa</title>
<link href='css/main.min.css' rel='stylesheet' />
<link href="/P_css/home.css" rel="stylesheet" type="text/css">
<script src='https://cdn.jsdelivr.net/npm/rrule@2.6.4/dist/es5/rrule.min.js'></script>
<script src='js/main.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/rrule@5.11.5/main.global.min.js'></script>
<script src='js/ko.js'></script>
</head>
<style>
@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css");
</style>
<body>
<%@ include file="P_header.jsp" %>
<div class="asd">
<input type="hidden" id="userid" name="userid" value="${userid}">
	<div>
	<!--프로필 박스 -->
    <div class="profile-box">
        <div class="rounded-image">
            <img src="img/${profileIMG}" style="width: 100%; height: 100%;" alt="프로필 이미지">
        </div>
        <div class="profile-name">
        	<p>${userid}</p>
        	<span>${emp.departmentName}</span>&nbsp;<span style="font-weight:bold;"> ${name} ${emp.position}</span>
    	</div>
    	<button id=btnLogout >임시 로그아웃</button>
    </div>
	    <div class="centerD">
		    <span class=mBtn style="margin-left:240px" id="goToMail"><img src="img/email_icon.png" class='icon'> <span>메일쓰기</span></span>
		    <span class=mBtn id="goToAddPlan"><img src="img/calendar-icon.png" class='icon'> <span>일정등록</span></span>
	    </div>
    </div>
  <div class="home-content">
	    <!-- 공지사항 박스 -->
	    <h2>공지사항</h2> 
	    <div class="announcement-box">
		    <ul>
			    <c:forEach items="${alist}" var="alist">
				    <li>
				    	<a href="/announcement_view?seqno=${alist.communityID}">
					    <span class="title">${alist.communityTitle}</span>
					    <span class="info">${alist.name} ${alist.position}</span>
					    <span class="date">${alist.formattedDate}</span>
					    </a>
					</li>
			    </c:forEach>
			</ul>
			<a href="/announcement">더보기></a>
	    </div>
	    <h2>메일</h2>
	    <!-- 메일함 박스 -->
	    <div class="mail-box">
	    <!-- 메일함바로가기, 메일쓰기바로가 -->
	    	
	         <div class="tab-box">
			    <ul>
			        <li class="selected" data-tab="tab1">받은 메일함</li>
			        <li data-tab="tab2">보낸 메일함</li>
			        <li data-tab="tab3">중요 메일함</li>
			       
			    </ul>
			    <div class="tab-view" id="tab1">
					    <c:forEach items="${rMlist}" var="rMlist">
					    		<div class=rMlist>
					    		<a href="/mailDetail?eid=${rMlist.emailid}">	    		
							    <span class="mail-name">${rMlist.name}&#60;${rMlist.email}&#62;</span>
							    <span class="mail-subject">${rMlist.subject}</span>
								<span class="mail-time">${rMlist.sendtime}</span></a><br>
								</div>
					    </c:forEach>
					    <a href="/mailFolder1">더보기></a>
				</div>
			    <div class="tab-view" id="tab2">
					    <c:forEach items="${sMlist}" var="sMlist">
					    		<div class=sMlist>
							    <a href="/mailDetail?eid=${sMlist.emailid}">
							    <span class="mail-name">${sMlist.name}&#60;${sMlist.email}&#62;</span>
							    <span class="mail-subject">${sMlist.subject}</span>
							    <span class="mail-time">${sMlist.sendtime}</span></a><br>
							    </div>
					    </c:forEach>
					    <a href="/mailFolder2">더보기></a>
				</div>
			    <div class="tab-view" id="tab3">
					    <c:forEach items="${iMlist}" var="iMlist">
					    <div class=iMlist>
							    <a href="/mailDetail?eid=${iMlist.emailid}"><span class="mail-name">${iMlist.name}&#60;${iMlist.email}&#62;</span>
							    <span class="mail-subject">${iMlist.subject}</span>
							    <span class="mail-time">${iMlist.sendtime}</span></a><br>
						</div>
					    </c:forEach>
					    <a href="/mailMark">더보기></a>
				</div>
			</div>
			
	    </div>
	    <h2>결재</h2>
	    <div class="wait-box">    	
	         <div class="tab-box1">
			    <ul>
			        <li class="selected1" data-tab="tab1-1">결재 대기</li>
			        <li data-tab="tab2-1">결재 수신</li>
			        <li data-tab="tab3-1">결재 발송</li>
			       
			    </ul>
			    <div class="tab-view1" id="tab1-1">
			    		<table>
			    			<thead>
			    				<tr><th>기안일</th><th>결재양식</th><th>제목</th><th>기안자</th></tr>
			    			</thead>
			    			<tbody>
							    <c:forEach items="${Wapproval}" var="Wapproval">
							    		<tr>
						                    <td>${Wapproval.createdTime}</td>
						                    <td>${Wapproval.approval_type}</td>
						                    <td>${Wapproval.approvalTitle}</td>
						                    <td>${Wapproval.senderName}</td>
						                </tr>	
							    </c:forEach>
						    </tbody>
					    </table>
					    <a href="/arriveApproval">더보기></a>
				</div>
			    <div class="tab-view1" id="tab2-1">
					    <table>
			    			<thead>
			    				<tr><th>기안일</th><th>결재양식</th><th>제목</th><th>기안자</th></tr>
			    			</thead>
			    			<tbody>
							    <c:forEach items="${Rapproval}" var="Rapproval">
							    		<tr>
								    		<td>${Rapproval.createdTime}</td>
						                    <td>${Rapproval.approval_type}</td>
						                    <td>${Rapproval.approvalTitle}</td>
						                    <td>${Rapproval.senderName}</td>
							    		</tr>
							    </c:forEach>
						    </tbody>
					    </table>
					    <a href="/comeApproval">더보기></a>
				</div>
			    <div class="tab-view1" id="tab3-1">
					    <table>
			    			<thead>
			    				<tr><th>기안일</th><th>결재양식</th><th>제목</th><th>담당자</th><th>기안자</th><th>결재 상태</th></tr>
			    			</thead>
			    			<tbody>
							    <c:forEach items="${Sapproval}" var="Sapproval">
							    		 <tr>
								            <td>${Sapproval.createdTime}</td>
								            <td>${Sapproval.approval_type}</td>
								            <td>${Sapproval.approvalTitle}</td>
								            <td>${Sapproval.senderName}</td> <!-- 변경된 부분 -->
								            <td>${Sapproval.approval_status}</td> <!-- 변경된 부분 -->
								        </tr>
							    </c:forEach>
						    </tbody>
					    </table>
					    <a href="/sendApproval">더보기></a>
				</div>
			</div>
			
	    </div>
	    <h2>게시판</h2>
	    <!-- 게시판 최근글 -->

	    <div class="commu-box">
		    <ul>
		        <c:forEach items="${blist}" var="blist">
		            <li>
		                <a href="/community_view?seqno=${blist.communityID}" class="full-link">
		                    <span class="title">${blist.communityTitle}</span>
		                    <span class="info">${blist.name} ${blist.position}</span>
		                    <span class="date">${blist.formattedDate}</span>
		                </a>
		            </li>
		        </c:forEach>
		    </ul>
		    <a href="/community" class="more-link">더보기></a>
		</div>

  </div>
  	    <div class="calendar_box">
	    	    <!-- 캘린더박스 -->
	    <h2>일정</h2><span id="seeMore" class="seeMore">+더보기</span>
	    <div id='calendar' class="calendar"></div>
	    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
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
</script>
</html>
