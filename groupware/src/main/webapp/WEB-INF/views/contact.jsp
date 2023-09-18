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
        /* 필터 목록 스타일링 */
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

        /* 추가적인 스타일링을 원하는 대로 추가하세요 */
    </style>
</head>
<body>
<input type="hidden" id="employee_id" value="${sessionScope.employee_id}">
    <h1>주소록</h1>
    
     <div>
	   <button onclick="quickAdd()">빠른 등록</button>
	   <button onclick="sendEmail()">메일 방송</button>
	   <button onclick="deleteContact()">삭제</button>
	   <button onclick="copyContact()">주소록 복사</button>
    </div>

	<div>
	    <input type="text" id="addName" name="addName" placeholder="이름(표시명)">
	    <input type="text" id="addPhone" name="addPhone" placeholder="휴대폰">
	    <input type="text" id="addEmail" name="addEmail" placeholder="이메일">
	    <input type="text" id="addCompany" name="addCompany" placeholder="회사">
	    <input type="text" id="addCompanyAddress" name="addCompanyAddress" placeholder="회사 주소">
	    <input type="text" id="addGroup" name="addGroup" placeholder="그룹">
	    <button onclick="addContact()">추가</button>
	</div>


    <!-- 검색 필터를 위한 ul 및 li 요소 추가 -->
    <ul>
        <li><a href="#" onclick="filterContacts('all')">전체</a></li>
        <li><a href="#" onclick="filterContacts('ㄱ')">ㄱ</a></li>
        <li><a href="#" onclick="filterContacts('ㄴ')">ㄴ</a></li>
        <li><a href="#" onclick="filterContacts('ㄷ')">ㄷ</a></li>
        <li><a href="#" onclick="filterContacts('A')">A</a></li>
        <li><a href="#" onclick="filterContacts('B')">B</a></li>
        <li><a href="#" onclick="filterContacts('C')">C</a></li>
        <li><a href="#" onclick="filterContacts('0-9')">0-9</a></li>
        <li><a href="#" onclick="filterContacts('etc')">etc</a></li>
    </ul>

    <!-- 주소록 목록을 나타내는 테이블 예시 -->
    <table>
        <thead>
            <tr>
                <th></th>
                <th>이름</th>
                <th>휴대폰</th>
                <th>이메일</th>
                <th>회사</th>
                <th>회사 주소</th>
                <th>그룹</th>
            </tr>
        </thead>
        <tbody id="contactListBody">
            <!-- 주소록 항목들은 JavaScript로 동적으로 추가됩니다. -->
        </tbody>
    </table>
    <!-- 필요한 JavaScript 파일 또는 스크립트 태그를 추가하세요 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // 주소록 데이터 예시 (JSON 형태)
        
        
        const contacts = [
            {
                name: "홍길동",
                phone: "010-1234-5678",
                email: "hong@example.com",
                company: "ABC 주식회사",
                companyAddress: "서울시 강남구",
                group: "친구"
            },
            {
                name: "김철수",
                phone: "010-9876-5432",
                email: "kim@example.com",
                company: "XYZ 주식회사",
                companyAddress: "서울시 영등포구",
                group: "가족"
            },
            // 나머지 주소록 데이터를 추가하세요
        ];
        
        function get_addressBook() {
            console.log('주소록 불러옴');
            const space_id = $('#space_id').val();
            $.ajax({
                url: '/get_addressBook',
                data: { },
                type: 'get',
                dataType: 'json',
                success: function(data) {
                    console.log('리뷰 데이터 불러오기', data);
                    $("#qa").empty();
                    for (let i = (page - 1) * qa_PerPage; i < page * qa_PerPage && i < data.length; i++) {
                        let qa =
                            "<div class='qa'>" +
                            "<h4>작성자: " + data[i]['writer'] + "</h4>" +
                            "<input type='hidden' id='writer' name='writer' value='" + data[i]['writer'] + "'>" +
                            "<input type='hidden' id='seqno' name='seqno' value='" + data[i]['seqno'] + "'>" +
                            "<p>제목 " + data[i]['title'] + "</p>" + // 수정된 부분
                            "<p>리뷰 내용: " + data[i]['content'] + "</p>" +
                            "<p>작성일: " + data[i]['created'] + "</p>" +
                            "</div>";
                        $('#qa').append(qa);
                    }

                    qa_updatePagination(data.length);
                }
            });
        }

        // 초기 페이지 로드 시 주소록 표시
        window.onload = function () {
            displayContacts(contacts);
        };

        // 검색 기능
        function searchContacts() {
            // JavaScript 코드를 작성하여 검색 기능을 구현하세요.
        }

        // 주소록 필터링 기능
        function filterContacts(filter) {
            const filteredContacts = contacts.filter(contact => {
                const name = contact.name.toLowerCase();
                if (filter === 'all') {
                    return true;
                } else if (filter === '0-9') {
                    return name.match(/^\d/) !== null;
                } else if (filter === 'etc') {
                    return !name.match(/^[가-힣a-zA-Z\d]/);
                } else {
                    return name.startsWith(filter.toLowerCase());
                }
            });

            displayContacts(filteredContacts);
        }

        // 주소록 목록을 화면에 표시하는 함수
        function displayContacts(contactList) {
            const tableBody = document.getElementById("contactListBody");
            tableBody.innerHTML = "";

            for (const contact of contactList) {
                const newRow = tableBody.insertRow(-1);
                const checkBoxCell = newRow.insertCell(0);
                const nameCell = newRow.insertCell(1);
                const emailCell = newRow.insertCell(2);
                const phoneCell = newRow.insertCell(3);
                const companyCell = newRow.insertCell(4);
                const companyAddressCell = newRow.insertCell(5);
                const groupCell = newRow.insertCell(6);

                checkBoxCell.innerHTML = '<input type="checkbox">';
                nameCell.innerHTML = contact.name;
                emailCell.innerHTML = contact.email;
                phoneCell.innerHTML = contact.phone;
                companyCell.innerHTML = contact.company;
                companyAddressCell.innerHTML = contact.companyAddress;
                groupCell.innerHTML = contact.group;
            }
        }

        // 주소록 추가 기능
        function addContact() {
            // JavaScript 코드를 작성하여 주소록 추가 기능을 구현하세요.
        }
         
        function insert_personal_address_book() {
            console.log("임시예약 인서트");
            const addName = $('#addName').val();
            const addPhone = $('#addPhone').val();
            const addEmail = $('#addEmail').val();
            const addCompany = $('#addCompany').val();
            const addCompanyAddress = $("#addCompanyAddress").val();
            const addGroup = $('#addGroup').val();
            
            const addressBookData = {
                Name: addName,
                Phone: addPhone,
                Email: addEmail,
                Company: addCompany,
                CompanyAddress: addCompanyAddress, 
                Group: addGroup 
            };
           
            console.log(addressBookData);
             
        	 $.ajax({
                 url: '/insert_temp_reservation',
                 type: 'post',
                 data: reservationData,
                 success: function (response) {
                     console.log('임시예약 등록 성공:');
                     // 여기에 리뷰 등록 후 작업을 추가할 수 있습니다.
                 },
                 error: function (error) {
                     console.error('임시예약 등록 실패:');
                     // 실패 시 에러 처리를 수행하거나 사용자에게 알림을 보여줄 수 있습니다.
                 }
             });
        }
        
    	<div>
	    <input type="text" id="addName" name="addName" placeholder="이름(표시명)">
	    <input type="text" id="addPhone" name="addPhone" placeholder="휴대폰">
	    <input type="text" id="addEmail" name="addEmail" placeholder="이메일">
	    <input type="text" id="addCompany" name="addCompany" placeholder="회사">
	    <input type="text" id="addCompanyAddress" name="addCompanyAddress" placeholder="회사 주소">
	    <input type="text" id="addGroup" name="addGroup" placeholder="그룹">
	    <button onclick="addContact()">추가</button>
	</div>
    </script>
</body>
</html>
