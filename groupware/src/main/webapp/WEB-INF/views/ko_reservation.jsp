<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회의실 예약</title>
</head>
<%@ include file ="P_header.jsp" %>
<link href='css/ko_addPlan.css' rel='stylesheet' />
<body>
<div class='pageCalendar'>
	<div class='sideBar'>
		<h2 id="c_title" class="c_title" style="margin-left:15px">예 약</h2>
		<button class="addPlanBtn" id="btnReservation">회의실 예약</button>
	</div>
	<form method="post" action="/reservationMeetingrooms">
		<div class="addPlan">
				<div class="addPlanTitle">
					<h2>회의실 예약</h2>
				</div>
				<div>
					<table class="tbl_tit">
						<tbody>
								<tr>
									<td>
										<select class="pl" id='meetingrooms'>
											<c:forEach items="${meetingrooms}" var="meetingrooms">
												<option value="${meetingrooms.roomID}">${meetingrooms.roomName}</option>
											</c:forEach>
										</select><input type="text" id="roomNameHidden" name='roomNameHidden'>
												 <input type='text' id='roomIdHidden' name='roomIdHidden'>
											     <input type='text' id='sHourHidden' name='sHourHidden'>
											     <input type='text' id='eHourHidden' name='eHourHidden'>
									</td>
								</tr>
								<tr>
									<td>
										<input type="date" id="startDate" name="startDate" required>
								        <select id="startHour" required>
								            <!-- 시간 드롭다운 옵션 생성 -->
								            <!-- 0부터 23까지의 시간 옵션을 생성합니다. -->
								            <% for (int i=8; i<22; i++) { %>
								                <% String hour = String.format("%02d", i); %>
								                <option value="<%= hour %>">T<%= hour %>:00:00</option>
								            <% } %>
								        </select> 
								        <input type="text" id="startHidden" name="startHidden"> ~ 
								        <select id="endHour" required>
								            <!-- 시간 드롭다운 옵션 생성 -->
								            <!-- 0부터 23까지의 시간 옵션을 생성합니다. -->
								            <% for (int i=9; i<23; i++) { %>
								                <% String hour = String.format("%02d", i); %>
								                <option value="<%= hour %>">T<%= hour %>:00:00</option>
								            <% } %>
								        </select> 
								        <input type="text" id="endHidden" name="endHidden">
									</td>
								</tr>
						</tbody>
					</table>
					<table class="tbl_tit" style="margin-top: 40px">
						<tbody>
							<tr class="contentTr">
								<td class="content">작성자 :</td><td class="content"><input class="writer" name="writer" type="text" value="${name}" readonly></td>
							</tr>
							<tr class="contentTr">
								<td class="content">목적 :</td><td><textarea class="contentArea" name="contentArea" required></textarea></td>
							</tr>
							<tr class="contentTr">
								<td align="center" colspan="2">
									<input type="submit" id="btnSend" class="btnPlan" value="확인">&nbsp;
									<input type="button" id="btnCancel" class="btnPlan" value="취소">
								</td>
							</tr>					
						</tbody>
					</table>
				</div>
			</div>
		</form>
