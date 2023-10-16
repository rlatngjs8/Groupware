<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>

/* 게시물 목록을 감싸는 컨테이너 */
.post-container {
    border: 1px solid #ccc;
    margin-bottom: 20px;
    padding: 10px;
    background-color: #f9f9f9;
}

.post-container:hover {
    background-color: #d4d2d2;
}

/* 제목 스타일 */
.post-title {
    font-size: 20px;
    font-weight: bold;
}

/* 작성자 스타일 */
.post-author {
    font-size: 14px;
    color: #666;
}

/* 내용 스타일 */
.post-content {
    margin-top: 10px;
    font-size: 16px;
}

/* 게시물 정보 스타일 */
.post-info {
    margin-top: 10px;
    font-size: 14px;
    color: #888;
}

/* 조회수와 좋아요 스타일 */
.post-views-likes {
    margin-top: 5px;
}

/* 시간 스타일 */
.post-time {
    font-size: 12px;
    color: #aaa;
}

.page-side a:hover {
    background-color: #cfcfcf;
}

.board-search-bar input[type="text"] {
    padding:5px ;
    font-size :20px ;
}
</style>
<meta charset="UTF-8">
<title>게시판</title>
<link href="/P_css/Main_Content.css" rel="stylesheet" type="text/css">
<%@ include file="../P_header.jsp" %>
</head>
<body>
<div class="board">
	<div class="page-side">
    	<h3 class="boardTitle">커뮤니티</h3>
  		<%
  		String id =(String)session.getAttribute("userid");
		if(id.equals("관리자1")){
		%>
			<a href='/announcement_write' class="big-button">공지사항 작성</a> <!-- 큰 버튼 스타일 적용 -->
			<div class="sideA">
        		<a href='/announcement' style="font-weight:bold;">공지사항</a><br>
    		</div>
    		<div class="sideA">
        		<a href='/community'>자유게시판</a>
    		</div>
		<%
		}else{
		%>
			<div class="sideA">
        		<a href='/announcement'>공지사항</a><br>
    		</div>
    		<div class="sideA">
        		<a href='/community'>자유게시판</a>
    		</div>
		<%
			}
		%>
</div>
<div class="Main_Content">
	<h3 class="boardTitle" style="padding-left: 40px;">공지사항</h3>
<div class="board-search-bar" style="border-bottom:1px solid lightgrey">
	<input type="text" placeholder="공지사항 검색"  id="board-search-bar" onkeyup="boardenterkey()"><button class="search-board-button" id="search-board-button"><img src="P_img/free-icon-magnifier-71403.png"></button>
</div>
<ul>
<c:forEach items="${blist}" var="blist">
	<li class="post-container">
	<div onclick="location.href='/announcement_view?seqno=${blist.CommunityID}';" style=" cursor: pointer;">
            <span class="post-title">${blist.CommunityTitle}</span><br><br>
            <span class="post-content">${blist.Content}</span><br><br>
            <span class="post-info">
                <span class="post-views-likes">
                	<span class="post-author">작성자 : ${blist.Name} ${blist.Position}</span><br>
                    <span>조회수: ${blist.Views}</span><br>
                </span>
                <span class="post-time">${blist.CreatedTime}</span>
            </span>
            </div>
        </li>
</c:forEach>
</ul>
<div class="board-search-bar">
<input type="text" placeholder="공지사항 검색"  id="board-search-bar" onkeyup="boardenterkey()"><button class="search-board-button" id="search-board-button"><img src="P_img/free-icon-magnifier-71403.png"></button>
</div>
<div style="margin-left:auto;margin-right:auto;text-align:center;font-size: x-large">${pagestr}</div>
</div>
</div>

</body>
<script>
$(document)	 
.on('click','#search-board-button',function(){
	let search = $('#board-search-bar').val();
	console.log(search);
	document.location="doaboardsearch?search="+search;
	return false;
})
function boardenterkey() {
	if (window.event.keyCode == 13) {
    	// 엔터키가 눌렸을 때
		document.getElementById("search-board-button").click();
    }
}
</script>
</html>