<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>editSelf</title>
</head>
<style>
	/*모달 css*/
  .modal {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.7);
  z-index: 1;
}

.modal-content {
  background-color: #fff;
  margin: 3% auto;
  padding: 20px;
  border-radius: 5px;
  width: 50%;
  
}

.close {
    position: absolute;
    top: 8%;
    right: 26%;
    font-size: 27px;
    cursor: pointer;
    color: #6d6d6d;
    font-weight: bold;
}
/* 파일 업로드 스타일 */
  .file-upload {
    margin-top: 1%;
  }

  .file-upload p {
    font-size: 18px;
    margin-bottom: 10px;
  }

  .file-upload select,
  .file-upload input[type="file"],
  .file-upload button {
    font-size: 16px;
    margin-bottom: 10px;
  }

  /* 파일 목록 테이블 스타일 */
  #fileTable {
    border-collapse: collapse;
    width: 100%;
  }

  #fileTable th,
  #fileTable td {
    border: 1px solid #ccc;
    padding: 8px;
    text-align: left;
  }

  #fileTable th {
    background-color: #f2f2f2;
  }

/* 파일첨부 버튼 스타일 */
.btn-upload,
.btn-delete {
  font-size: 15px;
    padding: 6px 10px;
  background-color: #ffffff;
  color: #000000;
  border: 1px solid #c0c0c0;
  border-radius: 5px;
  cursor: pointer;
  margin-right: 10px;
}

  /* 업로드 버튼 스타일 */
  .btnSubmit,
  .btnCancel {
    font-size: 17px;
    padding: 8px 12px;
    background-color: #ffffff;
    color: #000000;
    border: 1px solid #c0c0c0;
    border-radius: 5px;
    cursor: pointer;
  }
  .btnSubmit{
  	border: none;
  	color: #fff;
  	background-color:rgb(106, 176, 173);
  }
</style>
<body>
<div class="modal-content">
    <span class="close" id="closeModal">&times;</span>
    <h2>파일 업로드</h2>
    <div class="file-upload">
      <form id="frmSubmit" action="/fileUpload" method="post" enctype="multipart/form-data">
        <div>
          <p>대상 폴더 선택</p>
          <select name="storageType">
            <option value="all">전체 자료실</option>
            <option value="${userid}">개인 자료실</option>
          </select>
        </div>
        <hr/>
        <div>
          <p>파일첨부</p>
          <input multiple type="file" id="documentFile" name="documentFile" accept=".pdf, .doc, .docx, .hwp, .hwpx, .jpg, .jpeg, .png, .xls, .xlsx, .zip" style="display:none;"onchange="handleFileSelect(this)">
          <input type="button" onclick="document.getElementById('documentFile').click()" value="파일선택"	class="btn-upload">
          <input type="button" id="delFile" value="삭제" class="btn-delete">
        </div>
        <br>
        <!-- 파일 목록 표시 테이블 -->
        <table id="fileTable">
          <thead>
            <tr>
              <th><input type="checkbox" id="selectAll" onclick="toggleCheckboxes()"></th>
              <th>파일명</th>
              <th>확장자</th>
              <th>파일크기</th>
              <th>상태</th>
            </tr>
          </thead>
          <tbody id="fileTableBody">
            <!-- 여기에 업로드된 파일 정보가 추가됩니다 -->
          </tbody>
        </table>
        <br>
        <div style="text-align:right">
        <input type="submit" id="btnSubmit" class="btnSubmit" value="업로드">
        <input type="button" id="closeModal" class="btnCancel" value="취소">
        </div>
      </form>
      
    </div>
  </div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

const dataTransfer = new DataTransfer();

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
     fileSizeCell.textContent = (file.size / 1024).toFixed(2) + ' KB'; // 크기를 KB로 변환하여 소수점 두 자리까지 표시
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



</script>
</html>