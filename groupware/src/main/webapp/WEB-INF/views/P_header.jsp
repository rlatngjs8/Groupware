<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="P_css/header.css" rel="stylesheet" type="text/css">
</head>
<body>
    <header class="side-bar">
      <section class="side-bar__icon-box">
        <section class="side-bar__icon-1">
      
        </section>
      </section>
      <a href="/"><img src="/P_img/logonexa.png" style="height:170px;width:210px;" alt="홈"></a>
      <ul>
        <li>
          <a href="/">홈</a>
        </li>
        <li>
          <a href="/company">연락처</a>
        </li>
        <li>
          <a href="/mailFolder1">메일<div id="pHedaerEmailAlarm"></div></a>
        </li>
        <li>
          <a href="/community">게시판</a>
        </li>
        <li>
          <a href="/ko_calendar">캘린더</a>
        </li>
        <li>
            <a href="/reservationList">예약</a>
        </li>
        <li>
            <a href="/attendance">근태관리</a>
        </li>
        <li>
            <a href="/approval">전자결재<div id="pHeaderRequest">3</div></a>
        </li>
        <li>
           <a href="/todo">ToDO+</a>
        </li>
        <li>
            <a href="/documentLibrary">자료실</a>
        </li>
        <li>
            <a href="#">-</a>
        </li>
        <li>
            <a href="#">-</a>
        </li>
      </ul>
    </header>

    <div class="nav">
       <div class="search-bar">
       <input type="text" placeholder="검색" id="search-bar" onkeyup="enterkey()"><button class="search-button" id="search-button" ><img src="P_img/free-icon-magnifier-71403.png"></button>
       </div>
      <div class="menu-container">
         <img src="/P_img/bell.png" alt="공지" class="bell">
          <div id="notice" class="menu menu1"></div>
      </div>          
      <div class="menu-container">
         <img src="img/${profileIMG}" class="profile">
          <div class="menu menu2">
              <a href="/">홈</a>
              <a href="/myInfo">정보수정</a>
              <c:if test="${userid eq '관리자1'}">
              <a href="/manage_attendance">근태관리</a>
              <a href="/showEmployee">직원관리</a>
              </c:if>
              <a href="/logout">로그아웃</a>
          </div>
      </div>
   </div>
   <input type="hidden" value= '${sessionScope.userid}' id="sessionid">
</body>

<script src='https://code.jquery.com/jquery-Latest.js'></script>
<script>
$(document)
.ready(function(){
    $(".menu-container").mouseenter(function(){
        $(this).children(".menu").fadeIn(200);
    });
    $(".menu-container").mouseleave(function(){
        $(this).children(".menu").fadeOut(200);
    });   
   let sessionid = $("#sessionid").val()
   if(sessionid == null || sessionid == ""){
      alert("권한이 없습니다");
      return false;
   }
   $.ajax({url:'/pHeaderAlarm',type:'post',dataType:'text',
      success:function(data){
         console.log("/pHeaderAlarm 성공");
         console.log(data);
         $('#pHedaerEmailAlarm').text(data);
      },
      error:function(data){
         alert("/pHeaderAlarm 오류");
      }
   });
   $.post('/getNewNotice',{empID:${sessionScope.EmpId}},
         function(data){
            for(let i=0; i<data.length; i++){
               if(data[i].type=="Announcement"){
                  let li = "<a href='/announcement' class='stext'>공지사항: "+data[i].title+"<br>"+data[i].time+"</a>"
                  $('#notice').append(li)
               }else if(data[i].type=="Email"){
                  let li = "<a href='/mailFolder1' class='stext'>새 메일: "+data[i].title+"<br>"+data[i].time+"</a>"
                  $('#notice').append(li)
               }else if(data[i].type=="Request"){
                  let li = "<a href='/approval' class='stext'>결재요청: "+data[i].title+"<br>"+data[i].time+"</a>"
                  $('#notice').append(li)
               }else if(data[i].type=="InProgress"){
                  let li = "<a href='/approval' class='stext'>결재진행중: "+data[i].title+"<br>"+data[i].time+"</a>"
                  $('#notice').append(li)
               }else if(data[i].type=="Suspension"){
                  let li = "<a href='/approval' class='stext'>결재보류: "+data[i].title+"<br>"+data[i].time+"</a>"
                  $('#notice').append(li)
               }else if(data[i].type=="Approval"){
                  let li = "<a href='/approval' class='stext'>결재승인: "+data[i].title+"<br>"+data[i].time+"</a>"
                  $('#notice').append(li)
               }else if(data[i].type=="Rejection"){
                  let li = "<a href='/approval' class='stext'>결재거절: "+data[i].title+"<br>"+data[i].time+"</a>"
                  $('#notice').append(li)
               }
            }
   },'json');
   $.post('/countRequest',{empID:${sessionScope.EmpId}},
		   function(data){
	   	       $('#pHeaderRequest').text(data);
   },'text');
})

.on('click','#search-button',function(){
	   let search = $('#search-bar').val();
	   console.log(search);
	   document.location="dosearch?search="+search;
	   return false;
	})
	function enterkey() {
	   if (window.event.keyCode == 13) {
	       // 엔터키가 눌렸을 때
	      document.getElementById("search-button").click();
	    }
	}</script>
</html>