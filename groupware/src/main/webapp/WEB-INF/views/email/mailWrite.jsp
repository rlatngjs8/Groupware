<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<p id="mailSideTitle">메일쓰기</p>
		<br>
		<input type="button" id="btnMailSend" class="whiteBtn" value="보내기">
		<br><br>
		<table id="mailTableW">
		<tr><td>받는사람</td><td><div id="divInputEmail"><input type=text autofocus id="mInputEmail" class="mInputEmail" value="${email}"></div></td></tr>
		<tr><td>제목</td><td><div class="divInputE"><input type=text id="mInputTitle" class="mInputText" value="${subject}"></div></td></tr>
		<tr><td>파일첨부</td><td><label for="mailFile" id="mFileLabel">파일선택</label><input type=file id="mailFile" class="mInputText" multiple></td></tr>
		<tr><td></td><td><div class="mailFileName2 mailFileName"><label>파일은 3개까지 선택 가능합니다.</label></div></td></tr>
		<tr><td colspan=2><textarea rows=27 id="mInputContent" class="font_rnffla">${content2}${content}</textarea></td></tr>
		</table>
	</div>
</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="js/email2.js"></script>
</html>