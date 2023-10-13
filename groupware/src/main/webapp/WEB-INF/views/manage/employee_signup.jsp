<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원생성</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/manage/employee_signup.js"></script>
<link href="css/manage/employee_signup.css" rel="stylesheet">
<body>
<div class="modal-content">

	<div class="modal-left">
		<h2>직원 생성</h2>
		<form id="frmsignup" action="/signup" method="post" enctype="multipart/form-data">
			<!-- 프로필이미지 -->
			<label class="lblclass">프로필이미지</label> 
			<img id="previewIMG" src="/img/default_profile.png" alt="미리보기 이미지" name="defaultIMG">
			<br>
			<input type="file" placeholder="프로필이미지" id="profileIMG" name="profileIMG">
			<!-- 이름 -->
			<label class="lblclass">이름</label> 
			<input type="text" placeholder="이름" id="name" name="name" class="text">
			<!-- 영문이름 -->
			<label class="lblclass">영문이름</label> 
			<input type="text" placeholder="영문이름" id="Ename" name="Ename" class="text">
			<!-- 사번 -->
			<label class="lblclass">사번</label> 
			<input type="text" placeholder="사번" id="userid" name="userid" class="text">
			<!-- 비밀번호는 생년월일로 자동설정 -->
			<input type="hidden" id="password" name="password">
			<!-- 부서 -->
			<label class="lblclass">부서</label> 
			<select id="department" name="departmentID">
				<option value="" disabled selected>부서를 선택하세요</option>
				<option value="1">관리부</option>
				<option value="2">영업부</option>
				<option value="3">생산부</option>
			</select>
			<!-- 직급 -->
			<label class="lblclass">직급</label> 
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
	</div>
	<div class="modal-right">
		<span class="close-button" id="closeEmployeeModalBtn">×</span>
		<!-- 생년월일 -->
		<label class="lblclass" style="margin-top: 20%">생년월일</label> 
		<input type="hidden" placeholder="생년월일" id="birthday" name="birthday">
		<div class="info" id="info__birth">
			<select class="box" id="birth-year">
				<option disabled selected>출생 연도</option>
			</select> <select class="box" id="birth-month">
				<option disabled selected>월</option>
			</select> <select class="box" id="birth-day">
				<option disabled selected>일</option>
			</select>
		</div>
		<!-- 나머지 -->
		<label class="lblclass">전화번호</label> 
		<input type="text" placeholder="전화번호" id="phoneNumber" name="phoneNumber" class="text"> 
		<label class="lblclass">주소</label> 
		<input type="text" placeholder="주소" id="address" name="address" class="text"> 
		<label class="lblclass">이메일</label>
		<input type="email" placeholder="이메일" id="email" name="email">
		<label class="lblclass">월 급여</label> 
		<input type="text" placeholder="월 급여" id="salary" name="salary" class="text"> 
		<label class="lblclass">입사일</label> 
		<input type="date" placeholder="입사일" id="hireDate" name="hireDate"> 
		<input type="submit" class="btn" id="saveEmployeeBtn" value="저장" style="margin-top: 8%">
	</div>
	</form>
</div>
</body>
</html>