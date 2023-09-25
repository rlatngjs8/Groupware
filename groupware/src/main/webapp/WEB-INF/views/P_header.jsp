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
  margin: 5;
  padding: 0;
  list-style: none;   /* 해당 태그의 list-style을 none으로 하는 것으로 ●을 제거한다 */
}

a {
  color: inherit;   /* 부모 엘리먼트의 값을 물려받는다 */
  text-decoration: none;    /* 해당 태그의 text-decoration 속성을 none 값으로 하는 것으로 밑줄을 제거한다 */
}
/* 노멀라이즈 끝 */

/* 커스텀 시작 */
.side-bar > ul ul {
  display: none;
}
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
  margin-top : -1%;
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
  font-size: 1.4rem;
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
          <a href="/"> 홈</a>
        </li>
        <li>
          <a href="/contact/company">연락처</a>
        </li>
        <li>
          <a href="#">메일</a>
          <a href="/mailFolder1">메일</a>
        </li>
        <li>
          <a href="/community">게시판</a>
        </li>
        <li>
          <a href="#">캘린더</a>
        </li>
        <li>
            <a href="#">예약</a>
        </li>
        <li>
            <a href="#">근태관리</a>
        </li>
        <li>
            <a href="#">전자결재</a>
        </li>
        <li>
            <a href="#">자료실</a>
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
    	<input type="text" placeholder="검색" id="search-bar" onkeyup="enterkey()"><button class="search-button" id="search-button"><img src="P_img/free-icon-magnifier-71403.png"></button>
    	</div>
    	<a href="#"><img src="P_img/free-icon-question-mark-3272332.png" alt="FAQ"></a>    	
    	<a href="#"><img src="P_img/bell.png" alt="공지"></a>  	
    	<img src="img/${profileIMG}" class="profile">
	</div>
</body>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
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