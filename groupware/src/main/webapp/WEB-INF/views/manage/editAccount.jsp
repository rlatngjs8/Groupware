<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원정보 수정</title>
</head>
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
    .container {
        background-color: #fff;
        border-radius: 5px;
        margin: 20px auto;
        padding: 20px;
        width: 70%;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    #exImage {
        max-width: 200px;
        max-height: 200px;
    }
     table {
        width: 100%;
        border-collapse: collapse;
    }

    .lblclass {
        font-weight: bold;
        width: 12%;
    }

    td {
        padding: 10px;
        text-align: left;
    }
    
   /* 로딩중 */
   #link {color: #E45635;display:block;font: 12px "Helvetica Neue", Helvetica, Arial, sans-serif;text-align:center; text-decoration: none;}
#link:hover {color: #CCCCCC}

#link, #link:hover {-webkit-transition: color 0.5s ease-out;-moz-transition: color 0.5s ease-out;-ms-transition: color 0.5s ease-out;-o-transition: color 0.5s ease-out;transition: color 0.5s ease-out;}

/** BEGIN CSS **/
        body {background: #333333;}
        @keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @-moz-keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @-webkit-keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @-o-keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @-moz-keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @-webkit-keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @-o-keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @keyframes loading-text-opacity {
            0%  {opacity: 0}
            20% {opacity: 0}
            50% {opacity: 1}
            100%{opacity: 0}
        }

        @-moz-keyframes loading-text-opacity {
            0%  {opacity: 0}
            20% {opacity: 0}
            50% {opacity: 1}
            100%{opacity: 0}
        }

        @-webkit-keyframes loading-text-opacity {
            0%  {opacity: 0}
            20% {opacity: 0}
            50% {opacity: 1}
            100%{opacity: 0}
        }

        @-o-keyframes loading-text-opacity {
            0%  {opacity: 0}
            20% {opacity: 0}
            50% {opacity: 1}
            100%{opacity: 0}
        }
        .loading-container,
        .loading {
/*         	display:none; */
            height: 200px;
            position: relative;
            width: 200px;
            border-radius: 100%;
            margin: 40px auto;
        	margin-top: -30%;
        	background-color: #fff;
        }


/*         .loading-container {  */
        	
/*         	 } */

        .loading {
            border: 3px solid transparent;
            border-color: transparent #333 transparent #333;
            -moz-animation: rotate-loading 1.5s linear 0s infinite normal;
            -moz-transform-origin: 50% 50%;
            -o-animation: rotate-loading 1.5s linear 0s infinite normal;
            -o-transform-origin: 50% 50%;
            -webkit-animation: rotate-loading 1.5s linear 0s infinite normal;
            -webkit-transform-origin: 50% 50%;
            animation: rotate-loading 2.5s linear 0s infinite normal;
            transform-origin: 50% 50%;
        }

        .loading-container:hover .loading {
            border-color: transparent #E45635 transparent #E45635;
        }
        .loading-container:hover .loading,
        .loading-container .loading {
            -webkit-transition: all 0.5s ease-in-out;
            -moz-transition: all 0.5s ease-in-out;
            -ms-transition: all 0.5s ease-in-out;
            -o-transition: all 0.5s ease-in-out;
            transition: all 0.3s ease-in-out;
        }

        #loading-text {
            -moz-animation: loading-text-opacity 2s linear 0s infinite normal;
            -o-animation: loading-text-opacity 2s linear 0s infinite normal;
            -webkit-animation: loading-text-opacity 2s linear 0s infinite normal;
            animation: loading-text-opacity 2s linear 0s infinite normal;
            color: #333;
            font-family: "Helvetica Neue, "Helvetica", ""arial";
            font-size: 20px;
            font-weight: bold;
            margin-top: 48%;
    		margin-left: 26%;
            opacity: 0;
            position: absolute;
            text-align: center;
            text-transform: uppercase;
            top: 0;
            width: 100px;
        }
      /* 로딩중 */
</style>
<body>
<%@ include file="manage_header.jsp" %>
<h3>직원통합관리 > 직원상세 > 직원수정</h3>
<div class="container">
	<form id="frmEdit" action="/editEMP" method="post" enctype="multipart/form-data">
<%-- 		<c:forEach items="${Elist}" var="emp"> --%>
		<input type="hidden" id="userid" name="userid" value="${emp.userid}">
		<!-- 이미지 -->
		<div class="image">
			<label>
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
</div>
<!-- 로딩중 -->
<div class="loading-container" id="loading-container" style="display:none;">
    <div class="loading"></div>
    <div id="loading-text">loading</div>
</div>
<!-- 로딩중 -->
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
// 전화번호 입력란의 ID를 가져옵니다. 이 예제에서는 editPhoneNumberInput입니다.
var phoneNumberInput = $('#phoneNumber');

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


$(document).ready(function() {
    // 월 급여 입력 필드를 가져옵니다.
    var salaryInput = $("#salary");

    // 입력이 변경될 때마다 이벤트를 실행합니다.
    salaryInput.on("input", function() {
        // 입력된 급여 값을 가져옵니다.
        var salaryValue = salaryInput.val();

        // 숫자가 아닌 문자를 제거하고, 천 단위로 쉼표를 추가합니다.
        salaryValue = salaryValue.replace(/\D/g, "");
        salaryValue = salaryValue.replace(/\B(?=(\d{3})+(?!\d))/g, ",");

        // 변경된 값을 다시 입력 필드에 설정합니다.
        salaryInput.val(salaryValue);
    });
});

//파일 업로드 필드의 값이 변경되었을 때 미리보기 이미지 업데이트
$('#profileIMG').change(function() {
  var input = this;
  var reader = new FileReader();

  reader.onload = function(e) {
    $('#exImage').attr('src', e.target.result);
//     $('#exImage').show(); // 이미지를 보이도록 설정
  };

  reader.readAsDataURL(input.files[0]);
});



$(document).ready(function() {
$('#btnBack').click(function(){
	window.history.back();
})
$('#btnSubmit').click(function(){
// 	$('#frmEdit').submit();
	$('#loading-container').show();
	alert("수정완료");
// 	var userid = $('#userid').val();
// 	window.location.href="account?userid="+userid;
})
});

</script>
</html>