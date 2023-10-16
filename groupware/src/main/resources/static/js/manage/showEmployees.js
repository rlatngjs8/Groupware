$(document).ready(function() {
	//-----직원생성 모달  
	// 직원 생성 버튼 클릭 시 모달 열기
	$('#createEmployeeBtn').click(function() {
		$('#createEmployeeModal').css('display', 'block');
	});

	// 모달 닫기 버튼 클릭 시 모달 닫기
	$('#closeEmployeeModalBtn').click(function() {
		$('#createEmployeeModal').css('display', 'none');
	});

	// 모달 바깥 영역 클릭 시 모달 닫기
	$(window).click(function(event) {
		if (event.target.id === 'createEmployeeModal') {
			$('#createEmployeeModal').css('display', 'none');
		}
	});
	//-----------
	//----체크박스 맨위꺼 체크하면 전부 체크
	var selectAllCheckbox = $('#selectAllCheckbox');
	var employeeCheckboxes = $('.employeeCheckbox');

	selectAllCheckbox.click(function() {
		var isChecked = selectAllCheckbox.prop('checked'); // 맨 위 체크박스의 상태 가져오기
		employeeCheckboxes.prop('checked', isChecked); // 모든 하위 체크박스에 적용
	});
	//-------
	//----선택한 행 삭제
	$(document).ready(function() {
		$(document).on('click', '#deleteEMP', function() {
			var deleteEMP = $('.employeeCheckbox:checked');
			console.log("deleteEMP=" + deleteEMP);
			if (deleteEMP.length == 0) {
				alert("삭제할 직원을 선택하세요.");
				return;
			}
			var confirmDelete = confirm("정말로 선택한 직원을 삭제하시겠습니까?");
			if (confirmDelete) {
				deleteEMP.each(function() {
					var userid = $(this).val();
					var name = $(this).closest('tr').find('td:eq(1)').text(); // 두 번째 열(td)의 텍스트 값 (이름) 가져오기
					var rowToRemove = $(this).closest('tr'); // 삭제할 행 찾기
					console.log("삭제직원 사번:" + userid);
					$.ajax({
						url: '/deleteEMP',
						data: { userid: userid, name: name },
						type: 'post',
						dataType: 'text',
						success: function(data) {
							console.log('삭제성공');
							rowToRemove.remove(); // 테이블에서 해당 행 제거
							alert('삭제가 완료되었습니다.');
						},
						error: function() {
							console.log('삭제실패');
						}
					});
				});
			}
		})
	});
	//---------
	//----이름 or 사번 클릭시 상세/수정 링크
	$(document).on('click', '#viewName, #viewUserid', function() {
		var userid = $(this).data("userid");
		console.log("usrid=" + userid);
		window.location.href = "account?userid=" + userid;
	})

});