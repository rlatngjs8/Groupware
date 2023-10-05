<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.mainSection {
	display: flex; /* Flexbox를 사용하여 요소들을 가로 배치합니다. */
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
.table1 {
    border: 0px solid rgb(0, 0, 0);
    border-image: none;
    width: 800px;
    font-family: malgun gothic,dotum,arial,tahoma;
    margin-top: 1px;
    border-collapse: collapse;
}
.td1{
	background: white;
    padding: 0px !important;
    border: 0px currentColor;
    border-image: none;
    height: 90px;
    text-align: center;
    color: black;
    font-size: 36px;
    font-weight: bold;
    vertical-align: middle;
}
</style>
<body>
<%@ include file="/WEB-INF/views/P_header.jsp"%>
<div class="mainSection">
	<div class="asidebar">
		<%@ include file="approvalHeader.jsp"%>
	</div>
	<h3 class="title">전자결재 작성</h3>
	<div class="writeForm" >
		<form action="/writeApprovalData" method="get">
		<table class="table1">
			<tr><td class="td1">업 무 기 안</td></tr>
		
		</table>
		</form>
	</div>
</div>
</body>
</html>