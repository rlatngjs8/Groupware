<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 내역</title>
</head>
<%@ include file ="P_header.jsp" %>
<link href='css/ko_addPlan.css' rel='stylesheet' />
<body>
<div class='pageCalendar'>
	<div class='sideBar'>
		<h3 id="c_title" class="c_title" style="margin-left:0px">예 약</h3>
		<button class="addPlanBtn" id="btnReservation">회의실 예약</button>
	</div>
	<form method="post" action="/reservationUpdate">
		<div class="addPlan">
				<div class="addPlanTitle">
					<h3 style="padding-left:40px; margin-top:20px;">예약 상세</h3>
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
										</select><input type="hidden" id="roomNameHidden" name='roomNameHidden'>
												 <input type='hidden' id='roomIdHidden' name='roomIdHidden'>
											     <input type='hidden' id='sHourHidden' name='sHourHidden'>
											     <input type='hidden' id='eHourHidden' name='eHourHidden'>
											     <input type='hidden' id='connectionIDHidden' name='connectionIDHidden' value='${getDetailsR.connectionID}'>											     
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
								                <option value="<%= i %>">T<%= hour %>:00:00</option>
								            <% } %>
								        </select> 
								        <input type="hidden" id="startHidden" name="startHidden"> ~ 
								        <select id="endHour" required>
								            <!-- 시간 드롭다운 옵션 생성 -->
								            <!-- 0부터 23까지의 시간 옵션을 생성합니다. -->
								            <% for (int i=9; i<23; i++) { %>
								                <% String hour = String.format("%02d", i); %>
								                <option value="<%= i %>">T<%= hour %>:00:00</option>
								            <% } %>
								        </select> 
								        <input type="hidden" id="endHidden" name="endHidden">
									</td>
								</tr>
						</tbody>
					</table>
					<table class="tbl_tit" style="margin-top: 40px">
						<tbody>
							<tr class="contentTr">
								<td class="content">작성자 :</td><td class="content"><input class="writer" name="writer" type="text" value="${getDetailsC.writer}" readonly></td>
							</tr>
							<tr class="contentTr">
								<td class="content">목적 :</td><td><textarea class="contentArea" name="contentArea" required>${getDetailsC.calendar_memo}</textarea></td>
							</tr>
							<tr class="contentTr">
								<td align="center" colspan="2">
									<c:if test="${name==getDetailsC.writer}">
										<input type="submit" id="btnSend" class="btnPlan" value="수정">&nbsp;
										<input type="button" id="btnCancel" class="btnPlan" value="취소">&nbsp;
										<input type="button" id="btnDelete" class="btnPlan" value="예약 취소">
									</c:if>
									<c:if test="${name!=getDetailsC.writer}">
										<input type="button" id="btnCancel" class="btnPlan" value="취소">
									</c:if>	
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
	$("#meetingrooms option:contains(${getDetailsC.calendar_title})").prop("selected",true);	//방 선택
	$('#roomNameHidden').val($("#meetingrooms option:selected").text());						//선택된 방 이름 히든에 넣기
	$('#roomIdHidden').val($("#meetingrooms option:selected").val());							//선택된 방 코드 히든에 넣기
	startDate="${getDetailsC.calendar_start}".substr(0,10);										//날짜값 꺼내기
	startHour="${getDetailsC.calendar_start}".substr(10,9);										//시작 시간 꺼내기
	$('#startDate').val(startDate);																//꺼낸 날짜 선택하기
	$("#startHour option:contains("+startHour+")").prop("selected", true);						//꺼낸 시작 시간 선택하기
	$('#sHourHidden').val($('#startHour option:selected').val());								//선택된 시간 value 히든에 넣기
	endHour="${getDetailsC.calendar_end}".substr(10,9);											//끝 시간 꺼내기
	$("#endHour option:contains("+endHour+")").prop("selected", true);							//꺼낸 끝 시간 선택하기
	$('#eHourHidden').val($('#endHour option:selected').val());									//선택된 끝 시간의 value 히든에 넣기
	$('#startHidden').val($('#startDate').val()+$("#startHour option:selected").text());		//선택된 날짜와 시작시간의 값 합쳐서 히든에 넣기
	$('#endHidden').val($('#startDate').val()+$("#endHour option:selected").text());
	$.post('/getTimeDetails',{roomId:$('#roomIdHidden').val(), date:$('#startDate').val(), connectionID:"${getDetailsR.connectionID}"},
			function(data){
				if(data.length==0){
					return false;
				}else{
					for(let i=0; i<data.length; i++){
					    $('#startHour option').filter(function() {
					        return parseInt(this.value) >= parseInt(data[i].starttime) && parseInt(this.value) < parseInt(data[i].endtime);
					    }).prop('disabled', true); // 시작 시간보다 작거나 같은 옵션을 비활성화합니다.
					    $('#endHour option').filter(function() {
					        return parseInt(this.value) > parseInt(data[i].starttime) && parseInt(this.value) <= parseInt(data[i].endtime);
					    }).prop('disabled', true); // 예약되어 있는 시간은 선택 불가 (끝 시간)
					    if(parseInt($('#startHour option:selected').val())<parseInt(data[i].endtime)){
						    $('#endHour option').filter(function() {
							    	return parseInt(data[i].endtime) < parseInt(this.value);
							    }).prop('disabled', true);
					    }
					}
				}    
	},'json');
})
.on('click','#btnDelete',function(){		// 삭제버튼 클릭했을 때
	if(!confirm('삭제하시겠습니까?')) return false;
	document.location="/reservationDelete?connectionID=${getDetailsR.connectionID}"
})
</script>
<script src='js/reservation/ko_reservationDetails.js'></script>
</html>