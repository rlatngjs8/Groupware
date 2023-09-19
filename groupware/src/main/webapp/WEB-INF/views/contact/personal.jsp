<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주소록</title>
    <!-- 스타일 추가 -->
    <style>

ul {
    display: flex;
    list-style: none;
    padding: 0;
}

li {
    margin-right: 10px;
}

li a {
    text-decoration: none;
    color: #333;
    background-color: #C0FFEE; /* 연두색 테마 */
    padding: 5px 10px;
    border-radius: 5px;
}

/* 주소록 목록 스타일링 */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    border: 1px solid #ccc;
    padding: 8px;
    text-align: left;
}

th {
    background-color: #C0FFEE; /* 연두색 테마 */
}
/* 모달 스타일 */
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
}


/* 모달 내용 스타일 */
.modal-content {
  background-color: #fff;
  margin: 10% auto;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  width: 25%;
  max-height: 50vh; /* 최대 높이를 화면 높이의 80%로 제한 */
  overflow-y: auto; /* 내용이 넘칠 경우 스크롤 표시 */
}

.close {
  float: right;
  font-size: 24px;
  font-weight: bold;
  cursor: pointer;
  color: #888;
}

.close:hover {
  color: #000;
}

/* 입력 폼 스타일 */
.form-container {
  text-align: left;
}

.form-group {
  margin-bottom: 15px;
}

label {
  font-weight: bold;
  display: block;
  margin-bottom: 2px;
}

input[type="text"] {
  width: 60%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  margin-left: 10px; /* 여백을 10px로 설정 */
}
/* 필수 작성란 메시지 스타일 */
.required-note {
  font-weight: bold;
  color: red;
}

/* 클래스를 사용한 버튼 스타일 */
.custom-button {
  background-color: #8CC63E;
  width: 50%;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
  margin-top: 10px; /* 버튼 위 여백 추가 */
  display: block; /* 블록 요소로 설정하여 가운데 정렬을 적용 */
  margin: 0 auto; /* 가운데 정렬 */
}

.custom-button:hover {
  background-color: #6B9E32;
}
/* 토스트 */
#toast {
  position: fixed;
  bottom: 50%; /* 변경된 부분 */
  left: 50%;
  transform: translateX(-50%);
  background-color: #333;
  color: white;
  padding: 10px 20px;
  border-radius: 5px;
  display: none;
  z-index: 2;
}


.hidden {
  display: none;
}
        /* 사이드바 스타일 */
.sidebar {
    height: 100%;
    width: 250px;
    position: fixed;
    top: 0;
    left: 0;
    background-color: white;
    padding-top: 20px;
    border-right: 1px solid gray; /* 오른쪽 부분에만 테두리 적용 */
}

      /* 사이드바 링크 스타일 */
      .sidebar a {
          padding: 15px;
          text-decoration: none; /* 링크 밑줄 제거 */
          color: black; /* 글자색 설정 */
          display: block; /* 블록 요소로 표시하여 세로로 배치 */
      }

      /* 사이드바 링크 호버 스타일 */
	.sidebar a:hover {
	    background-color: #ccc; /* 연한 회색 배경으로 변경 */
	}
	
	      .main {
	    margin-left: 250px; /* 사이드바 너비만큼 왼쪽 여백 설정 */
	    padding: 20px; /* 콘텐츠 패딩 설정 */
	}
			


        /* 추가적인 스타일링을 원하는 대로 추가하세요 */
    </style>
</head>
<body>
<input type="hidden" id="user_id" value="${sessionScope.userid}">
<div id="toast" class="hidden">토스트 메세지 넣어라</div>

	 <aside>
	     <!-- 사이드바 -->
		<div class="sidebar">
		    <a href="/contact/company">사내 주소록</a>
		    <a href="/contact/personal">개인 주소록</a>
		    <!-- 필요한 메뉴 항목을 추가할 수 있습니다. -->
		</div>
    </aside>
