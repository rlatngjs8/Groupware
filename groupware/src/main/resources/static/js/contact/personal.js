//jQuery를 사용하여 모달을 제어합니다.
$(document).ready(function() {
	//#per_name 열을 클릭했을 때 페이지 이동
	$('#contactListBody').on('click', 'tr', function(event) {
		var nameColumn = $(this).find('#per_name'); // #per_name 열을 선택
		console.log("뭐요")

 
		// 클릭한 열의 #per_name 열을 클릭한 경우에만 페이지 이동
		if ($(event.target).is(nameColumn)) {
			var name = nameColumn.text();
			var position = $(this).find('#per_position').text();
			var phone = $(this).find('#per_phone').text();
			var email = $(this).find('#per_email').text();
			var department = $(this).find('#per_department').text();
			var company = $(this).find('#per_company').text();
			var companyPhone = $(this).find('#per_company_phone').text();
			var companyAddress = $(this).find('#per_company_address').text();
			var memo = $(this).find('#per_memo').text();
			var groupName = $(this).find('#per_group_name').text();
			var addressBookId = $(this).find('.address-book-id').val();

			// 데이터를 Detail.jsp로 전달하고 페이지 이동
			window.location.href = 'detail?name=' + encodeURIComponent(name) + '&position=' + encodeURIComponent(position) + '&phone=' + encodeURIComponent(phone) + '&email=' + encodeURIComponent(email) + '&department=' + encodeURIComponent(department) + '&company=' + encodeURIComponent(company) + '&companyPhone=' + encodeURIComponent(companyPhone) + '&companyAddress=' + encodeURIComponent(companyAddress) + '&memo=' + encodeURIComponent(memo) + '&groupName=' + encodeURIComponent(groupName) + '&addressBookId=' + encodeURIComponent(addressBookId);
		}
	});
	
	
});



let currentPage = 1; // 현재 페이지 번호
const perPage = 13; // 한 페이지당 표시할 데이터 수

// 페이지 번호를 클릭할 때 호출되는 함수
function changePage(page) {
	currentPage = page;
	console.log('changePage 함수 호출: 페이지', currentPage);
	sort('all', currentPage);
}

function sort(name, page) {
	console.log('개인 주소록 불러옴');
	const userid = $('#user_id').val();
	console.log(userid);
	$.ajax({
		url: '/get_personal_addressBook',
		data: { userid: userid, name: name, page: page }, // 필터 값을 서버로 전송
		type: 'get',
		dataType: 'json',
		success: function(data) {
			console.log('주소록 데이터 불러오기', data);
			const tableBody = $('#contactListBody');
			tableBody.empty(); // 기존 데이터를 지웁니다.
			if (data.length === 0) {
				// 데이터가 없는 경우 빈 테이블 행을 추가
				const newRow = $('<tr>');
				newRow.append('<td colspan="11" style="text-align: center;">' +
					'<p>새 연락처를 추가해주세요.</p>' +
					'<div style="text-align: center;">' +
					'</div>' +
					'</td>');
				$('#contactListBody').append(newRow);
			} else {
				// 데이터가 있는 경우 연락처를 추가
				for (let i = (page - 1) * perPage; i < page * perPage && i < data.length; i++) {
					const newRow = $('<tr>');
					newRow.append('<td style="text-align: center;"><input type="checkbox" id="perCheckbox"></td>');
					newRow.append('<td id="per_name" style="cursor: pointer; text-align: center;">' + data[i]['name'] + '</td>');
					newRow.append('<td id="per_position" style="text-align: center;">' + data[i]['position'] + '</td>');
					newRow.append('<td id="per_phone" style="text-align: center;">' + data[i]['phone'] + '</td>');
					newRow.append('<td id="per_email" style="text-align: center;"><a href="mailto:' + data[i]['email'] + '">' + data[i]['email'] + '</a></td>');
					newRow.append('<td id="per_department" style="text-align: center;">' + data[i]['department'] + '</td>');
					newRow.append('<td id="per_company" style="text-align: center;">' + data[i]['company'] + '</td>');
					newRow.append('<td id="per_company_phone" style="text-align: center;">' + data[i]['company_phone'] + '</td>');
					newRow.append('<td id="per_company_address" style="text-align: center;">' + data[i]['company_address'] + '</td>');
					newRow.append('<td id="per_memo" style="text-align: center;">' + data[i]['memo'] + '</td>');
					newRow.append('<td id="per_group_name" style="text-align: center;">' + data[i]['group_name'] + '</td>');
					newRow.append('<input type="hidden" class="address-book-id" value="' + data[i]['address_book_id'] + '">');
					$('#contactListBody').append(newRow);
				}
			}
			updatePagination(data.length);
		},
		error: function(xhr, status, error) {
			console.error('주소록 데이터 불러오기 에러:', status, error);
			// 에러 처리를 수행할 수 있습니다. 예를 들어, 사용자에게 오류 메시지를 표시하는 등의 작업을 수행할 수 있습니다.
		}
	});
}

