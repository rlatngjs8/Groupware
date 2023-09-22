<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원목록</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 0;
}

h2 {
	margin-top: 0;
}

h2.horizontal-layout {
	display: inline-block; /* 인라인 블록 요소로 설정하여 가로 배치 */
	margin-right: 20px; /* 원하는 간격 설정 */
}

.table-container {
	background-color: #fff;
	border-radius: 5px;
	margin: 20px auto;
	padding: 20px;
	width: 70%;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	text-align: left;
}

th {
	background-color: rgb(106, 176, 173);
	color: #fff;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

input[type="checkbox"] {
	margin-right: 5px;
}
#viewName, #viewUserid {
	cursor: pointer;
}
</style>
</head>
<body>
<%@ include file="manage_header.jsp" %>
	<div class="table-container">
	<h3>직원통합관리</h3>
		<button class="btn" id="createEmployeeBtn">+ 직원생성</button>
		<button class="btn" id="deleteEMP">- 직원삭제</button>
		<br>
		<br>
		<table>
			<thead>
				<tr>
					<th><input type="checkbox" id="selectAllCheckbox"></th>
					<th>이름</th>
					<th>사번</th>
					<th>부서명</th>
					<th>직급</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>입사일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${Elist}" var="emp">
					<tr>
						<td><input type="checkbox" class="employeeCheckbox"
							value="${emp.userid}"></td>
						<td><a id=viewName data-userid="${emp.userid}">${emp.name}</a></td>
						<td><a id=viewUserid data-userid="${emp.userid}">${emp.userid}</a></td>
						<td>${emp.departmentName}</td>
						<td>${emp.position}</td>
						<td>${emp.email}</td>
						<td>${emp.phoneNumber}</td>
						<td>${emp.hireDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		${pagestr}
	</div>

	<!-- 직원 생성 모달 -->
	<div class="modal" id="createEmployeeModal">
		<!-- 인클루드 자리 -->
		<%@ include file="employee_signup.jsp"%>
	</div>
	<div class="loading-container" id="loading-container" style= "display:none;">
    	<div class="loading"></div>
    	<div id="loading-text">loading</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>

//-----직원생성 모달  
  // 직원 생성 버튼 클릭 시 모달 열기
  $('#createEmployeeBtn').click(function() {
    $('#createEmployeeModal').css('display', 'block');
  });

  // 모달 닫기 버튼 클릭 시 모달 닫기
  $('#closeEmployeeModalBtn').click(function() {
    $('#createEmployeeModal').css('display', 'none');
  });

  // 모달 바깥 영역 클릭 시 모달 닫기
  $(window).click(function(event) {
    if (event.target.id === 'createEmployeeModal') {
      $('#createEmployeeModal').css('display', 'none');
    }
  });
//-----------
//----체크박스 맨위꺼 체크하면 전부 체크
  var selectAllCheckbox = $('#selectAllCheckbox');
  var employeeCheckboxes = $('.employeeCheckbox');
  
  selectAllCheckbox.click(function() {
	  var isChecked = selectAllCheckbox.prop('checked'); // 맨 위 체크박스의 상태 가져오기
	  employeeCheckboxes.prop('checked', isChecked); // 모든 하위 체크박스에 적용
	});
//-------
//----선택한 행 삭제
$(document).ready(function(){
	$(document).on('click','#deleteEMP',function(){
		var deleteEMP = $('.employeeCheckbox:checked');
		console.log("deleteEMP="+deleteEMP);
		if(deleteEMP.length == 0){
			alert("삭제할 직원을 선택하세요.");
			return;
		}
		var confirmDelete = confirm("정말로 선택한 직원을 삭제하시겠습니까?");
		if(confirmDelete){
			deleteEMP.each(function() {
				var userid = $(this).val();
				var name = $(this).closest('tr').find('td:eq(1)').text(); // 두 번째 열(td)의 텍스트 값 (이름) 가져오기
				var rowToRemove = $(this).closest('tr'); // 삭제할 행 찾기
				console.log("삭제직원 사번:" + userid);
				$.ajax({
					url:'/deleteEMP',
					data:{userid:userid, name:name},
					type:'post',
					dataType:'text',
					success:function(data){
						console.log('삭제성공');
						rowToRemove.remove(); // 테이블에서 해당 행 제거
						alert('삭제가 완료되었습니다.');
					},
					error:function(){
						console.log('삭제실패');
					}
				});
			});
		}
	})
});
//---------
//----이름 or 사번 클릭시 상세/수정 링크
$(document).on('click','#viewName, #viewUserid', function(){
	var userid = $(this).data("userid");
	console.log("usrid="+userid);
	window.location.href="account?userid="+userid;
})
</script>
</body>
</html>
