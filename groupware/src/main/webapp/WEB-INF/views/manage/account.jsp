<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 상세 정보</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }

    h3 {
        width: 20%;
        margin-left: 9%;
        text-align: left;
        background-color: #007bff;
        color: #fff;
        padding: 10px 0;
    }

    #container {
        background-color: #fff;
        border-radius: 5px;
        margin: 20px auto;
        padding: 20px;
        width: 80%;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    #image {
        text-align: left;
        margin-bottom: 20px;
    }

    #exProfileIMG {
        max-width: 200px;
        max-height: 200px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    .tdclass {
        font-weight: bold;
        width: 12%;
    }

    td {
        padding: 10px;
        text-align: left;
    }

    .editField {
        display: none;
    }

    .modify {
        width: 13px;
        height: 13px;
        margin-left: 2%;
        cursor: pointer;
    }

    /* 추가된 부분: 파일 업로드 버튼 스타일 */
    #uploadImageInput {
        display: none;
    }

/*     #changeImageBtn { */
/*         background-color: #007bff; */
/*         color: #fff; */
/*         border: none; */
/*         padding: 5px 10px; */
/*         cursor: pointer; */
/*     } */
</style>
</head>
<body>
<h3>직원통합관리 > 직원상세</h3>
<div id="container">
    <c:forEach items="${Elist}" var="emp">
        <div id="image">
            <label class="lblclass">
                <img src="/img/${emp.profilePicture}" id="exProfileIMG">
            </label>
            <!-- 추가된 부분: 이미지 변경 버튼 -->
            <img src="/img/수정.png" id="changeImageBtn" class="modify">
            <span style="font-size: 5px;">사진 변경</span>
        </div>
        <table>
            <tr>
                <td class="tdclass">이름</td>
                <td>
                    <span id="editName">${emp.name}</span>
                    <input type="text" id="editNameInput" class="editField">
                    <img src="/img/수정.png" id="modifyName" class="modify">
                </td>
            </tr>
            <tr>
                <td class="tdclass">사번</td>
                <td>${emp.userid}</td>
            </tr>
            <tr>
                <td class="tdclass">부서</td>
                <td>
                    <span id="editDepartment">${emp.departmentName}</span>
                    <!-- select option 넣고 -->
                    <select id="editDdepartmentSelect" class="editField">
                        <option value="" disabled selected>부서를 선택하세요</option>
                        <option value="1">관리부</option>
                        <option value="2">영업부</option>
                        <option value="3">생산부</option>
                    </select>
                    <img src="/img/수정.png" id="modifyDepart" class="modify">
                </td>
            </tr>
            <tr>
                <td class="tdclass">직급</td>
                <td>
                    <span id="editPosition">${emp.position}</span>
                    <!-- 여기도 셀렉트 넣고 -->
                    <select id="editPositionSelect" class="editField">
                        <option value="" disabled selected>직급을 선택하세요</option>
                        <option value="회장">회장</option>
                        <option value="사장">사장</option>
                        <option value="이사">이사</option>
                        <option value="부장">부장</option>
                        <option value="과장">과장</option>
                        <option value="대리">대리</option>
                        <option value="사원">사원</option>
                    </select>
                    <img src="/img/수정.png" id="modifyPosition" class="modify">
                </td>
            </tr>
            <tr>
                <td class="tdclass">전화번호</td>
                <td>
                    <span id="editPhoneNumber">${emp.phoneNumber}</span>
                    <input type="text" id="editPhoneNumberInput" class="editField">
                    <img src="/img/수정.png" id="modifyPhoneNumber" class="modify">
                </td>
            </tr>
            <tr>
                <td class="tdclass">생년월일</td>
                <td>
                    <span id="editPhonebirthDate">${emp.birthdate}</span>
                </td>
            </tr>
            <tr>
                <td class="tdclass">주소</td>
                <td>
                    <span id="editAddress">${emp.address}</span>
                    <input type="text" id="editAddressInput" class="editField">
                    <img src="/img/수정.png" id="modifyAddress" class="modify">
                </td>
            </tr>
            <tr>
                <td class="tdclass">이메일</td>
                <td>
                    <span id="editEmail">${emp.email}</span>
                    <!-- 인풋넣는데, 도메인은 가만히 -->
                    <input type="text" id="editEmailInput" class="editField">
                    <img src="/img/수정.png" id="modifyEmail" class="modify">
                </td>
            </tr>
            <tr>
                <td class="tdclass">월 급여</td>
                <td>
                    <span id="editSalary">${emp.salary}</span>
                    <input type="text" id="editSalaryInput" class="editField">
                    <img src="/img/수정.png" id="modifySalary" class="modify">
                </td>
            </tr>
            <tr>
                <td class="tdclass">입사일</td>
                <td>${emp.hireDate}</td>
            </tr>
        </table>
    </c:forEach>
    <input type="button" class="btnGo" id="btnGo" value="저장">
    <input type="button" class="btnBack" id="btnBack" value="돌아가기">
    <!-- 추가된 부분: 이미지 업로드를 위한 파일 선택(input type="file) 요소 -->
    <input type="file" id="uploadImageInput" accept="image/*">
</div>

</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	$("#modifyName").click(function() {
        $("#editName").hide();
        $("#editNameInput").val($("#editName").text()).show().focus();
    });

	
	

    
 // 전화번호 입력란의 ID를 가져옵니다. 이 예제에서는 editPhoneNumberInput입니다.
    var phoneNumberInput = $('#editPhoneNumberInput');

    // 입력 필드의 값을 변경할 때 이벤트 핸들러를 추가합니다.
    phoneNumberInput.on('input', function() {
      // 입력된 전화번호에서 숫자만 추출합니다.
      var phoneNumber = phoneNumberInput.val().replace(/\D/g, '');

      // 전화번호가 11자리를 초과하지 않도록 제한합니다.
      if (phoneNumber.length > 11) {
        phoneNumber = phoneNumber.slice(0, 11);
      }

      // 전화번호 형식을 적용하여 하이픈을 추가합니다.
      if (phoneNumber.length >= 4 && phoneNumber.length <= 7) {
        phoneNumber = phoneNumber.replace(/(\d{3})(\d{1,4})/, '$1-$2');
      } else if (phoneNumber.length >= 8) {
        phoneNumber = phoneNumber.replace(/(\d{3})(\d{4})(\d{1,4})/, '$1-$2-$3');
      }

      // 입력 필드에 변경된 전화번호를 설정합니다.
      phoneNumberInput.val(phoneNumber);
    });
    
    
    
    

    // 파일 선택(input type="file) 요소의 값이 변경되면 이미지를 미리보기합니다.
    $("#uploadImageInput").change(function() {
        var fileInput = this;
        if (fileInput.files && fileInput.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                // 미리보기 이미지를 업데이트합니다.
                $("#exProfileIMG").attr("src", e.target.result);
            };

            reader.readAsDataURL(fileInput.files[0]);
        }
    });

</script>
</html>