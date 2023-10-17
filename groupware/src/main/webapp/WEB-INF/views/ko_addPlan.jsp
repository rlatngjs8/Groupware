<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='css/ko_addPlan.css' rel='stylesheet' />
<%@ include file ="P_header.jsp" %>
<title>일정추가</title>
</head>
<body>
<div class='pageCalendar'>
	<div class='sideBar'>
		<h3 id="c_title" class="c_title" style="margin-left:0px">캘린더</h3>
		<button class="addPlanBtn" id="addPlanBtn">일정등록</button>
	</div>
	<form method="post" action="/planInsert" id='planInsert'>
		<div class="addPlan">
				<div class="addPlanTitle">
					<h3 style="padding-left:40px; margin-top:20px;">일정등록</h3>
				</div>
				<div>
					<table class="tbl_tit">
						<tbody>
								<tr>
									<td>
										<input id="ipt_tit" name="ipt_tit" class="ipt_tit" type="text" maxlength="500" required>
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
									        </select> 
									        <input type="hidden" id="startHidden" name="startHidden"> ~ 
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
								<td class="content">작성자 :</td><td class="content"><input class="writer" name="writer" type="text" value="${name}" readonly></td>
							</tr>
							<tr class="contentTr">
								<td class="content">내용 :</td><td><textarea class="contentArea" name="contentArea" required></textarea></td>
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
<script src='js/calendar/ko_addPlan.js'></script>
</html>