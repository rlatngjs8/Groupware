<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재</title>
<style>
body {
    overflow-x: hidden; /* 가로 스크롤을 숨깁니다. */
}
.mainSection {
	display: flex; /* Flexbox를 사용하여 요소들을 가로 배치합니다. */
}

.approvalHome {
	margin-left: 25%;
	margin-top: 25px;
	width: 1400px;
	height: 850px;
/* 	border: 1px solid #c0c0c0; */
}
.title{
		display: block;
    position: absolute;
    top: 20px;
    left: 25%;
    width: 100%;
    margin-top: 10px;
    font-size: 24px;
    font-weight: normal;
}
.arriveApproval{
	width: 100%;
    height: 25%;
/*     border-top: 1px solid #C0C0C0; /* 위쪽 테두리 */ 
    border-bottom: 1px solid #C0C0C0; /* 아래쪽 테두리 */
    display: flex;
}
.proceeding,.complete{
	margin-top:8%;
}
.comeApproval{
	margin-top:5%;
}
.subtitle{
	font-size:16px;
}
table {
    border-collapse: collapse; /* 테두리 병합 */
    width: 100%;
    text-align:left;
}

thead {
    border-bottom: 1px solid #C0C0C0; /* <thead>에 가로 줄을 추가 */
    border-top: 1px solid #C0C0C0;
    font-weight: normal;
    height:30px;
}
th {
	font-weight: normal;
}
tbody td, tbody th {
    border: none; /* <tbody>의 <td>와 <th>에 테두리 없애기 */
}
th:first-child,th:nth-child(4),th:nth-child(5),th:nth-child(6){
    width: 10%; /* 첫 번째 <th> 요소의 너비를 200px로 설정합니다. */
}
th:nth-child(2) {
    width: 18%;
}
th:nth-child(3) {
    width: 45%;
}
.approvalCard{
		border: 1px solid #c0c0c0;
    width: 350px;
    height: 200px;
   	border-radius: 5px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/P_header.jsp"%>
	<input type="hidden" id="user_id" name="user_id" value="${sessionScope.userid}">
	<div class="mainSection">
		<div class="asidebar">
			<%@ include file="approvalHeader.jsp"%>
		</div>
		<h3 class="title">전자결재 홈</h3>
		<div class="approvalHome">
			<div class="arriveApproval"><!-- 나한테 결재온거(미완) -->
				결재할 문서가 없습니다.
				<!-- c:if, forEach 써서 도착한게 있지만, 결재 미완료이면 div로 띄우기 -->
				<div class="approvalCard">
					
				</div>
			</div>
			<div class="comeApproval"> <!--나한테 온거 5개 -->
				<p class="subtitle">결재수신문서</p><br>
				<table>
					<thead>
						<tr><th>수신일</th><th>결재양식</th><th>제목</th><th>기안자</th><th>담당자</th><th>결재상태</th></tr>
					</thead>
					<c:forEach items="${receipt_approval}" var="c_approval">
					<tbody>
					<tr>
						<td>${c_approval.createdTime}</td>
						<td>아무거나</td>
						<td>${c_approval.approvalTitle}</td>
						<td>${c_approval.senderName}</td>
						<td>${c_approval.receiverName}</td>
						<td>${c_approval.approval_status}</td>
					</tr>
					</c:forEach>	
					</tbody>
				</table>
			</div>
			<div class="proceeding"> <!-- 내가 결제 보낸거(미완) 5개 -->
				<p class="subtitle">기안진행문서</p><br>
				<table>
					<thead>
						<tr><th>기안일</th><th>결재양식</th><th>제목</th><th>기안자</th><th>담당자</th><th>결재상태</th></tr>
					</thead>
					<tbody>
					<c:forEach items="${incomplete_approval}" var="i_approval">
				
					
					<tr>
						<td>${i_approval.createdTime}</td>
						<td>아무거나</td>
						<td>${i_approval.approvalTitle}</td>
						<td>${i_approval.senderName}</td>
						<td>${i_approval.receiverName}</td>
						<td>${i_approval.approval_status}</td>
					</tr>
					
					</c:forEach> 
					</tbody>
						
				</table>
			</div>
			<div class="complete">
				<p class="subtitle">결제완료문서</p><br> <!-- 나한테 결재 온거, 내가 보낸거(완료) 5개 -->
				<table>
					<thead>
						<tr><th>기안일</th><th>결재양식</th><th>제목</th><th>기안자</th><th>담당자</th><th>결재상태</th></tr>
					</thead>
					<tbody>
					<c:forEach items="${completion_approval}" var="co_approval">
					<tr>
						<td>${co_approval.createdTime}</td>
						<td>아무거나</td>
						<td>${co_approval.approvalTitle}</td>
						<td>${co_approval.senderName}</td>
						<td>${co_approval.receiverName}</td>
						<td>${co_approval.approval_status}</td>
					</tr>
					</c:forEach>  
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>