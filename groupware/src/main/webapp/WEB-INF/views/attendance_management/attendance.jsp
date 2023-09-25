<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
         href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
         rel="stylesheet"
         integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
         crossorigin="anonymous"
      />
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
        /* 사이드바 스타일 */
.sidebar {
	margin-left: 185px;
    height: 100%;
    width: 300px;
    position: fixed;
    top: 0;
    left: 0;
    background-color: white;
    padding-top: 20px;
    border-right: 1px solid gray; /* 오른쪽 부분에만 테두리 적용 */
}

      /* 사이드바 링크 스타일 */
      .sidebar a {
          padding: 15px;
          text-decoration: none; /* 링크 밑줄 제거 */
          color: black; /* 글자색 설정 */
          display: block; /* 블록 요소로 표시하여 세로로 배치 */
      }

      /* 사이드바 링크 호버 스타일 */
.sidebar a:hover {
    background-color: #ccc; /* 연한 회색 배경으로 변경 */
}

    #current_time {
      font-size: 50px; /* 원하는 크기로 조정하세요 */
    }
    
    #date_info {
    	font-size:20px;
    }
    .swal-toast {
	  width: 500px; /* 토스트 창의 너비를 조절합니다. */
	  height: 100px; /* 토스트 창의 높이를 조절합니다. */
	}
    
    </style>
<body>
<%@ include file="/WEB-INF/views/P_header.jsp" %>
<input type="hidden" id="user_id" value="${sessionScope.userid}">
    <aside>
			<div class="sidebar">
  <section id="attendance_section">
            <h2>근태관리</h2>
            <p id="date_info">1</p>
            <p id="time_info"><span id="current_time"></span></p>
            <p>출근시간: <span id="start_time">09:00:00</span></p>
            <p>퇴근시간: <span id="end_time">18:00:00</span></p>
            <p>주간 누적 근무시간: <span id="weekly_hours">40</span> 시간</p>
     
            <hr>
      		<button class="btn btn-primary m-2" id="btnCheckIn">출근하기</button>
			<button class="btn btn-secondary m-2" id="btnCheckOut">퇴근하기</button>
            <label for="status_select">근무상태 변경:</label>
            
            <select id="status_select">
                <option value="출근">출근</option>
                <option value="휴게">휴게</option>
                <option value="퇴근">퇴근</option>
            </select>
        </section>
        ㅜ
		<button class="btn btn-success m-2" id="">Prompt 실행</button>
		<button class="btn btn-danger m-2" id="toastStart">Toast 실행</button>
		<button class="btn btn-warning m-2" id="ajaxStart">Ajax 실행 (깃헙 아이디 검색)</button>

        내 근태관리
        <section id="my_attendance_section">
            <h2>내 근태관리</h2>
            <ul>
                <li><a href="#">내 근태현황</a></li>
                <li><a href="#">내 연차 내역</a></li>
                <li><a href="#">내 인사정보</a></li>
            </ul>
        </section>
       </div>
    </aside>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
  $(document).ready(function () {

	});

