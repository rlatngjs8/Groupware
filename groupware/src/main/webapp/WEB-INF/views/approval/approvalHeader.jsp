<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.asidebar {
	margin-left: 220px;
	height: 100%;
	width: 225px;
	position: fixed;
	top: 0;
	left: 0;
	background-color: #fff;
	padding-top: 20px;
	border-right: 1px solid #c0c0c0;
	order: 1;
	text-align: left;
	/* .asidebar의 스타일을 지정합니다. */
}

.newApproval {
	overflow: hidden;
	transition: all 0.3s ease;
	padding: 13px 50px;
	font-size: 15px;
	cursor: pointer;
	outline: none;
	box-shadow: 0 2px 3px rgba(0, 0, 0, 0.05);
	width: 200px;
	height: 50px;
	border-radius: 4px;
	border: 1px solid #c0c0c0;
	background: #fff;
}

.newApproval:hover {
	background: rgb(106, 176, 173);
	border: 1px solid #c0c0c0;
	color: #fff;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.sidebarMenu {
	margin-top: 70px;
}

.appSub {
	margin-left: 25px;
	letter-spacing: 1px;
	line-height: 2;
	font-size: 15px;
}
/* .appSub:hover { */
/* 	background-color: #ccc; /* hover 상태에서 배경색 변경 */ 
/* 	cursor: pointer; */
/* } */

.apphome {
	letter-spacing: 1px;
	line-height: 3.5;
	font-size: 22px;
	font-weight: bold;
}
</style>
</head>
<body>
	<a href="/approval" id="apphome" class="apphome">전자결재</a>
	<button class="newApproval" id="newApproval">새 결제 작성</button>
	<div class="sidebarMenu">
		<p style="font-size: 17px; letter-spacing: 1px;">결재하기</p>
		<a href="/arriveApproval" class="appSub">결재 대기 문서</a><br><!-- 나한테 온것들(미완) --> 
		<a href="/comeApproval" class="appSub">결재 수신 문서</a><br> <!-- 나한테 온것들(완료) -->
		<a href="/sendApproval" class="appSub">결재 발송 문서</a><!-- 내가 쓴것(미완,완료)	  -->
	</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$('#newApproval').click(function(){
	window.location.href="/writeApproval";
})
</script>
</html>