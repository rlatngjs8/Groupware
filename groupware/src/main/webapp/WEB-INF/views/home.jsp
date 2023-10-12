<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GroupNexa</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link href='css/main.min.css' rel='stylesheet' />
<link href="/P_css/home.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
    	<button id=btnLogout style="position: relative;top: 7px;left: 65px;">로그아웃</button>
    </div>
	    <div class="centerD">
		    <span class=mBtn style="margin-left:240px" id="goToMail"><img src="img/email_icon.png" class='icon'> <span>메일쓰기</span></span>
		    <span class=mBtn id="goToAddPlan"><img src="img/calendar-icon.png" class='icon'> <span>일정등록</span></span>
	    </div>
	    
	    <div class="attendance">      		
	    	<h2><a href="/attendance_management/attendance">근태관리</a></h2>
            <p id="date_info"></p>
            <p id="time_info"><span id="current_time"></span></p>
      		<button class="btn btn-success m-2" id="btnCheckIn">출근하기</button>
			<button class="btn btn-warning m-2" id="btnCheckOut" disabled>퇴근하기</button>
			<hr>
       		<p id="checkin_time">출근시간: <span id="start_time"></span></p>
        	<p id="checkout_time">퇴근시간: <span id="end_time"></span></p>
	    </div>
	    
<!-- 	    <div class="atttendance">
			<div class="sidebar">
  			<section id="attendance_section">
      		<h2><a href="/attendance_management/attendance">근태관리</a></h2>
            <p id="date_info"></p>
            <p id="time_info"><span id="current_time"></span></p>
      		<button class="btn btn-success m-2" id="btnCheckIn">출근하기</button>
			<button class="btn btn-warning m-2" id="btnCheckOut" disabled>퇴근하기</button>
        	</section>
        <hr>
        
        <p id="checkin_time">출근시간: <span id="start_time"></span></p>
        <p id="checkout_time">퇴근시간: <span id="end_time"></span></p>

       </div>
    </div> -->
    
	    
	    
	    
	    
	    
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
			<br>
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
					    <br>
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
					    <br>
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
					    <br>
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
							    		<tr class="approval-row" data-link="/approvalDetail?approvalID=${Wapproval.approvalID}">
						                    <td>${Wapproval.createdTime}</td>
						                    <td>${Wapproval.approval_type}</td>
						                    <td>${Wapproval.approvalTitle}</td>
						                    <td>${Wapproval.senderName}</td>
						                </tr>	
							    </c:forEach>
						    </tbody>
					    </table>
					    <br>
					    <a href="/arriveApproval">더보기></a>
				</div>
			    <div class="tab-view1" id="tab2-1">
					    <table>
			    			<thead>
			    				<tr><th>기안일</th><th>결재양식</th><th>제목</th><th>기안자</th></tr>
			    			</thead>
			    			<tbody>
							    <c:forEach items="${Rapproval}" var="Rapproval">
							    		<tr class="approval-row" data-link="/approvalDetail?approvalID=${Rapproval.approvalID}">
								    		<td>${Rapproval.createdTime}</td>
						                    <td>${Rapproval.approval_type}</td>
						                    <td>${Rapproval.approvalTitle}</td>
						                    <td>${Rapproval.senderName}</td>
							    		</tr>
							    </c:forEach>
						    </tbody>
					    </table>
					    <br>
					    <a href="/comeApproval">더보기></a>
				</div>
			    <div class="tab-view1" id="tab3-1">
					    <table>
			    			<thead>
			    				<tr><th>기안일</th><th>결재양식</th><th>제목</th><th>기안자</th><th>결재 상태</th></tr>
			    			</thead>
			    			<tbody>
							    <c:forEach items="${Sapproval}" var="Sapproval">
							    		 <tr class="approval-row" data-link="/approvalDetail?approvalID=${Sapproval.approvalID}">
								            <td>${Sapproval.createdTime}</td>
								            <td>${Sapproval.approval_type}</td>
								            <td>${Sapproval.approvalTitle}</td>
								            <td>${Sapproval.receiverName}</td> <!-- 변경된 부분 -->
								            <td>${Sapproval.approval_status}</td> <!-- 변경된 부분 -->
								        </tr>
							    </c:forEach>
						    </tbody>
					    </table>
					    <br>
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
		    <br>
		    <a href="/community" class="more-link">더보기></a>
		</div>
  </div>
  	    <div class="calendar_box">
	    	    <!-- 캘린더박스 -->
	    <h2 class="day">일정</h2><span id="seeMore" class="seeMore">+더보기</span>
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

