<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/emailCSS.css" rel="stylesheet" type="text/css"/>
<title>보낸메일함</title>
<%@ include file="../P_header.jsp" %>
</head>
<style>
#mailFolder2 {color:black; font-weight:bold;}
input[type=checkbox] {width: 16px; height: 16px; vertical-align:middle; margin: 0 auto; cursor: pointer;}
#emailReadImg {width: 20px; height: 20px; vertical-align:middle;}
</style>
<body style="font-size:14px; background-color:white;">
<div style="display:flex; height: 100%;">
<!-- 	<div style="width:210px; background-color: rgb(106, 176, 173);"></div> -->
	<jsp:include page="mailLeftDiv.jsp"></jsp:include>
	<div id="mDivMain">
		<p id="mailSideTitle">보낸메일함</p>
		<c:if test='${rlist==""}'><p class="mline"></p><br><br><br><br><br><h2 style="text-align:center;">보낸 메일이 없습니다.</h2><br><br><br><br><br><br><br><br><br></c:if>
		<c:if test='${rlist!=""}'>
		<div style="height:28px; padding:10px 0 10px 40px;">
			<input type="checkbox" name="mChkAll" id="mCheckAll">
			&nbsp;&nbsp;&nbsp;<input type=button id="mRead" class="mFolderBtn" value="읽음">
			&nbsp;&nbsp;&nbsp;<input type=button id="mDelete" class="mFolderBtn" value="삭제">
		</div>
		<p class="mline"></p>
		<table id="rmailTable">
			<c:forEach items="${rlist}" var="r">
		<%-- 	${r.emailid} ${r.name} ${r.email} ${r.subject} ${r.content} ${r.senderemployeeid} ${r.receiveremployeeid} ${r.sendtime} --%>
			
			<tr>
				<td class="rMailChk"><input type="checkbox" class="mChk" name="mChk"><div id="rEmailid" class="divHidden">${r.emailid}</div></td>
				<td class="rMailReadOrNot">
					<div class="divHidden emailReceive">${r.emailReceive}</div>
					<div id="emailReadImg">
						<c:if test='${r.emailReceive=="0"}'><img src='mailpageImg/mailIcon0.png'></c:if>
						<c:if test='${r.emailReceive!="0"}'><img src='mailpageImg/mailIcon1.png'></c:if>
					</div>
				</td>
				<td id="rMailName">${r.name}</td>
				<td id="rMailTitle">${r.subject}</td>
				<td class="erSendtime">${r.sendtime}/</td>
			</tr>
			</c:forEach>
		</table>
		</c:if>
		<div id="mailPageDiv">
			<input type=button id="mPrev" class="mFolderBtn2" value="이전">
			&nbsp;${pagestr}&nbsp;
			<input type=button id="mNext" class="mFolderBtn2" value="다음"></div>
		<br><br>
	</div>
