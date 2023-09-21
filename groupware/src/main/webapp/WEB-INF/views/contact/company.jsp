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
    ul.filter-list {
        display: flex;
        list-style: none;
        padding: 0;
    }

    ul.filter-list li {
        margin-right: 10px;
    }

    ul.filter-list li a {
        text-decoration: none;
        color: #333;
        background-color: #C0FFEE; /* 연두색 테마 */
        padding: 5px 10px;
        border-radius: 5px;
    }

    /* 주소록 목록 스타일링 */
    table.address-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    table.address-table th,
    table.address-table td {
        border: 1px solid #ccc;
        padding: 8px;
        text-align: left;
    }

    table.address-table th {
        background-color: #C0FFEE; /* 연두색 테마 */
    }
        
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
		   <button onclick="sendEmail()">메일 방송</button>
		   <button onclick="copyContact()">주소록 복사</button>
	    </div>

	    <!-- 검색 필터를 위한 ul 및 li 요소 추가 -->
		<ul class="filter-list">
		    <li class="filter-list-item"><button class="filter-list-link" onclick="filterContacts('all')">전체</button></li>
		    <li class="filter-list-item"><button class="filter-list-link" onclick="filterContacts('ㄱ')">ㄱ</button></li>
		    <li class="filter-list-item"><button class="filter-list-link"onclick="filterContacts('ㄴ')">ㄴ</button></li>
		    <li class="filter-list-item"><button class="filter-list-link"onclick="filterContacts('ㄷ')">ㄷ</button></li>
		    <li class="filter-list-item"><button class="filter-list-link" onclick="filterContacts('ㄹ')">ㄹ</button></li>
		    <li class="filter-list-item"><button class="filter-list-link" onclick="filterContacts('ㅁ')">ㅁ</button></li>
		    <li class="filter-list-item"><button class="filter-list-link" onclick="filterContacts('ㅂ')">ㅂ</button></li>
		    <li class="filter-list-item"><button class="filter-list-link" onclick="filterContacts('ㅅ')">ㅅ</button></li>
		    <li class="filter-list-item"><button class="filter-list-link" onclick="filterContacts('ㅇ')">ㅇ</button></li>
		    <li class="filter-list-item"><button class="filter-list-link" onclick="filterContacts('ㅈ')">ㅈ</button></li>
		    <li class="filter-list-item"><button class="filter-list-link" onclick="filterContacts('ㅊ')">ㅊ</button></li>
		    <li class="filter-list-item"><button class="filter-list-link" onclick="filterContacts('ㅌ')">ㅌ</button></li>
		    <li class="filter-list-item"><button class="filter-list-link" onclick="filterContacts('ㅍ')">ㅍ</button></li>
		    <li class="filter-list-item"><button class="filter-list-link" onclick="filterContacts('ㅎ')">ㅎ</button></li>
		    <li class="filter-list-item"><button class="filter-list-link" onclick="filterContacts('AZ')">A-Z</button></li>
		</ul>
		
	    <!-- 주소록 목록을 나타내는 테이블 예시 -->
	    <table class="address-table">
	    <thead>
	        <tr>
	            <th><input type="checkbox" id="selectAll"></th>
	            <th class="address-table-header">이름</th>
	            <th class="address-table-header">부서</th>
	            <th class="address-table-header">직급</th>
	            <th class="address-table-header">휴대폰</th>
	            <th class="address-table-header">이메일</th>
	            <th class="address-table-header">그룹</th>
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

		 $(document).ready(function () {
			 filterContacts('all');
		    // "selectAll" 체크박스의 변경 이벤트를 감지
		    $('#selectAll').change(function() {
		        // "selectAll" 체크박스의 상태를 가져옴
		        const selectAllChecked = $(this).prop('checked');
		        
		        // "perCheckbox" 체크박스들의 상태를 변경
		        $('#contactListBody').find('input[type="checkbox"]').prop('checked', selectAllChecked);
		    });
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
			                    newRow.append('<td><input type="checkbox" id="perCheckbox"></td>');
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
