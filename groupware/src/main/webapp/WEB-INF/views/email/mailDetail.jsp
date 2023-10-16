<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/emailCSS.css" rel="stylesheet" type="text/css"/>
<title>메일</title>
<%@ include file="../P_header.jsp" %>
</head>
<body style="font-size:14px; background-color:white;">
<div style="display:flex; height: 100%;">
	<jsp:include page="mailLeftDiv.jsp"></jsp:include>
	<div id="mDivMain">
	<div id="mailNow" class="divHidden">${rs}</div>
	<c:if test='${trs=="tS"}'><div id="mailNow2" class="divHidden">tS</div></c:if>
	<c:if test='${trs=="tR"}'><div id="mailNow2" class="divHidden">tR</div></c:if>
	<c:if test='${trs=="mS"}'><div id="mailNow2" class="divHidden">mS</div></c:if>
	<c:if test='${trs=="mR"}'><div id="mailNow2" class="divHidden">mR</div></c:if>
	<c:if test='${rs=="receive"}'><p id="mailSideTitle">받은메일함</p></c:if>
	<c:if test='${rs=="send"}'><p id="mailSideTitle">보낸메일함</p></c:if>
	<c:if test='${rs=="trash"}'><p id="mailSideTitle">휴지통</p></c:if>
	<c:if test='${rs=="mark"}'><p id="mailSideTitle">중요메일함</p></c:if>
	<div style="height:28px; padding:10px 0 10px 30px;">
		<input type=button id="mdAnswer" class="mFolderBtn2" value="답장">
		&nbsp;&nbsp;&nbsp;<input type=button id="mdDelete" class="mFolderBtn2" value="삭제">
		<div id="rEmailid" class="divHidden">${dmail.emailid}</div>
	</div>
	<p class="mline"></p>
	<table id="dmailTable">
		<tr><td colspan=2 id="mdSubject"><h2 style="margin-bottom:5px;">${dmail.subject}</h2></td></tr>
		<tr><td style="font-weight:bold;">보낸사람</td><td id="namebox1"><label id="emailbox1" class="emailbox">${dmail2.name} ＜${dmail2.email}＞</label></td></tr>
		<tr><td style="font-weight:bold;">받은사람</td>
		<td>
			<c:if test='${dlist==""}'><label id="emailbox2" class="emailbox">${dmail.name} ＜${dmail.email}＞</label></c:if>
			<c:if test='${dlist!=""}'>
			<c:forEach items="${dlist}" var="d">
				<label id="emailbox2" class="emailbox">${d.name} ＜${d.email}＞</label>
			</c:forEach>
			</c:if>
		</td></tr>
		<tr><td colspan=2 id="emailDate">${date}<div style="padding:7px;"></div><p class="mline"></td></tr>
		<tr><td colspan=2 style="padding-top:14px;">
			<div class="mailFileName1 mailFileName">
				<div id="mailFileContent1" class="mailFileContent">
					<div id="mailC1">${C1}</div>
					<div class="divHidden efileHidden">${dmail.attachment1}</div>
				</div>
				<div id="mailFileContent2" class="mailFileContent">
					<div id="mailC2">${C2}</div>
					<div class="divHidden efileHidden">${dmail.attachment2}</div>
				</div>
				<div id="mailFileContent3" class="mailFileContent">
					<div id="mailC3">${C3}</div>
					<div class="divHidden efileHidden">${dmail.attachment3}</div>
				</div>
			</div>
		</td></tr>
		<tr><td colspan=2><div id="mailDContent" style="white-space: pre-line; overflow:hidden; text-overflow: ellipsis;">${dmail.content}</div></td></tr>
	</table>
	</div>
</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="js/email2.js"></script>
</html>