// 근태관리 부분
$(document).ready(function () {
    // 업무시간 퇴근시간 설정
    const workStartTime = new Date();
    workStartTime.setHours(9, 0, 0);
    const workEndTime = new Date();
    workEndTime.setHours(18, 0, 0);

    // 현재 시간을 가져오기
    var currentTime = new Date();
    var hours = currentTime.getHours();
    var minutes = currentTime.getMinutes();
    var seconds = currentTime.getSeconds();

    // 시간, 분, 초를 두 자리 숫자로 표시
    hours = (hours < 10 ? "0" : "") + hours;
    minutes = (minutes < 10 ? "0" : "") + minutes;
    seconds = (seconds < 10 ? "0" : "") + seconds;

    // 날짜 업데이트
    var options = { weekday: 'long', year: 'numeric', month: '2-digit', day: '2-digit' };
    var dateStr = currentTime.toLocaleDateString('ko-KR', options);
    var dateParts = dateStr.split(' ');
    
    
    // 1초마다 updateTime 함수를 호출하여 시간 업데이트
    setInterval(updateTime, 1000);
    // 페이지 로드시 초기 시간 업데이트
    updateTime();
    console.log("안녕",  $("#user_name").val() );
});

// 시간 업데이트 함수 정의
function updateTime() {
    // 현재 시간을 가져오기
    var currentTime = new Date();
    var hours = currentTime.getHours();
    var minutes = currentTime.getMinutes();
    var seconds = currentTime.getSeconds();

    // 시간, 분, 초를 두 자리 숫자로 표시
    hours = (hours < 10 ? "0" : "") + hours;
    minutes = (minutes < 10 ? "0" : "") + minutes;
    seconds = (seconds < 10 ? "0" : "") + seconds;

    // 날짜 업데이트
    var options = { weekday: 'long', year: 'numeric', month: '2-digit', day: '2-digit' };
    var dateStr = currentTime.toLocaleDateString('ko-KR', options);
    var dateParts = dateStr.split(' ');

    // 시간 정보를 HTML 요소에 업데이트
    $("#current_time").text(hours + ":" + minutes + ":" + seconds);

    // 날짜 포맷 변경
    var formattedDate = (dateParts[0] + dateParts[1] + dateParts[2].replace('.', '') + '(' + dateParts[3].slice(0, -2) + ")").replace(/\./g, '-');

    // 변경된 날짜를 HTML 요소에 업데이트
    $("#date_info").text(formattedDate);
}

// 업무시간 퇴근시간 설정
const workStartTime = new Date();
workStartTime.setHours(9, 0, 0);
const workEndTime = new Date();
workEndTime.setHours(18, 0, 0);

// 현재 시간을 가져오기
var currentTime = new Date();
var hours = currentTime.getHours();
var minutes = currentTime.getMinutes();
var seconds = currentTime.getSeconds();

// 시간, 분, 초를 두 자리 숫자로 표시
hours = (hours < 10 ? "0" : "") + hours;
minutes = (minutes < 10 ? "0" : "") + minutes;
seconds = (seconds < 10 ? "0" : "") + seconds;

// 날짜 업데이트
var options = { weekday: 'long', year: 'numeric', month: '2-digit', day: '2-digit' };
var dateStr = currentTime.toLocaleDateString('ko-KR', options);
var dateParts = dateStr.split(' ');

var date = $("#date").val();

function select_time() {
    var current_date = (dateParts[0] + dateParts[1] + dateParts[2].replace('.', '')).replace(/\./g, '-');
    var currentTime = new Date();
    var hours = currentTime.getHours();
    var minutes = currentTime.getMinutes();
    var seconds = currentTime.getSeconds();
    hours = (hours < 10 ? "0" : "") + hours;
    minutes = (minutes < 10 ? "0" : "") + minutes;
    seconds = (seconds < 10 ? "0" : "") + seconds;

    const userid = $('#userid').val();
    const date = current_date;
	
    const checkData = {
            userid: userid,
            date: date,
        };
    
    $.ajax({
        url: "/select_time",
        data: checkData,
        type: 'get',
        dataType: 'json',
        success: function (data) {
            if (data.length === 0) {
                console.log("출퇴근시간 받기 실패");
            } else {
                // 출근시간과 퇴근시간이 각각 하나씩만 있는 경우를 가정합니다.
                console.log(data);
                $('#start_time').text(data[0]['starttime']);
                $('#end_time').text(data[0]['endtime']);
                if ($('#start_time').text() === null) {
                    // 출근시간이 비어 있는 경우
                    $("#btnCheckIn").prop('disabled', false); // 출근 버튼 활성화
                    $("#btnCheckOut").prop('disabled', true); // 퇴근 버튼 비활성화
                } else {
                    // 출근시간이 비어 있지 않은 경우
                    $("#btnCheckIn").prop('disabled', true); // 출근 버튼 비활성화

                    if ($('#end_time').text() !== '00:00:00') {
                        // 퇴근시간이 00:00:00이 아닌 경우
                        $("#btnCheckOut").prop('disabled', true); // 퇴근 버튼 비활성화
                    } else {
                        // 퇴근시간이 00:00:00인 경우
                        $("#btnCheckOut").prop('disabled', false); // 퇴근 버튼 활성화
                    }
                }    
            }
        },
        error: function (xhr, status, error) {
            console.error("Ajax 요청 실패:", error);
        }
    });

}

$(document).ready(function() {
    select_time();
});