</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
let mailChklist = [];
let mChkFirst;
let mChkStart;
$(document)
.ready(function(){
	window.location;
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
 	if($('#mailPno').text()=="1"){
 		$('#mPrev').css({"color":"lightgray","border-color":"lightgray"});
 	}
 	if($('#mailPno').text()==$('#mailPcnt').text()){
 		$('#mNext').css({"color":"lightgray","border-color":"lightgray"});
 	}

})
.on('click','#mNext',function(){
// 	if()
	$.ajax({url:'/mailNext',type:'post',dataType:'text',
		success:function(data){
			if(data=="noMove"){
				return false;
			}
			console.log("/mailNext 성공");	
			document.location="/mailFolder1?pageno="+data;
		},
		error:function(data){
			alert("/mailNext 오류");
		}
	});
})
.on('click','#mPrev',function(){
	$.ajax({url:'/mailPrev',type:'post',dataType:'text',
		success:function(data){
			if(data=="noMove"){
				return false;
			}
			console.log("/mailPrev 성공");
			document.location="/mailFolder1?pageno="+data;
		},
		error:function(data){
			alert("/mailPrev 오류");
		}
	});
})	
.on('click','#mCheckAll',function(){
// 	let checklist = [];
	if($('#mCheckAll').is(":checked")){
		$("input[name=mChk]").prop("checked", true);//prop으로 속성값 추가
		$('#mDelete, #mRead').css({"color":"black","border-color":"black","cursor":"pointer"});
	}
	else {
		$("input[name=mChk]").prop("checked", false);
		$('#mDelete, #mRead').css({"color":"lightgray","border-color":"lightgray","cursor":"default"});
	}
	$("input[name=mChk]:checked").each(function(i){
		let nowRead = $(this).parent().siblings().children('.emailReceive').text();
		if(nowRead=="1"){
			$('#mRead').val("안 읽음");
			$('#mRead').css("width","60px");
		}
		if(nowRead=="0"){
			$('#mRead').val("읽음");
			$('#mRead').css("width","45px");
			return false;
		}
	});
})
.on('click','.mChk',function(){
// 	let checklist = [];
	
	let chkL = $(".mChk").length;
	let chkchkL = $(".mChk:checked").length;
// 	console.log($(this).parent().siblings().children('.emailReceive').text()); //0은 안읽음 1은 읽음 2는 삭제	
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
	
	if (event.shiftKey){
		console.log("A");
// 		let now = $(this).parent().siblings().children('.emailReceive').text();
		console.log($(".mChk").index(this));
		let mChk1 = $(".mChk").index(this);
// 		console.log($("input[name=mChk]:checked").lastIndex());
		if(mChkStart>mChk1){
			let temp = mChk1;
			mChk1 = mChkStart;
			mChkStart = temp;
		}
		$("input[name=mChk]").each(function(i){ //mChkFirst부터 mChk 까지 체크하는 문 만들기
			if(i>mChkStart && i<mChk1){
				if($(".mChk:eq("+mChkStart+")").is(":checked") && $(".mChk:eq("+mChk1+")").is(":checked")){
					$(".mChk:eq("+i+")").prop("checked", true);
				} else if (!$(".mChk:eq("+mChkStart+")").is(":checked") && !$(".mChk:eq("+mChk1+")").is(":checked")) {
					$(".mChk:eq("+i+")").prop("checked", false);
				}	
			}
		});
	} 
	mChkStart = $(".mChk").index(this);
	
// 	console.log(mChkStart+"ANC");
	
	$("input[name=mChk]:checked").each(function(i){
		let nowRead = $(this).parent().siblings().children('.emailReceive').text();
		if(nowRead=="1"){
			$('#mRead').val("안 읽음");
			$('#mRead').css("width","60px");
		}
		if(nowRead=="0" || chkchkL==0){
			$('#mRead').val("읽음");
			$('#mRead').css("width","45px");
			return false;
		}
	});
})
.on('click','#mRead',function(){
	let checklist = [];
	$("input[name=mChk]:checked").each(function(i){
		let tp = $(this).siblings('#rEmailid').text(); 
		console.log(tp);
		if(tp!=''){	
			checklist.push(tp);
		}
	});
	mailChklist = checklist;
	if($('#mRead').val()=="읽음"){
		$.ajax({url:'/mailRead',data:{mailChklist:JSON.stringify(mailChklist)},type:'post',dataType:'text',
			success:function(data){
				console.log("/mailRead 성공");	
				location.reload();
			},
			error:function(data){
				alert("/mailRead 오류");
			}
		});
	}
	if($('#mRead').val()=="안 읽음"){
		$.ajax({url:'/mailNotRead',data:{mailChklist:JSON.stringify(mailChklist)},type:'post',dataType:'text',
			success:function(data){
				console.log("/mailNotRead 성공");	
				location.reload();
			},
			error:function(data){
				alert("/mailRead 오류");
			}
		});
	}
})
.on('click','#mDelete',function(){
	let checklist = [];
	$("input[name=mChk]:checked").each(function(i){
		let tp = $(this).siblings('#rEmailid').text(); 
		console.log(tp);
		if(tp!=''){	
			checklist.push(tp);
		}
	});
	mailChklist = checklist;
	$.ajax({url:'/mailDelete',data:{mailChklist:JSON.stringify(mailChklist)},type:'post',dataType:'text',
		success:function(data){
			console.log("/mailDelete 성공");	
			location.reload();
		},
		error:function(data){
			alert("/mailRead 오류");
		}
	});
})
.on('click','#rmailTable tr',function(e){
	if($(e.target).hasClass("mChk") || $(e.target).hasClass("rMailChk")){
        return ;
    }
	let tp = $(this).find('#rEmailid').text(); 
	
	$.ajax({url:'/mailReadUpdate', data:{eid:tp}, type:'post',
		success:function(data){
			console.log("/mailReadUpdate 성공");
		 	document.location="/mailDetail?eid="+tp; 
		},
		error:function(data){
			alert("오류");
			return false;
		}
	});
});

window.onpageshow = function(event) { //뒤로가기 감지
    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
    	location.reload();
        console.log('back button event');
    }
}

</script>
</html>