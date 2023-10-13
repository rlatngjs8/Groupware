$(document).ready(function() {
	async function hashPassword(password) {
		// TextEncoder를 사용하여 비밀번호를 바이트 배열로 변환
		var encoder = new TextEncoder();
		var data = encoder.encode(password);

		try {
			// 비밀번호를 SHA-256으로 해싱
			var hashBuffer = await crypto.subtle.digest("SHA-256", data);

			// 해싱된 비밀번호를 16진수 문자열로 변환
			var hashArray = Array.from(new Uint8Array(hashBuffer));
			var hashHex = hashArray.map(byte => byte.toString(16).padStart(2, "0")).join("");

			// 해싱된 비밀번호 반환
			return hashHex;
		} catch (error) {
			console.error("비밀번호 해싱 오류:", error);
		}
	}

	$('#email2').on('input', function() {
		// 입력된 이메일의 첫 부분을 가져와서 @example.com을 추가한 뒤 email1에 설정
		var email2Value = $(this).val(); // email2 입력란의 값 가져오기
		var email1Value = email2Value + '@example.com'; // @example.com을 추가한 문자열 생성
		$('#email1').val(email1Value); // email1 입력란에 값을 설정
	});


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


	$('#btnSubmit').click(async function(event) {

		event.preventDefault(); // 폼 제출 막기

		var password = $('#password1').val();
		var phoneNumber = $('#phoneNumber1').val();
		var email = $('#email2').val();
		var address = $('#address1').val();
		// 비밀번호가 비어 있는지 확인
		if (!password || !phoneNumber || !email || !address) {
			alert("입력란을 모두 입력하세요.");
			return; // 비밀번호가 비어 있으면 함수를 종료하고 폼 제출을 막습니다.
		}

		try {
			var hashHex = await hashPassword(password);
			// 해시가 완료되면 폼 제출하기
			document.getElementById("password1").value = hashHex;




			document.getElementById("frmEdit").submit();
			$('#loading-container').show();
			alert("수정완료");
			console.log(password);
		} catch (error) {
			console.error("비밀번호 해싱 오류:", error);
		}
	})
})