function insert_checkIn() {
    console.log('insert_checkIn 함수 실행 시작');
    var current_date = (dateParts[0] + dateParts[1] + dateParts[2].replace('.', '')).replace(/\./g, '-');
    var currentTime = new Date();
    var hours = currentTime.getHours();
    var minutes = currentTime.getMinutes();
    var seconds = currentTime.getSeconds();
    hours = (hours < 10 ? "0" : "") + hours;
    minutes = (minutes < 10 ? "0" : "") + minutes;
    seconds = (seconds < 10 ? "0" : "") + seconds;

    const userid = $('#userid').val();
    const date = current_date;
    const startTime = hours + ":" + minutes + ":" + seconds;
    console.log('userid:', userid);
    


    if (currentTime >= workStartTime && currentTime <= workEndTime) {
        $("#status").val("지각");
    } else {
        $("#status").val("정상출근");
    }

    var AttendanceStatus = $("#status").val();

    if (!userid) {
        console.log('로그인 필요');
        Swal.fire({
            icon: 'warning',
            title: '로그인 필요',
            text: '출근 기록을 저장하려면 먼저 로그인해주세요.',
        });
        return;
    }

    const checkData = {
        userid: userid,
        date: date,
        startTime: startTime
    };

    console.log('checkData:', checkData);

    $.ajax({
        url: "/insert_checkIn",
        data: checkData,
        type: 'post',
        success: function (data) {
            console.log("보내는data:", data);
            if (data === '0') {
                console.error("인서트 실패:", data);
                Swal.fire({
                    icon: 'error',
                    showConfirmButton: false,
                    position: 'center-center',
                    timer: 3000,
                    timerProgressBar: true,
                    title: '출근 실패',
                    text: '출근 데이터 insert중 오류가 발생했습니다.',
                });
            } else {
                console.log("인서트 성공");
                Swal.fire({
                    icon: 'success',
                    showConfirmButton: true,
                    position: 'center-center',
                    title: '출근이 완료되었습니다.',
                    confirmButtonText: '확인' // 확인 버튼 추가
   	         }).then((result) => {
   	           if (result.isConfirmed) {
   	        	   
   	             // 확인 버튼을 누르면 페이지 리로드
   	             location.reload();
   	           }
   	         });
            }
        },
        error: function (xhr, status, error) {
            console.error("Ajax 요청 실패:", error);
            Swal.fire({
                icon: 'error',
                title: '출근 실패',
                text: '출근 데이터 insert중 오류가 발생했습니다',
            });
        }
    });
    console.log('insert_checkIn 함수 실행 종료');
}

function insert_checkOut() {
    const userid = $('#userid').val();
    var current_date = (dateParts[0] + dateParts[1] + dateParts[2].replace('.', '')).replace(/\./g, '-');
    var currentTime = new Date();
    var hours = currentTime.getHours();
    var minutes = currentTime.getMinutes();
    var seconds = currentTime.getSeconds();
    hours = (hours < 10 ? "0" : "") + hours;
    minutes = (minutes < 10 ? "0" : "") + minutes;
    seconds = (seconds < 10 ? "0" : "") + seconds;
    const endTime = hours + ":" + minutes + ":" + seconds;
    const date = current_date;

    const checkData = {
        userid: userid,
        date: date,
        endTime: endTime,
    };

    if (!userid) {
        console.log('로그인 필요');
        Swal.fire({
            icon: 'warning',
            title: '로그인 필요',
            text: '출근 기록을 저장하려면 먼저 로그인해주세요.',
        });
        return;
    }
    console.log('checkData:', checkData);

    $.ajax({
        url: "/insert_checkOut",
        data: checkData,
        type: 'post',
        success: function (data) {
            console.log('Ajax 요청 성공');
            if (data === '0') {
                console.error("인서트 실패:", data);
                Swal.fire({
                    icon: 'error',
                    title: '퇴근 실패',
                    text: '퇴근 데이터 insert중 오류가 발생했습니다.',
                });
            } else {
                Swal.fire({
                    icon: 'success',
                    showConfirmButton: true,
                    position: 'center-center',
                    title: '퇴근이 완료되었습니다.',
     	         	confirmButtonText: '확인' // 확인 버튼 추가
   	         }).then((result) => {
   	           if (result.isConfirmed) {
   	             // 확인 버튼을 누르면 페이지 리로드
   	             location.reload();
   	           }
   	         });
            }
        },
        error: function (xhr, status, error) {
            console.error("Ajax 요청 실패:", error);
            Swal.fire({
                icon: 'error',
                title: '퇴근 실패',
                text: '퇴근 데이터 insert중 오류가 발생했습니다',
            });
        }
    });
}

$().ready(function () {
    $("#btnCheckIn").click(function () {
        insert_checkIn(); // 출근 함수
    });

    $("#btnCheckOut").click(function () {
        Swal.fire({
            title: '지금 퇴근하실껀가요?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '승인',
            cancelButtonText: '취소',
            reverseButtons: false, // 버튼 순서 거꾸로
        }).then((result) => {
            if (result.isConfirmed) {
                insert_checkOut();
            }
        });
    });

});



</script>
</html>
