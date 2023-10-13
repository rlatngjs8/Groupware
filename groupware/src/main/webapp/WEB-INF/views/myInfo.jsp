<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 정보</title>
</head>
<script src='https://code.jquery.com/jquery-Latest.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.js"></script>
<script src="js/myInfo.js"></script>
<link href="css/myInfo.css" rel="stylesheet">
</head>
<body>
  <%@ include file="P_header.jsp"%>
  <br><br>
  <div id="section">
    <input type="hidden" id="userid" name="userid" value="${userid}">
    <div class="checkPassword" id="checkPassword">
      <!-- ajax 로 보내서 체크 -->
      <h3>비밀번호 확인</h3>
      <hr/><br>
      <input type="password" id="password" placeholder="비밀번호를 입력해주세요"><br><br>
      <button id="check">비밀번호 확인</button>
    </div>
    <div class="info" id="info" style="display: none;">
    <h2 style="margin-left:3%">직원정보조회</h2>
      <div id="image">
        <label>
          <p style="font-weight: bold; margin-right:37%">프로필 이미지</p>
          <img src="/img/${emp.profilePicture}" id="exProfileIMG">
        </label>
        <p class="warning">⚠️ 이미지가 제대로 나오지 않는다면 새로고침(f5)를 눌러주세요.</p>
      </div>
      <table>
        <tr>
          <td class="tdclass">이름</td>
          <td><span id="name">${emp.name}</span></td>
        </tr>
        <tr>
          <td class="tdclass">사번</td>
          <td>${emp.userid}</td>
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
          <td><span id="phoneNumber">${emp.phoneNumber}</span></td>
        </tr>
        <tr>
          <td class="tdclass">생년월일</td>
          <td><span id="birthdate">${emp.birthdate}</span></td>
        </tr>
        <tr>
          <td class="tdclass">주소</td>
          <td><span id="address">${emp.address}</span></td>
        </tr>
        <tr>
          <td class="tdclass">이메일</td>
          <td><span id="email">${emp.email}</span></td>
        </tr>
        <tr>
          <td class="tdclass">월 급여</td>
          <td><span id="salary">${emp.salary}</span></td>
        </tr>
        <tr>
          <td class="tdclass">입사일</td>
          <td>${emp.hireDate}</td>
        </tr>
      </table>
      <button id="editModal">정보수정</button>
    </div>
    <!-- 모달로 수정만든후에 저장 버튼 누르면 info에 업데이트 -->
    <!-- 로딩 중도 띄워야 함 -->
	  <div class="modal" id="editSelf">
			<!-- 인클루드 자리 -->
				<%@ include file="editSelf.jsp"%>
		</div>
  </div>
</body>
</html>