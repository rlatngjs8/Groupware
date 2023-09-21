<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <style>

        /* 공통 스타일 */
		.styled-table {
		    border: 1px #a39485 solid;
		    font-size: .9em;
		    box-shadow: 0 2px 5px rgba(0,0,0,.25);
		    width: 80%;
		    border-collapse: collapse;
		    border-radius: 5px;
		    overflow: hidden;
			margin-left: 280px; /* 수평 가운데 정렬을 위한 스타일 */
		}

		/* 테이블 제목 셀 스타일 */
		.styled-table th {
		    text-align: left; /* 텍스트 왼쪽 정렬 */
		    transition: background-color 0.3s; /* 호버 시 배경색 변경 애니메이션 */
		    cursor: pointer; /* 호버 시 포인터 커서로 변경 */
		}
		
		/* 호버 시 배경색 변경 */
		.styled-table th:hover {
		    background-color: #ccc; /* 호버 시 배경색 변경 (예: 회색) */
		}
		
		
        .styled-table thead {
            font-weight: bold;
            color: #fff;
            background: rgb(106, 176, 173);
        }

        .styled-table td, .styled-table th {
            padding: 1em .5em;
            vertical-align: middle;
        }

        .styled-table td {
            border-bottom: 1px solid rgba(0,0,0,.1);
            background: #fff;
        }

        .styled-table a {
            color: #73685d;
        }

        /* 미디어 쿼리 */
        @media all and (max-width: 768px) {
            .styled-table, .styled-table thead, .styled-table tbody, .styled-table th, .styled-table td, .styled-table tr {
                display: block;
            }

            .styled-table th {
                text-align: right;
            }

            .styled-table {
                position: relative;
                padding-bottom: 0;
                border: none;
                box-shadow: 0 0 10px rgba(0,0,0,.2);
            }

            .styled-table thead {
                float: left;
                white-space: nowrap;
            }

            .styled-table tbody {
                overflow-x: auto;
                overflow-y: hidden;
                position: relative;
                white-space: nowrap;
            }

            .styled-table tr {
                display: inline-block;
                vertical-align: top;
            }

            .styled-table th {
                border-bottom: 1px solid #a39485;
            }

            .styled-table td {
                border-bottom: 1px solid #e5e5e5;
            }
        }
        
       .search-container {
            position: absolute;
            top: 10px; /* 원하는 상단 여백 조정 */
            right: 10px; /* 원하는 오른쪽 여백 조정 */
            display: flex;
            align-items: center;
            background-color: #8bc34a; /* 연두색 배경색상 */
            border: 2px solid #4caf50; /* 연두색 테두리 */
            border-radius: 0; /* 모서리를 둥글게 만들지 않음 */
            overflow: hidden;
        }

        .search-input {
            flex: 1;
            border: none;
            padding: 10px;
            font-size: 16px;
            background-color: white; /* 연두색 배경색상 */
            color: black; /* 글자색을 흰색으로 지정 */
        }

        .search-button {
            background-color: #4caf50; /* 진한 연두색 버튼 배경색상 */
            color: #fff; /* 버튼 텍스트 색상 */
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        /* 검색 버튼에 호버 효과 추가 */
        .search-button:hover {
            background-color: #45a049; /* 호버 시 색상 변경 */
        }
    </style>
        
  
<body>
<%@ include file="/WEB-INF/views/P_header.jsp" %>

<input type="hidden" id="user_id" value="${sessionScope.userid}">
    <div id="toast" class="hidden">토스트 메세지 넣어라</div>

       <div class="search-container">
        <input type="text" class="search-input" placeholder="검색어를 입력하세요">
        <button class="search-button">검색</button>
    </div>

    <table class="styled-table">
        <thead>
        <tr>
            <th><input type="checkbox" id="selectAll"></th>
            <th onclick="sort('name')">이름</th>
            <th onclick="sort('position')">직위</th>
            <th onclick="sort('phone')">휴대폰</th>
            <th onclick="sort('email')">Email</th>
            <th onclick="sort('department')">부서</th>
            <th onclick="sort('company')">회사</th>
            <th onclick="sort('companyPhone')">회사전화</th>
            <th onclick="sort('companyAddress')">회사주소</th>
            <th onclick="sort('memo')">메모</th>
            <th onclick="sort('group')">그룹</th>
        </tr>
        </thead>
        <tbody id="contactListBody">

        </tbody>
    </table>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
//jQuery를 사용하여 모달을 제어합니다.
$(document).ready(function() {
    sort('all');
});





function sort(name) {
    console.log('개인 주소록 불러옴');
    const userid = $('#user_id').val();
    console.log(userid);
    $.ajax({
        url: '/get_personal_addressBook',
        data: { userid: userid, name: name }, // 필터 값을 서버로 전송
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
                    '<p>데이터가 없습니다.</p>' +
                    '<div style="text-align: center;">' +
                    '<button id="openModalButton" class="btn btn-primary">빠른 등록</button>' +
                    '</div>' +
                    '</td>');
                $('#no_contactListBody').append(newRow);
            } else {
                // 데이터가 있는 경우 연락처를 추가
                for (let i = 0; i < data.length; i++) {
                    const newRow = $('<tr>');
                    newRow.append('<td><input type="checkbox" id="perCheckbox"></td>');
                    newRow.append('<td id="per_name">' + data[i]['name'] + '</td>');
                    newRow.append('<td id="per_position">' + data[i]['position'] + '</td>'); // 부서 정보를 추가
                    newRow.append('<td id="per_phone">' + data[i]['phone'] + '</td>');
                    newRow.append('<td id="per_email"><a href="mailto:' + data[i]['email'] + '">' + data[i]['email'] + '</a></td>');
                    newRow.append('<td id="per_department">' + data[i]['department'] + '</td>');
                    newRow.append('<td id="per_company">' + data[i]['company'] + '</td>');
                    newRow.append('<td id="per_company_phone">' + data[i]['company_phone'] + '</td>');
                    newRow.append('<td id="per_company_address">' + data[i]['company_address'] + '</td>');
                    newRow.append('<td id="per_memo">' + data[i]['memo'] + '</td>');
                    newRow.append('<td id="per_group_name">' + data[i]['group_name'] + '</td>');
                    newRow.append('<input type="hidden" class="address-book-id" value="' + data[i]['address_book_id'] + '">');
                    $('#contactListBody').append(newRow);
                }
            }
        },
        error: function(xhr, status, error) {
            console.error('주소록 데이터 불러오기 에러:', status, error);
            // 에러 처리를 수행할 수 있습니다. 예를 들어, 사용자에게 오류 메시지를 표시하는 등의 작업을 수행할 수 있습니다.
        }
    });
}

</script>
</html>