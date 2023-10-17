<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="css/login.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div>
            <div>
<!--                 <h3>로그인</h3> -->
								<a href="/"><img src="/img/loginLogo.png" class="logo" ></a>
                <br>
                <br>
            </div>
            <form id="frmLogin" action="/doLogin" method="post">
                <div class="inputbox">
                    <input type="text" id="userid" name="userid" placeholder="사번" autofocus>
                    <input type="password" id="password" name="password" placeholder="비밀번호"><br>
                    <div class="check"><input type="checkbox" id="auto"><a class="saveid">로그인저장</a></div>
                </div>
                <br>
                <div>
                    <input type="submit" id="btnsubmit" value="로그인">
                </div>
            </form>
        </div>
    </div>
</body>
<script src="http://code.jquery.com/jquery-Latest.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.js"></script>
<script src="js/login.js"></script>
</html>