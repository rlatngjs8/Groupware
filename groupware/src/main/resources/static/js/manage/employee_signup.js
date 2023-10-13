$(document).ready(function() {
	$(document).ready(function() {
		// 페이지 로드 시 이미지 설정
		updatePreviewImage();

		// 파일 업로드 필드의 값이 변경될 때 미리보기 이미지 업데이트
		$('#profileIMG').change(function() {
			updatePreviewImage();
		});

		// 이미지 업데이트 함수 정의
		function updatePreviewImage() {
			var input = $('#profileIMG')[0];
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#previewIMG').attr('src', e.target.result);
				$('#previewIMG').show(); // 이미지를 보이도록 설정
			};

			// 이미지가 없을 경우 기본 이미지를 사용하거나 숨깁니다.
			if (input.files.length > 0) {
				reader.readAsDataURL(input.files[0]);
			} else {
				//       $('#previewIMG').hide();
			}
		}
	});



	// 부서명을 번호로 변경
	$('#department').change(function() {
		var selectedDepartment = $('#department').val();
		console.log(selectedDepartment);
	});


	// 생년월일 선택
	$(document).ready(function() {
		const birthYearEl = $('#birth-year');
		const birthMonthEl = $('#birth-month');
		const birthDayEl = $('#birth-day');
		// 연도 선택 목록 생성
		function createYearOptions() {
			for (let i = 1960; i <= 2010; i++) {
				birthYearEl.append($('<option>', { value: i, text: i }));
			}
		}
		// 월 선택 목록 생성
		function createMonthOptions() {
			for (let i = 1; i <= 12; i++) {
				birthMonthEl.append($('<option>', { value: i, text: i }));
			}
		}
		// 일 선택 목록 생성
		function createDayOptions() {
			for (let i = 1; i <= 31; i++) {
				birthDayEl.append($('<option>', { value: i, text: i }));
			}
		}
		// 연도, 월, 일 선택 목록 생성
		createYearOptions();
		createMonthOptions();
		createDayOptions();
		// 선택 목록 변경 이벤트 핸들러 연결
		birthYearEl.change(updateBirthdayField);
		birthMonthEl.change(updateBirthdayField);
		birthDayEl.change(updateBirthdayField);

		// 초기에도 한번 실행
		updateBirthdayField();
		//선택 목록 변경 시 호출되는 함수
		function updateBirthdayField() {
			let year = birthYearEl.val();
			let month = birthMonthEl.val();
			let day = birthDayEl.val();

			if (month.length === 1) {
				month = '0' + month;
			}
			if (day.length === 1) {
				day = '0' + day;
			}

			const birthday = year + '-' + month + '-' + day;
			$('#birthday').val(birthday);

			// 생년월일에서 하이픈 제거 후 비밀번호로 설정
			const password = birthday.replace(/-/g, '');
			$('#password').val(password);

			console.log("생년월일: " + birthday);
			console.log("비밀번호: " + password);
		}
	});
	$(document).ready(function() {
		// 전화번호 입력란의 ID를 가져옵니다. 이 예제에서는 phoneNumber입니다.
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
	});


	//영문이름 입력란에 영어만 입력 가능하도록 제한
	$(document).ready(function() {
		$("#Ename").on("input", function() {
			var inputElement = $(this);
			var inputValue = inputElement.val();

			// 정규식을 사용하여 영어만 입력되도록 제한
			var englishOnly = inputValue.replace(/[^a-zA-Z]/g, "");

			// 제한된 값을 다시 입력란에 설정
			inputElement.val(englishOnly);
		});
	});

	//이메일 주소 생성 함수
	function generateEmail() {
		// 사번 입력란의 ID를 가져옵니다. 이 예제에서는 "userid"라고 가정합니다.
		var Ename = $('#Ename').val();
		// 이메일 주소 형식으로 생성합니다. 여기서는 "@example.com"을 추가합니다.
		var email = Ename + '@example.com';
		// 생성된 이메일 주소를 이메일 입력 필드에 설정합니다.
		$('#email').val(email);
	}
	// 사번 입력란의 값이 변경될 때마다 이메일 주소를 생성합니다.
	$('#Ename').on('input', generateEmail);

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
		document.getElementById("frmsignup").submit();
	}

	//저장 버튼 클릭 시 처리 (여기에서 서버로 데이터를 전송할 수 있습니다.)
	$('#saveEmployeeBtn').click(function() {
		if ($('#name').val() == '') {
			alert('이름을 입력해주세요.'); return false;
		}
		if ($('#Ename').val() == '') {
			alert('영문이름을 입력해주세요.'); return false;
		}
		if ($('#userid').val() == '') {
			alert('사번을 입력해주세요.'); return false;
		}
		if ($('#department').val() == null) {
			alert('부서를 선택해주세요.'); return false;
		}
		if ($('#position').val() == null) {
			alert('직급을 선택해주세요.'); return false;
		}
		if ($('#birth-year').val() == null || $('#birth-month').val() == null || $('#birth-day').val() == null) {
			alert('생년월일을 입력해주세요.'); return false;
		}
		if ($('#phoneNumber').val() == '') {
			alert('전화번호를 입력해주세요.'); return false;
		}
		if ($('#address').val() == '') {
			alert('주소를 입력해주세요.'); return false;
		}
		if ($('#salary').val() == '') {
			alert('급여를 입력해주세요.'); return false;
		}
		if ($('#hireDate').val() == '') {
			alert('입사일을 입력해주세요.'); return false;
		}
		var password = $('#password').val();
		hashPassword(password);
		// 모달 닫기
		console.log("닫고 데이터 간다");
		$('#loading-container').show();
		alert("직원생성이 완료되었습니다.");

		$('#createEmployeeModal').css('display', 'none');
	});
});