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
    flex-direction: column;
    justify-content: center; /* 수직 가운데 정렬 */
    align-items: center; /* 수평 가운데 정렬 */
    margin-top: 85px;
    text-align: center;
}

.title {
	display: block;
	position: absolute;
	top: 110px;
	right: 17%;
	width: 100%;
	margin-top: 10px;
	font-size: 24px;
	font-weight: normal;
}

.comeForm {
	margin-left: 25%;
	margin-top: 2%;
	width: 65%;
	font-size: 16px;
}

/* 추가된 CSS 클래스 */
.customTable {
	border-collapse: collapse;
	width: 100%;
}

.customTable td, .customTable th {
/* 	border: 1px solid #ddd; */
	padding: 8px;

}

.customTable th {
	  border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    background-color: rgb(106, 176, 173);
    color: #fff;
}


.td1 {
	font-size: 35px;
	text-align: center !important; /* 텍스트를 가운데 정렬합니다. */
}
    .id,
    .time,
    .type,
    .Apptitle,
    .send_name,
    .receiver_name,
    .status {
        text-align: center; /* 텍스트 중앙 정렬 */
    }
	
	.id {
	 width: 150px;
	}
    
    .time {
        width: 330px; /* 원하는 너비 지정 */
    }

    .type {
        width: 150px; /* 원하는 너비 지정 */
    }

.Apptitle {
    width: 230px; /* 원하는 너비 지정 */
    cursor: pointer; /* 마우스 포인터를 가리키는 속성 추가 */
}

    .send_name,
    .receiver_name {
        width: 210px; /* 원하는 너비 지정 */
    }

    .status {
        width: 210px; /* 원하는 너비 지정 */
    }
    .customTable {
    	width: 100%;
    }
      .pagination {
    text-align: center;
    margin-top: 20px;
}

.pagination a {
    display: inline-block;
    padding: 5px 10px;
    margin: 5px;
    background-color: #fff;
    color: #333;
    border: 1px solid #ccc;
    border-radius: 5px;
    text-decoration: none;
}

.pagination a:hover {
    background-color: #f5f5f5;
}

.pagination .current-page {
    background-color: #6ab0ad;
    color: #fff;
    padding: 5px 10px;
    margin: 5px;
    border: 1px solid #6ab0ad;
    border-radius: 5px;
}

.pagination a:disabled {
    background-color: #eee;
    color: #888;
    pointer-events: none;
}
    

</style>
</head>
<body>
<!--나한테 온 결재목록 (미완료, 완료) -->
	<%@ include file="/WEB-INF/views/P_header.jsp"%>
	<div class="mainSection">
		<div class="asidebar">
			<%@ include file="approvalHeader.jsp"%>
		</div>
		<h3 class="title">결재수신문서</h3>
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
		        <c:when test="${empty incomplete_approval}">
		            <tbody>
		                <tr>
		                    <td colspan="8">데이터가 없습니다.</td>
		                </tr>
		            </tbody>
		        </c:when>
		        <c:otherwise>
		            <tbody>
		                <c:forEach items="${incomplete_approval}" var="list">
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
			
			<!--  ${pagestr} -->
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    // 각 approval 제목을 가지고 있는 요소에 대한 이벤트 핸들러를 할당
    $('td.Apptitle').on('click', function() {
        // 클릭된 요소의 data-approvalid 속성 값을 가져옴
        var approvalID = $(this).data('approvalid');
        console.log(approvalID); // 콘솔에 출력
        window.location = "approvalDetail?approvalID=" + approvalID;
    });
});
</script>
</html>
