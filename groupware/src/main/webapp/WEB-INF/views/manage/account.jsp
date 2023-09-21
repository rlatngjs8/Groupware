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
        margin-left: 14%;
        text-align: left;
        background-color: rgb(106, 176, 173);
        color: #fff;
        padding: 10px 0;
    }

    #container {
        background-color: #fff;
        border-radius: 5px;
        margin: 20px auto;
        padding: 20px;
        width: 70%;
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
<%@ include file="manage_header.jsp" %>
<h3>직원통합관리 > 직원상세</h3>
<div id="container">
<!--     <form enctype="multipart/form-data" method="post" action="/EMPmodify"> -->
    <c:forEach items="${Elist}" var="emp">
        <div id="image">
        <input type="hidden" id="userid" value="${emp.userid}">
            <label class="lblclass">
                <img src="/img/${emp.profilePicture}" id="exProfileIMG">
            </label>
            <!-- 추가된 부분: 이미지 변경 버튼 -->
<!--             <img src="/img/수정.png" id="modifyImageBtn" class="modify"> -->
<!--             <span style="font-size: 5px;">사진 변경</span> -->
<!--             <input type="file" id="uploadImageInput" accept="image/*" name="profileIMG"> -->
        </div>
        <table>
            <tr>
                <td class="tdclass">이름</td>
                <td>
                    <span id="name">${emp.name}</span>
<!--                     <input type="text" id="name1" class="editField" name="name"> -->
<!--                     <img src="/img/수정.png" id="modifyName" class="modify"> -->
                </td>
            </tr>
            <tr>
                <td class="tdclass">사번</td>
                <td>${emp.userid}</td>
            </tr>
            <tr>
                <td class="tdclass">부서</td>
                <td>
                    <span id="department">${emp.departmentName}</span>
                    <!-- select option 넣고 -->
<!--                     <select id="department1" class="editField" name="department"> -->
<!--                         <option value="" disabled selected>부서를 선택하세요</option> -->
<!--                         <option value="1">관리부</option> -->
<!--                         <option value="2">영업부</option> -->
<!--                         <option value="3">생산부</option> -->
<!--                     </select> -->
<!--                     <img src="/img/수정.png" id="modifyDepart" class="modify"> -->
                </td>
            </tr>
            <tr>
                <td class="tdclass">직급</td>
                <td>
                    <span id="position">${emp.position}</span>
                    <!-- 여기도 셀렉트 넣고 -->
<!--                     <select id="position1" class="editField" name="position"> -->
<!--                         <option value="" disabled selected>직급을 선택하세요</option> -->
<!--                         <option value="회장">회장</option> -->
<!--                         <option value="사장">사장</option> -->
<!--                         <option value="이사">이사</option> -->
<!--                         <option value="부장">부장</option> -->
<!--                         <option value="과장">과장</option> -->
<!--                         <option value="대리">대리</option> -->
<!--                         <option value="사원">사원</option> -->
<!--                     </select> -->
<!--                     <img src="/img/수정.png" id="modifyPosition" class="modify"> -->
                </td>
            </tr>
            <tr>
                <td class="tdclass">전화번호</td>
                <td>
                    <span id="phoneNumber">${emp.phoneNumber}</span>
<!--                     <input type="text" id="phoneNumber1" class="editField" name="phoneNumber"> -->
<!--                     <img src="/img/수정.png" id="modifyPhoneNumber" class="modify"> -->
                </td>
            </tr>
            <tr>
                <td class="tdclass">생년월일</td>
                <td>
                    <span id="birthdate">${emp.birthdate}</span>
                </td>
            </tr>
            <tr>
                <td class="tdclass">주소</td>
                <td>
                    <span id="address">${emp.address}</span>
<!--                     <input type="text" id="address1" class="editField" name="address"> -->
<!--                     <img src="/img/수정.png" id="modifyAddress" class="modify"> -->
                </td>
            </tr>
            <tr>
                <td class="tdclass">이메일</td>
                <td>
                    <span id="email">${emp.email}</span>