<main class="main">
	    <h1>주소록</h1>
	
	     <div>
		   <button id="openModalButton">빠른 등록</button>
		   <button onclick="sendEmail()">메일 방송</button>
		   <button onclick="deleteContact()">삭제</button>
		   <button onclick="copyContact()">주소록 복사</button>
	    </div>
	    
	<!-- 모달 -->
	<div id="myModal" class="modal">
	  <div class="modal-content">
	    <span class="close" id="closeModal">&times;</span>
	    <div class="form-container">
	      <!-- 입력 폼 -->
	      <h2>새로운 연락처 추가</h2>
	      	<p class="required-note">*은 필수 작성란입니다</p>
	        <div class="form-group">
	          <label for="addName">이름(표시명) <span class="required">*</span></label>
	          <input type="text" id="addName" name="addName" placeholder="이름(표시명)" required>
	        </div>
	        <div class="form-group">
	          <label for="addPosition">직위 <span class="required">*</span></label>
	          <input type="text" id="addPosition" name="addPosition" placeholder="직위">
	        </div>
	        <div class="form-group">
	          <label for="addPhone">휴대폰 <span class="required">*</span></label>
	          <input type="text" id="addPhone" name="addPhone" placeholder="휴대폰" required>
	        </div>
	        <div class="form-group">
	          <label for="addEmail">이메일 <span class="required">*</span></label>
	          <input type="text" id="addEmail" name="addEmail" placeholder="이메일">
	        </div>
	        <div class="form-group">
	          <label for="addDepartment">부서</label>
	          <input type="text" id="addDepartment" name="addDepartment" placeholder="부서">
	        </div>
	        <div class="form-group">
	          <label for="addCompany">회사 <span class="required">*</span></label>
	          <input type="text" id="addCompany" name="addCompany" placeholder="회사">
	        </div>
	        <div class="form-group">
	          <label for="addCompanyPhone">회사전화</label>
	          <input type="text" id="addCompanyPhone" name="addCompanyPhone" placeholder="회사전화">
	        </div>
	        <div class="form-group">
	          <label for="addCompanyAddress">회사 주소</label>
	          <input type="text" id="addCompanyAddress" name="addCompanyAddress" placeholder="회사 주소">
	        </div>
	        <div class="form-group">
	          <label for="addMemo">메모</label>
	          <input type="text" id="addMemo" name="addMemo" placeholder="메모 추가하기">
	        </div>
	        <div class="form-group">
	          <label for="addGroup">그룹</label>
	          <input type="text" id="addGroup" name="addGroup" placeholder="그룹">
	        </div>
	        <button type="button" class="custom-button" onclick="addContact()">추가</button>
	    </div>
	  </div>
	</div>
	    <!-- 검색 필터를 위한 ul 및 li 요소 추가 -->
		<ul>
		    <li><button onclick="filterContacts('all')">전체</button></li>
		    <li><button onclick="filterContacts('ㄱ')">ㄱ</button></li>
		    <li><button onclick="filterContacts('ㄴ')">ㄴ</button></li>
		    <li><button onclick="filterContacts('ㄷ')">ㄷ</button></li>
		    <li><button onclick="filterContacts('ㄹ')">ㄹ</button></li>
		    <li><button onclick="filterContacts('ㅁ')">ㅁ</button></li>
		    <li><button onclick="filterContacts('ㅂ')">ㅂ</button></li>
		    <li><button onclick="filterContacts('ㅅ')">ㅅ</button></li>
		    <li><button onclick="filterContacts('ㅇ')">ㅇ</button></li>
		    <li><button onclick="filterContacts('ㅈ')">ㅈ</button></li>
		    <li><button onclick="filterContacts('ㅊ')">ㅊ</button></li>
		    <li><button onclick="filterContacts('ㅌ')">ㅌ</button></li>
		    <li><button onclick="filterContacts('ㅍ')">ㅍ</button></li>
		    <li><button onclick="filterContacts('ㅎ')">ㅎ</button></li>
		    <li><button onclick="filterContacts('AZ')">A-Z</button></li>
		</ul>
		
		
	    <!-- 주소록 목록을 나타내는 테이블 예시 -->
	    <table>
	        <thead>
	            <tr>
	                <th></th>
	                <th>이름</th>
	                <th>직위</th>
	                <th>휴대폰</th>
	                <th>이메일</th>
	                <th>부서</th>
	                <th>회사</th>
	                <th>회사전화</th>
	                <th>회사주소</th>
	                <th>메모</th>
	                <th>그룹</th>
	            </tr>
	        </thead>
	        <tbody id="contactListBody">
	            <!-- 주소록 항목들은 JavaScript로 동적으로 추가됩니다. -->
	        </tbody>
	    </table>
    </main>
    <!-- 필요한 JavaScript 파일 또는 스크립트 태그를 추가하세요 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
		// 모달 열기 버튼 클릭 시
		document.getElementById('openModalButton').addEventListener('click', function() {
		  document.getElementById('myModal').style.display = 'block';
		});

		// 모달 닫기 버튼 클릭 시
		document.getElementById('closeModal').addEventListener('click', function() {
		  document.getElementById('myModal').style.display = 'none';
		});

		// 모달 외부 클릭 시 닫기
		window.addEventListener('click', function(event) {
		  if (event.target == document.getElementById('myModal')) {
		    document.getElementById('myModal').style.display = 'none';
		  }
		});

		// 추가 버튼 클릭 시
		function addContact() {
			console.log("개인 주소록 insert 중이에요");
		    const addName = $('#addName').val().trim();
		    const addPhone = $('#addPhone').val().trim();
		    const addCompany = $('#addCompany').val().trim();
		    const addPosition = $('#addPosition').val().trim();
		    const addEmail = $('#addEmail').val().trim();

		    // 필수 필드가 비어 있는지 확인
		    if (addName === '' || addPhone === '' || addCompany === '' || addPosition === '' || addEmail === '' ) {
		    	showToast("필수 작성란을 확인해주세요.");
		        return; // 필드가 비어 있으면 함수를 종료하고 추가 작업을 수행하지 않음
		    }

		    // 나머지 필드 값 가져오기
		    const addDepartment = $('#addDepartment').val().trim();
		    const addCompanyPhone = $('#addCompanyPhone').val().trim();
		    const addCompanyAddress = $('#addCompanyAddress').val().trim();
		    const addMemo = $('#addMemo').val().trim();
		    const addGroup = $('#addGroup').val().trim();
		    const userid = $('#user_id').val()

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
			  userid : userid
			};

            console.log(addressBookData);

            $.ajax({
                url: '/insert_addressBook',
                type: 'post',
                data: addressBookData,
                success: function (data) {
                    console.log('인서트 성공', data);
                    document.getElementById('myModal').style.display = 'none';
                },
    			error: function (error) {
    				  console.error('인서트 실패:', error);
    				  showToast("오류가 발생했습니다. 확인해주세요.");
    				}
            });
		}
		
        // jQuery를 사용하여 모달을 제어합니다.
        $(document).ready(function() {
        	filterContacts('all');
        });
		 
		 function filterContacts(filter) {
			    console.log('개인 주소록 불러옴');
			    const userid = $('#user_id').val();
			    console.log(userid);
			    $.ajax({
			        url: '/get_personal_addressBook',
			        data: { userid: userid, filter: filter }, // 필터 값을 서버로 전송
			        type: 'get',
			        dataType: 'json',
			        success: function (data) {
			            console.log('주소록 데이터 불러오기', data);
			            const tableBody = $('#contactListBody');
			            tableBody.empty(); // 기존 데이터를 지웁니다.
			            if (data.length === 0) {
			                // 데이터가 없는 경우 빈 테이블 행을 추가
			                const newRow = $('<tr>');
			                newRow.append('<td colspan="11">데이터가 없습니다.</td>');
			                $('#contactListBody').append(newRow);
			            } else {
			                // 데이터가 있는 경우 연락처를 추가
			                for (let i = 0; i < data.length; i++) {
			                    const newRow = $('<tr>');
			                    newRow.append('<td><input type="checkbox"></td>');
			                    newRow.append('<td>' + data[i]['name'] + '</td>');
			                    newRow.append('<td>' + data[i]['position'] + '</td>'); // 부서 정보를 추가
			                    newRow.append('<td>' + data[i]['phone'] + '</td>');
			                    newRow.append('<td>' + data[i]['email'] + '</td>');
			                    newRow.append('<td>' + data[i]['department'] + '</td>');
			                    newRow.append('<td>' + data[i]['company'] + '</td>');
			                    newRow.append('<td>' + data[i]['company_phone'] + '</td>');
			                    newRow.append('<td>' + data[i]['company_address'] + '</td>');
			                    newRow.append('<td>' + data[i]['memo'] + '</td>');
			                    newRow.append('<td>' + data[i]['group_name'] + '</td>');
			                    $('#contactListBody').append(newRow);
			                }
			            }
			        },
			        error: function (xhr, status, error) {
			            console.error('주소록 데이터 불러오기 에러:', status, error);
			            // 에러 처리를 수행할 수 있습니다. 예를 들어, 사용자에게 오류 메시지를 표시하는 등의 작업을 수행할 수 있습니다.
			        }
			    });
			}
		 
		 // 토스트 메세지
		 function showToast(message) {
			  const toast = document.getElementById('toast');
			  toast.textContent = message;
			  toast.style.display = 'block';

			  setTimeout(function() {
			    toast.style.display = 'none';
			  }, 3000); // 3초 후에 숨김
			}

			// 오류 발생 시 토스트 메시지 호출

    </script>
</body>
</html>
