<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/emailCSS.css" rel="stylesheet" type="text/css"/>
<title>받은메일함</title>
</head>
<style>
#mailFolder1 {color:black; font-weight:bold;}
#rmailTable {width:100%; border-collapse:collapse;}
#rmailTable td {height:28px; padding:0 20px 20px 40px; border:1px solid lightgray;}
</style>
<body>
<div style="display:flex; height: 100%;">
	<jsp:include page="mailLeftDiv.jsp"></jsp:include>
	<div id="mDivMain">
	<p id="mailSideTitle">받은메일함</p>
	<table id="rmailTable">
		<c:forEach items="${rlist}" var="r">
	<%-- 	${r.emailid} ${r.subject} ${r.content} ${r.senderemployeeid} ${r.receiveremployeeid} ${r.sendtime} --%>
		
		<tr><td>${r.senderemployeeid}</td><td>${r.subject}</td><td>${r.sendtime}</td></tr>
		</c:forEach>
	</table>
	</div>
</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

$(document)
.ready(function(){
});

</script>
</html>