<%--                     <input type="text" id="email1" class="editField" name="email> --%>
<!--                     <img src="/img/수정.png" id="modifyEmail" class="modify"> -->
                </td>
            </tr>
            <tr>
                <td class="tdclass">월 급여</td>
                <td>
                    <span id="salary">${emp.salary}</span>
<!--                     <input type="text" id="salary1" class="editField" name="salary"> -->
<!--                     <img src="/img/수정.png" id="modifySalary" class="modify"> -->
                </td>
            </tr>
            <tr>
                <td class="tdclass">입사일</td>
                <td>${emp.hireDate}</td>
            </tr>
        </table>
    </c:forEach>
<!--     <input type="button" class="btnGo" id="btnGo" value="저장"> -->
    <input type="button" class="btnEdit" id="btnEdit" value="수정">
    <input type="button" class="btnBack" id="btnBack" value="돌아가기">
    <!-- 추가된 부분: 이미지 업로드를 위한 파일 선택(input type="file) 요소 -->
<!--     </form> -->
</div>

</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
// $(document).ready(function() {
// 	$("#modifyName").click(function() {
//     $("#name").hide();
//     $("#modifyName").hide();
//     $("#name1").val($("#name").text()).show().focus();
//     });
// 	$("#modifyDepart").click(function(){
// 		$("#department").hide();
// 		$("#modifyDepart").hide();
// 		$("#department1").val($("#department").text()).show().focus();
// 	});
// 	$("#modifyPosition").click(function(){
// 		$("#position").hide();
// 		$("#modifyPosition").hide();
// 		$("#position1").val($("#position").text()).show().focus();
// 	});
// 	$("#modifyPhoneNumber").click(function(){
// 		$("#phoneNumber").hide();
// 		$("#modifyPhoneNumber").hide();
// 		$("#phoneNumber1").val($("#phoneNumber").text()).show().focus();
// 	});
// 	$("#modifyAddress").click(function(){
// 		$("#address").hide();
// 		$("#modifyAddress").hide();
// 		$("#address1").val($("#address").text()).show().focus();
// 	});
// 	$("#modifyEmail").click(function(){
// 		$("#email").hide();
// 		$("#modifyEmail").hide();
// 		$("#email1").val($("#email").text()).show().focus();
// 	});
// 	$("#modifySalary").click(function(){
// 		$("#salary").hide();
// 		$("#modifySalary").hide();
// 		$("#salary1").val($("#salary").text()).show().focus();
// 	});
// 	$("#modifyImageBtn").click(function(){
// 		$("#uploadImageInput").click();
// 	})
	
    
//  // 전화번호 입력란의 ID를 가져옵니다. 이 예제에서는 editPhoneNumberInput입니다.
//     var phoneNumberInput = $('#phoneNumber1');

//     // 입력 필드의 값을 변경할 때 이벤트 핸들러를 추가합니다.
//     phoneNumberInput.on('input', function() {
//       // 입력된 전화번호에서 숫자만 추출합니다.
//       var phoneNumber = phoneNumberInput.val().replace(/\D/g, '');

//       // 전화번호가 11자리를 초과하지 않도록 제한합니다.
//       if (phoneNumber.length > 11) {
//         phoneNumber = phoneNumber.slice(0, 11);
//       }

//       // 전화번호 형식을 적용하여 하이픈을 추가합니다.
//       if (phoneNumber.length >= 4 && phoneNumber.length <= 7) {
//         phoneNumber = phoneNumber.replace(/(\d{3})(\d{1,4})/, '$1-$2');
//       } else if (phoneNumber.length >= 8) {
//         phoneNumber = phoneNumber.replace(/(\d{3})(\d{4})(\d{1,4})/, '$1-$2-$3');
//       }

//       // 입력 필드에 변경된 전화번호를 설정합니다.
//       phoneNumberInput.val(phoneNumber);
//     });
    
    

//     // 파일 선택(input type="file) 요소의 값이 변경되면 이미지를 미리보기합니다.
//     $("#uploadImageInput").change(function() {
//         var fileInput = this;
//         if (fileInput.files && fileInput.files[0]) {
//             var reader = new FileReader();

//             reader.onload = function(e) {
//                 // 미리보기 이미지를 업데이트합니다.
//                 $("#exProfileIMG").attr("src", e.target.result);
//             };
//             reader.readAsDataURL(fileInput.files[0]);

// //             // 이미지 파일을 FormData에 추가합니다.
// //             formData.append('image', fileInput.files[0]); // 'image'는 서버에서 파일을 받을 때 사용할 필드 이름입니다.
//         }
//     });
// });

// $(document).ready(function() {
//     // "저장" 버튼 클릭 이벤트 처리
//     $("#btnGo").click(function() {
//     	if($("#name1").val() == ''){
//     		$("#name1").val($("#name").val());
//     	}
//     	if($("#department1").val() == ''){
//     		$("#department1").val($("#department").val());
//     	}
//     	if($("#position1").val() == ''){
//     		$("#position1").val($('#position').val());
//     	}
//     	if($("#phoneNumber1").val() == ''){
//     		$("#phoneNumber1").val($("#phoneNumber").val());
//     	}
//     	if($("#address1").val()==''){
//     		$("#address1").val($("#address").val());
//     	}
//     	if($("#email1").val()==''){
//     		$("#email1").val($("#email").val());
//     	}
//     	if($("#salary1").val()==''){
//     		$("#salary1").val($("#salary").val());
//     	}
    	
    	
    	
    	
    	
    	
//         // 수정된 데이터를 수집합니다.
//         var updatedData = {
//             userid: $("#userid").val(),
//             name: $("#name1").val(),
//             department: $("#department1").val(),
//             position: $("#position1").val(),
//             phoneNumber: $("#phoneNumber1").val(),
//             address: $("#address1").val(),
//             email: $("#email1").val(),
//             salary: $("#salary1").val(),
//             // 기타 필요한 데이터 추가
//         };

//         // 이미지 파일을 FormData에 추가합니다.
//         var formData = new FormData();
//         formData.append('image', $('#uploadImageInput')[0].files[0]); // 'image'는 서버에서 파일을 받을 때 사용할 필드 이름입니다.
        
//         // 다른 데이터도 FormData에 추가합니다.
//         for (var key in updatedData) {
//             formData.append(key, updatedData[key]);
//         }

        // 서버로 데이터를 전송하는 Ajax 요청
//         $.ajax({
//             type: "POST", // HTTP 요청 방식 (POST를 사용하여 데이터 전송)
//             url: "/EMPmodify", // 서버의 요청 URL (서버 측 코드가 필요합니다)
//             data: updatedData, // 보낼 데이터 (FormData 객체를 전달합니다)
//             processData: false, // 필수: 데이터를 query string으로 변환하지 않음
//             contentType: false, // 필수: Content-Type 헤더를 설정하지 않음
//             success: function(response) {
//                 // 요청이 성공적으로 처리되었을 때 실행할 코드
//                 alert("수정이 성공적으로 저장되었습니다.");
//                 // 필요한 추가 작업을 수행할 수 있습니다.
//                 window.location.reload();
//             },
//             error: function(xhr, status, error) {
//                 // 요청이 실패했을 때 실행할 코드
//             	var errorMessage = "수정을 저장하는 동안 오류가 발생했습니다.\n";
//                 errorMessage += "Status: " + status + "\n";
//                 errorMessage += "Error: " + error + "\n";
//                 errorMessage += "Response Text: " + xhr.responseText;
//                 alert(errorMessage);
//                 console.error(errorMessage);
//             }
//         });
//     });
// });
$("#btnBack").click(function(){
	window.location.href="/manage/showEmployee";
})
$("#btnEdit").click(function(){
	window.location.href="/manage/editAccount";
})
</script>
</html>