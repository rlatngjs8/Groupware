<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/emailCSS.css" rel="stylesheet" type="text/css"/>
<title>전체메일함</title>
</head>
<style>
#mailFolder0 {color:black; font-weight:bold;}
</style>
<body>
<div style="display:flex; height: 100%;">
	<jsp:include page="mailLeftDiv.jsp"></jsp:include>
	<div id="mDivMain">
<%-- 	<div id="mailMyEmpID" class="divHidden">${empID}</div> --%>
	전체메일함
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