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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <!-- jQuery 라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	
  .main {
        margin-left: 500px; /* 사이드바 너비만큼 왼쪽 여백 설정 */
        padding: 20px; /* 콘텐츠 패딩 설정 */
    }

    .header {
        text-align: center;
        font-size: 24px;
        margin-bottom: 20px;
    }

    .month-navigation {
        text-align: center;
        margin-bottom: 20px;
    }

    .month-navigation button {
        font-size: 18px;
        background-color: #007bff; /* 버튼 배경색 */
        color: #fff; /* 버튼 텍스트 색상 */
        padding: 5px 10px;
        border: none;
        cursor: pointer;
    }

    .attendance-summary p {
        font-size: 16px;
        margin: 5px 0;
    }
    .attendance-summary {
        display: flex;
        justify-content: space-between; /* 요소들 사이의 공간을 균등하게 배분 */
        text-align: center;
        margin-bottom: 20px;
    }

    .attendance-summary div {
        text-align: center;
    }

    .attendance-summary div span {
        font-weight: bold;
    }
    .weekly-summary {
        text-align: center;
    }

    .weekly-summary h2 {
        font-size: 20px;
        margin-bottom: 10px;
    }

    .weekly-summary p {
        font-size: 16px;
        margin: 5px 0;
    }
    
    
    </style>
<body>
<%@ include file="/WEB-INF/views/P_header.jsp" %>
<input type="hidden" id="user_id" value="${sessionScope.userid}">
    <aside>
			<div class="sidebar">
  <section id="attendance_section">
        <h2><a href="/attendance_management/attendance">근태관리</a></h2>
            <p id="date_info">1</p>
            <p id="time_info"><span id="current_time"></span></p>
            <p>출근시간: <span id="start_time"></span></p>
            <p>퇴근시간: <span id="end_time"></span></p>
            <p>주간 누적 근무시간: <span id="weekly_hours">40</span> 시간</p>
     
            <hr>
      		<button class="btn btn-primary m-2" id="btnCheckIn">출근하기</button>
			<button class="btn btn-secondary m-2" id="btnCheckOut">퇴근하기</button>
            <label for="status_select">근무상태 변경:</label>
            
   <select id="status_select">
        <option value="업무상태변경" selected disabled hidden>근무상태변경</option>
        <option value="업무">업무</option>
        <option value="업무종료">업무종료</option>
        <option value="외근">외근</option>
        <option value="출장">출장</option>
        <option value="반차">반차</option>
    </select>
    
        </section>
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
    
    <main class="main">
        <div class="header">
            <h1>근태 현황</h1>
        </div>

        <div class="month-navigation">
            <button>&lt;</button>
            <span>2023년 9월</span>
            <button>&gt;</button>
        </div>

			<div class="attendance-summary">
	    <div>
	        <span>이번주 누적:</span>
	        <p>X 시간</p>
	    </div>
	    <div>
	        <span>이번주 초과:</span>
	        <p>Y 시간</p>
	    </div>
	    <div>
	        <span>이번주 잔여:</span>
	        <p>Z 시간</p>
	    </div>
	    <div>
	        <span>이번달 누적:</span>
	        <p>A 시간</p>
	    </div>
	    <div>
	        <span>이번달 연장:</span>
	        <p>B 시간</p>
	    </div>
	</div>

        <div class="weekly-summary">
            <h2>1주차</h2>
            <p>1주차 근무 시간: C 시간</p>
            <!-- 다른 주차 정보도 추가하세요 -->
        </div>
    </main>
