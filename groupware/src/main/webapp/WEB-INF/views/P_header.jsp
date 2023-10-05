<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
/* 사이트의 높이를 5000px로 만들어 스크롤 생성 */
body {
/*   height: 5000px; */
  background-color: #f1f1f1;
}

/* 사이드바 시작 */

/* 사이드바의 너비와 높이를 변수를 통해 통제 */
:root {
  --side-bar-width: 280	px;
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
}

/* 새로운 스타일: 메뉴 스타일 및 서브메뉴 애니메이션 추가 */
.menu {
    position: relative;
    margin-right: 20px;
}

.menu a {
    cursor: pointer;
    text-decoration: none;
    color: white;
    padding: 5px 10px; /* 좌우 여백을 더 넓게 설정 */
    transition: background-color 0.3s, color 0.3s; /* 배경색과 텍스트 색상에 애니메이션 적용 */
    white-space: nowrap; /* 텍스트가 길어도 줄바꿈하지 않도록 설정 */
    /* overflow: hidden;  넘치는 텍스트 숨김 처리 
    text-overflow: ellipsis;  넘치는 텍스트에 ... 추가
    */
}

.menu ul {
	border-radius: 10px;
    position: absolute;
    background-color: rgb(106, 176, 173);
    list-style: none;
    margin-left: -50px;
	
    padding: 5px;
    opacity: 0;
    transform: translateY(-20px); /* 초기에 위로 이동한 상태로 시작 */
    transition: opacity 0.3s, transform 0.3s, background-color 0.3s; /* 투명도, 위치 변경, 배경색에 애니메이션 적용 */
}

.menu ul li {
    padding: 5px;
}

/* 호버 시 배경색 및 텍스트 색상 변경 */
.menu a:hover {
    background-color: rgb(116, 137, 136);
    color: #fff;
    white-space: normal; /* 호버 시 텍스트가 줄바꿈되도록 설정 */
    text-overflow: initial; /* 호버 시 ...을 제거하여 텍스트를 모두 표시 */
}

/* 마우스 호버 시 투명도 변경과 위치 변경으로 나타나게 만듭니다. */
.menu:hover ul {
    opacity: 1;
    transform: translateY(0); /* 서브메뉴가 위에서 아래로 나타나도록 이동합니다. */
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
          <a href="/mailFolder1">메일</a>
        </li>
        <li>
          <a href="/community">게시판</a>
        </li>
        <li>
          <a href="/ko_calendar">캘린더</a>
        </li>
        <li>
            <a href="/ko_reservation">예약</a>
        </li>
        <li>
            <a href="#">근태관리</a>
        </li>
        <li>
            <a href="#">전자결재</a>
        </li>
        <li>
            <a href="/documentLibrary">자료실</a>
        </li>
        <li>
            <a href="#">문의</a>
        </li>
        <li>
            <a href="#">조직도</a>
        </li>
      </ul>
    </header>

    <div class="nav">
    	<div class="search-bar">
    	<input type="text" placeholder="검색" id="search-bar" onkeyup="enterkey()"><button class="search-button" id="search-button" ><img src="P_img/free-icon-magnifier-71403.png"></button>
    	</div>
    	<div id="pHedaerEmailAlarm"></div>
    	<a href="#"><img src="/P_img/free-icon-question-mark-3272332.png" alt="FAQ"></a>    	
    	<a href="#"><img src="/P_img/bell.png" alt="공지"></a>  
    	<ul>
        <li class="menu">
            <img src="img/${profileIMG}" class="profile">
            <ul class="hide">
            	<li><a href="/"> 홈</a></li>
            	<li><a href="/myInfo">정보수정</a></li>
                <li><a href="/logout">로그아웃</a></li>
                
            </ul>
        </li>
        </ul>
<!--     	<a href="#"><img src="P_img/free-icon-question-mark-3272332.png" alt="FAQ"></a>    	 -->
<!--     	<div id="pHedaerEmailAlarm"></div> -->
<!--     	<a href="#"><img src="P_img/bell.png" alt="공지"></a>    	 -->
<!--     	<a href="#"><img src="P_img/bell.png" alt="공지"></a>  -->
<%--     	<img src="img/${profileIMG}" class="profile"> --%>
	</div>
	<input type="hidden" value= '${sessionScope.userid}' id="sessionid">
</body>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	let sessionid = $("#sessionid").val()
	console.log($("#sessionid").val())
	if(sessionid == null || sessionid == "") {
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