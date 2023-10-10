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
					<input type="text" id="userid" name="userid" placeholder="사번"autofocus>
					<input type="password" id="password" name="password" placeholder="비밀번호"><br>
					<input type="checkbox" id="auto"><a class="saveid">로그인저장</a>
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
<script>
	$(document).on('submit', '#frmLogin', async function(event) {
		event.preventDefault();
	    var password = $('#password').val();
	    var hashedPassword = await hashPassword(password); // 비밀번호 해싱
	    
	    console.log('mmmm=',hashedPassword);

	    
		if ($('#userid').val() == "" || $('#password').val() == "") {
			Swal.fire({
			      icon: 'warning',
			      title: '로그인실패.',
			      text: '사번 혹은 비밀번호를 입력해주세요.',
			    });
			return false;
			
		}
		$.ajax({
			url:'/doLogin',
			data:{userid:$('#userid').val(),password:hashedPassword, cookiePW:$('#password').val()},
			type:"post",
// 			dataType:"json", 이걸 생략했다는거는 텍스트타입으로 리턴받음
			success:function(data){
				if(data=='success'){	// 리턴 문자열을 받으면 실행
					console.log("로그인정보="+data);
					window.location.href="/";
				} else{
					console.error("로그인실패",data);
					Swal.fire({
					      icon: 'warning',
					      title: '로그인실패.',
					      text: '아이디 혹은 비밀번호를 확인해주세요.',
					    });
					window.location.href="redirect:/";
				}
			}, 
			error: function(xhr, status, error){
					console.error("로그인실패",error);
					Swal.fire({
					      icon: 'error',
					      title: '로그인오류.',
					      text: '관리자에게 문의하세요.',
				    });
			}
		})
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
    
    $('#auto').change(function() {
        if ($(this).is(':checked')) {
            // id=auto 체크박스가 체크되었을 때 쿠키 저장
            $.cookie('userid', $('#userid').val());
            $.cookie('password', $('#password').val());
        } else {
            // id=auto 체크박스가 해제되었을 때 쿠키 삭제
            $.removeCookie('userid');
            $.removeCookie('password');
        }
    });
});
	// -----로그인 비밀번호 암호화로 체크함수
	async function hashPassword(password) {
    var encoder = new TextEncoder();
    var data = encoder.encode(password);
    var hashBuffer = await crypto.subtle.digest("SHA-256", data);
    var hashArray = Array.from(new Uint8Array(hashBuffer));
    var hashHex = hashArray.map(byte => byte.toString(16).padStart(2, "0")).join("");
    return hashHex; // 해싱된 비밀번호 반환
}

	
</script>
</html>