</body>
     <script>
        $(document).ready(function () {
            // 1초마다 updateTime 함수를 호출하여 시간 업데이트
            setInterval(updateTime, 1000);
            // 페이지 로드시 초기 시간 업데이트
            updateTime();
         // 2023년 12월의 첫 날과 마지막 날을 구합니다.
            const firstDayOfMonth = new Date(2023, 11, 1); // 월은 0부터 시작하므로 12월은 11로 표시합니다.
            const lastDayOfMonth = new Date(2023, 11, 0);

            // 첫 날의 요일과 마지막 날의 날짜를 가져옵니다.
            const firstDayOfWeek = firstDayOfMonth.getDay(); // 0 (일요일)부터 6 (토요일)까지입니다.
            const lastDateOfMonth = lastDayOfMonth.getDate(); // 해당 월의 마지막 날짜를 가져옵니다.

            // 첫 날이 일요일이 아니면 한 주를 더 추가합니다.
            const additionalWeek = firstDayOfWeek !== 0 ? 1 : 0;

            // 2023년 12월의 총 주 수 계산
            const totalWeeksInDecember = Math.ceil((lastDateOfMonth + additionalWeek) / 7);

            console.log("2023년 12월은 총 " + totalWeeksInDecember + " 주 있습니다.");

        });

        // 업무시간 퇴근시간 설정
        const workStartTime = new Date();
        workStartTime.setHours(9, 0, 0);
        const workEndTime = new Date();
        workEndTime.setHours(18, 0, 0);

        // 현재 시간을 가져오기
        var currentTime = new Date();
        var hours = currentTime.getHours();
        var minutes = currentTime.getMinutes();
        var seconds = currentTime.getSeconds();

        // 시간, 분, 초를 두 자리 숫자로 표시
        hours = (hours < 10 ? "0" : "") + hours;
        minutes = (minutes < 10 ? "0" : "") + minutes;
        seconds = (seconds < 10 ? "0" : "") + seconds;

        // 날짜 업데이트
        var options = { weekday: 'long', year: 'numeric', month: '2-digit', day: '2-digit' };
        var dateStr = currentTime.toLocaleDateString('ko-KR', options);
        var dateParts = dateStr.split(' ');

        // 시간 업데이트 함수 정의
        function updateTime() {
            // 현재 시간을 가져오기
            var currentTime = new Date();
            var hours = currentTime.getHours();
            var minutes = currentTime.getMinutes();
            var seconds = currentTime.getSeconds();

            // 시간, 분, 초를 두 자리 숫자로 표시
            hours = (hours < 10 ? "0" : "") + hours;
            minutes = (minutes < 10 ? "0" : "") + minutes;
            seconds = (seconds < 10 ? "0" : "") + seconds;

            // 날짜 업데이트
            var options = { weekday: 'long', year: 'numeric', month: '2-digit', day: '2-digit' };
            var dateStr = currentTime.toLocaleDateString('ko-KR', options);
            var dateParts = dateStr.split(' ');

            // 시간 정보를 HTML 요소에 업데이트
            $("#current_time").text(hours + ":" + minutes + ":" + seconds);

            // 날짜 포맷 변경
            var formattedDate = (dateParts[0] + dateParts[1] + dateParts[2].replace('.', '') + '(' + dateParts[3].slice(0, -2) + ")").replace(/\./g, '-');

            // 변경된 날짜를 HTML 요소에 업데이트
            $("#date_info").text(formattedDate);
        }
        
        $().ready(function () {
            $("#btnCheckIn").click(function () {
                insert_checkIn(); // 출근 함수
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
                        insert_checkOut();
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

        function insert_checkIn() {
            console.log('insert_checkIn 함수 실행 시작');
            var current_date = (dateParts[0] + dateParts[1] + dateParts[2].replace('.', '')).replace(/\./g, '-');
            var currentTime = new Date();
            var hours = currentTime.getHours();
            var minutes = currentTime.getMinutes();
            var seconds = currentTime.getSeconds();
            hours = (hours < 10 ? "0" : "") + hours;
            minutes = (minutes < 10 ? "0" : "") + minutes;
            seconds = (seconds < 10 ? "0" : "") + seconds;

            const userid = $('#user_id').val();
            const date = current_date;
            const startTime = hours + ":" + minutes + ":" + seconds;
            console.log('userid:', userid);

            $('#start_time').text(startTime);

            if (currentTime >= workStartTime && currentTime <= workEndTime) {
                $("#status").val("지각");
            } else {
                $("#status").val("정상출근");
            }

            var AttendanceStatus = $("#status").val();

            if (!userid) {
                console.log('로그인 필요');
                Swal.fire({
                    icon: 'warning',
                    title: '로그인 필요',
                    text: '출근 기록을 저장하려면 먼저 로그인해주세요.',
                });
                return;
            }

            const checkData = {
                userid: userid,
                date: date,
                startTime: startTime
            };

            console.log('checkData:', checkData);

            $.ajax({
                url: "/insert_checkIn",
                data: checkData,
                type: 'post',
                success: function (data) {
                    console.log("보내는data:", data);
                    if (data === '0') {
                        console.error("인서트 실패:", data);
                        Swal.fire({
                            icon: 'error',
                            showConfirmButton: false,
                            position: 'center-center',
                            timer: 3000,
                            timerProgressBar: true,
                            title: '출근 실패',
                            text: '출근 데이터 insert중 오류가 발생했습니다.',
                        });
                    } else {
                        console.log("인서트 성공");
                        Swal.fire({
                            icon: 'success',
                            showConfirmButton: false,
                            position: 'center-center',
                            timer: 3000,
                            timerProgressBar: true,
                            title: '출근이 완료되었습니다.',
                            text: '오늘도 화이팅.',
                        });
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

        function insert_checkOut() {
            const userid = $('#user_id').val();
            var current_date = (dateParts[0] + dateParts[1] + dateParts[2].replace('.', '')).replace(/\./g, '-');
            var currentTime = new Date();
            var hours = currentTime.getHours();
            var minutes = currentTime.getMinutes();
            var seconds = currentTime.getSeconds();
            hours = (hours < 10 ? "0" : "") + hours;
            minutes = (minutes < 10 ? "0" : "") + minutes;
            seconds = (seconds < 10 ? "0" : "") + seconds;
            const endTime = hours + ":" + minutes + ":" + seconds;
            const date = current_date;
            $('#end_time').text(endTime);

            const checkData = {
                userid: userid,
                date: date,
                endTime: endTime,
            };

            if (!userid) {
                console.log('로그인 필요');
                Swal.fire({
                    icon: 'warning',
                    title: '로그인 필요',
                    text: '출근 기록을 저장하려면 먼저 로그인해주세요.',
                });
                return;
            }
            console.log('checkData:', checkData);

            $.ajax({
                url: "/insert_checkOut",
                data: checkData,
                type: 'post',
                success: function (data) {
                    console.log('Ajax 요청 성공');
                    if (data === '0') {
                        console.error("인서트 실패:", data);
                        Swal.fire({
                            icon: 'error',
                            title: '퇴근 실패',
                            text: '퇴근 데이터 insert중 오류가 발생했습니다.',
                        });
                    } else {
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
                },
                error: function (xhr, status, error) {
                    console.error("Ajax 요청 실패:", error);
                    Swal.fire({
                        icon: 'error',
                        title: '퇴근 실패',
                        text: '퇴근 데이터 insert중 오류가 발생했습니다',
                    });
                }
            });
        }
        

        
    </script>
</html>