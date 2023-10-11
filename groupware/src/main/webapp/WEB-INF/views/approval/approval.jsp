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
	margin-bottom: 20%;
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
    font-weight: bold;
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
	font-size:20px;
	margin:auto;
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
		font-weight: bold;
    background-color: rgb(106, 176, 173);
    font-size: 15px;
    text-align: center;
    color: white;
}
tbody td, tbody th {
    border: none;
    text-align:center;
}
th:first-child,th:nth-child(4),th:nth-child(5),th:nth-child(6){
    width: 10%; /* 첫 번째 <th> 요소의 너비를 200px로 설정합니다. */
}
th:nth-child(2) {
    width: 20%;
}
th:nth-child(3) {
    width: 35%;
}

.approvalCard {
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-bottom: 10px;
    padding: 10px;
    box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
    width: 300px; /* 크기를 조정할 수 있습니다 */
    margin-right: 35px;
}

.cardHeader {
    background-color: #f2f2f2;
    padding: 5px;
    border-bottom: 1px solid #ccc;
}

.state {
    font-weight: bold;
    padding: 5px 10px;
	text-align: center;
    text-transform: uppercase;
}

.card_subject {
    margin: 10px 0;
    font-size: 21px;
    font-weight: bold;
}

.form_th {
    font-weight: bold;
    margin-right: 0px;
    width: 80px; /* 레이블 너비를 조정할 수 있습니다 */
}

.form_td {
    color: block;
    font-weight: bold;
    word-break: break-all; /* 긴 텍스트 줄 바꿈 처리 */
}

.form_tr {
    display: flex;
    align-items: center;
    margin-bottom: 5px; /* 각 항목 간격 조정 */
}

.card_action {
  display: inline-block;
  padding: 8px 0;
  color: #666;
  background: #f7f7f7;
  border: 1px solid #d9d9d9;
  min-width: 95px;
  font-size: 12px;
  text-align: center;
  font-weight: bold;
  font-weight: 500;
  vertical-align: middle;
  width: -webkit-fill-available;
}
.card_action:hover {
    background-color: #cccccc; /* 짙은 회색 배경색 */
}



.approval {
	color: rgb(153, 255, 153); /* 연한초록색 배경색 */
    background-color: rgb(0, 102, 0); /* 진한초록색 배경색 */
}
.noDataMessage {
    color: gray; /* 회색 글씨 색상 */
    text-align: center; /* 가운데 정렬 */
    width: 100%;
    position: relative;
    top: 88px;
    font-size: 18px;
}

#c_approval_title {
cursor: pointer;
}

#i_approval_title {
cursor: pointer;

}

#co_approval_title{
cursor: pointer;
}

.ongoing {
    color: #0056b3; /* 진한 파랑색 텍스트 색상 */
    background-color: #dbeeff; /* 연한 파랑색 배경색 */
}

.defer {
    color: #996300; /* 진한 갈색 텍스트 색상 */
    background-color: #fff580; /* 연한 노랑색 배경색 */
}

.refuse {
    color: #8c0000; /* 진한 붉은색 텍스트 색상 */
    background-color: #ff6666; /* 연한 붉은색 배경색 */
}

