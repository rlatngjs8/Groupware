$(document).ready(function() {
	var userid = $('#userid').val();

	$(document).on('click', '#check', function(event) {
		event.preventDefault();
		var password = $('#password').val();
		// 추가
		var hashedPassword = CryptoJS.SHA256(password).toString();
		
		console.log("사번="+userid);
		console.log("패스워드="+hashedPassword);

		if (password == '') {
			alert('비밀번호를 입력해주세요');
			return false;
		}

		// 비밀번호 해싱 및 비밀번호 체크
//		hashPassword(password)
//			.then(function(hashedPassword) {
				$.ajax({
					url: '/checkPassword',
					type: 'post',
					data: {
						userid: userid,
						password: hashedPassword // 해싱된 비밀번호 전달
//						 	password: $('#password').val()
					},
					success: function(data) {
						if (data == 'success') {
							console.log("로그인정보=" + data);
							$('#info').show();
							$('#checkPassword').hide();
						} else {
							console.error("로그인실패", data);
							alert("비밀번호를 확인해주세요");
						}
					},
					error: function(xhr, status, error) {
						console.error('로그인실패', error);
					}
				});
//			})
//			.catch(function(error) {
//				console.error('비밀번호 해싱 오류', error);
//			});
	});

	// -----로그인 비밀번호 암호화로 체크함수
//	async function hashPassword(password) {
//		var encoder = new TextEncoder();
//		var data = encoder.encode(password);
//		var hashBuffer = await crypto.subtle.digest("SHA-256", data);
//		var hashArray = Array.from(new Uint8Array(hashBuffer));
//		var hashHex = hashArray.map(byte => byte.toString(16).padStart(2, "0")).join("");
//		return hashHex; // 해싱된 비밀번호 반환
//	}

	$(document).on('click', '#editModal', function() {
		$('#editSelf').show();
	});

	$(document).on('click', '#closeModal', function() {
		$('#editSelf').hide();
	});
});