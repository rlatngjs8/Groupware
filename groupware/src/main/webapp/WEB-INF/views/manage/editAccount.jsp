<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원정보 수정</title>
</head>
<body>
<%@ include file="manage_header.jsp" %>
<h3>직원통합관리 > 직원상세</h3>
<div class="container">
	<form id=frmEdit action="/editEMP" method="post" enctype="multipart/form-data"></form>
		<c:forEach items="${Elist}" var="emp">
		<input type="hidden" id="userid" value="${emp.userid}">
		<!-- 이미지 -->
		<div class="image">
			<label class="lblclass">
				<img src="/img/${emp.profilePicture}" id="exImage">
				<br>
				<input type="file" id="profileIMG" accept="image/*" name="profileIMG">
			</label>
		</div>
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" id="name" name="name" value="${emp.name}"></td>
			</tr>
			<tr>
				<td>사번</td>
				<td><span id="userid">${emp.userid}</span></td>
			</tr>
			<tr>
				<td>부서</td>
				<td>
				 <select id="departmentID" name="departmentID">
                    <option value="" disabled selected>부서를 선택하세요</option> 
                    <option value="1">관리부</option>
                    <option value="2">영업부</option>
                    <option value="3">생산부</option>
                 </select>
				</td>
			</tr>
			<tr>
				<td>직급</td>
				<td>
				<select id="position" name="position" value="${emp.position}">
                        <option value="" disabled selected>직급을 선택하세요</option>
                        <option value="회장">회장</option>
                        <option value="사장">사장</option>
                        <option value="이사">이사</option>
                        <option value="부장">부장</option>
                        <option value="과장">과장</option>
                        <option value="대리">대리</option>
                        <option value="사원">사원</option>
                    </select>
				</td>
			</tr>
			<tr>
				<td>전화번</td>
				<td><input type="text" id="phoneNumber" name="phoneNumber" value="${emp.phoneNumber}"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><span id="birthdate">${emp.birthdate}</span></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" id="address" name="address" value="${emp.address}"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" id="email" name="email" value="${emp.email}"></td>
			</tr>
			<tr>
				<td>월 급여</td>
				<td><input type="text" id="salary" name="salary" value="${emp.salary}"></td>
			</tr>
			<tr>
				<td>입사일</td>
				<td><span id="hiredate">${emp.hireDate}</span></td>
			</tr>
			
				
		</table>
		</c:forEach>
	</form>
</div>
</body>
</html>