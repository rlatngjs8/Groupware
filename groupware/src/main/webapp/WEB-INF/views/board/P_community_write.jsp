<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<title>글쓰기</title>
<link href="/P_css/P_community_write.css" rel="stylesheet" type="text/css">
</head>
<%@ include file="../P_header.jsp" %>
<link href="/P_css/Main_Content.css" rel="stylesheet" type="text/css">
<body>
<div class="board">
	<div class="page-side">
	    <h3 class="boardTitle">커뮤니티</h3>
	    <a href='/community_write' class="big-button">글쓰기</a> <!-- 큰 버튼 스타일 적용 -->
		<div class="sideA">
	        <a href='/announcement'>공지사항</a>
	    </div>
	    <div class="sideA">
	        <a href='/community'>자유게시판</a>
	    </div>
	</div>
	<div class="writeTitle">
		<h3 class="boardTitle">자유게시판 글쓰기</h3>
	</div>
	<div id="editorContainer">
	    <div id="smarteditor">
	        <span>제목</span><input type="text" id="community_title" name="community_title">
	        <textarea name="editorTxt" id="editorTxt" rows="20" cols="10">
	        내용을 입력하세요
	        </textarea>
	    </div>
	    <input type="button" value="완료" id="submitButton" />
	</div>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src='P_js/P_community_write.js'></script>
</html>
