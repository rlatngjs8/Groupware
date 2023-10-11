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
<style>
.boardAdd0 {width:246px; height:100px; float:left;
			border-radius:8px; margin:10px 10px 10px 0; padding:10px;}
.boardAdd1 {line-height:100px; text-align:center; font-size:28px; color:gray; 
			cursor:pointer; border: 1px dashed gray;}
.boardAdd1:hover {border:1px solid rgba(106, 176, 173, 0.1); background-color:rgba(106, 176, 173, 0.1);}
.boardAdd2 {border: 1px solid gray;}
.iamboard {transition-duration: 0.2s; cursor:pointer}
.iamboard:hover {transform: translateY(-3px); box-shadow: 0 3px 5px -3px #B3BDBD;}
#newboardtitle {width:238px;}
#tDivMyboard>div {display:inline-block;}
.subjectpadding{padding-top:10px; height:25px;}
</style>
<body style="font-size:14px; background-color:white;">
<div class="boardmain">
	<div id="tDivMain">
		<div class="todoBoardName"> 내 보드 </div>
		<div id="tDivMyboard">
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
<script>

$(document)
.on('keydown','#newboardtitle',function(e){
    if(e.keyCode == 13) {
    	$("#btnAddOK").click();
    }   
})
.on('click','.boardAdd1',function(){
	$('.boardAdd').html("<div style='padding-top:10px; height:25px;'>이름</div>"
	+"<div><input id='newboardtitle' class='todobasic'></div><div style='padding-top:10px; height:25px;'>"
		+"<input type=button id='btnAddOK' class='todoBtn1 bcM cWhite' value='확인'> "
		+"<input type=button id='btnAddNO' class='todoBtn1 bcLg' value='취소'></div>");
	$('.boardAdd').removeClass("boardAdd1");
	$('.boardAdd').addClass("boardAdd2");
	$('#newboardtitle').focus();
	$('#newboardtitle').val('새 보드');
})
.on('click','#btnAddOK',function(){
	let newboardtitle = $('#newboardtitle').val()
	console.log(newboardtitle.length);
	if(newboardtitle.length>50){
		alert("제목은 50글자 이하로 작성해 주십시오.")
		return false;
	} else {
		$.ajax({url:'/newboardTitleAdd',data:{subject:newboardtitle}, type:'post',dataType:'text',
			success:function(data){
				console.log("/newboardTitleAdd 성공");
				location.reload();
			},
			error:function(data){
				alert("/newboardTitleAdd 오류");
			}
		});
	}
})
.on('click','#btnAddNO',function(){
	$('.boardAdd').html("+");
	$('.boardAdd').removeClass("boardAdd2");
	$('.boardAdd').addClass("boardAdd1");
})
.on('click','.iamboard',function(e){
	let tp =  $(this).find('.tSubject').attr('id');
	tp = tp.substring(10); // todoid
	console.log(tp);
	document.location="/todoDetail?tid="+tp; 
});

</script>
</html>