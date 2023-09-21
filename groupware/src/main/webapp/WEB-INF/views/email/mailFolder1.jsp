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
#rmailTable {width:100%; border-collapse:collapse; table-layout: auto; min-width:700px;}
#rmailTable td {height:28px; line-height:28px; padding:10px 20px 10px 40px; border:1px solid lightgray; border-width: 1px 0 0 0;}
#rmailTable tr {cursor:pointer;}
#rmailTable td:nth-child(1) {width:30px;}
#rmailTable td:nth-child(2) {width:100px;}
#rmailTable td:nth-child(4) {width:130px;}
#rmailTable tr:first-child td {border: none;}
#rmailTable tr:last-child td {border-width: 1px 0 1px 0;}
input[type=checkbox] {width: 16px; height: 16px; display:table-cell; vertical-align:middle; margin: 0 auto; cursor: pointer;}
.mline {border-style: solid; border-width: 1px 0 0 0; border-color:lightgray; margin:2px 0;}
#mDelete {width:45px; height:32px; border-radius:0; color:lightgray; border-color: lightgray;}
</style>
<body>
<div style="display:flex; height: 100%;">
<!-- 	<div style="width:210px; background-color: rgb(106, 176, 173);"></div> -->
	<jsp:include page="mailLeftDiv.jsp"></jsp:include>
	<div id="mDivMain">
		<p id="mailSideTitle">받은메일함</p>
		<c:if test='${rlist==""}'><p class="mline"></p><br><br><br><br><br><h2 style="text-align:center;">받은 메일이 없습니다.</h2></c:if>
		<c:if test='${rlist!=""}'>
		<div style="height:28px; padding:10px 0 10px 40px;">
			<input type="checkbox" name="chk" id="mCheckAll">
			&nbsp;&nbsp;&nbsp;<input type=button id="mDelete" class="whiteBtn" value="삭제">
		</div>
		<p class="mline"></p>
		<table id="rmailTable">
			<c:forEach items="${rlist}" var="r">
		<%-- 	${r.emailid} ${r.name} ${r.email} ${r.subject} ${r.content} ${r.senderemployeeid} ${r.receiveremployeeid} ${r.sendtime} --%>
			
			<tr>
				<td class="rMailChk"><input type="checkbox" class="mChk" name="mChk"></td>
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
	$('.erSendtime').addClass(function(index){
		return 'erSendtime' + index;
	});
	let erSendtime = $('.erSendtime').text();
	erSendtime = erSendtime.split("/");

 	for(let i=0;i<$('.erSendtime').length; i++){
 		$('.erSendtime'+i).html(erSendtime[i].slice(0,-3)); //초 삭제
	}
})
.on('click','#mCheckAll',function(){
	let checklist = [];
	if($('#mCheckAll').is(":checked")){
		$("input[name=mChk]").prop("checked", true);//prop으로 속성값 추가
	}
	else {
		$("input[name=mChk]").prop("checked", false);
	}
	$("input[name=mChk]:checked").each(function(i){
// 		let tp = $(this).siblings('#pid').text();  //같은 라인에 있는 형제를 가지고 오는 siblings (pid 체크)
// 		if(tp!=''){ //checkall의 값 제외
// 			checklist.push(tp);
// 		}
	});
	mailChklist = checklist;
})
.on('click','.mChk',function(){
	let chkL = $(".mChk").length;
	let chkchkL = $(".mChk:checked").length;
	if(chkL==chkchkL){
		$("#mCheckAll").prop("checked", true);
	} else {
		$("#mCheckAll").prop("checked", false);
	}
})
.on('click','#rmailTable tr',function(e){
// 	if($(e.target).hasClass("mChk") || $(e.target).hasClass("rMailChk") || $(e.target).attr("id")=="mCheckAll"){
//         return ;
//     }
	let tp = $(this).find('#rEmailid').text(); 
 	document.location="/mailDetail?eid="+tp;
});

</script>
</html>