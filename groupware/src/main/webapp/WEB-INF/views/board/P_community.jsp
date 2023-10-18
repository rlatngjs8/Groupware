<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="/P_css/P_community.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>게시판</title>
<link href="/P_css/Main_Content.css" rel="stylesheet" type="text/css">
<%@ include file="../P_header.jsp" %>
</head>
<body>
<div class="board">
	<div class="page-side">
	    <h3 class="boardTitle">커뮤니티</h3>
	    <a href='/community_write' class="big-button">글쓰기</a> <!-- 큰 버튼 스타일 적용 -->
		<div class="sideA">
	        <a href='/announcement'>공지사항</a>
	    </div>
	    <div class="sideA">
	        <a href='/community' style="font-weight:bold;">자유게시판</a>
	    </div>
	</div>	
	<div class="Main_Content">
		<h3 class="boardTitle" 	style="padding-left: 40px;">자유게시판</h3>
		<div class="board-search-bar" style="border-bottom:1px solid lightgrey">
			<input type="text" placeholder="게시판 검색"  id="board-search-bar" onkeyup="boardenterkey()"><button class="search-board-button" id="search-board-button"><img src="P_img/free-icon-magnifier-71403.png"></button>
		</div>
		<ul>
			<c:forEach items="${blist}" var="blist">
    			<li class="post-container">
        			<div style="cursor: pointer;" onclick="location.href='/community_view?seqno=${blist.CommunityID}';">
            			<span class="post-title">${blist.CommunityTitle}</span><br><br>
            			<div class="post-content">${blist.Content}</div><br><br>
            			<div class="post-info">
                			<span class="post-views-likes">
                    			<span class="post-author">작성자 : ${blist.Name} ${blist.Position}</span><br>
                    			<span>조회수: ${blist.Views}</span><br>
                    			<span><img src="/P_img/like.png" style="width:20px;height:20px"> ${blist.Likes}</span><br>
                			</span>
                		<span class="post-time">${blist.CreatedTime}</span>
            			</div>
        			</div>
    			</li>
			</c:forEach>
		</ul>
		<div class="board-search-bar" style="border-bottom:1px solid lightgrey">
			<input type="text" placeholder="게시판 검색"  id="board-search-bar2" onkeyup="boardenterkey2()"><button class="search-board-button" id="search-board-button2"><img src="P_img/free-icon-magnifier-71403.png"></button>
		</div>
		<div style="margin-left:auto;margin-right:auto;text-align:center;font-size: x-large">${pagestr}</div>
	</div>
</div>
</body>
<script src='P_js/P_community.js'></script>
</html>