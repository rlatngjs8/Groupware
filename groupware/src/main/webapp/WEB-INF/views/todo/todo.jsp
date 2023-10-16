<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/todoCSS.css" rel="stylesheet" type="text/css"/>
<title>ToDo</title>
<%@ include file="../P_header.jsp" %>
</head>
<body style="font-size:14px; background-color:white;">
<div class="boardmain">
	<div id="tDivMain">
		<div class="todoBoardName"> 내 보드 </div>
		<div id="tDivMyboard1">
			<c:forEach items="${tlist}" var="t">
				<div class="iamboard boardAdd0 boardAdd2 drag-prevent">
					<div id="myboardid_${t.todoid}" class="subjectpadding tSubject">${t.subject}</div>
				</div>
			</c:forEach>
			<div class="boardAdd boardAdd0 boardAdd1 drag-prevent">
			+
			</div>
		</div>
	</div>	
</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="js/todo.js"></script>
</html>