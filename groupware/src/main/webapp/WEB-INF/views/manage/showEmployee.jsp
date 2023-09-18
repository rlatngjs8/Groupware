<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원목록</title>
<style>
  /* CSS 스타일링을 추가합니다. */
  input[type="checkbox"] {
    margin-right: 5px;
    padding: 0;
  }

  .table-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 5% auto; /* 수직 가운데 정렬, 수평 가운데 정렬 */
  }

  table {
    border-collapse: collapse;
    width: 80%; /* 테이블 넓이를 조정합니다. */
  }

  th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
  }

  th {
    background-color: #f2f2f2;
  }

  tr:nth-child(even) {
    background-color: #f2f2f2;
  }

 .pagination {
  margin-top: 20px; /* 페이지 링크의 위쪽 여백 추가 */
  margin-left: 50%;
  transform: translateX(-50%); /* 가운데 정렬 */
  text-align: center;
}

.pagination a {
  display: inline-block;
  padding: 5px 10px;
  margin: 0 5px;
  background-color: #007bff; /* 배경색을 원하는 색상으로 설정하세요. */
  color: #fff; /* 글자색을 원하는 색상으로 설정하세요. */
  text-decoration: none;
  border-radius: 3px;
  cursor: pointer;
}

.pagination a:hover {
  background-color: #0056b3; /* 마우스를 올렸을 때의 배경색을 설정하세요. */
}

.pagination .active {
  background-color: #0056b3; /* 현재 활성화된 페이지의 배경색을 설정하세요. */
}

/* 모달 스타일 */
.modal {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.7);
  justify-content: center;
  align-items: center;
  z-index: 1;
}

.modal-content {
    background-color: #fff;
    margin: auto;
    margin-top: 10%;
    width: 350px;
    height: 450px;
    padding: 20px;
    border-radius: 5px;
    text-align: center;
    position: relative;
}

.modal-content input {
  width: 100%;
  margin-bottom: 10px;
}

/* X 버튼 스타일 */
.close-button {
  position: absolute;
  top: 10px;
  right: 10px;
  cursor: pointer;
}

.btn {
  background-color: #007bff;
  color: #fff;
  border: none;
  padding: 10px 20px;
  cursor: pointer;
}
</style>
</head>
<body>
<div class="table-container">
	<button class="btn" id="createEmployeeBtn">+ 직원생성</button>
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
        <td><input type="checkbox" class="employeeCheckbox" value="${emp.userid}"></td>
        <td>${emp.name}</td>
        <td>${emp.userid}</td>
        <td>${emp.departmentName}</td>
        <td>${emp.position}</td>
        <td>${emp.email}</td>
        <td>${emp.phoneNumber}</td>
        <td>${emp.hireDate}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

<!-- 직원 생성 모달 -->
<div class="modal" id="createEmployeeModal">
  <div class="modal-content">
    <span class="close-button" id="closeEmployeeModalBtn">×</span>
    <h2>직원 생성</h2>
    <form id="frmsignup" action="/signup" method="post">
      <input type="text" placeholder="사번" id="userid" name="userid">
      <input type="text" placeholder="초기비밀번호는 생년월일" id="password">
      <input type="text" placeholder="이름" id="name">
      <input type="text" placeholder="부서명" id="부서명">
      <input type="text" placeholder="직급" id="직급">
      <input type="text" placeholder="생일" id="birthday" name="birthday">
      <input type="text" placeholder="전화번호" id="phoneNumber" name="phoneNumber">
      <input type="text" placeholder="주소" id="address" name="address">
      <input type="text" placeholder="이메일" id="email" name="email">
      <input type="text" placeholder="급여" id="salary" name="salary">
      <input type="text" placeholder="프로필이미지" id="profileIMG" name="profileIMG">
      <input type="text" placeholder="입사일" id="hireDate" name="hireDate">
      <!-- 여기에 추가 필드를 포함할 수 있습니다. -->
      <button type="button" class="btn" id="saveEmployeeBtn">저장</button>
    </form>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
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

  // 저장 버튼 클릭 시 처리 (여기에서 서버로 데이터를 전송할 수 있습니다.)
  $('#saveEmployeeBtn').click(function() {
    var name = $('#employeeName').val();
    var id = $('#employeeID').val();
    var department = $('#employeeDepartment').val();
    // 이후 데이터 처리를 진행합니다.
    
    // 모달 닫기
    $('#createEmployeeModal').css('display', 'none');
  });
</script>
</body>
</html>
