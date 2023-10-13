

$(document).ready(function() {
	// 이미지를 클릭하면 해당 필드를 수정 가능하게 변경
	console.log("불러와지고있는거임?")

	// URL에서 가져온 값들을 각 입력 필드에 설정
	const currentUrl = new URL(window.location.href);
	$('#editNameSpan').text(currentUrl.searchParams.get("name"));
	$('#editPositionSpan').text(currentUrl.searchParams.get("position"));
	$('#editPhoneSpan').text(currentUrl.searchParams.get("phone"));
	$('#editEmailSpan').text(currentUrl.searchParams.get("email"));
	$('#editDepartmentSpan').text(currentUrl.searchParams.get("department"));
	$('#editCompanySpan').text(currentUrl.searchParams.get("company"));
	$('#editCompanyPhoneSpan').text(currentUrl.searchParams.get("companyPhone"));
	$('#editCompanyAddressSpan').text(currentUrl.searchParams.get("companyAddress"));
	$('#editMemoSpan').text(currentUrl.searchParams.get("memo"));
	$('#editGroupNameSpan').text(currentUrl.searchParams.get("groupName"));

	$(".modify").click(function() {
		const fieldId = $(this).attr("id").replace("modify", "edit");
		const editSpan = $("#" + fieldId + "Span");
		const editInput = $("<input>")
			.attr("id", fieldId + "Input")
			.addClass("editInput")
			.val(editSpan.text());

		editSpan.replaceWith(editInput);
		$("#updateButton").show();
	});

	// 전화번호 입력란의 ID를 가져옵니다. 이 예제에서는 phoneNumber입니다.
	var phoneNumberInput = $('#editPhoneInput');

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

	$("#confirmStart").click(function() {
		Swal.fire({
			title: '연락처를 수정하시겠습니까?',
			icon: 'question',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '승인',
			cancelButtonText: '취소',
			reverseButtons: false, // 버튼 순서 거꾸로
		}).then((result) => {
			if (result.isConfirmed) {
				// 수정 로직을 진행
				$(".modify").click(); // .modify 클래스를 가진 요소를 클릭
				$(".modify + input").css("display", "none"); // 클릭한 후에 해당 input 태그를 숨김

				var newName = $("#editNameInput").val();
				var newPosition = $("#editPositionInput").val();
				var newPhone = $("#editPhoneInput").val();
				var newEmail = $("#editEmailInput").val();
				var newDepartment = $("#editDepartmentInput").val();
				var newCompany = $("#editCompanyInput").val();
				var newCompanyPhone = $("#editCompanyPhoneInput").val();
				var newCompanyAddress = $("#editCompanyAddressInput").val();
				var newMemo = $("#editMemoInput").val();
				var newGroupName = $("#editGroupNameInput").val();
				var addressBookId = currentUrl.searchParams.get("addressBookId"); // addressBookId 가져오기

				console.log("newName:", newName);
				console.log("newPosition:", newPosition);
				console.log("newPhone:", newPhone);
				console.log("newEmail:", newEmail);
				console.log("newDepartment:", newDepartment);
				console.log("newCompany:", newCompany);
				console.log("newCompanyPhone:", newCompanyPhone);
				console.log("newCompanyAddress:", newCompanyAddress);
				console.log("newMemo:", newMemo);
				console.log("newGroupName:", newGroupName);
				console.log("addressBookId:", addressBookId);

				// 모든 필드가 빈 값인지 확인합니다.
				if (
					!newName ||
					!newPosition ||
					!newPhone ||
					!newEmail ||
					!newCompany
				) {
					Swal.fire({
						icon: 'warning', // 경고 아이콘
						title: '모든 칸을 채워주세요.', // 메시지 제목
						showCancelButton: false, // 취소 버튼을 표시하지 않음
						confirmButtonText: '확인', // 확인 버튼의 텍스트
					}).then((result) => {
						return; // 업데이트 중지
					});
				}

				// 핸드폰 번호 형식 확인 (숫자만 허용)
				var phoneRegex = /^\d{3}-\d{4}-\d{4}$/; // 000-0000-0000 형식의 정규식

				if (!phoneRegex.test(newPhone)) {
					Swal.fire({
						icon: 'warning', // 경고 아이콘
						title: '000-0000-0000 형식으로 입력하세요.', // 메시지 제목
						showCancelButton: false, // 취소 버튼을 표시하지 않음
						confirmButtonText: '확인', // 확인 버튼의 텍스트
					}).then((result) => {
						return; // 업데이트 중지
					});
				}

				// 이메일 주소 형식 확인 (간단한 형식 검증, 더 엄격한 형식을 사용할 수도 있음)
				var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
				if (!emailRegex.test(newEmail)) {
					Swal.fire({
						icon: 'warning', // 경고 아이콘
						title: '올바른 이메일 형식이 아닙니다', // 메시지 제목
						showCancelButton: false, // 취소 버튼을 표시하지 않음
						confirmButtonText: '확인', // 확인 버튼의 텍스트
					}).then((result) => {
						return; // 업데이트 중지
					});
				}

				const updateContactData = {
					name: newName,
					position: newPosition,
					phone: newPhone,
					email: newEmail,
					department: newDepartment,
					company: newCompany,
					companyPhone: newCompanyPhone,
					companyAddress: newCompanyAddress,
					memo: newMemo,
					groupName: newGroupName,
					addressBookId: addressBookId
				};

				$.ajax({
					url: '/updateContact',
					type: 'post',
					data: updateContactData,
					success: function(data) {
						console.log('업데이트 성공', data);
						Swal.fire({
							icon: 'success',
							title: '수정이 완료되었습니다.',
							showCancelButton: false, // 확인 버튼만 표시
							confirmButtonText: '확인', // 확인 버튼 텍스트 설정
						}).then((result) => {
							if (result.isConfirmed) {
								// 확인 버튼을 클릭하면 페이지 리로드
								window.location.href = '/personal';

							}
						});
					},
					error: function(xhr, status, error) {
						console.error('업데이트 실패:', error);
						Swal.fire({
							icon: 'error',
							title: '업데이트 실패',
							text: '연락처 수정 중 오류가 발생했습니다.',
						});
					}
				});
			}
		});
	});

	$("#confirmDelete").click(function() {
		Swal.fire({
			title: '이 연락처를 삭제하실껀가요?',
			text: "다시 되돌릴 수 없습니다. 신중하세요.",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '승인',
			cancelButtonText: '취소',
			reverseButtons: false, // 버튼 순서 거꾸로
		}).then((result) => {
			if (result.isConfirmed) {
				// 승인 버튼을 클릭한 경우 Delete_emp 함수 호출
				Delete_emp();
			}
		})
	});



});

function Delete_emp() {
	var addressBookId = currentUrl.searchParams.get("addressBookId"); // addressBookId 가져오기

	$.ajax({
		url: '/Delete_emp',
		type: 'post',
		data: { addressBookId: addressBookId }, // 수정된 부분: 객체 형태로 속성과 값을 지정
		success: function(data) {
			console.log('업데이트 성공', data);
			Swal.fire({
				icon: 'success',
				title: '삭제가 완료되었습니다.',
				showCancelButton: false, // 확인 버튼만 표시
				confirmButtonText: '확인', // 확인 버튼 텍스트 설정
			}).then((result) => {
				if (result.isConfirmed) {
					// 확인 버튼을 클릭하면 페이지 리로드
					window.location.href = '/personal';
				}
			});
		},
		error: function(xhr, status, error) {
			console.error('업데이트 실패:', error);
			Swal.fire({
				icon: 'error',
				title: '업데이트 실패',
				text: '연락처 수정 중 오류가 발생했습니다.',
			});
		}
	});
}
