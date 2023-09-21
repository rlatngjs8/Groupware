<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

        .button-span {
            margin-right: 10px; /* 버튼 사이의 간격을 조절할 수 있습니다. */
        }
        /* 모달 버튼 스타일 */
		.btn {
		  margin: 5px;
		  padding: 10px 20px;
		  border: none;
		  cursor: pointer;
		  border-radius: 5px;
		}
		
		.btn-danger {
		  background-color: #dc3545;
		  color: white;
		}
		
		.btn-danger:hover {
		  background-color: #c82333;
		}
		
		.btn-secondary {
		  background-color: #6c757d;
		  color: white;
		}
		
		.btn-secondary:hover {
		  background-color: #545b62;
		}
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
        <button id="deleteButton" class="btn btn-danger" onclick="showDeleteConfirmation()">삭제</button>
        <button onclick="copyContact()">주소록 복사</button>
    </div>
    <!-- 모달 -->
	<div id="deleteModal" class="modal">
	  <div class="modal-content">
	    <span id="closeModal" class="close" onclick="hideDeleteConfirmation()">&times;</span>
	    <p>선택한 연락처를 정말 삭제하시겠습니까?</p>
	    <button id="confirmDelete" class="btn btn-danger" onclick="deleteContact()">확인</button>
	    <button id="cancelDelete" class="btn btn-secondary" onclick="hideDeleteConfirmation()">취소</button>
	  </div>
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
                <span class="button-span">
                    <button type="button" class="custom-button" onclick="addContact()">추가</button>
                </span>
                <span class="button-span">
                    <button type="button" class="custom-button" onclick="clearContact()">초기화</button>
                </span>
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
                <th><input type="checkbox" id="selectAll"></th>
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
            
        </tbody>
        <tbody id="no_contactListBody">
            
        </tbody>
    </table>