function updatePagination(totalPage) {
	const totalPages = Math.ceil(totalPage / perPage);
	let paginationHTML = '';

	for (let i = 1; i <= totalPages; i++) {
		if (i === currentPage) {
			paginationHTML += '<span>' + i + '</span>';
		} else {
			paginationHTML += "<a href='#' onclick='changePage(" + i + ")'>" + i + "</a>";
		}
	}

	$("#pagination").html(paginationHTML);
}

// 페이지 로딩 시 초기 데이터 가져오기
$(document).ready(function() {
	sort('all', currentPage);
	console.log('문서가 로드되었습니다.');
});


//전체 선택 체크박스 클릭 이벤트 처리
$("#selectAll").click(function() {
	// 전체 선택 체크박스의 상태를 가져옵니다.
	var isChecked = $(this).prop("checked");

	// 모든 개별 체크박스의 상태를 전체 선택 체크박스와 동일하게 설정합니다.
	$("input[type='checkbox'][id='perCheckbox']").prop("checked", isChecked);
});


function deleteContact() {
	const selectedContacts = $('#contactListBody input[type="checkbox"]:checked');

	// 선택된 연락처가 없으면 아무 작업도 수행하지 않음
	if (selectedContacts.length === 0) {
		showToast("삭제할 연락처를 선택해주세요.");
		return;
	}

	selectedContacts.each(function() {
		const addressBookId = $(this).closest('tr').find('.address-book-id').val();
		console.log("Deleting Address Book ID:", addressBookId); // 콘솔에 addressBookId 찍기

		// 서버로 개별적인 삭제 요청 보내기
		$.ajax({
			url: "/delete_addressBook",
			data: { addressBookId: addressBookId },
			type: 'post',
			success: function(data) {
				if (data === '0') {
					console.error("삭제 실패:", data);
				} else {
					console.log("삭제 성공");
					window.location.reload();
				}
			},
			error: function(xhr, status, error) {
				console.error("삭제 실패:", error);
			}
		});
	});
}


