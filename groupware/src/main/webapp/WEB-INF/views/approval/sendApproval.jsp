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
	left: 12%;
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

}

.customTable th {
	background-color: #f2f2f2;
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

</style>
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
		                        <td><input type="checkbox"></td>
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

			
			<!--  ${pagestr} -->
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
