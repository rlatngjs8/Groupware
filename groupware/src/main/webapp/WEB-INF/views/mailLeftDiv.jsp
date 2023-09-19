<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mailLeftDiv</title>
</head>
<style>
.leftDiv {float:left; width:210px; padding:0 18px 0 18px; border:1px solid lightgray; border-right-width: 0;}
.leftDiv a {text-decoration: none; color: black;}
.leftDiv a:hover {color: gray;} 
.leftDiv ul {padding-left:0; margin:20px 0 0 0;}
.leftDiv ul li {width: 100%; list-style:none; text-align:left; font-size:15px; padding:20px 0 0 0;}
.whiteBtn {width: 200px; height: 44px; border: 1px solid black; border-radius: 4px; background-color: white;}
</style>
<body>
<div id='mailLeftDiv' class="leftDiv">
	<ul>
		<li style="font-weight:bold; font-size:20px; padding:0;">메일</li>
		<br>
		<li><input type="button" class="whiteBtn" value="메일쓰기"></li>
		<br>
		<li><a href="/mail" id="">전체메일</a></li>
		<li><a href="/mail" id="">받은메일함</a></li>
		<li><a href="/mail" id="">보낸메일함</a></li>
		<li><p style="border: 1px solid black; border-width: 0 0 1px; width:200px;"></p></li>
	</ul>
</div>
</body>
</html>