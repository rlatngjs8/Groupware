$(document).ready(function() {
	// 전화번호 입력란의 ID를 가져옵니다. 이 예제에서는 editPhoneNumberInput입니다.
	var phoneNumberInput = $('#phoneNumber');

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


	$(document).ready(function() {
		// 월 급여 입력 필드를 가져옵니다.
		var salaryInput = $("#salary");

		// 입력이 변경될 때마다 이벤트를 실행합니다.
		salaryInput.on("input", function() {
			// 입력된 급여 값을 가져옵니다.
			var salaryValue = salaryInput.val();

			// 숫자가 아닌 문자를 제거하고, 천 단위로 쉼표를 추가합니다.
			salaryValue = salaryValue.replace(/\D/g, "");
			salaryValue = salaryValue.replace(/\B(?=(\d{3})+(?!\d))/g, ",");

			// 변경된 값을 다시 입력 필드에 설정합니다.
			salaryInput.val(salaryValue);
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



	$(document).ready(function() {
		$('#btnBack').click(function() {
			window.history.back();
		})
		$('#btnSubmit').click(function() {
			$('#loading-container').show();
			alert("수정완료");
		})
	});
})