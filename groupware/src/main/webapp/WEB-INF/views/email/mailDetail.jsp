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
<style>
.mailFileName {height:120px; line-height:120px;}
.mailFileContent {cursor:pointer; height:40px; line-height:40px; padding-left: 12px; padding-right: 12px;}
.mailFileContent:hover {background-color:#F2F2F2;}
#dmailTable {width:100%; border-collapse:collapse; table-layout: auto; min-width:700px; font-size:13px;}
#dmailTable td {height:28px; line-height:28px; padding:7px 20px 7px 40px;}
#dmailTable td:nth-child(1) {width:60px;}
#dmailTable td:nth-child(2) {padding:7px 20px 7px 0px;}
/* #dmailTable tr:last-child td:nth-child(1) {border:1px solid lightgray;} */
#emailbox2 {white-space: nowrap;}
</style>
<body style="font-size:14px; background-color:white;">
<div style="display:flex; height: 100%;">
	<jsp:include page="mailLeftDiv.jsp"></jsp:include>
	<div id="mDivMain">
	<!-- 	c:if 처리하기 -->
	<div id="mailNow" class="divHidden">${rs}</div>
	<c:if test='${rs=="receive"}'><p id="mailSideTitle">받은메일함</p></c:if>
	<c:if test='${rs=="send"}'><p id="mailSideTitle">보낸메일함</p></c:if>
	<c:if test='${rs=="trash"}'><p id="mailSideTitle">휴지통</p></c:if>
	<div style="height:28px; padding:10px 0 10px 30px;">
		<input type=button id="mAnswer" class="mFolderBtn2" value="답장">
		&nbsp;&nbsp;&nbsp;<input type=button id="mDelete" class="mFolderBtn2" value="삭제">
		<div id="rEmailid" class="divHidden">${dmail.emailid}</div>
	</div>
	<p class="mline"></p>
	<table id="dmailTable">
		<tr><td colspan=2 id="mdSubject"><h2 style="margin-bottom:5px;">${dmail.subject}</h2></td></tr>
		<tr><td style="font-weight:bold;">보낸사람</td><td id="namebox1"><label id="emailbox1" class="emailbox">${dmail2.name} &#60;${dmail2.email}&#62;</label></td></tr>
		<tr><td style="font-weight:bold;">받은사람</td>
		<td>
			<c:if test='${dlist==""}'><label id="emailbox2" class="emailbox">${dmail.name} &#60;${dmail.email}&#62;</label></c:if>
			<c:if test='${dlist!=""}'>
			<c:forEach items="${dlist}" var="d">
				<label id="emailbox2" class="emailbox">${d.name} &#60;${d.email}&#62;</label>
			</c:forEach>
			</c:if>
		</td></tr>
		<tr><td colspan=2 id="emailDate">${date}<div style="padding:7px;"></div><p class="mline"></td></tr>
		<tr><td colspan=2 style="padding-top:14px;">
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
		<tr><td colspan=2><div id="mailDContent" style="white-space: pre-line; overflow:hidden; text-overflow: ellipsis;">${dmail.content}</div></td></tr>
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
	if($('#mailSideTitle').text()=="받은메일함"){
		$('#mailFolder1').css({"color":"black","font-weight":"bold"});
	} else if($('#mailSideTitle').text()=="보낸메일함") {
		$('#mailFolder2').css({"color":"black","font-weight":"bold"});
	} else if($('#mailSideTitle').text()=="휴지통") {
		$('#trashcanFolder').css({"color":"black","font-weight":"bold"});
	}
	if($('#mailC1').text()==''){
		$('.mailFileContent').remove();
		$('.mailFileName').css({"height":"40px","line-height":"40px","cursor":"default"});
		$('.mailFileName').html("<label>첨부파일이 없습니다.</label>");
		$('.mailFileName label').css("color","");
	} else if ($('#mailC2').text()==''){
		$('#mailFileContent2, #mailC2').remove();
		$('#mailFileContent3, #mailC3').remove();
		$('.mailFileName').css({"height":"40px","line-height":"40px","cursor":"pointer"});
	} else if ($('#mailC3').text()==''){
		$('#mailFileContent3, #mailC3').remove();
		$('.mailFileName').css({"height":"80px","line-height":"80px","cursor":"pointer"});
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
.on('click','#mAnswer',function(){
// 	document.location="/mailWrite2?email="+$('#emailbox1').text();
	//0925
	let name = $('#namebox1').text();
	let email = $('#emailbox1').text();
	let email2 = $('#emailbox2').text();
	let emailDate = $('#emailDate').text();
	let subject = "Re: "+$('#mdSubject').text();
	let content = $('#mailDContent').text();
	$.ajax({url:'/mdAnswer',data:{name:name,email:email,email2:email2,emailDate:emailDate,subject:subject,content:content},type:'post',dataType:'text',
		success:function(data){
			console.log("/mdAnswer 성공");	
			document.location="/mailWrite2";
		},
		error:function(data){
			alert("/mdAnswer 오류");
		}
	});
})
.on('click','#mDelete',function(){
	console.log($('#rEmailid').text());
	$.ajax({url:'/mdDelete',data:{emailid:$('#rEmailid').text(),now:$('#mailNow').text()},type:'post',dataType:'text',
		success:function(data){
			console.log("/mdDelete 성공");	
			if($('#mailNow').text()=="receive"){
				document.location="/mailFolder1";
			} else if($('#mailNow').text()=="send") {
				document.location="/mailFolder2";
			} else if($('#mailNow').text()=="trash") {
				document.location="/mailFolder2";
			}
		},
		error:function(data){
			alert("/mdDelete 오류");
		}
	});
})
.on('click','.mailFileContent',function(){
	let thistext = $(this).find('.efileHidden').text();
// 	console.log(thistext);
	document.location="/mailFiledownload?attachment="+thistext;
});
</script>
</html>