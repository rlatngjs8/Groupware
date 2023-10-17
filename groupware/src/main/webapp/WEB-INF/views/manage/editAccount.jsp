<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원정보 수정</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/manage/editAccount.js"></script>
<link href="css/manage/editAccount.css" rel="stylesheet">
<body>
<%@ include file="/WEB-INF/views/P_header.jsp"%>
<h3>직원통합관리 > 직원상세 > 직원수정</h3>
<div class="container">
	<form id="frmEdit" action="/editEMP" method="post" enctype="multipart/form-data" >
<%-- 		<c:forEach items="${Elist}" var="emp"> --%>
		<input type="hidden" id="userid" name="userid" value="${emp.userid}">
		<!-- 이미지 -->
		<div class="image">
			<label>
				<p class="lblclass">프로필이미지</p>
				<img src="/img/${emp.profilePicture}" id="exImage">
				<input type="hidden" id="imgName" name="imgName" value="${emp.profilePicture}">
				<br>
				<input type="file" id="profileIMG" accept="image/*" name="profileIMG">
				<script>
					var Image = $("#profileIMG").val();
					if(Image == null) {
						Image = "${emp.profilePicture}";
					}
					$("#profileIMG").val(Image);
				</script>
			</label>
		</div>
		<br>
		<table>
			<tr>
				<td class="lblclass">이름</td>
				<td><input type="text" id="name" name="name" value="${emp.name}"></td>
			</tr>
			<tr>
				<td class="lblclass">사번</td>
				<td><span id="userid">${emp.userid}</span></td>
			</tr>
			<tr>
				<td class="lblclass">부서</td>
				<td>
				 <select id="departmentID" name="departmentID">
                    <option value="" disabled selected>부서를 선택하세요</option> 
                    <option value="1">관리부</option>
                    <option value="2">영업부</option>
                    <option value="3">생산부</option>
                 </select>
                 <script>
                    var empDepartment = "${emp.departmentName}";
                    if(empDepartment == "관리부") {
                    	empDepartment = 1;
                    } else if (empDepartment == "영업부"){
                    	empDepartment = 2;
                    } else if (empDepartment == "생산부") {
                    	empDepartment = 3;
                    }
                    $("#departmentID").val(empDepartment);
                 </script>
				</td>
			</tr>
			<tr>
				<td class="lblclass">직급</td>
				<td>
				<select id="position" name="position">
                        <option value="" disabled selected>직급을 선택하세요</option>
                        <option value="회장">회장</option>
                        <option value="사장">사장</option>
                        <option value="이사">이사</option>
                        <option value="부장">부장</option>
                        <option value="과장">과장</option>
                        <option value="대리">대리</option>
                        <option value="사원">사원</option>
                    </select>
                    <script>
                    var empPosition = "${emp.position}";
                    $("#position").val(empPosition);
                    </script>
				</td>
			</tr>
			<tr>
				<td class="lblclass">전화번호</td>
				<td><input type="text" id="phoneNumber" name="phoneNumber" value="${emp.phoneNumber}"></td>
			</tr>
			<tr>
				<td class="lblclass">생년월일</td>
				<td><span id="birthdate">${emp.birthdate}</span></td>
			</tr>
			<tr>
				<td class="lblclass">주소</td>
				<td><input type="text" id="address" name="address" value="${emp.address}"></td>
			</tr>
			<tr>
				<td class="lblclass">이메일</td>
				<td><input type="text" id="email" name="email" value="${emp.email}"></td>
			</tr>
			<tr>
				<td class="lblclass">월 급여</td>
				<td><input type="text" id="salary" name="salary" value="${emp.salary}"></td>
			</tr>
			<tr>
				<td class="lblclass">입사일</td>
				<td><span id="hiredate">${emp.hireDate}</span></td>
			</tr>
		</table>
<%-- 		</c:forEach> --%>
		<input type="submit" id="btnSubmit" class="btnSubmit" value="수정완료">
		<input type="button" id="btnBack" class="btnBack" value="이전메뉴">
	</form>
<!-- <iframe name="kkk" style="display: none;"></iframe> -->
</div>
<!-- 로딩중 -->
<div class="loading-container" id="loading-container" style="display:none;">
    <div class="loading"></div>
    <div id="loading-text">loading</div>
</div>
<!-- 로딩중 -->
</body>
</html>