</main>
<!-- 필요한 JavaScript 파일 또는 스크립트 태그를 추가하세요 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>


    // jQuery를 사용하여 모달을 제어합니다.
    $(document).ready(function() {
        filterContacts('all');
        // "selectAll" 체크박스의 변경 이벤트를 감지
        $('#selectAll').change(function() {
            // "selectAll" 체크박스의 상태를 가져옴
            const selectAllChecked = $(this).prop('checked');

            // "perCheckbox" 체크박스들의 상태를 변경
            $('#contactListBody').find('input[type="checkbox"]').prop('checked', selectAllChecked);
        });
        // 전화번호 입력란의 ID를 가져옵니다. 이 예제에서는 phoneNumber입니다.
        var phoneNumberInput = $('#addPhone');

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
    
 // 삭제 확인 모달 표시
    function showDeleteConfirmation() {
      $('#deleteModal').css('display', 'block');
    }

    // 삭제 확인 모달 닫기
    function hideDeleteConfirmation() {
      $('#deleteModal').css('display', 'none');
    }

 // 특정 이벤트(예: 클릭)가 발생할 때 데이터를 가져와서 변수에 저장하고 Detail.jsp로 이동
    $('#contactListBody').on('click', 'td', function(event) {
        // 클릭한 요소가 체크박스인지 확인
        if ($(event.target).is(':checkbox')) {
            // 체크박스를 클릭한 경우 이벤트 중단
            event.stopPropagation();
        } else {
            // 클릭한 행에서 필요한 데이터 가져오기
            var name = $(this).closest('tr').find('td:eq(1)').text(); // 이름
            var position = $(this).closest('tr').find('td:eq(2)').text(); // 직위
            var phone = $(this).closest('tr').find('td:eq(3)').text(); // 휴대폰
            var email = $(this).closest('tr').find('td:eq(4)').text(); // 이메일
            var department = $(this).closest('tr').find('td:eq(5)').text(); // 부서
            var company = $(this).closest('tr').find('td:eq(6)').text(); // 회사
            var companyPhone = $(this).closest('tr').find('td:eq(7)').text(); // 회사 전화
            var companyAddress = $(this).closest('tr').find('td:eq(8)').text(); // 회사 주소
            var memo = $(this).closest('tr').find('td:eq(9)').text(); // 메모
            var groupName = $(this).closest('tr').find('td:eq(10)').text(); // 그룹
            var addressBookId = $(this).closest('tr').find('.address-book-id').val();
            // 데이터를 Detail.jsp로 전달하고 페이지 이동
            window.location.href = 'detail?name=' + encodeURIComponent(name) + '&position=' + encodeURIComponent(position) + '&phone=' + encodeURIComponent(phone) + '&email=' + encodeURIComponent(email) + '&department=' + encodeURIComponent(department) + '&company=' + encodeURIComponent(company) + '&companyPhone=' + encodeURIComponent(companyPhone) + '&companyAddress=' + encodeURIComponent(companyAddress) + '&memo=' + encodeURIComponent(memo) + '&groupName=' + encodeURIComponent(groupName) + 
                '&addressBookId=' + encodeURIComponent(addressBookId);
        }
    });


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

    function clearContact() {
        $('#addName').val('');
        $('#addPhone').val('');
        $('#addCompany').val('');
        $('#addPosition').val('');
        $('#addEmail').val('');
        $('#addDepartment').val('');
        $('#addCompanyPhone').val('');
        $('#addCompanyAddress').val('');
        $('#addMemo').val('');
        $('#addGroup').val('');
        $('#user_id').val('');
    }

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
        
        // 핸드폰 번호 형식 확인 (숫자만 허용)
        const phoneRegex = /^\d{3}-\d{4}-\d{4}$/; // 000-0000-0000 형식의 정규식

        if (!phoneRegex.test(addPhone)) {
            showToast("올바른 핸드폰 번호 형식이 아닙니다. (000-0000-0000 형식으로 입력하세요)");
            return; // 업데이트 중지
        }

        // 이메일 주소 형식 검사
        const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (!emailRegex.test(addEmail)) {
            showToast("올바른 이메일 주소 형식이 아닙니다.");
            return;
        }
        

        // 나머지 필드 값 가져오기
        const addDepartment = $('#addDepartment').val().trim();
        const addCompanyPhone = $('#addCompanyPhone').val().trim();
        const addCompanyAddress = $('#addCompanyAddress').val().trim();
        const addMemo = $('#addMemo').val().trim();
        const addGroup = $('#addGroup').val().trim();
        const userid = $('#user_id').val();

        // userid가 빈 값인 경우
        if (userid === '') {
            showToast("로그인해주세요.");
            return;
        }

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
                window.location.href = '/contact/personal';
            },
            error: function (error) {
                console.error('인서트 실패:', error);
                showToast("오류가 발생했습니다. 확인해주세요.");
            }
        });
    }



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
                    newRow.append('<td colspan="11" style="text-align: center;">' +
                  		  '<p>데이터가 없습니다.</p>' +
                  		  '<div style="text-align: center;">' +
                  		  '<button id="openModalButton" class="btn btn-primary" >빠른 등록</button>' +
                  		  '</div>' +
                  		  '</td>');
                    $('#no_contactListBody').append(newRow);
                } else {
                    // 데이터가 있는 경우 연락처를 추가
                    for (let i = 0; i < data.length; i++) {
                        const newRow = $('<tr>');
                        newRow.append('<td><input type="checkbox" id="perCheckbox"></td>');
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
                        newRow.append('<input type="hidden" class="address-book-id" value="' + data[i]['address_book_id'] + '">');
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
    
    function insert_address_book_group() {
    	writer_id = $('#user_id').val();
    	
    }
    
    function get_address_book_group() {
    	
    }
 


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
                success: function (data) {
                    if (data === '0') {
                        console.error("삭제 실패:", data);
                    } else {
                        console.log("삭제 성공");
                        window.location.reload();
                    }
                },
                error: function (xhr, status, error) {
                    console.error("삭제 실패:", error);
                }
            });
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

    function sendEmail() {
        const selectedContacts = $('#contactListBody input[type="checkbox"]:checked');

        // 선택된 연락처가 없으면 아무 작업도 수행하지 않음
        if (selectedContacts.length === 0) {
            showToast("메일을 보낼 연락처를 선택하세요.");
            return;
        }

        const selectedEmails = [];

        selectedContacts.each(function() {
            const email = $(this).closest('tr').find('td:nth-child(4)').text();
            selectedEmails.push(email);
        });

        // 선택된 이메일 주소 배열을 문자열로 조합
        const emailAddresses = selectedEmails.join(';');

        // 이메일 클라이언트를 열기 위한 mailto 링크 생성
        const mailtoLink = 'mailto:' + emailAddresses;

        // mailto 링크를 사용하여 이메일 클라이언트 열기
        window.location.href = mailtoLink;
    }

    function copyContact() {
        const selectedContacts = $('#contactListBody input[type="checkbox"]:checked');

        // 선택된 연락처가 없으면 아무 작업도 수행하지 않음
        if (selectedContacts.length === 0) {
            showToast("복사할 연락처를 선택하세요.");
            return;
        }

        const copiedContacts = [];

        selectedContacts.each(function() {
            const contact = {};

            contact.Name = $(this).closest('tr').find('td:nth-child(2)').text();
            contact.Position = $(this).closest('tr').find('td:nth-child(3)').text();
            contact.Phone = $(this).closest('tr').find('td:nth-child(4)').text();
            contact.Email = $(this).closest('tr').find('td:nth-child(5)').text();
            contact.Department = $(this).closest('tr').find('td:nth-child(6)').text();
            contact.Company = $(this).closest('tr').find('td:nth-child(7)').text();
            contact.CompanyPhone = $(this).closest('tr').find('td:nth-child(8)').text();
            contact.CompanyAddress = $(this).closest('tr').find('td:nth-child(9)').text();
            contact.Memo = $(this).closest('tr').find('td:nth-child(10)').text();
            contact.Group = $(this).closest('tr').find('td:nth-child(11)').text();

            copiedContacts.push(contact);
        });

        // 복사된 연락처 배열을 로컬 스토리지에 저장
        localStorage.setItem('copiedContacts', JSON.stringify(copiedContacts));

        showToast("선택한 연락처를 복사했습니다.");
    }
    let review_currentPage = 1; // 현재 페이지 번호
    const reviews_PerPage = 3; // 한 페이지당 리뷰 갯수


    function updatePagination(totalReviews) {
        const totalPages = Math.ceil(totalReviews / reviews_PerPage);
        let paginationHTML = '';

        for (let i = 1; i <= totalPages; i++) {
            if (i === review_currentPage) {
                paginationHTML += '<span>' + i + '</span>';
            } else {
            	paginationHTML += "<a href='#' onclick='re_changePage(" + i + ")'>" + i + "</a>";
            }
        }

        $("#pagination").html(paginationHTML);
    }

    function re_changePage(page) {
        review_currentPage = page;

        // 스크롤을 아래로 내리고 QA 창을 보이게 하기 위한 코드
        const reElement = $('#reviews'); // QA 창 요소를 jQuery로 선택
        const currentScrollTop = $(window).scrollTop(); // 현재 스크롤 위치 가져오기
        const reOffset = reElement.offset().top - 100; // 100px 위로 스크롤

        // 페이지를 변경할 때 스크롤을 아래로 내리고 QA 창을 보이게 함
        $('html, body').animate({
            scrollTop: reOffset // 상단 위치로 스크롤
        }, 'slow'); // 부드러운 스크롤 효과 적용 (빠르게 하려면 'fast' 사용 가능)

        review_get(review_currentPage);
    }



    // 페이지 로드시 첫 번째 페이지의 리뷰를 불러옵니다.
    $(document).ready(function () {
        review_get(review_currentPage);
    });


</script>
</body>
</html>
