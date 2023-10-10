<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='css/ko_addPlan.css' rel='stylesheet' />
<%@ include file ="P_header.jsp" %>
<title>일정 상세</title>
</head>
<body>
<div class='pageCalendar'>
	<div class='sideBar'>
		<h3 id="c_title" class="c_title" style="margin-left:0px">캘린더</h3>
		<button class="addPlanBtn" id="addPlanBtn">일정등록</button>
	</div>
	<form method="post" action="/planUpdate">
		<div class="addPlan">
				<div class="addPlanTitle">
					<h3 style="padding-left:40px; margin-top:20px;">일정상세</h3>
				</div>
				<div>
					<table class="tbl_tit">
						<tbody>
								<tr>
									<td>
										<input type='hidden' name='c_num'value="${getDetails.calendar_no}">
										<input id="ipt_tit" name="ipt_tit" class="ipt_tit" type="text" maxlength="500" value="${getDetails.calendar_title}" required>
									</td>
								</tr>
								<tr>
									<td>
										<input type="date" id="startDate" required>
									        <select id="startHour" required>
									            <!-- 시간 드롭다운 옵션 생성 -->
									            <!-- 0부터 23까지의 시간 옵션을 생성합니다. -->
									            <% for (int i=8; i<22; i++) { %>
									                <% String hour = String.format("%02d", i); %>
									                <option value="<%= hour %>">T<%= hour %>:00:00</option>
									            <% } %>
									        </select> <input type="hidden" id="startHidden" name="startHidden"> ~ 
										<input type="date" id="endDate" required>
									        <select id="endHour" required>
									            <!-- 시간 드롭다운 옵션 생성 -->
									            <!-- 0부터 23까지의 시간 옵션을 생성합니다. -->
									            <% for (int i=9; i<23; i++) { %>
									                <% String hour = String.format("%02d", i); %>
									                <option value="<%= hour %>">T<%= hour %>:00:00</option>
									            <% } %>
									        </select> <input type="hidden" id="endHidden" name="endHidden">
										<input type="checkbox" id="allDay"><span>종일</span>
									</td>
								</tr>
						</tbody>
					</table>
					<table class="tbl_tit" style="margin-top: 40px">
						<tbody>
							<tr class="contentTr">
								<td class="content">작성자 :</td><td class="content"><input class="writer" name="writer" type="text" value="${getDetails.writer}" readonly></td>
							</tr>						
							<tr>
								<td class="content">내용 :</td><td><textarea class="contentArea" name="contentArea" required>${getDetails.calendar_memo}</textarea></td>
							</tr>
							<tr>
								<td align="center" colspan="2">
									<c:if test="${name==getDetails.writer}">
										<input type="submit" id="btnSend" class="btnPlan" value="수정">&nbsp;
										<input type="button" id="btnCancel" class="btnPlan" value="취소">
										<input type="button" id="btnDelete" class="btnPlan" value="삭제">	
									</c:if>
									<c:if test="${name!=getDetails.writer}">
										<input type="button" id="btnCancel" class="btnPlan" value="뒤로">
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
	if(19>"${getDetails.calendar_start}".length){
		$('#startDate').val("${getDetails.calendar_start}");
	}else{
		startDate="${getDetails.calendar_start}".substr(0,10);
		startHour="${getDetails.calendar_start}".substr(10,9);
		$('#startDate').val(startDate);
		$("#startHour option:contains("+startHour+")").prop("selected", true);
	}
	if(19>"${getDetails.calendar_end}".length){
		$('#endDate').val("${getDetails.calendar_end}");
	}else{
		endDate="${getDetails.calendar_end}".substr(0,10);
		endHour="${getDetails.calendar_end}".substr(10,9);
		$('#endDate').val(endDate);
		$("#endHour option:contains("+endHour+")").prop("selected", true);
	}
	
	var today = new Date();	// 현재 날짜를 가져오기
	
	var formattedDate = today.toISOString().substr(0, 10);	// 년도, 월, 일을 YYYY-MM-DD 형식으로 변환
	
    $('#startHidden').val($('#startDate').val()+$("#startHour option:selected").text());
    $('#endHidden').val($('#endDate').val()+$("#endHour option:selected").text());
})

