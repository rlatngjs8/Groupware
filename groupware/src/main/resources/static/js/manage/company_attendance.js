$(document).ready(function() {

	let totalFormattedTime;
	let remainingFormattedTime;
	let accumulatedFormattedTime;

	$(document).ready(function() {
		// 1초마다 updateTime 함수를 호출하여 시간 업데이트
		setInterval(updateTime, 1000);
		// 페이지 로드시 초기 시간 업데이트
		updateTime();
		console.log("안녕", $("#user_name").val());
	});

	$(document).ready(function() {
		var currentMonth = new Date().getMonth() + 1; // 현재 월 (1월은 0, 12월은 11)
		var currentYear = new Date().getFullYear(); // 현재 년도

		// 월 레이블 업데이트 함수
		function updateMonthLabel(year, month) {
			// 월을 두 자리 숫자로 표시하도록 수정
			var formattedMonth = month.toLocaleString('en-US', { minimumIntegerDigits: 2, useGrouping: false });
			$("#current_month").text(year + "년 " + formattedMonth + "월");
		}

		// 이전 달로 이동하는 함수
		function goToPreviousMonth() {
			if (currentMonth === 1) {
				currentMonth = 12;
				currentYear--;
			} else {
				currentMonth--;
			}
			updateMonthLabel(currentYear, currentMonth);
			sort('all', currentPage);
		}

		// 다음 달로 이동하는 함수
		function goToNextMonth() {
			if (currentMonth === 12) {
				currentMonth = 1;
				currentYear++;
			} else {
				currentMonth++;
			}
			updateMonthLabel(currentYear, currentMonth);
			sort('all', currentPage);
		}

		// 이전 달 버튼 클릭 이벤트
		$("#prevMonthButton").click(goToPreviousMonth);

		// 다음 달 버튼 클릭 이벤트
		$("#nextMonthButton").click(goToNextMonth);

		// 초기 월 레이블 설정
		updateMonthLabel(currentYear, currentMonth);
	});



	$(document).ready(function() {
		sort('all', currentPage);
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

	$().ready(function() {
		$("#btnCheckIn").click(function() {
			insert_checkIn(); // 출근 함수
		});

		$("#btnCheckOut").click(function() {
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
			success: function(data) {
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
			error: function(xhr, status, error) {
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
			success: function(data) {
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
			error: function(xhr, status, error) {
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
	const perPage = 15; // 한 페이지당 표시할 데이터 수

	// 페이지 번호를 클릭할 때 호출되는 함수
	function changePage(page) {
		currentPage = page;
		console.log('changePage 함수 호출: 페이지', currentPage);
		sort('all', currentPage);
	}
	/* 		// 월 보내서 월단위로 체크하기 .
			 function sort(name, page) {
					 console.log('sort 함수 호출: name', name, 'page', page);
					 // <span> 요소의 텍스트 가져오기
					 var fullText = $('#current_month').text();
					 let totalFormattedTime;
					 let remainingFormattedTime;
					 // 문자열에서 숫자 추출하기 (정규식 사용)
					 var matches = fullText.match(/\d+/g);
				 console.log(matches)
					 var month = matches[1];
				 var year = matches[0];
				 const userid = $("#user_id").val()
				 let totalSeconds = 0; // 누적 시간을 초로 저장하는 변수
					 // 콘솔에 출력
					 console.log("이번년", year); // 출력 결과: 이번달 10
					 console.log("userid:", userid)
					 $.ajax({
							 url: '/get_manage_attendance',
							 data: { name: name, page: page, month: month, year: year, userid: userid}, // 필터 값을 서버로 전송
							 type: 'get',
							 dataType: 'json',
							 success: function(data) {
									 console.log('주소록 데이터 불러오기', data);
									 const tableBody = $('#attendanceListBody');
									 tableBody.empty(); // 기존 데이터를 지웁니다.
									 //let totalSeconds = 0; // 누적 시간을 초로 저장하는 변수
									 $("#accumulated_month").text(month + "월 누적")
									 $("#remaining_month").text(month + "월 잔여")
	
						// 이름별로 초 값을 배열로 저장할 객체 생성
						const nameTotalTimes = {};
						
						// 데이터 반복 처리
						data.forEach(item => {
								const name = item['name'];
								const startTimeString = item['starttime'];
								const endTimeString = item['endtime'];
						
								const startTimeArray = startTimeString.split(':');
								const endTimeArray = endTimeString.split(':');
						
								const startHour = parseInt(startTimeArray[0], 10);
								const startMinute = parseInt(startTimeArray[1], 10);
								const startSecond = parseInt(startTimeArray[2], 10);
								const endHour = parseInt(endTimeArray[0], 10);
								const endMinute = parseInt(endTimeArray[1], 10);
								const endSecond = parseInt(endTimeArray[2], 10);
						
								const startTimeInSeconds = startHour * 3600 + startMinute * 60 + startSecond;
								const endTimeInSeconds = endHour * 3600 + endMinute * 60 + endSecond;
						
								const diffInSeconds = endTimeInSeconds - startTimeInSeconds;
						
								// 이름별로 초 값을 배열에 저장
								if (name in nameTotalTimes) {
										nameTotalTimes[name].push(diffInSeconds);
								} else {
										nameTotalTimes[name] = [diffInSeconds];
								}
						});
						
						// 각 이름별로 계산된 시간 출력
						Object.keys(nameTotalTimes).forEach(name => {
								const totalSeconds = nameTotalTimes[name].reduce((acc, curr) => acc + curr, 0);
								const accumulatedHours = Math.floor(totalSeconds / 3600);
								const remainingSeconds = totalSeconds % 3600;
								const accumulatedMinutes = Math.floor(remainingSeconds / 60);
								const accumulatedSeconds = remainingSeconds % 60;
						
								const totalFormattedTime =
										('00' + accumulatedHours).slice(-2) + ':' +
										('00' + accumulatedMinutes).slice(-2) + ':' +
										('00' + accumulatedSeconds).slice(-2);
						
								console.log('이름: ' + name + ', 누적 시간: ' + totalFormattedTime);
							  
											const workingDays = calculateWorkingDays(year, month);
								const hoursPerDay = 8;
								const totalWorkingHours = workingDays * hoursPerDay;
							  
									// 현재까지의 누적 근무시간 (예: 초로 변환된 시간)
									var accumulatedTimeText = totalFormattedTime //$("#accumulated_time").text();
									const accumulatedTimeArray = accumulatedTimeText.split(':'); // 예상 포맷: 'xx:xx:xx'
									const accumulatedHoursss = parseInt(accumulatedTimeArray[0], 10);
									const accumulatedMinutesss = parseInt(accumulatedTimeArray[1], 10);
									const accumulatedSecondsss = parseInt(accumulatedTimeArray[2], 10);
			 
									// 누적 시간을 초로 변환
									const accumulatedTimeInSeconds = accumulatedHoursss * 3600 + accumulatedMinutesss * 60 + accumulatedSecondsss;
	
									// 남은 시간 계산
									const remainingSecondss = totalWorkingHours * 3600 - accumulatedTimeInSeconds;
									const remainingFormattedHours = Math.floor(remainingSecondss / 3600);
									const remainingFormattedMinutes = Math.floor((remainingSecondss % 3600) / 60);
									const remainingFormattedSeconds = remainingSecondss % 60;
							  
									const remainingFormattedTime = (remainingFormattedHours < 10 ? '0' : '') + remainingFormattedHours + ':' +
											(remainingFormattedMinutes < 10 ? '0' : '') + remainingFormattedMinutes + ':' +
											(remainingFormattedSeconds < 10 ? '0' : '') + remainingFormattedSeconds;
			 
									$('#remaining_time').text(remainingFormattedTime); 
									console.log("이거이거이거이거" ,remainingFormattedTime);
						});
	
	
									 
									 if (data.length === 0) {
											 const noDataMessage = $('<tr>');
											 noDataMessage.append('<td colspan="7" style="text-align: center;">출근 데이터가 없습니다</td>');
											 tableBody.append(noDataMessage);
									 } else {
											 for (let i = (page - 1) * perPage; i < page * perPage && i < data.length; i++) {
													 const newRow = $('<tr>');
													 newRow.append('<td id="att_name" style="width: 70px; text-align: center;">' + data[i]['name'] + '</td>');
													 newRow.append('<td id="att_departmentname" style="width: 100px; text-align: center;">' + data[i]['departmentname'] + '</td>');
													 newRow.append('<td id="att_starttime" style="width: 120px; text-align: center;">' + totalFormattedTime + '</td>');
													 newRow.append('<td id="att_endtime" style="width: 120px; text-align: center;">' + remainingFormattedTime + '</td>');
													 $('#attendanceListBody').append(newRow);
											 }
									 }
									 // 페이지네이션 업데이트
									 updatePagination(data.length);
							 },
							 error: function(xhr, status, error) {
									 console.error('주소록 데이터 불러오기 에러:', status, error);
									 // 에러 처리를 수행할 수 있습니다. 예를 들어, 사용자에게 오류 메시지를 표시하는 등의 작업을 수행할 수 있습니다.
							 }
					 });
			 } */

	// 데이터 처리 함수
	function processData(data) {
		const nameTotalTimes = {};

		data.forEach(item => {
			const name = item['name'];
			const departmentname = item['departmentname']; // 추가된 부분
			const startTimeString = item['starttime'];
			const endTimeString = item['endtime'];
			console.log(departmentname);
			console.log(name);


			const startTimeArray = startTimeString.split(':');
			const endTimeArray = endTimeString.split(':');

			const startHour = parseInt(startTimeArray[0], 10);
			const startMinute = parseInt(startTimeArray[1], 10);
			const startSecond = parseInt(startTimeArray[2], 10);
			const endHour = parseInt(endTimeArray[0], 10);
			const endMinute = parseInt(endTimeArray[1], 10);
			const endSecond = parseInt(endTimeArray[2], 10);

			const startTimeInSeconds = startHour * 3600 + startMinute * 60 + startSecond;
			const endTimeInSeconds = endHour * 3600 + endMinute * 60 + endSecond;

			const diffInSeconds = endTimeInSeconds - startTimeInSeconds;

			if (name in nameTotalTimes) {
				nameTotalTimes[name].push({
					duration: diffInSeconds,
					departmentname: departmentname // departmentname 추가
				});
			} else {
				nameTotalTimes[name] = [{
					duration: diffInSeconds,
					departmentname: departmentname // departmentname 추가
				}];
			}
		});

		console.log("배열 확인용", nameTotalTimes); // nameTotalTimes 배열 확인용 로그
		return nameTotalTimes;
	}

	// 화면 출력 함수
	function displayData(data) {
		const tableBody = $('#attendanceListBody');
		tableBody.empty();
		console.log("받은 데이터 =", data);

		if (Object.keys(data).length === 0) {
			const noDataMessage = $('<tr>');
			noDataMessage.append('<td colspan="7" style="text-align: center;">출근 데이터가 없습니다</td>');
			tableBody.append(noDataMessage);
		} else {
			// 데이터 출력 로직
			const fullText = $('#current_month').text();
			const matches = fullText.match(/\d+/g);
			const month = matches[1];
			const year = matches[0];
			const workingDays = calculateWorkingDays(year, month);
			const hoursPerDay = 8;
			const totalWorkingHours = workingDays * hoursPerDay;

			Object.keys(data).forEach(name => {
				const totalSeconds = data[name].reduce((acc, curr) => acc + curr.duration, 0);
				const accumulatedHours = Math.floor(totalSeconds / 3600);
				const remainingSeconds = totalSeconds % 3600;
				const accumulatedMinutes = Math.floor(remainingSeconds / 60);
				const accumulatedSeconds = remainingSeconds % 60;

				const totalFormattedTime =
					('00' + accumulatedHours).slice(-2) + ':' +
					('00' + accumulatedMinutes).slice(-2) + ':' +
					('00' + accumulatedSeconds).slice(-2);

				const departmentname = data[name][0].departmentname; // 첫 번째 객체의 departmentname 가져오기

				// 현재까지의 누적 근무시간 (예: 초로 변환된 시간)
				var accumulatedTimeText = totalFormattedTime
				const accumulatedTimeArray = accumulatedTimeText.split(':'); // 예상 포맷: 'xx:xx:xx'
				const accumulatedHoursss = parseInt(accumulatedTimeArray[0], 10);
				const accumulatedMinutesss = parseInt(accumulatedTimeArray[1], 10);
				const accumulatedSecondsss = parseInt(accumulatedTimeArray[2], 10);

				// 누적 시간을 초로 변환
				const accumulatedTimeInSeconds = accumulatedHoursss * 3600 + accumulatedMinutesss * 60 + accumulatedSecondsss;

				// 남은 시간 계산
				const remainingSecondser = totalWorkingHours * 3600 - accumulatedTimeInSeconds;
				const remainingFormattedHours = Math.floor(remainingSecondser / 3600);
				const remainingFormattedMinutes = Math.floor((remainingSecondser % 3600) / 60);
				const remainingFormattedSeconds = remainingSecondser % 60;

				const remainingFormattedTime = (remainingFormattedHours < 10 ? '0' : '') + remainingFormattedHours + ':' +
					(remainingFormattedMinutes < 10 ? '0' : '') + remainingFormattedMinutes + ':' +
					(remainingFormattedSeconds < 10 ? '0' : '') + remainingFormattedSeconds;

				// 데이터 행 추가
				const newRow = $('<tr>');
				newRow.append('<td id="att_name" style="width: 70px; text-align: center;">' + name + '</td>');
				newRow.append('<td id="att_departmentname" style="width: 100px; text-align: center;">' + departmentname + '</td>');
				newRow.append('<td id="accumulated_working_hours" style="width: 120px; text-align: center;">' + totalFormattedTime + '</td>');
				newRow.append('<td id="remaining_working_hours" style="width: 120px; text-align: center;">' + remainingFormattedTime + '</td>');

				console.log('이름:', name);
				console.log('누적 시간:', totalFormattedTime);
				console.log('부서:', departmentname);
				console.log('잔여 근무 시간:', remainingFormattedTime);

				$('#attendanceListBody').append(newRow);
			});
		}
	}


	// 데이터 요청 및 처리 함수
	function sort(name, page) {
		const fullText = $('#current_month').text();
		const matches = fullText.match(/\d+/g);
		const month = matches[1];
		const year = matches[0];
		const userid = $("#user_id").val();

		$.ajax({
			url: '/get_manage_attendance',
			data: { name: name, page: page, month: month, year: year, userid: userid },
			type: 'get',
			dataType: 'json',
			success: function(data) {
				const processedData = processData(data);
				console.log("그래서 나온게", processedData);
				displayData(processedData);
			},
			error: function(xhr, status, error) {
				console.error('주소록 데이터 불러오기 에러:', status, error);
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

	// 주어진 연도와 월에 대해 공휴일과 주말을 고려한 총 근무일 수를 계산하는 함수
	function calculateWorkingDays(year, month) {
		// 해당 월의 첫 날과 마지막 날을 구합니다.
		const firstDay = new Date(year, month - 1, 1);
		const lastDay = new Date(year, month, 0);

		let workingDays = 0;

		// 각 날짜를 확인하여 주말(토요일: 6, 일요일: 0)과 공휴일을 제외한 날을 카운트합니다.
		for (let day = firstDay; day <= lastDay; day.setDate(day.getDate() + 1)) {
			const dayOfWeek = day.getDay();
			// 주말과 공휴일(공휴일 목록을 알고 있다면 여기에서 체크)을 제외합니다.
			if (dayOfWeek !== 0 && dayOfWeek !== 6) {
				workingDays++;
			}
		}
		return workingDays;
	}




})