$().ready(function() {
	$("#confirmStart").click(function() {
		const selectedContacts = $('#contactListBody input[type="checkbox"]:checked');

		// 선택된 연락처가 없으면 경고 메시지를 표시하고 함수 종료
		if (selectedContacts.length === 0) {
			Swal.fire({
				icon: 'warning',
				title: '연락처를 선택해주세요.',
				showConfirmButton: false,
				timer: 2000, // 2초 동안 메시지 표시
			});
			return;
		}

		// 선택된 연락처가 있으면 삭제 확인 모달을 표시
		Swal.fire({
			title: '연락처를 삭제하시겠습니까?',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '승인',
			cancelButtonText: '취소',
			reverseButtons: false, // 버튼 순서 거꾸로
		}).then((result) => {
			if (result.isConfirmed) {
				// 삭제 로직을 진행
				selectedContacts.each(function() {
					const addressBookId = $(this).closest('tr').find('.address-book-id').val();
					console.log("Deleting Address Book ID:", addressBookId); // 콘솔에 addressBookId 찍기

					// 서버로 개별적인 삭제 요청 보내기
					$.ajax({
						url: "/delete_addressBook",
						data: { addressBookId: addressBookId },
						type: 'post',
						success: function(data) {
							if (data === '0') {
								console.error("삭제 실패:", data);
								Swal.fire({
									icon: 'error',
									title: '삭제 실패',
									text: '연락처 삭제 중 오류가 발생했습니다.',
								});
							} else {
								console.log("삭제 성공");
							}
						},
						error: function(xhr, status, error) {
							console.error("삭제 실패:", error);
							Swal.fire({
								icon: 'error',
								title: '삭제 실패',
								text: '연락처 삭제 중 오류가 발생했습니다.',
							});
						}
					});
				});
				Swal.fire({
					icon: 'success',
					title: '삭제가 완료되었습니다.',
					showCancelButton: false, // 확인 버튼만 표시
					confirmButtonText: '확인', // 확인 버튼 텍스트 설정
				}).then((result) => {
					if (result.isConfirmed) {
						// 확인 버튼을 클릭하면 페이지 리로드
						location.reload();
					}
				});
			}
		});
	});
	
		// 핸드폰 번호 포맷팅 함수 정의
	function formatPhoneNumber(phoneNumber) {
	    // 입력된 번호에서 숫자만 추출
	    const digits = phoneNumber.replace(/\D/g, '');
	
	    // 10자리 혹은 11자리 번호인 경우에만 포맷팅
	    if (digits.length === 10) {
	        return digits.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
	    } else if (digits.length === 11) {
	        return digits.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
	    } else {
	        return phoneNumber; // 10자리나 11자리가 아니면 원래 값을 반환
	    }
	}



	$(document).on('click', '#promptStart', function() {
		(async () => {
			
			const { value: formValues, dismiss: dismissReason } = await Swal.fire({
				position: 'top',
				title: '새 연락처 등록',
				html:
					'<input id="swal-input1" class="swal2-input" placeholder="이름">' +
					'<input id="swal-input2" class="swal2-input" placeholder="직위">' +
					'<input id="swal-input3" class="swal2-input" placeholder="핸드폰(000-0000-000)">' +
					'<input id="swal-input4" class="swal2-input" placeholder="이메일(xxx@naver.com)">' +
					'<input id="swal-input5" class="swal2-input" placeholder="부서">' +
					'<input id="swal-input6" class="swal2-input" placeholder="회사">' +
					'<input id="swal-input7" class="swal2-input" placeholder="회사 전화">' +
					'<input id="swal-input8" class="swal2-input" placeholder="회사 주소">' +
					'<input id="swal-input9" class="swal2-input" placeholder="메모">' +
					'<input id="swal-input10" class="swal2-input" placeholder="그룹">',
				focusConfirm: false,
				showCancelButton: true,
				customClass: {
					popup: 'swal2-custom',
					confirmButton: 'swal2-confirm',
					cancelButton: 'swal2-cancel',
				},
				cancelButtonText: '취소', // 취소 버튼 텍스트 설정
				confirmButtonText: '등록', // 확인 버튼 텍스트 설정
				onBeforeOpen: (popup) => {
					popup.style.marginTop = '200px';
					const confirmButton = popup.querySelector('.swal2-confirm');
					const cancelButton = popup.querySelector('.swal2-cancel');
				},

				preConfirm: () => {
					const values = [
						$('#swal-input1').val(),
						$('#swal-input2').val(),
		    formatPhoneNumber($('#swal-input3').val()), // 핸드폰 번호 포맷팅 함수 호출
						$('#swal-input4').val(),
						$('#swal-input5').val(),
						$('#swal-input6').val(),
						$('#swal-input7').val(),
						$('#swal-input8').val(),
						$('#swal-input9').val(),
						$('#swal-input10').val()
					];

					const isValid = values.every(value => value !== '' && value !== null);

					if (!isValid) {
						Swal.showValidationMessage('빈칸을 채워주세요.');
					}

					return values;
				}
			});

			if (dismissReason === Swal.DismissReason.cancel) {
				Swal.fire('입력이 취소되었습니다.');
			} else if (formValues) {
				// 주소록 추가 ajax 요청
				addAddressBook(formValues);
			}
		})();
	});


	// 주소록 추가 함수
	function addAddressBook(formValues) {
		console.log("개인 주소록 insert 중이에요");
		const addName = formValues[0];
		const addPosition = formValues[1];
		const addPhone = formValues[2];
		const addEmail = formValues[3];
		const addDepartment = formValues[4];
		const addCompany = formValues[5];
		const addCompanyPhone = formValues[6];
		const addCompanyAddress = formValues[7];
		const addMemo = formValues[8];
		const addGroup = formValues[9];
		const userid = $('#user_id').val();

		const addressBookData = {
			Name: addName,
			Position: addPosition,
			Phone: addPhone,
			Email: addEmail,
			Department: addDepartment,
			Company: addCompany,
			CompanyPhone: addCompanyPhone,
			CompanyAddress: addCompanyAddress,
			Memo: addMemo,
			Group: addGroup,
			userid: userid
		};

		console.log(addressBookData);

		$.ajax({
			url: '/insert_addressBook',
			type: 'post',
			data: addressBookData,
			success: function(data) {
				console.log('인서트 성공', data);
				Swal.fire({
					icon: 'success',
					title: '성공',
					text: '주소록이 추가되었습니다.',
					confirmButtonText: '확인' // 확인 버튼 추가
				}).then((result) => {
					if (result.isConfirmed) {
						// 확인 버튼을 누르면 페이지 리로드
						location.reload();
					}
				});
			},
			error: function(error) {
				console.error('인서트 실패:', error);
				Swal.fire({
					icon: 'warning',
					title: '실패',
					text: '주소록 추가에 실패하였습니다.',
					confirmButtonText: '확인' // 확인 버튼 추가
				});
			}
		});
	}


});
