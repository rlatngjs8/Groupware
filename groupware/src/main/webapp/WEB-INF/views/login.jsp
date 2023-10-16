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
      position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    z-index: 1059;
    height: 600px;
    width: 400px;
}

h3 {
	margin: 0;
    text-align: left;
    color: rgb(106, 176, 173);
    font-size: 40px;
    font-weight: bold;
    margin-top: 25%;
    margin-left: 10px;
}

input[type="text"], input[type="password"] {
	  width: 90%;
    padding: 15px;
    margin: 10px 0;
    font-size: 16px;
    border: 1px solid #a1a1a1;
    border-radius: 3px;
    border-top: none;
    border-left: none;
    border-right: none;
    z-index:2000;
    position: relative;
}

input[type="submit"] {
	    width: 40%;
    padding: 10px;
    background-color: rgb(106, 176, 173);
    color: #fff;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    margin-left: 58%;
    margin-top: 60px;
    font-size: 17px;
}
input[type="submit"]:hover{
	background-color: rgb(46, 146, 143);
}
#auto {
	margin-left: -50%;
}
<<<<<<< HEAD

=======
.check{
	position: relative;
    right: 40px;
    top: 10px;
    color: #585858;
}
.logo{
height: 400px;
    width: 400px;
    left: 20px;
    bottom: 260px;
    position: absolute;
}
.inputbox{
    margin-top: 250px;
    }
.Post_Content p {
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}
>>>>>>> refs/remotes/origin/master
</style>
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
<script>
    $(document).on('submit', '#frmLogin', function(event) {
        event.preventDefault();
        var password = $('#password').val();
        var hashedPassword = CryptoJS.SHA256(password).toString();

        if ($('#userid').val() == "" || $('#password').val() == "") {
            Swal.fire({
                icon: 'warning',
                title: '로그인실패.',
                text: '사번 혹은 비밀번호를 입력해주세요.',
            });
            return false;
        }
        $.ajax({
            url: '/doLogin',
            data: { userid: $('#userid').val(), password: hashedPassword, cookiePW: $('#password').val() },
            type: "post",
            success: function(data) {
                if (data == 'success') {
                    console.log("로그인정보=" + data);
                    window.location.href = "/";
                } else {
                    console.error("로그인실패", data);
                    Swal.fire({
                        icon: 'warning',
                        title: '로그인실패.',
                        text: '아이디 혹은 비밀번호를 확인해주세요.',
                    });
                    window.location.href = "redirect:/";
                }
            },
            error: function(xhr, status, error) {
                console.error("로그인실패", error);
                Swal.fire({
                    icon: 'error',
                    title: '로그인오류.',
                    text: '관리자에게 문의하세요.',
                });
            }
        })
    });

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
                $.cookie('userid', $('#userid').val());
                $.cookie('password', $('#password').val());
            } else {
                $.removeCookie('userid');
                $.removeCookie('password');
            }
        });
    });
</script>
</html>