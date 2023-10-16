<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/emailCSS.css" rel="stylesheet" type="text/css"/>
<title>mailLeftDiv</title>
</head>
<body>
<div style="margin-left:190px; width:246px;">
<div id='mailLeftDiv' class="leftDiv">
	<ul>
		<li id="mailTitle">메일</li>
		<br>
		<li><input type="button" id="mailWriteBtn" class="whiteBtn whiteBtn2" value="메일쓰기"></li>
		<br>
		<li><a href="/mailFolder1" id="mailFolder1">받은메일함</a></li>
		<li><a href="/mailFolder2" id="mailFolder2">보낸메일함</a></li>
		<li><a href="/mailMark" id="mailMark">중요메일함</a></li>
		<li><a href="/trashcanFolder" id="trashcanFolder">휴지통</a></li>
	</ul>
</div>
</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="js/email.js"></script>
</html>