</div>
</body>
<script src='https://code.jquery.com/jquery-Latest.js'></script>
<script>
$(document)
.ready(function(){
	var today = new Date();	//현재 날짜 가져오기
	
	var formattedDate = today.toISOString().substr(0,10);	//년도, 월, 일을 YYYY-MM-DD 형식으로 변환
	
	$('#startDate').val(formattedDate);		//시작 날짜 기본값 오늘로 설정
	$('#startHidden').val($('#startDate').val()+$("#startHour option:selected").text());
	$('#endHidden').val($('#startDate').val()+$("#endHour option:selected").text());
	$('#roomNameHidden').val($("#meetingrooms option:selected").text());
	$('#roomIdHidden').val($("#meetingrooms option:selected").val());
	$('#sHourHidden').val($('#startHour option:selected').val());
	$('#eHourHidden').val($('#endHour option:selected').val());
	$.post('/getTime',{roomId:$('#roomIdHidden').val(), date:$('#startDate').val()},
			function(data){
				if(data.length==0){
					return false;
				}else{
					$('#startHour option').prop('disabled', false); // 모든 옵션을 활성화합니다.
					$('#endHour option').prop('disabled', false); // 모든 옵션을 활성화합니다.
					for(let i=0; i<data.length; i++){
					    $('#startHour option').filter(function() {
					        return parseInt(this.value) >= parseInt(data[i].starttime) && parseInt(this.value) < parseInt(data[i].endtime);
					    }).prop('disabled', true); // 시작 시간보다 작거나 같은 옵션을 비활성화합니다.
					    $('#endHour option').filter(function() {
					        return parseInt(this.value) > parseInt(data[i].starttime) && parseInt(this.value) <= parseInt(data[i].endtime);
					    }).prop('disabled', true); // 예약되어 있는 시간은 선택 불가 (끝 시간)
					}
				}
			    
	},'json');
})
.on('click','#btnReservation',function(){	//회의실 예약버튼을 클릭했을 때
	document.location="/ko_reservation"
})
.on('click','#btnCancel',function(){		// 취소 눌렀을 때
	document.location="/ko_calendar"
})
.on('click','#c_title', function(){		//캘린더 title을 클릭했을 때
	document.location="/ko_reservation";
})
$('#startDate').on('change', function() {		// 시작 날짜 변경했을 때
    var startDate = $(this).val();
    $('#startHidden').val(startDate+$("#startHour option:selected").text());
    $('#endHidden').val(startDate+$("#endHour option:selected").text());
	$('#startHour option').prop('disabled', false); // 모든 옵션을 활성화합니다.
	$('#endHour option').prop('disabled', false); // 모든 옵션을 활성화합니다.
	$.post('/getTime',{roomId:$('#roomIdHidden').val(), date:$('#startDate').val()},
			function(data){
				if(data.length==0){
					return false;
				}else{
					$('#startHour option').prop('disabled', false); // 모든 옵션을 활성화합니다.
					$('#endHour option').prop('disabled', false); // 모든 옵션을 활성화합니다.
				
					for(let i=0; i<data.length; i++){
					    $('#startHour option').filter(function() {
					        return parseInt(this.value) >= parseInt(data[i].starttime) && parseInt(this.value) < parseInt(data[i].endtime);
					    }).prop('disabled', true); // 시작 시간보다 작거나 같은 옵션을 비활성화합니다.
					    $('#endHour option').filter(function() {
					        return parseInt(this.value) > parseInt(data[i].starttime) && parseInt(this.value) <= parseInt(data[i].endtime);
					    }).prop('disabled', true); // 예약되어 있는 시간은 선택 불가 (끝 시간)
					    
					}
				}
			    
	},'json');
})
$('#startHour').on('change', function(){		// 시작 시간 변경했을 때
	$('#startHidden').val($('#startDate').val()+$("#startHour option:selected").text());
	var startHour = parseInt($('#startHour').val());	// 선택된 시작 시간을 가져옴
	$('#endHour option').prop('disabled', false); // 모든 옵션을 활성화합니다.
    $('#endHour option').filter(function() {
        return parseInt(this.value) <= startHour;
    }).prop('disabled', true); // 시작 시간보다 작거나 같은 옵션을 비활성화합니다.
    $("#endHour").val(startHour+1);
	$('#endHidden').val($('#startDate').val()+$("#endHour option:selected").text());
	$('#sHourHidden').val($('#startHour option:selected').val());
	$('#eHourHidden').val($('#endHour option:selected').val());
})
$('#endHour').on('change', function(){		// 끝 시간 변경했을 때
	$('#endHidden').val($('#startDate').val()+$("#endHour option:selected").text());
	$('#eHourHidden').val($('#endHour option:selected').val());
})
$('#meetingrooms').on('change', function(){				//회의실 변경
	$('#roomIdHidden').val($("#meetingrooms option:selected").val());
	$('#roomNameHidden').val($("#meetingrooms option:selected").text());
	$('#startHour option').prop('disabled', false); // 모든 옵션을 활성화합니다.
	$('#endHour option').prop('disabled', false); // 모든 옵션을 활성화합니다.
	$.post('/getTime',{roomId:$('#roomIdHidden').val(), date:$('#startDate').val()},
			function(data){
				if(data.length==0){
					return false;
				}else{
					$('#startHour option').prop('disabled', false); // 모든 옵션을 활성화합니다.
					$('#endHour option').prop('disabled', false); // 모든 옵션을 활성화합니다.
					for(let i=0; i<data.length; i++){
					    $('#startHour option').filter(function() {
					        return parseInt(this.value) >= parseInt(data[i].starttime) && parseInt(this.value) < parseInt(data[i].endtime);
					    }).prop('disabled', true); // 예약되어 있는 시간은 선택 불가 (시작시간)
					    $('#endHour option').filter(function() {
					        return parseInt(this.value) > parseInt(data[i].starttime) && parseInt(this.value) <= parseInt(data[i].endtime);
					    }).prop('disabled', true); // 예약되어 있는 시간은 선택 불가 (끝 시간)
					}
				}
	},'json');
})
</script>
</html>