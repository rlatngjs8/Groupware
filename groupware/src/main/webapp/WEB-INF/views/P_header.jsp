<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
.menu ::before{
    font-family: 'Material Icons';
    font-size: 1.5em;
    float: left;
    clear: left;
}
.menu label::before{ content: '\e5d2'; }
.menu li:nth-child(1) a::before{ content: '\f02e'; }
.menu li:nth-child(2) a::before{ content: '\e8d6'; }
.menu li:nth-child(3) a::before{ content: '\e88a'; }
.menu li:nth-child(4) a::before{ content: '\e8cc'; }
.menu li:nth-child(5) a::before{ content: '\e87d'; }
.menu li:nth-child(6) a::before{ content: '\e8b8'; }
</style>
</head>
<body>
<div class="menu">
    <label for="expand-menu"><div>메뉴</div></label>
    <input type="checkbox" id="expand-menu" name="expand-menu">
    <ul>
        <li><a href="#" class="item"><div>프로필</div></a></li>
        <li><a href="#" class="item"><div>데이터사용량</div></a></li>
        <li><a href="#" class="item"><div>내URL</div></a></li>
        <li><a href="#" class="item"><div>구매내역</div></a></li>
        <li><a href="#" class="item"><div>추천목록</div></a></li>
        <li><a href="#" class="item"><div>설정</div></a></li>
    </ul>
</div>
</body>
</html>