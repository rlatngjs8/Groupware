<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원목록</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="js/manage/showEmployees.js"></script>
<link href="css/manage/showEmployees.css" rel="stylesheet">
</head>
<body>
<%@ include file="/WEB-INF/views/P_header.jsp"%>
<div class="table-container">
<h3>직원통합관리</h3>
   <button class="btn" id="createEmployeeBtn">+ 직원생성</button>
   <button class="btn" id="deleteEMP">- 직원삭제</button>
   <span class="accountGuide">※이름 혹은 사번 클릭시 직원상세보기</span>
   <br><br>
   <table>
      <thead>
         <tr>
            <th><input type="checkbox" id="selectAllCheckbox"></th>
            <th onclick="sort('name')">이름</th>
            <th onclick="sort('id')">사번</th>
            <th onclick="sort('department')">부서명</th>
            <th onclick="sort('position')">직급</th>
            <th onclick="sort('email')">이메일</th>
            <th onclick="sort('phone')">전화번호</th>
            <th onclick="sort('hiredate')">입사일</th>
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
   <div class="pagenation">
      ${pagestr}
   </div>
</div>
<!-- 직원 생성 모달 -->
<div class="modal" id="createEmployeeModal">
   <!-- 인클루드 자리 -->
   <%@ include file="employee_signup.jsp"%>
</div>
<div class="loading-container" id="loading-container">
<div class="loading"></div>
<div id="loading-text">loading</div>
</div>
</body>
</html>