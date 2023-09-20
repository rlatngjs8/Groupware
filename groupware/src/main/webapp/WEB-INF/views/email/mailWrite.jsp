<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/emailCSS.css" rel="stylesheet" type="text/css"/>
<title>메일</title>
</head>
<style>
#mailTable {width:100%; border-collapse:collapse;}
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
#btnMailSend {width:62px; height:28px; padding: 3px 10px 3px 10px; font-weight:bold; margin-left:40px;}
</style>
<body>
<div style="display:flex; height: 100%;">
	<jsp:include page="mailLeftDiv.jsp"></jsp:include>
	<div id="mDivMain">
		<p id="mailSideTitle">메일쓰기</p>
		<br>
		<input type="button" id="btnMailSend" class="whiteBtn" value="보내기">
		<br><br>
		<table id="mailTable">
		<tr><td>받는사람</td><td><input type=text autofocus id="mInputEmail" class="mInputText" value="kim@example.com"></td></tr>
		<tr><td>참조</td><td><input type=text id="mInputCC" class="mInputText"></td></tr>
		<tr><td>제목</td><td><input type=text id="mInputTitle" class="mInputText" value="안녕하세요."></td></tr>
		<tr><td>파일첨부</td><td><label for="mailFile" id="mFileLabel">파일선택</label><input type=file id="mailFile" class="mInputText" multiple></td></tr>
<!-- 		<tr><td>파일첨부</td><td><input type=file id="mailFile" class="mInputText" multiple></td></tr> -->
		<tr><td></td><td><div class="mailFileName"><label>파일은 3개까지 선택 가능합니다.</label></div></td></tr>
		<tr><td colspan=2><textarea rows=29 id="mInputContent" class="font_rnffla"></textarea></td></tr>
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
        	$(".mailFileName").append("<p class='mfn'>"+fileName+"</p>");
        }
        $('#mailFile')[0].files = dataTransfer.files;
          console.log("dataTransfer =>",dataTransfer.files);
//           console.log("input FIles =>", $('#mailFile')[0].files);
		$('.mailFileName').children('label').text("");
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
    if($('.mfn').length==0){
        $('.mailFileName').children('label').text("파일은 3개까지 선택 가능합니다.");
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
				alert("오류");
				return false;
			}
		});
// 		$.ajax({url:'/doProductInsert', processData : false, contentType : false,
// 			data:formData, type:'post',
// 			success:function(data){
// 				console.log("/doProductInsert 성공");
// 				if(data=='success'){
// 					alert("등록성공");
// 				}
// 				if(data=='fail'){
// 					alert("등록실패");	
// 				}
// 				document.location="/productInsert"; 
// 			},
// 			error:function(data){
// 				alert("오류");
// 				return false;
// 			}
// 		});
	}
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