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
    width: 250px;
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
	
            /* 메인 컨테이너 */
        .main {
            max-width: 1450px;
            margin-left: 450px; /* 사이드바 너비만큼 왼쪽 여백 설정 */
         	margin-top:20px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        /* 헤더 스타일 */
        .header {
            text-align: center;
            background-color: #007BFF;
            color: #fff;
            padding: 10px;
        }
        /* 월 네비게이션 스타일 */
        .month-navigation {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 20px 0;
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
         flex-basis: calc(50% - 10px);
         background-color: #f0f0f0;
         padding: 10px;
         margin: 5px;
         text-align: center;
     }

    .attendance-summary div span {
        font-weight: bold;
    }
    .weekly-summary {
        text-align: center;
        margin-top: 20px;
    }


     .weekly-summary h2 {
         background-color: #007BFF;
         color: #fff;
         padding: 10px;
         text-align: center;
     }

      .weekly-summary p {
            background-color: #f0f0f0;
            padding: 10px;
            text-align: center;
        }
        
        body {
  color: #666;
  font: 14px/24px "Open Sans", "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", Sans-Serif;
}
table {
  border-collapse: separate;
  border-spacing: 0;
  width: 100%;
}
th,
td {
  padding: 6px 15px;
}
th {
  background: #42444e;
  color: #fff;
  text-align: left;
}
tr:first-child th:first-child {
  border-top-left-radius: 6px;
}
tr:first-child th:last-child {
  border-top-right-radius: 6px;
}
td {
  border-right: 1px solid #c6c9cc;
  border-bottom: 1px solid #c6c9cc;
}
td:first-child {
  border-left: 1px solid #c6c9cc;
}
tr:nth-child(even) td {
  background: #eaeaed;
}
tr:last-child td:first-child {
  border-bottom-left-radius: 6px;
}
tr:last-child td:last-child {
  border-bottom-right-radius: 6px;
}
/* CSS를 사용하여 텍스트를 가운데 정렬 */
th {
  text-align: center; /* 가운데 정렬 */
}
/* CSS를 사용하여 텍스트를 가운데 정렬하고 호버 및 커서 포인터 스타일 추가 */
th.name-col,
th.department-col,
th.date-col {
  text-align: center; /* 가운데 정렬 */
  cursor: pointer; /* 커서 포인터 스타일 추가 */
}

/* 호버 시 적용할 스타일 */
th.name-col:hover,
th.department-col:hover,
th.date-col:hover {
	background-color: #f0f0f0; /* 밝은 회색 배경색으로 변경 */
  color: white; /* 텍스트 색상을 흰색으로 변경 */
}

#pagination {
    text-align: center;
    margin-top: 20px;
}

#pagination a {
    display: inline-block;
    margin: 0 5px;
    padding: 5px 10px;
    background-color: #fff;
    color: #000;
    text-decoration: none;
    border-radius: 5px;
    border: 1px solid #000;
}

#pagination a:hover {
    background-color: #333;
    color: #fff;
}

