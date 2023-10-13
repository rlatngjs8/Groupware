<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/approval/approval.js"></script>
<link href='css/approval/approval.css' rel='stylesheet' />
</head>
<body>
	<%@ include file="/WEB-INF/views/P_header.jsp"%>
	<input type="hidden" id="user_id" name="user_id"
		value="${sessionScope.userid}">
	<div class="mainSection">
		<div class="asidebar">
			<%@ include file="approvalHeader.jsp"%>
		</div>
		<h3 class="title">전자결재 홈</h3>
		<div class="approvalHome">
			<div class="arriveApproval">
				<!-- 나한테 결재온거(미완) -->
				<!-- c:if, forEach 써서 도착한게 있지만, 결재 미완료이면 div로 띄우기 -->
				<c:if test="${empty my_incomplete_approval}">
					<div class="noDataMessage">결재할 문서가 없습니다.</div>
				</c:if>
				<c:forEach items="${my_incomplete_approval}" var="my_approval">

					<div class="approvalCard">
						<input type="hidden" class="approvalID"
							value="${my_approval.approvalID}">
						<header>
							<span class="state ongoing">${my_approval.approval_status}</span>
						</header>
						<div class="card_content">
							<div class="form">
								<div class="card_subject">${my_approval.approvalTitle}</div>
								<div class="form_tr">
									<div class="form_th">기 안 자 :</div>
									<div class="form_td" title="${my_approval.sender_id}">${my_approval.senderName}</div>
								</div>
								<div class="form_tr">
									<div class="form_th">기 안 일 :</div>
									<div class="form_td" title="${my_approval.sender_id}">${my_approval.createdTime}</div>
								</div>
								<div class="form_tr">
									<div class="form_th">결재양식 :</div>
									<div class="form_td" title="${my_approval.sender_id}">${my_approval.approval_type}</div>
								</div>
								<div class="card_action" id="card_action"
									style="margin-top: 5px; cursor: pointer">결재하기</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="comeApproval">
				<!--나한테 온거 5개 -->
				<p class="subtitle">결재수신문서</p>
				<br>
				<table>
					<thead>
						<tr>
							<th>수신일</th>
							<th>결재양식</th>
							<th>제목</th>
							<th>기안자</th>
							<th>담당자</th>
							<th>결재상태</th>
						</tr>
					</thead>
					<c:forEach items="${receipt_approval}" var="c_approval">
						<tbody>
							<tr>
								<input type="hidden" id="approvalID"
									value="${c_approval.approvalID}">
								<td id="c_approval_createdTime">${c_approval.createdTime}</td>
								<td>${c_approval.approval_type}</td>
								<td id="c_approval_title"
									data-approvalid="${c_approval.approvalID}">${c_approval.approvalTitle}</td>
								<td>${c_approval.senderName}</td>
								<td>${c_approval.receiverName}</td>
								<td class="state">${c_approval.approval_status}</td>
							</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="proceeding">
				<!-- 내가 결제 보낸거(미완) 5개 -->
				<p class="subtitle">기안진행문서</p>
				<br>
				<table>
					<thead>
						<tr>
							<th>기안일</th>
							<th>결재양식</th>
							<th>제목</th>
							<th>기안자</th>
							<th>담당자</th>
							<th>결재상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${incomplete_approval}" var="i_approval">
							<tr>
								<%-- 						<input type="hidden" id="I_createdTime" value="${i_approval.createdTime}"> --%>
								<input type="hidden" id="approvalID"
									value="${i_approval.approvalID}">
								<td id="i_approval.createdTime">${i_approval.createdTime}</td>
								<td>${i_approval.approval_type}</td>
								<td id="i_approval_title"
									data-approvalid="${i_approval.approvalID}">${i_approval.approvalTitle}</td>
								<td>${i_approval.senderName}</td>
								<td>${i_approval.receiverName}</td>
								<td class="state">${i_approval.approval_status}</td>
							</tr>

						</c:forEach>
					</tbody>

				</table>
			</div>
			<div class="complete">
				<p class="subtitle">결제완료문서</p>
				<br>
				<!-- 나한테 결재 온거, 내가 보낸거(완료) 5개 -->
				<table>
					<thead>
						<tr>
							<th>기안일</th>
							<th>결재양식</th>
							<th>제목</th>
							<th>기안자</th>
							<th>담당자</th>
							<th>결재상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${completion_approval}" var="co_approval">
							<tr>
								<%-- 						<input type="hidden" id="CO_createdTime" value="${co_approval.createdTime}"> --%>
								<input type="hidden" id="approvalID"
									value="${co_approval.approvalID}">
								<td id="co_approval.createdTime">${co_approval.createdTime}</td>
								<td>${co_approval.approval_type}</td>
								<td id="co_approval_title"
									data-approvalid="${co_approval.approvalID}">${co_approval.approvalTitle}</td>
								<td>${co_approval.senderName}</td>
								<td>${co_approval.receiverName}</td>
								<td class="state">${co_approval.approval_status}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>