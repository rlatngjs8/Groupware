<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/emailCSS.css" rel="stylesheet" type="text/css"/>
<title>받은메일함</title>
<%@ include file="../P_header.jsp" %>
</head>
<style>
#mailFolder1 {color:black; font-weight:bold;}
#rmailTable {width:100%; border-collapse:collapse; table-layout: auto; min-width:700px;}
#rmailTable td {height:28px; line-height:28px; padding:10px 20px 10px 40px; border:1px solid lightgray; border-width: 1px 0 0 0;}
#rmailTable tr {cursor:pointer;}
#rmailTable td:nth-child(1) {width:30px;}
#rmailTable td:nth-child(2) {width:30px; padding:0;}
#rmailTable td:nth-child(3) {width:100px;}
#rmailTable td:nth-child(5) {width:130px;}
#rmailTable tr:first-child td {border: none;}
#rmailTable tr:last-child td {border-width: 1px 0 1px 0;}
input[type=checkbox] {width: 16px; height: 16px; vertical-align:middle; margin: 0 auto; cursor: pointer;}
#emailReadImg {width: 20px; height: 20px; vertical-align:middle;}
</style>
<body style="font-size:14px; background-color:white;">
<div style="display:flex; height: 100%;">
<!-- 	<div style="width:210px; background-color: rgb(106, 176, 173);"></div> -->
	<jsp:include page="mailLeftDiv.jsp"></jsp:include>
	<div id="mDivMain">
		<p id="mailSideTitle">받은메일함</p>
		<c:if test='${rlist==""}'><p class="mline"></p><br><br><br><br><br><h2 style="text-align:center;">받은 메일이 없습니다.</h2></c:if>
		<c:if test='${rlist!=""}'>
		<div style="height:28px; padding:10px 0 10px 40px;">
			<input type="checkbox" name="chk" id="mCheckAll">
			&nbsp;&nbsp;&nbsp;<input type=button id="mRead" class="whiteBtn mFolderBtn" value="읽음">
			&nbsp;&nbsp;&nbsp;<input type=button id="mDelete" class="whiteBtn mFolderBtn" value="삭제">
		</div>
		<p class="mline"></p>
		<table id="rmailTable">
			<c:forEach items="${rlist}" var="r">
		<%-- 	${r.emailid} ${r.name} ${r.email} ${r.subject} ${r.content} ${r.senderemployeeid} ${r.receiveremployeeid} ${r.sendtime} --%>
			
			<tr>
				<td class="rMailChk"><input type="checkbox" class="mChk" name="mChk"></td>
				<td class="rMailReadOrNot">
					<div class="divHidden emailReceive">${r.emailReceive}</div>
					<div id="emailReadImg">
						<c:if test='${r.emailReceive=="0"}'><img src='mailpageImg/mailIcon0.png'></c:if>
						<c:if test='${r.emailReceive!="0"}'><img src='mailpageImg/mailIcon1.png'></c:if>
					</div>
				</td>
				<td id="rMailName">${r.name}</td>
				<td id="rMailTitle">${r.subject}<div id="rEmailid" class="divHidden">${r.emailid}</div></td>
				<td class="erSendtime">${r.sendtime}/</td>
			</tr>
			</c:forEach>
		</table>
		</c:if>
	</div>
</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
let mailChklist = [];

$(document)
.ready(function(){
	$('.mFolderBtn').css("width","45px");
	$('.erSendtime').addClass(function(index){
		return 'erSendtime' + index;
	});
	let erSendtime = $('.erSendtime').text();
	erSendtime = erSendtime.split("/");

 	for(let i=0;i<$('.erSendtime').length; i++){
 		$('.erSendtime'+i).html(erSendtime[i].slice(0,-3)); //초 삭제
	}
 	for(let i=0;i<$('.emailReceive').length; i++){ //안 읽은 메일 굵게
 		if($('.emailReceive:eq('+i+')').text()=="0"){
 			$('.emailReceive:eq('+i+')').parent().siblings('#rMailName, #rMailTitle').css('font-weight','bold');
 		}
	}

})
.on('click','#mCheckAll',function(){
	let checklist = [];
	if($('#mCheckAll').is(":checked")){
		$("input[name=mChk]").prop("checked", true);//prop으로 속성값 추가
		$('#mDelete, #mRead').css({"color":"black","border-color":"black","cursor":"pointer"});
	}
	else {
		$("input[name=mChk]").prop("checked", false);
		$('#mDelete, #mRead').css({"color":"lightgray","border-color":"lightgray","cursor":"default"});
	}
// 	$("input[name=mChk]:checked").each(function(i){
// 		let tp = $(this).siblings('#pid').text();  //같은 라인에 있는 형제를 가지고 오는 siblings (pid 체크)
// 		if(tp!=''){ //checkall의 값 제외
// 			checklist.push(tp);
// 		}
// 	});
	mailChklist = checklist;
})
.on('click','.mChk',function(){
	let chkL = $(".mChk").length;
	let chkchkL = $(".mChk:checked").length;
	console.log($(this).parent().siblings().children('.emailReceive').text());
	let nowRead = $(this).parent().siblings().children('.emailReceive').text();

	if(nowRead=="1"){
		$('#mRead').val("안 읽음");
		$('#mRead').css("width","60px");
		cnt=1;
	} else if(nowRead=="0"){
		$('#mRead').val("읽음");
		$('#mRead').css("width","45px");
		
	}
		
	if(chkL==chkchkL){
		$("#mCheckAll").prop("checked", true);
	} else {
		$("#mCheckAll").prop("checked", false);
	}
	if($('.mChk').is(":checked")){
		$('#mDelete, #mRead').css({"color":"black","border-color":"black","cursor":"pointer"});
	} else {
		$('#mDelete, #mRead').css({"color":"lightgray","border-color":"lightgray","cursor":"default"});
	}
})
.on('click','#rmailTable tr',function(e){
	if($(e.target).hasClass("mChk") || $(e.target).hasClass("rMailChk")){
        return ;
    }
	let tp = $(this).find('#rEmailid').text(); 
	
	$.ajax({url:'/mailRead', data:{eid:tp}, type:'post',
		success:function(data){
			console.log("/mailRead 성공");
		 	document.location="/mailDetail?eid="+tp; 
		},
		error:function(data){
			alert("오류");
			return false;
		}
	});
});

</script>
</html>