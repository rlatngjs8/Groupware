
$(document).ready(function() {
	// "selectAll" 체크박스의 변경 이벤트를 감지
	$('#selectAll').change(function() {
		// "selectAll" 체크박스의 상태를 가져옴
		const selectAllChecked = $(this).prop('checked');

		// "perCheckbox" 체크박스들의 상태를 변경
		$('#contactListBody').find('input[type="checkbox"]').prop('checked', selectAllChecked);
	});
});


let currentPage = 1; // 현재 페이지 번호
const perPage = 10; // 한 페이지당 표시할 데이터 수

// 페이지 번호를 클릭할 때 호출되는 함수
function changePage(page) {
	currentPage = page;
	console.log('changePage 함수 호출: 페이지', currentPage);
	sort('all', currentPage);
}

function sort(name, page) {
	console.log('sort 함수 호출: name', name, 'page', page);
	$.ajax({
		url: '/get_addressBook',
		data: { name: name, page: page }, // 필터 값을 서버로 전송
		type: 'get',
		dataType: 'json',
		success: function(data) {
			console.log('주소록 데이터 불러오기', data);
			const tableBody = $('#contactListBody');
			tableBody.empty(); // 기존 데이터를 지웁니다.
			if (data.length === 0) {
				// 데이터가 없는 경우 빈 테이블 행을 추가
				const newRow = $('<tr>');
				newRow.append('<td colspan="5" style="text-align: center;">' +
					'<p>데이터가 없습니다.</p>' +
					'<div style="text-align: center;">' +
					'<button id="openModalButton" class="btn btn-primary">빠른 등록</button>' +
					'</div>' +
					'</td>');
				$('#no_contactListBody').append(newRow);
			} else {
				// 데이터가 있는 경우 연락처를 추가
				for (let i = (page - 1) * perPage; i < page * perPage && i < data.length; i++) {
					const newRow = $('<tr>');
					newRow.append('<td id="per_name" style=" text-align: center;">' + data[i]['name'] + '</td>');
					newRow.append('<td id="per_department" style="text-align: center;">' + data[i]['department'] + '</td>');
					newRow.append('<td id="per_position" style="text-align: center;">' + data[i]['position'] + '</td>');
					newRow.append('<td id="per_phone" style="text-align: center;">' + data[i]['phone'] + '</td>');
					newRow.append('<td id="per_email" style="text-align: center;"><a href="mailto:' + data[i]['email'] + '">' + data[i]['email'] + '</a></td>');
					$('#contactListBody').append(newRow);
				}
			}
			// 페이지네이션 업데이트
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

// 주소록 추가 기능
$('#addContact').click(function() {
	console.log('주소록 추가 버튼 클릭');
	insert_personal_address_book();
});




