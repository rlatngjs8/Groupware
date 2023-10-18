<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<title>공지 쓰기</title>
<link href="P_css/P_announcement_write.css" rel="stylesheet" type="text/css">
</head>
<%@ include file="../P_header.jsp" %>
<link href="/P_css/Main_Content.css" rel="stylesheet" type="text/css">
<body>
<div class="board">
	<div class="page-side">
		<h3 class="boardTitle">켜뮤니티</h3>
		<%
 		String id =(String)session.getAttribute("userid");
		if(id.equals("관리자1")){
		%>
			<a href='/announcement_write' class="big-button">공지사항 작성</a>
			<div class="sideA">
       			<a href='/announcement'>공지사항</a>
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
	<div class="writeTitle">
		<h3 class="boardTitle">공지사항 작성</h3>
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
<script src='P_js/P_announcement_write.js'></script>
</html>
