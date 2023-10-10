<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>editSelf</title>
</head>
<style>
	/*모달 css*/
  .modal {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.7);
  z-index: 1;
}

.modal-content {
  background-color: #fff;
  margin: 3% auto;
  padding: 20px;
  border-radius: 5px;
  width: 40%;
}

.close {
    position: absolute;
    top: 8.5%;
    right: 30%;
    font-size: 27px;
    cursor: pointer;
    color: #6d6d6d;
    font-weight: bold;
}
#exImage {
        max-width: 200px;
        max-height: 200px;
    }
.image,.button{
	text-align:center;
}
/* 로딩중 */
   #link {color: #E45635;display:block;font: 12px "Helvetica Neue", Helvetica, Arial, sans-serif;text-align:center; text-decoration: none;}
#link:hover {color: #CCCCCC}

#link, #link:hover {-webkit-transition: color 0.5s ease-out;-moz-transition: color 0.5s ease-out;-ms-transition: color 0.5s ease-out;-o-transition: color 0.5s ease-out;transition: color 0.5s ease-out;}

/** BEGIN CSS **/
/*         body {background: #333333;} */
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
			background-color: rgba(255, 255, 255, 0.6);
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
async function hashPassword(password) {
    // TextEncoder를 사용하여 비밀번호를 바이트 배열로 변환
    var encoder = new TextEncoder();
    var data = encoder.encode(password);

    try {
        // 비밀번호를 SHA-256으로 해싱
        var hashBuffer = await crypto.subtle.digest("SHA-256", data);

        // 해싱된 비밀번호를 16진수 문자열로 변환
        var hashArray = Array.from(new Uint8Array(hashBuffer));
        var hashHex = hashArray.map(byte => byte.toString(16).padStart(2, "0")).join("");

        // 해싱된 비밀번호 반환
        return hashHex;
    } catch (error) {
        console.error("비밀번호 해싱 오류:", error);
    }
}

$('#email2').on('input', function() {
	  // 입력된 이메일의 첫 부분을 가져와서 @example.com을 추가한 뒤 email1에 설정
	  var email2Value = $(this).val(); // email2 입력란의 값 가져오기
	  var email1Value = email2Value + '@example.com'; // @example.com을 추가한 문자열 생성
	  $('#email1').val(email1Value); // email1 입력란에 값을 설정
	});


$(document).ready(function() {
	  // 전화번호 입력란의 ID를 가져옵니다. 이 예제에서는 phoneNumber입니다.
	  var phoneNumberInput = $('#phoneNumber1');

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

	
$('#btnSubmit').click(async function(event){
	
	event.preventDefault(); // 폼 제출 막기
	
		var password = $('#password1').val();
	  var phoneNumber = $('#phoneNumber1').val();
	  var email = $('#email2').val();
	  var address = $('#address1').val();
	  // 비밀번호가 비어 있는지 확인
	  if (!password || !phoneNumber || !email || !address) {
	    alert("입력란을 모두 입력하세요.");
	    return; // 비밀번호가 비어 있으면 함수를 종료하고 폼 제출을 막습니다.
	  }

	try {
		var hashHex = await hashPassword(password);
		// 해시가 완료되면 폼 제출하기
		document.getElementById("password1").value = hashHex;
		
		
		
		
		document.getElementById("frmEdit").submit();
		$('#loading-container').show();
		alert("수정완료");
		console.log(password);
	} catch (error) {
		console.error("비밀번호 해싱 오류:", error);
	}
})

</script>
</html>