<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

</style>
<title>GroupNexa</title>
<style>
    .profile-box {
    	margin-left: 240px;
        width: 200px; /* div의 넓이를 200px로 설정 */
        align-items: center;
        gap: 10px;
        border: 1px solid #000;
        padding: 10px;
    }

    .rounded-image {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        overflow: hidden;
        margin-left: 25%;
    }

    .profile-name {
        text-align: center;
    }
</style>
</head>
<body>
<%@ include file="P_header.jsp" %>
<div>
    <div class="profile-box">
        <div class="rounded-image">
            <img src="img/${profileIMG}" style="width: 100%; height: 100%;" alt="프로필 이미지">
            <button id=btnLogout >임시 로그아웃</button>
        </div>
        <div class="profile-name">
        	<p>${name}</p>
    	</div>
    </div>
    
</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).on('click','#btnLogout',function(){
    window.location.href = "/logout";
 })
</script>
</html>
