$(document).ready(function() {

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
			data: {
				userid: $('#userid').val(),
				password: hashedPassword,
				//             	password:password,
				cookiePW: $('#password').val()
			},
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
})