<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GroupNexa</title>
<link href="/P_css/home.css" rel="stylesheet" type="text/css">
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
    	<button id=btnLogout >임시 로그아웃</button>
    </div>
  <div class="home-content">
	    <!-- 공지사항 박스 -->
	    <h2>공지사항</h2> 
	    <div class="announcement-box">
		    <ul>
			    <c:forEach items="${alist}" var="alist">
				    <li>
					    <div class="title"><a href="/announcement_view?seqno=${alist.communityID}">${alist.communityTitle}</a></div>
					    <div class="content-text"><a href="/announcement_view?seqno=${alist.communityID}">${alist.content}</a></div>
					    <div class="info">${alist.name} ${alist.position}</div>
					    <div class="date">${alist.formattedDate}</div>
					</li>

			    </c:forEach>
			</ul>
			<a href="/announcement_view">더보기></a>
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
							    <a href="/mailDetail?eid=${rMlist.emailid}"><span class="mail-name">${rMlist.name}&#60;${rMlist.email}&#62;</span>
							    <span class="mail-subject">${rMlist.subject}</span>
								<span class="mail-time">${rMlist.sendtime}</span></a><br>
								</div>
					    </c:forEach>
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
				</div>
			    <div class="tab-view" id="tab3">
					    <c:forEach items="${iMlist}" var="iMlist">
					    <div class=iMlist>
							    <a href="/mailDetail?eid=${iMlist.emailid}"><span class="mail-name">${iMlist.name}&#60;${iMlist.email}&#62;</span>
							    <span class="mail-subject">${iMlist.subject}</span>
							    <span class="mail-time">${iMlist.sendtime}</span></a><br>
						</div>
					    </c:forEach>
				</div>
			</div>
			<a href="/mailFolder1">더보기></a>
	    </div>
	    <!-- 캘린더박스 -->
	    <h2>캘린더</h2>
	    <div class="calender-box">
		    <div id="calendarContainer">
	<!-- 	   	<iframe id="calendarIframe" src="/ko_calendar" frameborder="0" scrolling="no" style="width: 100%; height: 400px;"></iframe> -->
		    </div>
	    </div>
	    <h2>결재</h2>
	    <!-- 결재대기 목록박스 -->
	    <div class="wait-box">
	    	123
	    </div>
	    <h2>게시판</h2>
	    <!-- 게시판 최근글 -->
	    <div class="commu-box">
	    	    123
	    </div>
  </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).on('click','#btnLogout',function(){
    window.location.href = "/logout";
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
function truncateString(str, num) {
    if (str.length > num) {
        return str.slice(0, num) + "...";
    } else {
        return str;
    }
}

document.addEventListener("DOMContentLoaded", function() {
    var contents = document.querySelectorAll(".content-text");
    contents.forEach(function(content) {
        content.textContent = truncateString(content.textContent, 12);
    });
});
</script>
</html>