//시간 업데이트 함수 정의
  function updateTime() {
      // 현재 시간을 가져오기
      var currentTime = new Date();
      var hours = currentTime.getHours(); // 현재 시간의 시간 부분을 가져옵니다.
      var minutes = currentTime.getMinutes(); // 현재 시간의 분 부분을 가져옵니다.
      var seconds = currentTime.getSeconds(); // 현재 시간의 초 부분을 가져옵니다.

      // 시간, 분, 초를 두 자리 숫자로 표시합니다.
      hours = (hours < 10 ? "0" : "") + hours; // 시간을 두 자리 숫자로 변환합니다.
      minutes = (minutes < 10 ? "0" : "") + minutes; // 분을 두 자리 숫자로 변환합니다.
      seconds = (seconds < 10 ? "0" : "") + seconds; // 초를 두 자리 숫자로 변환합니다.

      // 시간 정보를 JQuery를 사용하여 HTML 요소에 업데이트합니다.
      $("#current_time").text(hours + ":" + minutes + ":" + seconds); // 시간을 HTML 요소에 업데이트합니다.

      // 날짜 업데이트
      var options = { weekday: 'long', year: 'numeric', month: '2-digit', day: '2-digit' };
      var dateStr = currentTime.toLocaleDateString('ko-KR', options); // 현재 날짜를 원하는 형식으로 문자열로 변환합니다.

      // 날짜 포맷을 변경합니다.
      var dateParts = dateStr.split(' '); // 공백을 기준으로 문자열을 분리합니다.
      var formattedDate = dateParts[0] + dateParts[1] + dateParts[2].replace('.', '')  + '(' + dateParts[3].slice(0, -2) + ")"; // 요일, 년월일, 월을 조합하여 새로운 포맷으로 만듭니다.
      
      // 변경된 날짜를 HTML 요소에 업데이트합니다.
      $("#date_info").text(formattedDate); // 날짜를 HTML 요소에 업데이트합니다.
  }

  // 1초마다 updateTime 함수를 호출하여 시간 업데이트합니다.
  setInterval(updateTime, 1000); // 1초마다 updateTime 함수를 호출하여 시간을 업데이트합니다.

  // 페이지 로드시 초기 시간 업데이트
  updateTime(); // 페이지가 로드될 때 초기 시간을 업데이트합니다.
  
  function insert_checkIn() {
	    console.log('insert_checkIn 함수 실행 시작');
	    
	    // 날짜 업데이트
	    // 현재 시간을 가져오기
	    var currentTime = new Date();

	    // 날짜 업데이트
	    var options = { weekday: 'long', year: 'numeric', month: '2-digit', day: '2-digit' };
	    var dateStr = currentTime.toLocaleDateString('ko-KR', options); // 현재 날짜를 원하는 형식으로 문자열로 변환합니다.

	    // 날짜 포맷을 변경합니다.
	    var dateParts = dateStr.split(' '); // 공백을 기준으로 문자열을 분리합니다.
	    var current_date = (dateParts[0] + dateParts[1] + dateParts[2].replace('.', '')).replace(/\./g, '-'); // 요일, 년월일, 월을 조합하여 새로운 포맷으로 만듭니다.
	    console.log('current_date:', current_date);

	    // 현재 시간을 가져오기
	    var currentTime = new Date();
	    var hours = currentTime.getHours(); // 현재 시간의 시간 부분을 가져옵니다.
	    var minutes = currentTime.getMinutes(); // 현재 시간의 분 부분을 가져옵니다.
	    var seconds = currentTime.getSeconds(); // 현재 시간의 초 부분을 가져옵니다.

	    // 시간, 분, 초를 두 자리 숫자로 표시합니다.
	    hours = (hours < 10 ? "0" : "") + hours; // 시간을 두 자리 숫자로 변환합니다.
	    minutes = (minutes < 10 ? "0" : "") + minutes; // 분을 두 자리 숫자로 변환합니다.
	    seconds = (seconds < 10 ? "0" : "") + seconds; // 초를 두 자리 숫자로 변환합니다.
	    console.log('hours:', hours, 'minutes:', minutes, 'seconds:', seconds);

	    const userid = $('#user_id').val();
	    const date = current_date;
	    const startTime = hours + ":" + minutes + ":" + seconds;
	    
	    console.log('userid:', userid);
	    
	    if (!userid) {
	        console.log('로그인 필요');
	        Swal.fire({
	            icon: 'warning',
	            title: '로그인 필요',
	            text: '출근 기록을 저장하려면 먼저 로그인해주세요.',
	        });
	        return; // 함수 종료
	    }
	    
	    const checkData = {
	        userid: userid,
	        date: date,
	        startTime: startTime,
	    };
	    
	    console.log('checkData:', checkData);
	    
	    $.ajax({
	        url: "/insert_checkIn",
	        data: checkData,
	        type: 'post',
	        success: function (data) {
	            console.log('Ajax 요청 성공');
	            if (data === '0') {
	                console.error("인서트 실패:", data);
	                Swal.fire({
	                    icon: 'error',
	                    title: '출근 실패',
	                    text: '출근 데이터 insert중 오류가 발생했습니다.',
	                });
	            } else {
	                console.log("삭제 성공");
	            }
	        },
	        error: function (xhr, status, error) {
	            console.error("Ajax 요청 실패:", error);
	            Swal.fire({
	                icon: 'error',
	                title: '출근 실패',
	                text: '출근 데이터 insert중 오류가 발생했습니다',
	            });
	        }
	    });
	    console.log('insert_checkIn 함수 실행 종료');
	}
  
  $().ready(function () {
	  
	  $("#btnCheckIn").click(function () {
		  insert_checkIn();
	    Swal.fire({
	      icon: 'success',
	      showConfirmButton: false,
	      position: 'center-center',
	      timer: 3000,
	      timerProgressBar: true,
	      title: '출근이 완료되었습니다.',
	      text: '오늘도 화이팅.',
	    });
	  });
	  

	  
	  $("#btnCheckOut").click(function () {
		    Swal.fire({
		        title: '지금 퇴근하실껀가요?',
		        icon: 'question',
		        showCancelButton: true,
		        confirmButtonColor: '#3085d6',
		        cancelButtonColor: '#d33',
		        confirmButtonText: '승인',
		        cancelButtonText: '취소',
		        reverseButtons: false, // 버튼 순서 거꾸로
		    }).then((result) => {
		        if (result.isConfirmed) {
				    Swal.fire({
				        icon: 'success',
				        showConfirmButton: false,
				        position: 'center-center',
				        timer: 3000,
				        timerProgressBar: true,
				        title: '퇴근이 완료되었습니다.',
				        text: '좋은 하루 보내세요',
				    });
		        }
		    });
		});
	  
	  $("#promptStart").click(function () {
	    
	    (async () => {
	        const { value: getName } = await Swal.fire({
	            title: '당신의 이름을 입력하세요.',
	            text: '그냥 예시일 뿐이니 정보유출 같은건 없습니다.',
	            input: 'text',
	            inputPlaceholder: '이름을 입력..'
	        })

	        // 이후 처리되는 내용.
	        if (getName) {
	            Swal.fire(`: ${getName}`)
	        }
	    })()
	  });
	  
	  
	  $("#toastStart").click(function () {
	    const Toast = Swal.mixin({
	      toast: true,
	      position: 'center-center',
	      showConfirmButton: false,
	      timer: 3000,
	      timerProgressBar: true,
	      didOpen: (toast) => {
	        toast.addEventListener('mouseenter', Swal.stopTimer)
	        toast.addEventListener('mouseleave', Swal.resumeTimer)
	      }
	    })

	    Toast.fire({
	      icon: 'success',
	      title: '정상적으로 출근이 완료되었습니다'
	    })
	  });
	  
	  
	  $("#ajaxStart").click(function () { 
	    Swal.fire({
	      title: 'Submit your Github username',
	      input: 'text',
	      inputAttributes: {
	        autocapitalize: 'off'
	      },
	      showCancelButton: true,
	      confirmButtonText: 'Look up',
	      showLoaderOnConfirm: true,
	      preConfirm: (login) => {
	        return fetch(`//api.github.com/users/${login}`)
	          .then(response => {
	            if (!response.ok) {
	              throw new Error(response.statusText)
	            }
	            return response.json()
	          })
	          .catch(error => {
	            Swal.showValidationMessage(
	              `Request failed: ${error}`
	            )
	          })
	      },
	      allowOutsideClick: () => !Swal.isLoading()
	    }).then((result) => {
	      if (result.isConfirmed) {
	        Swal.fire({
	          title: `${result.value.login}'s avatar`,
	          imageUrl: result.value.avatar_url
	        })
	      }
	    })
	  });
	  
	});
  </script>
</html>