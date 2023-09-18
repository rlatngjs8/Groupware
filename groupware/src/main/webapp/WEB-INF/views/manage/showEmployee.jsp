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

  table {
    border-collapse: collapse;
    width: 100%;
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
</style>
</head>
<body>
<table>
<thead>
  <tr>
    <th>선택</th>
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
    <td><input type="checkbox" name="selectedEmps" value="${emp.userid}"></td>
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
</body>
</html>
