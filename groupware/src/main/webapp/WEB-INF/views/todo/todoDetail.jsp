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
<div class="boardmain2">
	<div id="tDivMain2">
		<input type="button" id="btnMemberAdd" class="whiteBtn newBoard" value="멤버 관리"> 
		<input type="button" id="btnBoardDel" class="whiteBtn newBoard" value="보드 삭제">
		<div style="width:900px; height:20px; padding-top:20px; padding:10px;">
			현재 멤버: <c:forEach items="${member}" var="m" varStatus="status">
						<c:if test="${status.first}">${m.name} <div class="memberTodoEid divHidden">${m.eid}/</div></c:if>
						<c:if test="${!status.first}">, ${m.name} <div class="memberTodoEid divHidden">${m.eid}/</div></c:if>
					</c:forEach>
		</div>
		<div id="tdemp">
			<div class="todoOlc"><h4 style="margin-top:0;">관리부</h4>
				<c:forEach items="${emp1}" var="e">
					<p id="eid_${e.employeeid}" class="todoEmp1">${e.name} ${e.position}</p>
				</c:forEach>
			</div>
			<div class="todoOlc"><h4>영업부</h4>
				<c:forEach items="${emp2}" var="e">
					<p id="eid_${e.employeeid}" class="todoEmp1">${e.name} ${e.position}</p>
				</c:forEach>
			</div>
			<div class="todoOlc"><h4>생산부</h4>
				<c:forEach items="${emp3}" var="e">
					<p id="eid_${e.employeeid}" class="todoEmp1">${e.name} ${e.position}</p>
				</c:forEach>
			</div>
			
		</div>
		<div id="tDivMyboard2">
			<div id="todoMyid" class="divHidden">${tpost.todoid}</div>
			<div class="todoBoardName">${tpost.subject}</div>
			<c:forEach items="${selectTitle}" var="t">
				<div class="todoBoard">
					<div class='titlepadding'>
						<label>${t.todotitle}</label><div class="todoXbtn">X</div>
					</div>
					<div class="divHidden todotitle">${t.todotitle}/@#$%^@!</div>
					<div class="tcidMain">
						<div id="ttid_${t.todotitleid}" class="divHidden todotitleid">${t.todotitleid}/</div>
					</div>
					<div class="todoBoard0">
					+
					</div>
				</div>
			</c:forEach>
			<div class="todoBoard">
				<div class="todoBoard1">
				+
				</div>
			</div>
		</div>
	</div>	
</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="js/todoDetail.js"></script>
</html>