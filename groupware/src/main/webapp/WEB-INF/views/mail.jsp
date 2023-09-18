<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일</title>
</head>
<style>
#mDivMain {width:100%; border:1px solid lightgray;}
#mTable {width:100%;}
#mTable td {height:28px; padding:0 20px 20px 40px;}
#mTable td:nth-child(1) {width:90px; font-weight:bold;}
#mTable tr:last-child td {border: 1px solid gray; border-width:1px 0 0;}
.mInputText {width:99%; border-width: 0 0 1px; border-color: black; outline:none; font-size:14px; 
			caret-color:red; padding:9px 0 9px 4px;}
.mInputText:focus {border-color: red;}
html, body {height: 100%; margin:0;}
textarea {width:99%; padding:15px 0 15px 0; border:none; outline:none; resize:none; font-size:14px;}
.rnffla {font-family: '굴림', Gulim;}
/* input[type="file"] {position:absolute; width:0; height:0; padding:0; overflow:hidden; border: 0;} */
#mFileLabel{border: 1px solid lightgray; padding:4px 12px 4px 12px; border-radius:4px;}
#mFileLabel:hover{border: 1px solid gray; cursor:pointer;}
.mailFileName{height:90px; border: 1px solid lightgray; padding:4px 12px 4px 12px; border-radius:4px;}
.mailFileName p {margin:2px 0 2px 0;}
.mailFileName p:hover {background-color: #F2F2F2;}
</style>
<body>
<div style="display:flex; height: 100%;">
	<jsp:include page="mailLeftDiv.jsp"></jsp:include>
	<div id="mDivMain">
		<p style="font-weight:bold; font-size:20px; padding-left:40px;">메일쓰기</p>
		<br>
		<table id="mTable">
		<tr><td>받는사람</td><td><input type=text autofocus class="mInputText"></td></tr>
		<tr><td>참조</td><td><input type=text class="mInputText"></td></tr>
		<tr><td>제목</td><td><input type=text class="mInputText"></td></tr>
<!-- 		<tr><td>파일첨부</td><td><label for="mailFile" id="mFileLabel">파일선택</label><input type=file id="mailFile" class="mInputText" multiple></td></tr> -->
		<tr><td>파일첨부</td><td><input type=file id="mailFile" class="mInputText" multiple></td></tr>
		<tr><td></td><td><div class="mailFileName"></div></td></tr>
		<tr><td colspan=2><textarea rows=35 class="rnffla">aaa메일쓰기</textarea></td></tr>
		</table>
	</div>
</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
const dataTransfer = new DataTransfer();

$(document)
.ready(function(){
})
.on('change','#mailFile',function(){
	let mailFile = $('#mailFile')[0].files;
	if($('#mailFile').val()!='' && mailFile.length>0){
    	for(let i=0; i<mailFile.length; i++){
    		dataTransfer.items.add(mailFile[i]);
           	let fileName = mailFile[i]["name"];
        	if($('.mfn').length>=3){
        		alert("파일은 3개까지만 업로드 가능합니다.");
        		dataTransfer.items.remove(3);
        		break;
        	}
        	$(".mailFileName").append("<p class='mfn'>"+fileName+"</p>");
        }
        $('#mailFile')[0].files = dataTransfer.files;
//           console.log("dataTransfer =>",dataTransfer.files);
//           console.log("input FIles =>", $('#mailFile')[0].files);
    }
})
// .on('click','.mfn',function(event){
// 	let mailFile = $('#mailFile')[0].files;
// 	let mailFileText = $(this).text();
// 	console.log(mailFileText);
	
//     if(event.target.className=='mfn'){
//         targetFile = event.target.dataset.index;
//         console.log(targetFile);
//         for(let i=0; i<dataTransfer.files.length; i++){
//         	console.log(dataTransfer.files.length);
//         	dataTransfer.items.remove(i);
//         }
//         $('#mailFile')[0].files = dataTransfer.files;
//     }
// });
// .on('click','.mfn',function(event){
// 	let mailFile = $('#mailFile')[0].files;
// 	console.log("A");
//     if(event.target.className=='mfn'){
// //         targetFile = event.target.dataset.index;
// //         console.log(targetFile);
//         for(let i=0; i<dataTransfer.files.length; i++){
//         	console.log(dataTransfer.files.length);
//             if(dataTransfer.files[i].lastModified==targetFile){
//                 // 총용량에서 삭제
//                 total_file_size-=dataTransfer.files[i].size;
                
//                 dataTransfer.items.remove(i);
//                 break;
//             }
//         }
//         $('#mailFile')[0].files = dataTransfer.files;
//     }
// });
</script>
</html>