<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script src="js/approval/approvalHeader.js"></script> -->
<link href='css/approval/approvalHeader.css' rel='stylesheet' />
<title>Insert title here</title>
</head>
<body>
	<a href="/approval" id="apphome" class="apphome">전자결재</a>
	<button class="newApproval" id="newApproval">새 결제 작성</button>
	<div class="sidebarMenu">
		<p style="font-size: 17px; letter-spacing: 1px;">결재하기</p>
		<a href="/arriveApproval" class="appSub">결재 대기 문서</a><br>
		<!-- 나한테 온것들(미완) -->
		<a href="/comeApproval" class="appSub">결재 수신 문서</a><br>
		<!-- 나한테 온것들(완료) -->
		<a href="/sendApproval" class="appSub">결재 발송 문서</a>
		<!-- 내가 쓴것(미완,완료)	  -->
	</div>
</body>
<script>
$('#newApproval').click(function(){
	window.location.href="/writeApproval";
})
</script>
</html>