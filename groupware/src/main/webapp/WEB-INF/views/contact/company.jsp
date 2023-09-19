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
        #toast {
		  position: fixed;
		  bottom: 20px; /* 하단 여백 조절 */
		  right: 20px; /* 오른쪽 여백 조절 */
		  background-color: #333;
		  color: white;
		  padding: 10px 20px;
		  border-radius: 5px;
		  display: none; /* 초기에는 숨김 */
		}
        

        /* 추가적인 스타일링을 원하는 대로 추가하세요 */
    </style>
</head>
<body>
<input type="hidden" id="user_id" value="${sessionScope.userid}">
<div id="toast">오류가 발생했습니다.</div>
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
                <th>부서</th>
                <th>직급</th>
                <th>휴대폰</th>
                <th>이메일</th>
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

		 $(document).ready(function () {
			 filterContacts('all');
        }); 
		 
		 function filterContacts(filter) {
			    console.log('주소록 불러옴');
			    const userid = $('#user_id').val();
			    console.log(userid);

			    $.ajax({
			        url: '/get_addressBook',
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
			                newRow.append('<td colspan="6">데이터가 없습니다.</td>');
			                $('#contactListBody').append(newRow);
			            } else {
			                // 데이터가 있는 경우 연락처를 추가
			                for (let i = 0; i < data.length; i++) {
			                    const newRow = $('<tr>');
			                    newRow.append('<td><input type="checkbox"></td>');
			                    newRow.append('<td>' + data[i]['name'] + '</td>');
			                    newRow.append('<td>' + data[i]['department'] + '</td>'); // 부서 정보를 추가
			                    newRow.append('<td>' + data[i]['position'] + '</td>');
			                    newRow.append('<td>' + data[i]['phoneNumber'] + '</td>');
			                    newRow.append('<td>' + data[i]['email'] + '</td>');
			                    newRow.append('<td>' + data[i]['address'] + '</td>');
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
		 

        // 주소록 추가 기능
        $('#addContact').click(function () {
            insert_personal_address_book();
        });

        // 주소록 추가 함수
        function insert_personal_address_book() {
            console.log("개인 주소록 insert 중이에요");
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
        
        //토스트 메세지
		 function showToast(message) {
			  const toast = document.getElementById('toast');
			  toast.textContent = message;
			  toast.style.display = 'block';

			  setTimeout(function() {
			    toast.style.display = 'none';
			  }, 3000); // 3초 후에 숨김
			}
    </script>
</body>
</html>