/* 버튼 배경색을 초록색(성공)으로 변경 */
.btn-success {
  background-color: var(--bs-teal);
  color: #fff; /* 텍스트 색상 변경 (선택 사항) */
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
      		<button class="btn btn-success m-2" id="btnCheckIn">출근하기</button>
			<button class="btn btn-warning m-2" id="btnCheckOut" disabled>퇴근하기</button>
<!--             <label for="status_select">근무상태 변경:</label> -->
            
<!--    <select id="status_select">
        <option value="업무상태변경" selected disabled hidden>근무상태변경</option>
        <option value="업무">업무</option>
        <option value="업무종료">업무종료</option>
        <option value="외근">외근</option>
        <option value="출장">출장</option>
        <option value="반차">반차</option>
    </select> -->
    
        </section>

        <section id="my_attendance_section">
        <br><br><br><br>
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
	        <span>이번달 누적:</span>
	        <p>X 시간</p>
	    </div>
	    <div>
	        <span>이번달 초과:</span>
	        <p>Y 시간</p>
	    </div>
	    <div>
	        <span>이번달 잔여:</span>
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

        

<table>
  <thead>
    <tr>
      <th class="name-col" onclick="sort('name', currentPage)">부서원</th>
      <th class="department-col" onclick="sort('department', currentPage)">부서명</th>
      <th class="date-col" onclick="sort('date', currentPage)">날짜</th>
      <th>출 근</th>
      <th>퇴 근</th>
      <th>출결상태</th>
      <th>휴 가</th>
    </tr>
  </thead>
  <tbody id="attendanceListBody">
   
  </tbody>

</table>
  <div id="pagination"></div>

    </main>
    
<c:forEach items="${time}" var="item">
    <input type="hidden" id="start_time" value="${item.startTime}">
    <input type="hidden" id="end_time" value="${item.endTime}">
    <input type="hidden" id="date" value="${item.date}">
</c:forEach>

    
</body>
     <script>
        $(document).ready(function () {
            // 1초마다 updateTime 함수를 호출하여 시간 업데이트
            setInterval(updateTime, 1000);
            // 페이지 로드시 초기 시간 업데이트
            updateTime();
        });
        
		 // 페이지 로딩 시 초기 데이터 가져오기
		 $(document).ready(function() {
		     sort('all', currentPage);
		     console.log('문서가 로드되었습니다.');
		 });
	        $(document).ready(function() {
/* 	            // 출근 버튼 클릭 시 실행되는 함수
	            $("#btnCheckIn").click(function() {
	                // 출근 버튼 비활성화
	                $(this).prop("disabled", true);
	                
	                // 퇴근 버튼 활성화
	                $("#btnCheckOut").prop("disabled", false);
	            });

	            // 퇴근 버튼 클릭 시 실행되는 함수
	            $("#btnCheckOut").click(function() {
	                // 출근 버튼 비활성화
	                $("#btnCheckIn").prop("disabled", true);
	                
	                // 퇴근 버튼 비활성화
	                $(this).prop("disabled", true);

	                // 자정에 출근 버튼 초기화
	                resetButtonsAtMidnight();
	            });

	            // 페이지 로드 시 버튼 상태 복원
	            restoreButtonState();

	            // 자정에 버튼 초기화 함수 호출
	            function resetButtonsAtMidnight() {
	                const now = new Date();
	                const midnight = new Date(now);
	                midnight.setHours(24, 0, 0, 0); // 자정 시간으로 설정

	                const timeUntilMidnight = midnight - now;

	                setTimeout(function() {
	                    // 출근 버튼 활성화
	                    $("#btnCheckIn").prop("disabled", false);
	                    
	                    // 퇴근 버튼 비활성화
	                    $("#btnCheckOut").prop("disabled", true);

	                    // 자정 다음 날에도 초기화 함수 호출 (반복)
	                    resetButtonsAtMidnight();
	                }, timeUntilMidnight);
	            }

	            // 로컬 스토리지에서 버튼 상태 복원
	            function restoreButtonState() {
	                const attendanceStatus = localStorage.getItem("attendanceStatus");
	                
	                if (attendanceStatus === "checkedIn") {
	                    // 출근 상태인 경우
	                    // 퇴근 버튼 비활성화
	                    $("#btnCheckOut").prop("disabled", true);
	                } else {
	                    // 기본적으로 출근 버튼 활성화
	                    $("#btnCheckIn").prop("disabled", false);
	                }
	            } */
	        });
		 
		 
	        
	        function month_time() {
	            const userid = $("#userid").val();
	            $.ajax({
	                url: '/month_time',
	                data: { userid: userid }, // 필터 값을 서버로 전송
	                type: 'get',
	                dataType: 'json',
	                success: function(data) {
	                    console.log('주소록 데이터 불러오기', data);
	                    const tableBody = $('#attendanceListBody');
	                    tableBody.empty(); // 기존 데이터를 지웁니다.
	                    // 데이터가 있는 경우 연락처를 추가
	                    for (let i = (page - 1) * perPage; i < page * perPage && i < data.length; i++) {
	                        // 데이터를 테이블에 추가하는 코드를 작성하세요.
	                    }
	                    // 페이지네이션 업데이트
	                    updatePagination(data.length);
	                },
	                error: function(xhr, status, error) {
	                    console.error('주소록 데이터 불러오기 에러:', status, error);
	                    // 에러 처리를 수행할 수 있습니다. 예를 들어, 사용자에게 오류 메시지를 표시하는 등의 작업을 수행할 수 있습니다.
	                }
	            });
	        }
	    	
	    
	        
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
        
        var date = $("#date").val();
   
		 // 페이지 로딩 시 초기 데이터 가져오기
		 $(document).ready(function() {
		     console.log(dateParts[1].replace('.', ''));
		     console.log("date",date);
		 });

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
                        // 출근 버튼 비활성화
                        $("#btnCheckIn").prop("disabled", true);

                        // 퇴근 버튼 활성화
                        $("#btnCheckOut").prop("disabled", false);
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
                        // 출근 버튼 활성화
                        $("#btnCheckIn").prop("disabled", true);

                        // 퇴근 버튼 비활성화
                        $("#btnCheckOut").prop("disabled", true);
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
		 
		 let currentPage = 1; // 현재 페이지 번호
		 const perPage = 10; // 한 페이지당 표시할 데이터 수

		 // 페이지 번호를 클릭할 때 호출되는 함수
		 function changePage(page) {
		     currentPage = page;
		     console.log('changePage 함수 호출: 페이지', currentPage);
		     sort('all',currentPage);
		 }

		 function sort(name, page) {
		     console.log('sort 함수 호출: name', name, 'page', page);
		     $.ajax({
		         url: '/get_attendance',
		         data: { name: name, page: page }, // 필터 값을 서버로 전송
		         type: 'get',
		         dataType: 'json',
		         success: function(data) {
		             console.log('주소록 데이터 불러오기', data);
		             const tableBody = $('#attendanceListBody');
		             tableBody.empty(); // 기존 데이터를 지웁니다.
		                 // 데이터가 있는 경우 연락처를 추가
		                    for (let i = (page - 1) * perPage; i < page * perPage && i < data.length; i++) {
		                     const newRow = $('<tr>');
		                     newRow.append('<td id="att_name" style="width: 70px; text-align: center;">' + data[i]['name'] + '</td>');
		                     newRow.append('<td id="att_departmentname" style="width: 100px; text-align: center;">' + data[i]['departmentname'] + '</td>');
		                     newRow.append('<td id="att_date" style="width: 100px; text-align: center;">' + data[i]['date'] + '</td>');
		                     newRow.append('<td id="att_starttime" style="width: 120px; text-align: center;">' + data[i]['starttime'] + '</td>');
		                     newRow.append('<td id="att_endtime" style="width: 120px; text-align: center;">' + data[i]['endtime'] + '</td>');
		                     newRow.append('<td id="att_attendancestatus" style="width: 150px; text-align: center;">' + data[i]['attendancestatus'] + '</td>');
		                     newRow.append('<td id="att_vacationtype" style="width: 100px; text-align: center;">' + (data[i]['vacationtype'] ? data[i]['vacationtype'] : '') + '</td>');
		                     $('#attendanceListBody').append(newRow);
		             }
		             // 페이지네이션 업데이트
		             updatePagination(data.length);
		         },
		         error: function(xhr, status, error) {
		             console.error('주소록 데이터 불러오기 에러:', status, error);
		             // 에러 처리를 수행할 수 있습니다. 예를 들어, 사용자에게 오류 메시지를 표시하는 등의 작업을 수행할 수 있습니다.
		         }
		     });
		 }
		 
		 function updatePagination(totalPage) {
			    const totalPages = Math.ceil(totalPage / perPage);
			    let paginationHTML = '';

			    for (let i = 1; i <= totalPages; i++) {
			        if (i === currentPage) {
			            paginationHTML += '<span>' + i + '</span>';
			        } else {
			        	paginationHTML += "<a href='#' onclick='changePage(" + i + ")'>" + i + "</a>";
			        }
			    }
			    
			    $("#pagination").html(paginationHTML);
			}
        

        
    </script>
</html>