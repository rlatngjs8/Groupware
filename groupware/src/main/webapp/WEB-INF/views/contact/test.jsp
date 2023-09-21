<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
  padding:1.5em;
  background: #f5f5f5
}

table {
  border: 1px #a39485 solid;
  font-size: .9em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  width: 100%;
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;
}

th {
  text-align: left;
}
  
thead {
  font-weight: bold;
  color: #fff;
  background: #73685d;
}
  
 td, th {
  padding: 1em .5em;
  vertical-align: middle;
}
  
 td {
  border-bottom: 1px solid rgba(0,0,0,.1);
  background: #fff;
}

a {
  color: #73685d;
}
  
 @media all and (max-width: 768px) {
    
  table, thead, tbody, th, td, tr {
    display: block;
  }
  
  th {
    text-align: right;
  }
  
  table {
    position: relative; 
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);
  }
  
  thead {
    float: left;
    white-space: nowrap;
  }
  
  tbody {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    white-space: nowrap;
  }
  
  tr {
    display: inline-block;
    vertical-align: top;
  }
  
  th {
    border-bottom: 1px solid #a39485;
  }
  
  td {
    border-bottom: 1px solid #e5e5e5;
  }
  
  
  }
</style>
<body>
<input type="hidden" id="user_id" value="${sessionScope.userid}">
<div id="toast" class="hidden">토스트 메세지 넣어라</div>
<table>
    <thead>
    <tr>
    	<th> </th>
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
                    newRow.append('<td id="checkbox"><input type="checkbox" id="perCheckbox"></td>');
                    newRow.append('<td id="per_name">' + data[i]['name'] + '</td>');
                    newRow.append('<td id="per_position">' + data[i]['position'] + '</td>'); // 부서 정보를 추가
                    newRow.append('<td id="per_phone">' + data[i]['phone'] + '</td>');
                    newRow.append('<td id="per_email"><a href="mailto:' + data[i]['email'] + '">' + data[i]['email'] + '</a></td>');
                    newRow.append('<td id="per_department">' + data[i]['department'] + '</td>');
                    newRow.append('<td id="per_company">' + data[i]['company'] + '</td>');
                    newRow.append('<td id="per_company_phone">' + data[i]['company_phone'] + '</td>');
                    newRow.append('<td id="company_address">' + data[i]['company_address'] + '</td>');
                    newRow.append('<td id="memo">' + data[i]['memo'] + '</td>');
                    newRow.append('<td id="group_name">' + data[i]['group_name'] + '</td>');
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

function sort(name) {
	
}


</script>
</html>