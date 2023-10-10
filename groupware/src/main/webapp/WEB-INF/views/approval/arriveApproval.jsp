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
	display: flex;
	flex-direction: column; /* 요소들을 수직으로 배치합니다. */
	/* Flexbox를 사용하여 요소들을 가로 배치합니다. */
}

.title {
	display: block;
	position: absolute;
	top: 20px;
	left: 25%;
	width: 100%;
	margin-top: 10px;
	font-size: 24px;
	font-weight: normal;
}

.comeForm {
	margin-left: 25%;
	margin-top: 2%;
	width: 45%;
	font-size: 16px;
}

/* 추가된 CSS 클래스 */
.customTable {
	border-collapse: collapse;
	width: 100%;
}

.customTable td, .customTable th {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

.customTable th {
	background-color: #f2f2f2;
}


.td1 {
	font-size: 35px;
	text-align: center !important; /* 텍스트를 가운데 정렬합니다. */
}
</style>
</head>
<body>
<!--나한테 온 결재목록 (미완료) -->
	<%@ include file="/WEB-INF/views/P_header.jsp"%>
	<div class="mainSection">
		<div class="asidebar">
			<%@ include file="approvalHeader.jsp"%>
		</div>
		<h3 class="title">결재대기문서</h3>
		<div class="comeForm">
	
			<table class="customTable">
				<thead>
				<tr>
					<th><input type="checkbox"></th>
					<th>문서번호</th>
					<th>기안일</th>
					<th>결재양식</th>
					<th>제목</th>
					<th>기안자</th>
					<th>담당자</th>
					<th>결재상태</th>
				</tr>
				</thead>
				<c:forEach items='${arrive_approval}' var="list">
				<tbody>
					<tr><td><input type="checkbox"></td><td>${list.approvalID}</td><td>${list.createdTime}</td><td>${list.approval_type}</td><td>${list.approvalTitle}</td><td>${list.senderName}</td><td>${list.receiverName}</td><td>${list.approval_status}</td></tr>
					</c:forEach>
				</tbody>
			</table>
			
			<!--  ${pagestr} -->
		</div>
	</div>
</body>
</html>