.on('click','#addPlanBtn',function(){		// 일정등록 버튼 클릭했을 때
	document.location="/ko_addPlan"
})
.on('click','#btnCancel',function(){		// 취소 눌렀을 때
	document.location="/ko_calendar"
})
.on('click','#btnDelete',function(){		// 삭제버튼 클릭했을 때
	if(!confirm('삭제하시겠습니까?')) return false;
	document.location="/ko_calendarDelete?c_no=${getDetails.calendar_no}"
})
.on('click','#c_title', function(){		//캘린더 title을 클릭했을 때
	document.location="/ko_calendar";
})
$('#startDate').on('change', function() {		// 시작 날짜 변경했을 때
    $('#endDate').attr('min', $(this).val());
    var startDate = $(this).val();
    $('#endDate').val(startDate);
    $('#startHidden').val(startDate+$("#startHour option:selected").text());
    $('#endHidden').val(startDate+$("#endHour option:selected").text());
})
$('#startHour').on('change', function(){		// 시작 시간 변경했을 때
	$('#startHidden').val($('#startDate').val()+$("#startHour option:selected").text());
})
$('#endDate').on('change', function(){		// 끝 날자 변경했을 때
	$('#endHidden').val($(this).val()+$("#endHour option:selected").text());
})
$('#endHour').on('change', function(){		// 끝 시간 변경했을 때
	$('#endHidden').val($('#endDate').val()+$("#endHour option:selected").text());
})
$("#allDay").change(function(){
    if($("#allDay").is(":checked")){	//종일 선택했을 때
        $('#startHour').hide();
        $('#endHour').hide();
        $('#startHidden').val($('#startDate').val()+"T08:00:00");
        $('#endHidden').val($('#endDate').val()+"T22:00:00");
    }else{								//종일 해제했을 때
    	$('#startHour').show();
    	$('#endHour').show();
    	$('#startHidden').val($('#startDate').val()+$("#startHour option:selected").text());
    	$('#endHidden').val($('#endDate').val()+$("#endHour option:selected").text());
    }
});	
$(document).ready(function() {
    // 시작 시간과 끝 시간 select 요소의 변경을 감지합니다.
    $('#startHour, #endHour').on('change', function() {
        // 현재 선택된 시작 시간과 끝 시간을 가져옵니다.
        var startHour = parseInt($('#startHour').val());
        var endHour = parseInt($('#endHour').val());

        // 만약 시작 날짜와 끝 날짜가 같고, 시작 시간이 끝 시간보다 크거나 같다면
        if ($('#startDate').val() === $('#endDate').val() && startHour >= endHour) {
            // 끝 시간을 변경합니다.
            $('#endHour option').prop('disabled', false); // 모든 옵션을 활성화합니다.
            $('#endHour option').filter(function() {
                return parseInt(this.value) <= startHour;
            }).prop('disabled', true); // 시작 시간보다 작거나 같은 옵션을 비활성화합니다.
        } else {
            // 날짜가 다르거나 시작 시간이 끝 시간보다 작은 경우 모든 옵션을 활성화합니다.
            $('#endHour option').prop('disabled', false);
        }
    });

    // 시작 날짜가 변경될 때 끝 날짜의 최소값을 업데이트합니다.
    $('#startDate').on('change', function() {
        $('#endDate').attr('min', $(this).val());
        var startDate = $(this).val();
        $('#endDate').val(startDate);

        // 변경된 시작 날짜에 따라 끝 시간을 업데이트합니다.
        var startHour = parseInt($('#startHour').val());
        $('#endHour option').prop('disabled', false);
        $('#endHour option').filter(function() {
            return parseInt(this.value) <= startHour;
        }).prop('disabled', true);
    });
});
</script>
</html>