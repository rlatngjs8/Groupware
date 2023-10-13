<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/approval/sendApproval.js"></script>
<link href='css/approval/sendApproval.css' rel='stylesheet' />
<title>전자결재</title>
</head>
<body>
<!--내가 보낸 결재목록(미완, 완료)	 -->
	<%@ include file="/WEB-INF/views/P_header.jsp"%>
	<div class="mainSection">
		<div class="asidebar">
			<%@ include file="approvalHeader.jsp"%>
		</div>
		<h3 class="title">결재발송문서</h3>
		<div class="comeForm">
	
		<table class="customTable">
		    <thead>
		        <tr>
		            <th>문서번호</th>
		            <th>기안일</th>
		            <th style= "width: 12%;">결재양식</th>
		            <th style= "width: 40%;">제목</th>
		            <th>기안자</th>
		            <th>담당자</th>
		            <th>결재상태</th>
		        </tr>
		    </thead>
		    <c:choose>
		        <c:when test="${empty send_approval}">
		            <tbody>
		                <tr>
		                    <td colspan="8">데이터가 없습니다.</td>
		                </tr>
		            </tbody>
		        </c:when>
		        <c:otherwise>
		            <tbody>
		                <c:forEach items="${send_approval}" var="list">
		                    <tr>
		                        <td class="id">${list.approvalID}</td>
		                        <td class="time">${list.createdTime}</td>
		                        <td class="type">${list.approval_type}</td>
		                        <td class="Apptitle" data-approvalid="${list.approvalID}">${list.approvalTitle}</td>
		                        <td class="send_name">${list.senderName}</td>
		                        <td class="receiver_name">${list.receiverName}</td>
		                        <td class="status">${list.approval_status}</td>
		                    </tr>
		                </c:forEach>
		            </tbody>
		        </c:otherwise>
		    </c:choose>
		</table>
		<div class="pagination">
		    <c:choose>
		        <c:when test="${totalPages > 1}">
		            <c:forEach begin="1" end="${totalPages}" var="page">
		                <c:url value="/sendApproval" var="url">
		                    <c:param name="page" value="${page}" />
		                </c:url>
		                <c:choose>
		                    <c:when test="${page == currentPage}">
		                        <span class="current-page">${page}</span>
		                    </c:when>
		                    <c:otherwise>
		                        <a href="${url}">${page}</a>
		                    </c:otherwise>
		                </c:choose>
		            </c:forEach>
		        </c:when>
		    </c:choose>
		</div>
		</div>
	</div> 
</body>
</html>
