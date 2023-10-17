<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/approval/writeApproval.js"></script>
<link href="css/approval/writeApproval.css" rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/views/P_header.jsp"%>
	<div class="mainSection">
		<div class="asidebar">
			<%@ include file="approvalHeader.jsp"%>
		</div>
		<h3 class="title">전자결재 작성</h3>
<!-- 		<form action="/writeApprovalData" method="post"> -->
			<div class="tool_bar">
				<button type="submit">
					<span><img src="/img/수정.png" class="tool_bar_icon1"></span><span>결재요청</span>
				</button>
					 <a href="/approval"><span><img src="/img/취소.png" class="tool_bar_icon"></span><span>취소</span></a>
			</div>
			<div class="modal">
				<div class="modal_body">
					<h2>모달창 제목</h2>
					<p>모달창 내용</p>
				</div>
			</div>
			<div class="writeForm">
				<table class="customTable">
					<tr>
						<td class="td1" colspan="5">업 무 기 안</td>
					</tr>
					<tr>
						<td class="bgGray width9 centerText"
							style="width: 10%; border-bottom: 1px solid #bfbfbf;">기안자</td>
						<td style="font-weight: bold;">${name}<input type="hidden"
							name="userid" id="userid" value="${userid}"></td>
						<td rowspan="4"></td>
						<td rowspan="3" class="bgGray width9 centerText"
							style="width: 10%; border-bottom: 1px solid #bfbfbf;">결재</td>
						<td class="width13 centerText" id="receiverDepartmentName"></td>
					</tr>
					<tr>
						<td class="bgGray centerText"
							style="border-bottom: 1px solid #bfbfbf;">부서</td>
						<td>${alEmp.departmentName}</td>
						<td rowspan="2" class="textCenter"><select name="receiver_id"
							id="receiver_id" class="receiver_id">
								<option value="" disabled selected>결재 담당자를 선택해주세요</option>
								<c:forEach items="${allMem}" var="mem">
									<option value="${mem.userid}">${mem.departmentName}-
										${mem.name} ${mem.position}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td class="bgGray centerText"
							style="border-bottom: 1px solid #bfbfbf;">기안일</td>
						<td><span id="currentDate"></span></td>
					</tr>
					<tr>
						<td class="bgGray centerText">문서번호</td>
						<td class="width25"></td>
						<td class="bgGray centerText">결재상태</td>
						<td class="textCenter">미완료</td>
					</tr>
				</table>
				<br>
				<hr />
				<br>
				<table class="customTable">
					<tr>
						<td class="width20 bgGray centerText"
							style="width: 20%; border-bottom: 1px solid #bfbfbf;">결재유형</td>
						<!--                     <td><input type="text" name="approvalType" id="approvalType"></td> -->
						<td><select name="approvalType" id="approvalType">
								<option value="" disabled selected>결재유형선택</option>
								<option value="업무기안">업무기안</option>
								<option value="업무협조">업무협조</option>
								<option value="일반품의서">일반품의</option>
								<option value="구매신청서">구매신청서</option>
								<option value="출장신청서">출장신청서</option>
								<option value="채용요청">채용요청</option>
								<option value="회의록">회의록</option>
								<option value="휴가신청서">휴가신청서</option>
								<option value="사유서">사유서</option>
						</select></td>
					</tr>
					<tr>
						<td class="bgGray centerText" 
						
							style="border-bottom: 1px solid #bfbfbf;">제목</td>
						<td><input type="text" name="approvalTitle"
							id="approvalTitle"></td>
					</tr>
					<tr>
						<td colspan="2" class="bgGray centerText"
							style="text-align: center">내 용</td>
					</tr>
					<tr>
						<td colspan="2" class="height450"><input type="text"
							name="approText" id="approText" class="ApproText"></td>
					</tr>
				</table>
			</div>
			<div class="tool_bar" style="margin-bottom: 5%">
				<button id ="submit_btn"><span><img src="/img/수정.png" class="tool_bar_icon"></span><span>결재요청</span></button>
				<a href="/approval"><span><img src="/img/취소.png" class="tool_bar_icon"></span><span>취소</span></a>
<!-- 		</form> -->
	</div>
</body>
</html>
