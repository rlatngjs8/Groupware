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
<style>
#rmailTable {width:100%; border-collapse:collapse;}
.mailFileName {height:120px; line-height:120px;}
#mailFolder1 {color:black; font-weight:bold;}
.mailFileContent {cursor:pointer; height:40px; line-height:40px;}
</style>
<body style="font-size:14px; background-color:white;">
<div style="display:flex; height: 100%;">
	<jsp:include page="mailLeftDiv.jsp"></jsp:include>
	<div id="mDivMain">
	<!-- 	c:if 처리하기 -->
	<p id="mailSideTitle">받은메일함</p>
	<div style="height:28px; padding:10px 0 10px 10px;">
			&nbsp;&nbsp;&nbsp;<input type=button id="mDelete" class="whiteBtn" value="삭제">
	</div>
	<p class="mline"></p>
	<table id="rmailTable">
		<tr><td>보낸사람</td><td>${dmail2.name}</td></tr>
		<tr><td>받은사람</td><td>${dmail.name}</td></tr>
		<tr><td>${dmail.subject}</td></tr>
		<tr><td>${dmail.sendtime}</td></tr>
		<tr><td colspan=2>
			<div class="mailFileName">
<%-- 			<a href="img path" download="download file name></a>  --%>
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
		<tr><td><div id="mailDContent" style="white-space: pre-line; overflow:hidden; text-overflow: ellipsis;">${dmail.content}</div></td></tr>
	</table>
	</div>
</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
let mailFileContent1 = $('#mailFileContent1').text();
let mailFileContent2 = $('#mailFileContent2').text();
let mailFileContent3 = $('#mailFileContent3').text();

$(document)
.ready(function(){
	if($('#mailC1').text()==''){
		$('.mailFileContent').remove();
		$('.mailFileName').css({"height":"40px","line-height":"40px"});
		$('.mailFileName').text("첨부파일이 없습니다.");
	} else if ($('#mailC2').text()==''){
		$('#mailFileContent2, #mailC2').remove();
		$('#mailFileContent3, #mailC3').remove();
		$('.mailFileName').css({"height":"40px","line-height":"40px"});
	} else if ($('#mailC3').text()==''){
		$('#mailFileContent3, #mailC3').remove();
		$('.mailFileName').css({"height":"80px","line-height":"80px"});
	}
    
	//
	let C1 = $('#mailC1').text();
	let C2 = $('#mailC2').text();
	let C3 = $('#mailC3').text();
	C1 = C1.substring(C1.indexOf(".")+1);
	C2 = C2.substring(C2.indexOf(".")+1);
	C3 = C3.substring(C3.indexOf(".")+1);
 	$('#mailC1').text(C1);
	$('#mailC2').text(C2);
	$('#mailC3').text(C3);
	//
})
.on('click','.mailFileContent',function(){
	let thistext = $(this).find('.efileHidden').text();
// 	console.log(thistext);
	document.location="/mailFiledownload?attachment="+thistext;
// 	document.location="/filedownload.do";
});
</script>
</html>