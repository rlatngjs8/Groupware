<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 정보</title>
</head>
<style>
  /* 전체 페이지 스타일 */
  html {
    font-family: Arial, sans-serif;
/*     background-color: #f7f7f7; */
  }

  #section {
  	width:60%;
    margin-left: 15%;
    padding: 20px;
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 5px;
  }
  .checkPassword{
/*   	height:500px; */
		
  	margin-left:36%;
  	margin-top:22%;
  	margin-bottom:22%;
  }

  /* 프로필 이미지 스타일 */
  #image {
    text-align: center;
    margin-bottom: 20px;
  }

  #exProfileIMG {
    max-width: 200px;
    height: auto;
  }

  /* 테이블 스타일 */
  table {
    width: 50%;
    border-collapse: collapse;
    margin-left: 27%;
  }

  td {
    padding: 8px;
    border-bottom: 1px solid #ccc;
  }

  .tdclass {
    font-weight: bold;
  }

  /* 경고 스타일 */
  .warning {
    font-size: 12px;
    color: #ff0000;
  }
   #password {
    padding: 8px;
    width: 40%;
    margin-bottom: 10px;
  }

  #check {
    padding: 8px 20px;
    background-color: rgb(106, 176, 173);
    color: #fff;
    font-size: 15px;
    font-weight: bold;
    border: none;
    cursor: pointer;
    margin-left: 6%;
    border-radius: 5%;
    width: 30%;
    height: 40px;
  }

  #check:hover {
    background-color: #0056b3;
  }
  hr{
  width:43%;
  margin-left:0%;
  }

  
</style>
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
<script src='https://code.jquery.com/jquery-Latest.js'></script>
<script>
var userid=$('#userid').val();

$(document).on('click','#check',function(){
	event.preventDefault();
    var password = $('#password').val();
    
    if(password == ''){
    	alert('비밀번호를 입력해주세요');
    	return false;
    }
    
    // 비밀번호 해싱 및 비밀번호 체크
    hashPassword(password)
        .then(function(hashedPassword) {
            $.ajax({
                url: '/checkPassword',
                type: 'post',
                data: {
                    userid: userid,
                    password: hashedPassword // 해싱된 비밀번호 전달
// 										password: $('#password').val()
                },
                success: function(data) {
                    if (data == 'success') {
                        console.log("로그인정보=" + data);
                        $('#info').show();
                        $('#checkPassword').hide();
                    } else {
                        console.error("로그인실패", data);
                        alert("비밀번호를 확인해주세요");
                    }
                },
                error: function(xhr, status, error) {
                    console.error('로그인실패', error);
                }
            });
        })
        .catch(function(error) {
            console.error('비밀번호 해싱 오류', error);
        });
});

// -----로그인 비밀번호 암호화로 체크함수
	async function hashPassword(password) {
    var encoder = new TextEncoder();
    var data = encoder.encode(password);
    var hashBuffer = await crypto.subtle.digest("SHA-256", data);
    var hashArray = Array.from(new Uint8Array(hashBuffer));
    var hashHex = hashArray.map(byte => byte.toString(16).padStart(2, "0")).join("");
    return hashHex; // 해싱된 비밀번호 반환
}

	$(document).on('click', '#editModal', function () {
		  $('#editSelf').show();
		});

		$(document).on('click', '#closeModal', function () {
		  $('#editSelf').hide();
		});

</script>
</html>