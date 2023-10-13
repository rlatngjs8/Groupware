
const dataTransfer = new DataTransfer();

//파일 크기를 KB 또는 MB로 변환하는 함수
function convertFileSize(fileSizeInBytes) {
	if (fileSizeInBytes < 1024) {
		return fileSizeInBytes + ' B';
	} else if (fileSizeInBytes < 1024 * 1024) {
		return (fileSizeInBytes / 1024).toFixed(2) + ' KB';
	} else {
		return (fileSizeInBytes / (1024 * 1024)).toFixed(2) + ' MB';
	}
}

//파일 선택(input type="file) 엘리먼트의 onchange 이벤트 핸들러
function handleFileSelect(input) {
	const fileInput = input;
	const fileTableBody = document.getElementById('fileTableBody');
	const files = Array.from(fileInput.files);

	for (const file of files) {
		const row = document.createElement('tr');
		const checkboxCell = document.createElement('td');
		const fileNameCell = document.createElement('td');
		const fileExtensionCell = document.createElement('td');
		const fileSizeCell = document.createElement('td');
		const fileStatusCell = document.createElement('td');

		const checkbox = document.createElement('input');
		checkbox.type = 'checkbox';

		checkboxCell.appendChild(checkbox);
		fileNameCell.textContent = file.name;
		fileExtensionCell.textContent = file.name.split('.').pop(); // 파일 확장자 가져오기
		// 파일 크기를 KB 또는 MB로 변환하여 소수점 두 자리까지 표시
		fileSizeCell.textContent = convertFileSize(file.size);
		fileStatusCell.textContent = "✅";

		// 셀을 행에 추가
		row.appendChild(checkboxCell);
		row.appendChild(fileNameCell);
		row.appendChild(fileExtensionCell);
		row.appendChild(fileSizeCell);
		row.appendChild(fileStatusCell);

		// 테이블 본문에 행 추가
		fileTableBody.appendChild(row);
	}
}

$("#documentFile").change(function() {
	let fileArr = $(this).get(0).files;

	if (fileArr != null && fileArr.length > 0) {
		// DataTransfer 파일 관리
		for (let i = 0; i < fileArr.length; i++) {
			dataTransfer.items.add(fileArr[i]);
		}
		$(this).get(0).files = dataTransfer.files;
		console.log("dataTransfer =>", dataTransfer.files);
		console.log("input FIles =>", $(this).get(0).files);
	}
});

//삭제 버튼을 클릭했을 때 실행되는 함수
$(document).on('click', '.btn-delete', function() {
	const selectedFiles = [];

	// 체크된 체크박스를 찾아 선택된 파일을 배열에 추가
	$('#fileTable input[type="checkbox"]:checked').each(function() {
		const row = $(this).closest('tr');
		const fileName = row.find('td:nth-child(2)').text();
		selectedFiles.push(fileName);
		row.remove(); // 선택된 행 삭제
	});

	// 선택된 파일을 DataTransfer에서도 삭제
	for (let i = dataTransfer.files.length - 1; i >= 0; i--) {
		if (selectedFiles.includes(dataTransfer.files[i].name)) {
			dataTransfer.items.remove(i);
		}
	}
	document.getElementById("documentFile").files = dataTransfer.files;

	console.log("선택된 파일 삭제 후 dataTransfer =>", dataTransfer.files);
	console.log("선택된 파일 삭제 후 input FIles =>", document.getElementById("documentFile").files);
});