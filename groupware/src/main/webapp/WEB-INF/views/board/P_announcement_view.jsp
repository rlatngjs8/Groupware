<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/P_css/thumblike.css" rel="stylesheet" type="text/css">
<link href="/P_css/Main_Content.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>GrouNexa:게시판 ${bpost.communityTitle}</title>
<%@ include file="../P_header.jsp" %>
<link href="/P_css/P_community_view.css" rel="stylesheet" type="text/css">

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
	        <a href='/community'>자유게시판</a><br>
	    </div>
	</div>
    <div class="Main_Content" style="margin-left: 426px;">
    	<div style="border-bottom:1px solid lightgrey;">
    			<h3 class="boardTitle" style="padding-left:40px;">공지사항 상세</h3>
    	</div>
        <div class="Post_Content">
        <input type="hidden" value="${bpost.communityID}" id="seq">
            <h3 class="boardTitle">제목: ${bpost.communityTitle}</h3>
            <span>작성자: ${bpost.name} ${bpost.position}</span>
            <span>작성시간: ${bpost.createdTime}</span> <span>${modidel}</span>
            <p>${bpost.content}</p>
            <span>조회수: ${bpost.views}</span>
        </div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src='P_js/P_announcement.js'></script>
</html>
