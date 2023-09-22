<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

</style>
<title>GroupNexa</title>
<style>
    .profile-box {
    	margin-left: 240px;
        width: 200px; /* div의 넓이를 200px로 설정 */
        align-items: center;
        gap: 10px;
        border: 1px solid #000;
        padding: 10px;
    }

    .rounded-image {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        overflow: hidden;
        margin-left: 25%;
    }

    .profile-name {
        text-align: center;
    }
    #btnLogout{
    	margin-left: 15%;
    }
</style>
</head>
<body>
<%@ include file="P_header.jsp" %>
<div>
<input type="hidden" id="userid" name="userid" value="${userid}">
	<!--프로필 박스 -->
    <div class="profile-box">
        <div class="rounded-image">
            <img src="img/${profileIMG}" style="width: 100%; height: 100%;" alt="프로필 이미지">
        </div>
        <div class="profile-name">
        	<p>${userid}</p>
        	<span>${emp.departmentName}</span>&nbsp;<span style="font-weight:bold;"> ${name} ${emp.position}</span>
    	</div>
    </div>
    <button id=btnLogout >임시 로그아웃</button>
    <!-- 공지사항 박스 -->
    <div class="announcement-box">
    
    </div>
    <!-- 메일함 박스 -->
    <div class="mail-box">
    <!-- 메일함바로가기, 메일쓰기바로가 -->
    </div>
    <!-- 캘린더박스 -->
    <div class="calender-box">
	    <div id="calendarContainer">
	   
	    </div>
    </div>
    <!-- 결재대기 목록박스 -->
    <div class="wait-box">
    
    </div>
    <!-- 게시판 최근글 -->
    <div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).on('click','#btnLogout',function(){
    window.location.href = "/logout";
 })
 $(document).ready(function() {
    // ko_calendar.jsp의 특정 부분을 비동기적으로 로드합니다.
    $.ajax({
        url: "ko_calendar.jsp",
        type: "GET",
        dataType: "html",
        success: function(data) {
            // 로드한 데이터 중에서 <div class='pageCalendar'> 부분만 추출하여 표시합니다.
            var pageCalendarContent = $(data).find(".pageCalendar");
            $("#calendarContainer").html(pageCalendarContent);
        },
        error: function() {
            // 로드 실패 시 처리
            console.log("오류 발생");
        }
    });
});
</script>
</html>
