<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.container {
	text-align: center;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h3 {
	margin: 0;
}

input[type="text"], input[type="password"] {
	width: 70%;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-radius: 3px;
}

input[type="submit"] {
	width: 40%;
	padding: 10px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

#auto {
	margin-left: -50%;
}
</style>
</head>
<body>
	<div class="container">
		<div>
			<div>
				<h3>로그인</h3>
				<br>
				<hr />
				<br>
			</div>
			<form id="frmLogin" action="/doLogin" method="post">
				<div>
					<input type="text" id="userid" name="userid" placeholder="사번"
						autofocus> <input type="password" id="password"
						name="password" placeholder="비밀번호"> <br> <input
						type="checkbox" id="auto"><a class="saveid">로그인저장</a>
				</div>
				<br>
				<div>
					<input type="submit" id="btnsubmit" value="로그인">
				</div>
				<c:if test="${loginFailed}">
					<script>
						alert("아이디 혹은 비밀번호를 확인해주세요");
					</script>
				</c:if>
			</form>
		</div>
	</div>
</body>
<script src="http://code.jquery.com/jquery-Latest.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script>
	$(document).on('submit', '#frmLogin', function() {
		if ($('#userid').val() == "" || $('#password').val() == "") {
			alert("사번 혹은 비밀번호를 입력해주세요");
			return false;
		}
		$.post('/doLogin', {
			userid : $('#userid').val(),
			password : $('#password').val()
		}, function(data) {
			if (data == '0') { // 로그인 성공
				if ($('#auto').prop('checked') == true) {
					$.cookie('userid', $('#userid').val());
					$.cookie('passcode', $('#password').val());
				}
			} else {// 실패 
				console.log("쿠키저장 실패");
			}
		}, 'json')
	})
	$(document).ready(function() {
		var useridCookie = $.cookie('userid');
		var passwordCookie = $.cookie('password');
		console.log("userid 쿠키=" + useridCookie);
		console.log("password 쿠키=" + passwordCookie);

		if (useridCookie != null && passwordCookie != null) {
			$('#userid').val(useridCookie);
			$('#password').val(passwordCookie);
		}
	});
	// -----로그인 비밀번호 암호화로 체크
	async function hashPassword(password) {
	    // TextEncoder를 사용하여 비밀번호를 바이트 배열로 변환
	    var encoder = new TextEncoder();
	    var data = encoder.encode(password);

	    // 비밀번호를 SHA-256으로 해싱
	    var hashBuffer = await crypto.subtle.digest("SHA-256", data);

	    // 해싱된 비밀번호를 16진수 문자열로 변환
	    var hashArray = Array.from(new Uint8Array(hashBuffer));
	    var hashHex = hashArray.map(byte => byte.toString(16).padStart(2, "0")).join("");

	    // 해싱된 비밀번호를 콘솔에 출력
	    console.log("해싱된 비밀번호:", hashHex);

	    // 해싱된 비밀번호를 서버로 전송
	    document.getElementById("password").value = hashHex;
	    document.getElementById("frmLogin").submit();
	}

	
</script>
</html>
