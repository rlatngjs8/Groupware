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
		</div>
		<h2>일정 검색</h2>
		<div class="calendar">
		    <ul>
		        <c:forEach items="${calendar}" var="calendar">
		            <li>
	                    <c:choose>
						    <c:when test="${calendar.birthday==1}">
			                    <span class="calenderTitle">${calendar.CALENDAR_TITLE}</span>
			                    <span class="calenderInfo">${calendar.calendar_start} ~ ${calendar.calendar_end}</span>	
						    </c:when>
						    <c:when test="${calendar.reservation==1}">
			                    <span class="calenderTitle"><a href="/ko_reservationDetails?c_no=${calendar.connectionID}">${calendar.CALENDAR_TITLE}</a></span>
			                    <span class="calenderInfo">${calendar.calendar_start} ~ ${calendar.calendar_end}</span>
						    </c:when>
						    <c:otherwise>
			                    <span class="calenderTitle"><a href="/ko_calendarDetails?c_no=${calendar.calendar_no}">${calendar.CALENDAR_TITLE}</a></span>
			                    <span class="calenderInfo">${calendar.calendar_start} ~ ${calendar.calendar_end}</span>
						    </c:otherwise>
						</c:choose>
		            </li>
		        </c:forEach>
		    </ul>
		    <br>
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
<script src='P_js/P_searchresult.js'></script>
</html>