.approval {
    color: #3d8b3d; /* 진한 초록색 텍스트 색상 */
    background-color: #a3d9a3; /* 연한 초록색 배경색 */
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
				<!-- c:if, forEach 써서 도착한게 있지만, 결재 미완료이면 div로 띄우기 -->
			<c:if test="${empty my_incomplete_approval}">
			    <div class="noDataMessage">
			        결재할 문서가 없습니다.
			    </div>
			</c:if>
			    <c:forEach items="${my_incomplete_approval}" var="my_approval"> 
			    	<input type="hidden" class="approvalID" value="${my_approval.approvalID}">
			        <div class="approvalCard">
			            <header>
			                <span class="state ongoing">${my_approval.approval_status}</span>
			            </header>
			            <div class="card_content"> 
			                <div class="form">
			                    <div class="card_subject">
			                        ${my_approval.approvalTitle}
			                    </div>
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
			                    <div class="card_action" onclick="go_approval(this)" style="margin-top: 10px; cursor:pointer">
			                        결재하기
			                    </div>
			                </div>
			            </div>
			        </div>
			    </c:forEach>
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
						<input type="hidden" id="approvalID" value="${c_approval.approvalID}">
						<td id= "c_approval_createdTime">${c_approval.createdTime}</td>
						<td>${c_approval.approval_type}</td>
						<td id="c_approval_title" data-approvalid="${c_approval.approvalID}" >${c_approval.approvalTitle}</td>
						<td>${c_approval.senderName}</td>
						<td>${c_approval.receiverName}</td>
						<td class="state">${c_approval.approval_status}</td>
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
						<input type="hidden" id="I_createdTime" value="${i_approval.createdTime}">
						<td id="i_approval.createdTime">${i_approval.createdTime}</td>
						<td>${i_approval.approval_type}</td>
						<td id="i_approval_title" data-approvalid="${i_approval.approvalID}" >${i_approval.approvalTitle}</td>
						<td>${i_approval.senderName}</td>
						<td>${i_approval.receiverName}</td>
						<td class="state">${i_approval.approval_status}</td>
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
						<input type="hidden" id="CO_createdTime" value="${co_approval.createdTime}">
						<td id="co_approval.createdTime">${co_approval.createdTime}</td>
						<td>${co_approval.approval_type}</td>
						<td id="co_approval_title" data-approvalid="${co_approval.approvalID}" >${co_approval.approvalTitle}</td>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    // 각 approval 제목을 가지고 있는 요소에 대한 이벤트 핸들러를 할당
    $('td#c_approval_title').on('click', function() {
        // 클릭된 요소의 data-approvalid 속성 값을 가져옴
        var approvalID = $(this).data('approvalid');
        console.log(approvalID); // 콘솔에 출력
        // 여기에 추가로 할 작업을 추가할 수 있습니다.
        window.location = "approvalDetail?approvalID=" + approvalID
    });
    $('td#i_approval_title').on('click', function() {
        // 클릭된 요소의 data-approvalid 속성 값을 가져옴
        var approvalID = $(this).data('approvalid');
        console.log(approvalID); // 콘솔에 출력
        // 여기에 추가로 할 작업을 추가할 수 있습니다.
        window.location = "approvalDetail?approvalID=" + approvalID
    });
    $('td#co_approval_title').on('click', function() {
        // 클릭된 요소의 data-approvalid 속성 값을 가져옴
        var approvalID = $(this).data('approvalid');
        console.log(approvalID); // 콘솔에 출력
        // 여기에 추가로 할 작업을 추가할 수 있습니다.
        window.location = "approvalDetail?approvalID=" + approvalID
    });
    
    $('td#c_approval_createdTime').each(function() {
        var text = $(this).text(); // 원본 createdTime 텍스트 가져오기
        if (text.length > 10) {
            var truncatedText = text.substring(0, 10);
            $(this).text(truncatedText); // 10자까지 자른 텍스트로 설정하기
        }
    });
    
    $('td#i_approval\\.createdTime').each(function() {
        var text = $(this).text(); // 원본 createdTime 텍스트 가져오기
        if (text.length > 10) {
            var truncatedText = text.substring(0, 10);
            $(this).text(truncatedText); // 10자까지 자른 텍스트로 설정하기
        }
    });
    
    $('td#co_approval\\.createdTime').each(function() {
        var text = $(this).text(); // 원본 createdTime 텍스트 가져오기
        if (text.length > 10) {
            var truncatedText = text.substring(0, 10);
            $(this).text(truncatedText); // 10자까지 자른 텍스트로 설정하기
        }
    });
    
    $('.state').each(function() {
        var approvalStatus = $(this).text();
        var stateElement = $(this).closest('tr').find('.state'); // 상태 열이 있는 행에서 .state 요소를 찾음
        
        console.log("이거입니다",approvalStatus )

        if (approvalStatus === '진행 중') {
            stateElement.addClass('ongoing');
        } else if (approvalStatus === '보류') {
            stateElement.addClass('defer');
        } else if (approvalStatus === '거절') {
            stateElement.addClass('refuse');
        } else if (approvalStatus === '승인') {
            stateElement.addClass('approval');
        }
    });
    
});

function go_approval(element) {
	var approvalID = $().closest('.approvalCard').find('.approvalID').val();
    console.log(approvalID); // 콘솔에 출력
    // 여기에 추가로 할 작업을 추가할 수 있습니다.
    window.location = "approvalDetail?approvalID=" + approvalID;
}



</script>
</html>