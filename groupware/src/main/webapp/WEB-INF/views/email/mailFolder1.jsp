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
#rmailTable {width:100%; border-collapse:collapse;}
#rmailTable td {height:28px; line-height:28px; padding:10px 20px 10px 40px; border:1px solid lightgray; border-width: 1px 0 0 0;}
#rmailTable tr {cursor:pointer;}
#rmailTable tr:last-child td {border-width: 1px 0 1px 0;}
</style>
<body>
<div style="display:flex; height: 100%;">
	<jsp:include page="mailLeftDiv.jsp"></jsp:include>
	<div id="mDivMain">
	<p id="mailSideTitle">받은메일함</p>
	<table id="rmailTable">
		<c:forEach items="${rlist}" var="r">
	<%-- 	${r.emailid} ${r.name} ${r.email} ${r.subject} ${r.content} ${r.senderemployeeid} ${r.receiveremployeeid} ${r.sendtime} --%>
		
		<tr><td>${r.name}</td><td id="rMailTitle">${r.subject}<div id="rEmailid" class="divHidden">${r.emailid}</div></td><td class="erSendtime">${r.sendtime}/</td></tr>
		</c:forEach>
	</table>
	</div>
</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

$(document)
.ready(function(){
	$('.erSendtime').addClass(function(index){
		return 'erSendtime' + index;
	});
	
	let erSendtime = $('.erSendtime').text();
	erSendtime = erSendtime.split("/");
// 	erSendtime = erSendtime.slice(0,-1);
//  	console.log(erSendtime);
 	for(let i=0;i<$('.erSendtime').length; i++){
 		$('.erSendtime'+i).html(erSendtime[i].slice(0,-3)); //초 삭제
	}
})
.on('click','#rmailTable tr',function(){
	let tp = $(this).find('#rEmailid').text(); 
 	console.log(tp);
 	document.location="/mailDetail?eid="+tp;
});

</script>
</html>