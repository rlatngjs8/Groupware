<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/emailCSS.css" rel="stylesheet" type="text/css"/>
<title>mailLeftDiv</title>
</head>
<style>
.leftDiv {width:210px; height:100%; padding:0 18px 0 18px; border:1px solid lightgray; border-right-width: 0; border-bottom:0;}
.leftDiv a {text-decoration: none; color: black;}
.leftDiv a:hover {color: gray;} 
.leftDiv ul {padding-left:0; margin:20px 0 0 0;}
.leftDiv ul li {width: 100%; list-style:none; text-align:left; font-size:15px; padding:20px 0 0 0;}
#mailTitle {font-weight:bold; font-size:20px; padding:0; cursor:pointer}
</style>
<body>
<div style="padding-left:210px;">
<div id='mailLeftDiv' class="leftDiv">
	<ul>
		<li id="mailTitle">메일</li>
		<br>
		<li><input type="button" id="mailWriteBtn" class="whiteBtn whiteBtn2" value="메일쓰기"></li>
		<br>
		<li><a href="/mailFolder1" id="mailFolder1">받은메일함</a></li>
		<li><a href="/mailFolder2" id="mailFolder2">보낸메일함</a></li>
<!-- 		<li><a href="/mailFolder3" id="mailFolder3">중요메일함</a></li> -->
<!-- 		<li><a href="/mailFolder3" id="mailFolder4">휴지통</a></li> -->
<!-- 		<li><p style="border: 1px solid black; border-width: 0 0 1px; width:200px;"></p></li> -->
	</ul>
</div>
</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

$(document)
.on('click','#mailTitle', function(){
	document.location="/mailFolder1";
})
.on('click','#mailWriteBtn', function(){
	document.location="/mailWrite";
});

</script>
</html>