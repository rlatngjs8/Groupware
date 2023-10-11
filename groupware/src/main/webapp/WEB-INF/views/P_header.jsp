<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 노멀라이즈 시작 */
body, ul, li {
  margin: 0;
  padding: 0;
  list-style: none;   /* 해당 태그의 list-style을 none으로 하는 것으로 ●을 제거한다 */
}

a {
  color: inherit;   /* 부모 엘리먼트의 값을 물려받는다 */
  text-decoration: none;    /* 해당 태그의 text-decoration 속성을 none 값으로 하는 것으로 밑줄을 제거한다 */
}
/* 노멀라이즈 끝 */

/* 커스텀 시작 */
/* .side-bar > ul ul {
  display: none;
} */
.side-bar > ul {
  height: 100vh; /* 화면 높이 100%로 설정 */
}

/* 사이드바 시작 */

/* 사이드바의 너비와 높이를 변수를 통해 통제 */
:root {
  --side-bar-width: 280   px;
  --side-bar-height: 90vh;
}

.side-bar {
  position: fixed;
  background-color: rgb(106, 176, 173);
  width: var(--side-bar-width);
  margin-top : -1.4%;
  margin-left: -1%;
}

/* 아이콘 시작 */
.side-bar__icon-box {
  display: flex;
  justify-content: flex-end;
}

.side-bar__icon-1 {
  position: relative;
  width: 23px;
  height: 17px;
  margin: 15px;
  margin-top: 20px;
  transition: .5s;
}

:root {
  --side-bar__icon: .4s;
}

.side-bar__icon-1 > div {
  position: absolute;
  width: 100%;
  height: 20%;
  background-color: white;
  transition: all var(--side-bar__icon);
}

.side-bar__icon-1 > div:nth-of-type(1) {
  top: 0;
  width: auto;
  left: 0;
  right: 0;
  transition: all var(--side-bar__icon), left calc(var(--side-bar__icon) / 2) calc(var(--side-bar__icon) / 2), right calc(var(--side-bar__icon) / 2) calc(var(--side-bar__icon) / 2), height calc(var(--side-bar__icon) / 2) 0s;
}

.side-bar__icon-1 > div:nth-of-type(2) {
  top: 40%;
  transform-origin:bottom left;
}

.side-bar__icon-1 > div:nth-of-type(3) {
  top: 80%;
  left: auto;
  right: 0;
  transform-origin:bottom right;
}

/* 모든 메뉴의 a에 속성값 부여 */
.side-bar ul > li > a {
  display: block;
  color: white;
  font-size: 17px;
  font-weight: bold;
  padding-top: 12px;
  padding-bottom: 20px;
  padding-left: 50px;
  transition: .5s;
}

/* 자식의 position이 absolute일 때 자식을 영역 안에 가두어 준다 */
.side-bar > ul > li {
  position: relative;
}

/* 모든 메뉴가 마우스 인식 시 반응 */
.side-bar ul > li:hover > a {
  background-color:  rgb(116, 137, 136);
  border-bottom: 1px solid #999;
}

/* 사이드바 너비의 80%만큼 왼쪽으로 이동 
.side-bar {
  transform: translate(calc(var(--side-bar-width) * -0.8), 0);
  transition: .5s;
}

/* 마우스 인식 시 원래의 위치로 이동 
.side-bar:hover {
  transform: translate(-20px, 0);    둥근 모서리의 너비만큼 숨겨주기 
}   
 사이드바 끝 

/* 커스텀 끝 */
.search-button{
position: relative;
    bottom: -4px;
}
.nav {
  display: flex;
  justify-content: flex-end;
  align-items: center;
  gap: 20px; /* Adjust this value to change the space between elements */
  margin-right:40px;
  margin-top:20px;
}

.search-bar {
  border: 1px solid #bbb;
  border-radius: 8px;
  padding: 5px;
}

.search-bar input[type="text"] {
    padding:5px ;
    font-size :20px ;
}
.profile{
   width:32px;
   height:32px;
   border-radius:50%;
   position: relative;
    right: 20px;
    cursor:pointer;
}

#pHedaerEmailAlarm {
  display: inline-block; /* div를 인라인 블록 요소로 설정 */
  vertical-align: top; /* 텍스트의 위쪽에 맞추기 */
  margin-left: 15px; /* 좌측 마진 추가 (선택사항) */
}

.stext{
   font-size:12px;
}

.menu-container {
    position: relative;
    display: inline-block;
    margin: 10px; /* 이미지 간 간격을 주기 위한 스타일 */
}
.menu {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    height: 23px; /* 메뉴 하나의 높이 */
    z-index: 1;
    background-color: rgb(106, 176, 173);
    margin-left: -70px;
}
.menu1{
   min-width: 202px;
}
.menu2{
   min-width: 130px;
}
.menu a {
    cursor: pointer;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    background-color: rgb(106, 176, 173);
    color:white;
}
.menu a:hover {
    background-color: rgb(116, 137, 136);
    color: #fff;
    white-space: normal; /* 호버 시 텍스트가 줄바꿈되도록 설정 */
    text-overflow: initial; /* 호버 시 ...을 제거하여 텍스트를 모두 표시 */
}
.menu img {
    width: 24px; /* 이미지의 너비 */
    height: 24px; /* 이미지의 높이 */
    margin-right: 5px; /* 이미지와 이미지 사이의 간격 */
}
.bell{
cursor:pointer;
}
</style>
</head>
<body>
    <header class="side-bar">
      <section class="side-bar__icon-box" onclick="toggleSidebar()">
        <section class="side-bar__icon-1">
          <div></div>
          <div></div>
          <div></div>
        </section>
      </section>
      <a href="/"><img src="/P_img/logonexa.png" style="height:170px;width:210px;" alt="홈"></a>
      <ul>
        <li>
          <a href="/">홈</a>
        </li>
        <li>
          <a href="/contact/company">연락처</a>
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
            <a href="/attendance_management/attendance">근태관리</a>
        </li>
        <li>
            <a href="/approval">전자결재</a>
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
   console.log("hello world");
   let sessionid = $("#sessionid").val()
   console.log($("#sessionid").val())
   console.log("empid="+${sessionScope.EmpId});
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
                  let li = "<a href='/mailFolder1' class='stext'>결재진행중: "+data[i].title+"<br>"+data[i].time+"</a>"
                  $('#notice').append(li)
               }else if(data[i].type=="Suspension"){
                  let li = "<a href='/mailFolder1' class='stext'>결재보류: "+data[i].title+"<br>"+data[i].time+"</a>"
                  $('#notice').append(li)
               }else if(data[i].type=="Approval"){
                  let li = "<a href='/mailFolder1' class='stext'>결재승인: "+data[i].title+"<br>"+data[i].time+"</a>"
                  $('#notice').append(li)
               }else if(data[i].type=="Rejection"){
                  let li = "<a href='/mailFolder1' class='stext'>결재거절: "+data[i].title+"<br>"+data[i].time+"</a>"
                  $('#notice').append(li)
               }
            }
   },'json');
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
}
</script>
</html>