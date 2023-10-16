$(document).ready(function() {

	// 전화번호 입력란의 ID를 가져옵니다. 이 예제에서는 phoneNumber입니다.
	var phoneNumberInput = $('#phoneNumber1');

	// 입력 필드의 값을 변경할 때 이벤트 핸들러를 추가합니다.
	phoneNumberInput.on('input', function() {
		// 입력된 전화번호에서 숫자만 추출합니다.
		var phoneNumber = phoneNumberInput.val().replace(/\D/g, '');

		// 전화번호가 11자리를 초과하지 않도록 제한합니다.
		if (phoneNumber.length > 11) {
			phoneNumber = phoneNumber.slice(0, 11);
		}

		// 전화번호 형식을 적용하여 하이픈을 추가합니다.
		if (phoneNumber.length >= 4 && phoneNumber.length <= 7) {
			phoneNumber = phoneNumber.replace(/(\d{3})(\d{1,4})/, '$1-$2');
		} else if (phoneNumber.length >= 8) {
			phoneNumber = phoneNumber.replace(/(\d{3})(\d{4})(\d{1,4})/, '$1-$2-$3');
		}

		// 입력 필드에 변경된 전화번호를 설정합니다.
		phoneNumberInput.val(phoneNumber);
	});
	//파일 업로드 필드의 값이 변경되었을 때 미리보기 이미지 업데이트
	$('#profileIMG').change(function() {
		var input = this;
		var reader = new FileReader();

		reader.onload = function(e) {
			$('#exImage').attr('src', e.target.result);
			//     $('#exImage').show(); // 이미지를 보이도록 설정
		};

		reader.readAsDataURL(input.files[0]);
	});

	$('#btnSubmit').on('click', function(event) {
		event.preventDefault(); // 기본 동작(양식 제출)을 막습니다.

		// 비밀번호 입력란의 ID를 가져옵니다. 이 예제에서는 password1입니다.
		var passwordInput = $('#password1');

		// 입력된 비밀번호를 가져옵니다.
		var password = passwordInput.val();

		// 비밀번호를 해싱합니다. CryptoJS.SHA256를 사용하여 SHA-256 해시를 생성합니다.
		var hashedPassword = CryptoJS.SHA256(password).toString();
		if (hashedPassword == "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855") {
			alert("새로운 비밀번호를 입력해주세요");
			return false;
		}
		// 해싱된 비밀번호를 비밀번호 입력 필드에 설정합니다.
		passwordInput.val(hashedPassword);



		// 양식을 서버로 제출합니다.
		$('#frmEdit').submit();
		$('#loading-container').show();
		alert("정보수정이 완료되었습니다.");
	});
});


