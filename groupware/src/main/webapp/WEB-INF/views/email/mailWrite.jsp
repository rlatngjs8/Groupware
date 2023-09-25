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
#mailTable {width:100%; border-collapse:collapse; min-width:600px;}
#mailTable td {height:28px; padding:0 20px 20px 40px;}
#mailTable td:nth-child(1) {width:90px; font-weight:bold;}
#mailTable tr:last-child td {border: 1px solid lightgray; border-width:1px 0 0;}
.mInputText {width:99%; border-width: 0 0 1px; border-color: black; outline:none; font-size:14px; 
			caret-color:#6AB0AD; padding:9px 0 9px 4px;}
.mInputText:focus {border-color: #6AB0AD;}
textarea {width:99%; padding:15px 0 15px 0; border:none; outline:none; resize:none;}
.font_rnffla {font-family: '굴림', Gulim;}
input[type="file"] {position:absolute; width:0; height:0; padding:0; overflow:hidden; border: 0;}
#mFileLabel{border: 1px solid lightgray; padding:4px 12px 4px 12px; border-radius:4px;}
#mFileLabel:hover{border: 1px solid gray; cursor:pointer;}
.mailFileName {height:65px;}
.mfd div {display:inline-block; text-align:center; margin:1px 10px 1px 10px; padding: 1px 10px 1px 10px;}
.mfx {cursor: pointer;}
#btnMailSend {width:62px; height:28px; padding: 3px 10px 3px 10px; font-weight:bold; margin-left:40px;}
</style>
<body style="font-size:14px; background-color:white;">
<div style="display:flex; height: 100%;">
	<jsp:include page="mailLeftDiv.jsp"></jsp:include>
	<div id="mDivMain">
		<p id="mailSideTitle">메일쓰기</p>
		<br>
		<input type="button" id="btnMailSend" class="whiteBtn" value="보내기">
		<br><br>
		<table id="mailTable">
		<tr><td>받는사람</td><td><input type=text autofocus id="mInputEmail" class="mInputText"></td></tr>
		<tr><td>참조</td><td><input type=text id="mInputCC" class="mInputText"></td></tr>
		<tr><td>제목</td><td><input type=text id="mInputTitle" class="mInputText" value="안녕하세요."></td></tr>
		<tr><td>파일첨부</td><td><label for="mailFile" id="mFileLabel">파일선택</label><input type=file id="mailFile" class="mInputText" multiple></td></tr>
<!-- 		<tr><td>파일첨부</td><td><input type=file id="mailFile" class="mInputText" multiple></td></tr> -->
		<tr><td></td><td><div class="mailFileName"><label>파일은 3개까지 선택 가능합니다.</label></div></td></tr>
		<tr><td colspan=2><textarea rows=25 id="mInputContent" class="font_rnffla"></textarea></td></tr>
		</table>
	</div>
</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
const dataTransfer = new DataTransfer();

$(document)
.ready(function(){
	console.log("내 사원아이디: "+$('#mailMyEmpID').text());
	$('#mInputEmail').val("${email}");
})
.on('click','.mfx',function(){
// 	console.log($(this).siblings('.mfn').text());
// 	console.log($('.mfx').index(this));
	dataTransfer.items.remove($('.mfx').index(this));
    console.log("dataTransfer =>",dataTransfer.files);
    $('#mailFile')[0].files = dataTransfer.files;
    $('.mfd')[$('.mfx').index(this)].remove();
    if($('.mfn').length==0){
        $('.mailFileName').children('label').text("파일은 3개까지 선택 가능합니다.");
    	$('.mailFileName').children('label').css("padding","0 12px 0 12px");
    }
})
.on('change','#mailFile',function(){
	let mailFile = $('#mailFile')[0].files;
	if($('#mailFile').val()!='' && mailFile.length>0){
    	for(let i=0; i<mailFile.length; i++){
    		dataTransfer.items.add(mailFile[i]);
           	let fileName = mailFile[i]["name"];
        	if($('.mfn').length>=3){
        		alert("파일은 3개까지만 선택 가능합니다.");
        		dataTransfer.items.remove(3);
        		break;
        	}
        	$(".mailFileName").append("<div class='mfd'><div class='mfx'>X</div><div class='mfn'>"+fileName+"</div><div>");
        }
        $('#mailFile')[0].files = dataTransfer.files;
          console.log("dataTransfer =>",dataTransfer.files);
//           console.log("input FIles =>", $('#mailFile')[0].files);
		$('.mailFileName').children('label').text("");
		$('.mailFileName').children('label').css("padding","0");
    }
})
.on('click','.mfn',function(event){
	let mailFile = $('#mailFile')[0].files;
	let mailFileText = $(this).text();
	console.log(mailFileText);
	
    if(event.target.className=='mfn'){
		let mailFileID = $(".mfn").index(this);
        console.log(mailFileID);
        dataTransfer.items.remove(mailFileID);
        $(this).remove();
        
        $('#mailFile')[0].files = dataTransfer.files;
        console.log("dataTransfer =>",dataTransfer.files);
    }
})
.on('click','#btnMailSend',function(){
	console.log(dataTransfer.files.length);
	let formData = new FormData();
	let mailFile = $('#mailFile')[0].files;
	
	if($('#mInputEmail').val()==''){alert('받는사람이 없습니다!'); return false;}
	else{formData.append('receiverEmail', $('#mInputEmail').val());}
	if($('#mInputTitle').val()==''){alert('제목이 없습니다!'); return false;}
	else{formData.append('mailTitle', $('#mInputTitle').val());}
	
	formData.append('mailCC', $('#mInputCC').val());
	formData.append('mailContent', $('#mInputContent').val());
	
	if($('#mailFile').val()!=''){
		if(mailFile.length>3){
			alert('파일은 3개까지만 선택 가능합니다.');
			return false;
		} else {
			for(let i=0; i<mailFile.length; i++){  
				console.log(mailFile[i].size);
				if(!fileCheck(mailFile[i].size)){ //파일 형식이나 크기가 안 맞을 경우 X
					console.log("들어왔는가?");
					return false;
				}
				formData.append("uploadFile", mailFile[i]);
			}
		}
	} else {
		formData.append("uploadFile", "");
	}
	if(confirm("메일을 발송하시겠습니까?")){
		$.ajax({url:'/mailSend', processData : false, contentType : false,
			data:formData, type:'post',
			success:function(data){
				console.log("/mailSend 성공");
				if(data=='success'){
					alert("전송성공");
				}
				if(data=='fail'){
					alert("전송실패");	
				}
				document.location="/mailFolder1"; 
			},
			error:function(data){
				alert("존재하지 않는 이메일입니다.");
				return false;
			}
		});
	}
})

$('.mailFileName').on("dragenter", function(e){
    e.preventDefault(); // 놓일 장소에 있는 요소의 기본 동작을 막기
    e.stopPropagation();
}).on("dragover", function(e){
    e.preventDefault();
    e.stopPropagation();
	$(this).css("border","1px solid #6AB0AD");
}).on("dragleave", function(e){
    e.preventDefault();
    e.stopPropagation();
    $(this).css("border","1px solid black");
}).on('drop', function (e) {
	e.preventDefault();
	let files = e.originalEvent.dataTransfer.files;
	console.log(files.length);
	for(let i=0; i<files.length; i++){
		dataTransfer.items.add(files[i]);
		let fileName = files[i]["name"];
		if($('.mfn').length>=3){
			alert("파일은 3개까지만 선택 가능합니다.");
			dataTransfer.items.remove(3);
			break;
		}
		$(".mailFileName").append("<div class='mfd'><div class='mfx'>X</div><div class='mfn'>"+fileName+"</div><div>");
	}
	$('#mailFile')[0].files = dataTransfer.files;
	$('.mailFileName').children('label').text("");
	$('.mailFileName').children('label').css("padding","0");
});

let maxSize = 5368709120; //5GB
function fileCheck(fileSize){
	if(fileSize >= maxSize){
		alert("5GB가 넘는 파일은 업로드할 수 없습니다.");
		return false;
	}  
	return true;
}
</script>
</html>