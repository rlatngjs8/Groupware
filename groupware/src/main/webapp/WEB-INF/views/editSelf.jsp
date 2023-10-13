<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>editSelf</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/editSelf.js"></script>
<link href="css/editSelf.css" rel="stylesheet">
<body>
<div class="modal-content">
	<span class="close" id="closeModal">&times;</span>
	<h2 style="margin-top:1%">사용자 정보 편집</h2>
	<div class="content">
		<form id="frmEdit" action="/selfEdit" method="post" enctype="multipart/form-data">
		<!-- 사용자 정보를 편집할 수 있는 입력 필드를 추가합니다 -->
		<div class="image">
			<p class="lblclass" style="margin-right:33%; font-weight:bold;">프로필이미지</p>
			<img src="/img/${emp.profilePicture}" id="exImage">
			<input type="hidden" id="imgName" name="imgName" value="${emp.profilePicture}">
			<br>
			<input type="file" id="profileIMG" accept="image/*" name="profileIMG" style="margin-left:7%">
			<script>
				var Image = $("#profileIMG").val();
				if(Image == null) {
					Image = "${emp.profilePicture}";
				}
				$("#profileIMG").val(Image);
			</script>
		</div><br>
		<!-- 예를 들어: -->
		<table>
        <tr>
          <td class="tdclass">이름</td>
          <td><span id="name">${emp.name}</span></td>
        </tr>
        <tr>
          <td class="tdclass">사번</td>
          <td><span id="userid">${emp.userid}</span></td>
        </tr>
        <tr>
        	<td class="tdclass">비밀번호</td>
        	<td><input type="text" id="password1" name="password1" placeholder="새 비밀번호를 입력하세요"></td>
        </tr>
        <tr>
          <td class="tdclass">부서</td>
          <td><span id="department">${emp.departmentName}</span></td>
        </tr>
        <tr>
          <td class="tdclass">직급</td>
          <td><span id="position">${emp.position}</span></td>
        </tr>
        <tr>
          <td class="tdclass">전화번호</td>
          <td><input type="text" id="phoneNumber1" name="phoneNumber1" value="${emp.phoneNumber}" style="width:35%"></td>
        </tr>
        <tr>
          <td class="tdclass">주소</td>
          <td><input type="text" id="address1" name="address1" value="${emp.address}" style="width:65%"></td>
        </tr>
        <tr>
          <td class="tdclass">이메일</td>
          <td><input type="text" id="email2" name="email2" value="${emp.email.split('@')[0]}" style="width:35%">@example.com<input type="hidden" id="email1" name="email1"></td>
        </tr>
        <tr>
          <td class="tdclass">생년월일</td>
          <td><span id="birthdate">${emp.birthdate}</span></td>
        </tr>
        <tr>
          <td class="tdclass">월 급여</td>
          <td><span id="salary">${emp.salary}</span></td>
        </tr>
        <tr>
          <td class="tdclass">입사일</td>
          <td>${emp.hireDate}</td>
        </tr>
      </table><br><br>
		<!-- 필요에 따라 더 많은 입력 필드를 추가합니다 -->
		<div class="button">
		<input type="submit" id="btnSubmit" class="btnSubmit" value="변경 사항 저장">			
		<input type="button" id="closeModal" class="closeModal" value="취소하기"> 
		</div>
		</form>
	</div>
</div>
<!-- 로딩중 -->
<div class="loading-container" id="loading-container" style="display:none;">
    <div class="loading"></div>
    <div id="loading-text">loading</div>
</div>
<!-- 로딩중 -->
</body>
</html>