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
.todoBoard {width:206px; height:auto; max-height:85%; float:left; border:none;
 			margin:10px 10px 10px 0; padding:10px; background-color: #EAEAEA; overflow:hidden;}
.todoBoard0 {height:30px; line-height:30px; text-align:center; font-size:28px; color:gray;
			cursor:pointer; border: 1px dashed gray; margin-top:5px; padding-bottom:5px;}
.todoBoard0:hover {background-color:lightgray;}
.todoBoard1 {height:30px; line-height:30px; text-align:center; font-size:28px; color:gray;
			cursor:pointer; padding-bottom:5px;}
.todoBoardContentTitle{height:30px; line-height:30px; text-align:center; color:black;  background-color:white;
				cursor:pointer; margin-bottom:5px; margin-right:4px;}
.titlepadding {padding-top:5px; height:30px; padding-bottom:3px;}
#tdemp {position:absolute; display:none; border: 1px solid gray; padding:15px; 
			background-color:white; width:240px; cursor:pointer;}
#tdemp p{padding:0; margin:0; margin-top:2px;}
.todoOlc{border-bottom:1px solid gray; padding-bottom:20px;} 
.todoMenuImg{width:18px;height:17px;}
.todoEmp1 {background-color:white}
.todoEmp1:hover{background-color:lightgray;}
.todoEmp2 {background-color:rgba(106, 176, 173, 0.2); cursor:pointer;}
#newboardContentTitle {width:200px; height:100px;}
#tcidMain {height:auto; max-height:560px; overflow:auto;}
#tDivMain {height:100%;}
#tDivMyboard {height:90%;}
</style>
<body style="font-size:14px; background-color:white;">
<div class="boardmain">
	<div id="tDivMain">
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
		<div id="tDivMyboard">
			<div id="todoMyid" class="divHidden">${tpost.todoid}</div>
			<div class="todoBoardName">${tpost.subject}</div>
			<div class="todoBoard">
				<div class='titlepadding'>
					<label>진행</label><div style="display:inline; float:right;"><img src='mailpageImg/todomenu.png' class="todoMenuImg"></div>
				</div>
				<div id="tcidMain">
				<c:forEach items="${selectTC}" var="tc">
					<div id="tcid_${tc.todocontentid}" class="todoBoardContentTitle">${tc.todotitle}</div>
				</c:forEach>
				</div>
				<div class="todoBoard0">
				+
				</div>
			</div>
			<div class="todoBoard">
				<div class='titlepadding'>
					<label>완료</label><div style="display:inline; float:right;"><img src='mailpageImg/todomenu.png' class="todoMenuImg"></div>
				</div>
				<div class="todoBoard0">
				+
				</div>
			</div>
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
<script>
let checklist = [];
$(document)
.ready(function(){
	let eids = $('.memberTodoEid').text();
	eids = eids.split("/");
	for(let i=0; i<eids.length-1; i++){
		checklist.push(eids[i]);
	}
	console.log(checklist);
})
.on('keydown','#newboardContentTitle',function(e){
    if(e.keyCode == 13) {
    	$("#btnAddOK").click();
    }   
})
.on('click','#btnMemberAdd',function(){
	for(let i = 0; i <checklist.length; i++) {
		$('#eid_'+checklist[i]).addClass("todoEmp2");
		$('#eid_'+checklist[i]).removeClass("todoEmp1");
	}
	if($('#tdemp').css("display")=='none'){
		$('#tdemp').show();
	} else {
		$('#tdemp').hide();
	}
})
.on('click','.todoEmp1',function(){
	let tp = $(this).attr("id");
	tp = tp.substring(4); //employeeid;
// 	console.log(tp);
	for(let i = 0; i < checklist.length; i++) { //중복 사원 금지
		 if(checklist[i] == tp){
			 return false;
		 }
	}
	$.ajax({url:'/todoEmp',data:{employeeid:tp,todoid:$('#todoMyid').text()}, type:'post',dataType:'text',
		success:function(data){
			console.log("/todoEmp 성공");
			$('#tdemp').hide();
			location.reload();
		},
		error:function(data){
			alert("/todoEmp 오류");
		}
	});
})
.on('click','.todoEmp2',function(){
	let tp = $(this).attr("id");
	tp = tp.substring(4); //employeeid;
// 	console.log(tp);
	if(confirm("멤버를 제외하시겠습니까?")){
// 		console.log("A");
		$.ajax({url:'/todoEmp2',data:{employeeid:tp,todoid:$('#todoMyid').text()}, type:'post',dataType:'text',
			success:function(data){
				console.log("/todoEmp2 성공");
				$('#tdemp').hide();
				location.reload();
			},
			error:function(data){
				alert("/todoEmp2 오류");
			}
		});
	}
})
.on('click', function(e) { // #tdemp 밖 선택 시 화면 hide
    let t = $("#tdemp");
//     console.log($(e.target).attr("id"));
    if($(e.target).attr("id")!="btnMemberAdd"){
        if (!$(e.target).closest(t).length) {
        	$('#tdemp').hide();
        }
    }
})
.on('click','#btnBoardDel',function(){
	if(confirm("보드를 삭제하시겠습니까?")){
		$.ajax({url:'/todoDel',data:{todoid:$('#todoMyid').text()}, type:'post',dataType:'text',
			success:function(data){
				console.log("/todoDel 성공");
				document.location="todo";
			},
			error:function(data){
				alert("/todoDel 오류");
			}
		});
	}
})
.on('click','#todoMenuImg',function(){
	
})
.on('click','.todoBoard1',function(){
	$(this).parent('.tDivMyboard').append("<div class='todoBoard'><div class='titlepadding'>"
	+"<label>완료</label><div style='display:inline; float:right;'>"
	+"<img src='mailpageImg/todomenu.png' class='todoMenuImg'></div></div>"
	+"<div class='todoBoard0'>+</div></div><div class='todoBoard'><div class='todoBoard1'></div></div>");
// 	$(this).remove();
})
.on('click','.todoBoard0',function(){
	$(this).parent('.todoBoard').append("<div id='todoTextarea'><div style='margin-top:5px;'><textarea id='newboardContentTitle' class='todobasic'></textarea></div>"
				+"<div style='padding-top:10px; height:25px; padding-bottom:10px;'>"
				+"<input type=button id='btnAddOK' class='todoBtn1 bcM cWhite' value='확인'> "
				+"<input type=button id='btnAddNO' class='todoBtn1 bcLg' value='취소'></div></div>");
	$(this).remove();
	$('#newboardContentTitle').focus();
})
.on('click','#btnAddOK',function(){
	let newboardContentTitle = $('#newboardContentTitle').val()
	if(newboardContentTitle.length>50){
		alert("50글자 이하로 작성해 주십시오.")
		return false;
	} else {
		$.ajax({url:'/newboardContentTitleAdd',data:{todoid:$('#todoMyid').text(),title:newboardContentTitle}, type:'post',dataType:'text',
			success:function(data){
				console.log("/newboardContentTitleAdd 성공");
				location.reload();
			},
			error:function(data){
				alert("/newboardContentTitleAdd 오류");
			}
		});
	}
})
.on('click','#btnAddNO',function(){
	console.log($(this).parent());
	$(this).parents('.todoBoard').append("<div class='todoBoard0'>+</div>");
	$('#todoTextarea').remove();
})

</script>
</html>