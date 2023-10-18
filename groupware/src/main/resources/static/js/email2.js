/* mailDetail.jsp */
let mailFileContent1 = $('#mailFileContent1').text();
let mailFileContent2 = $('#mailFileContent2').text();
let mailFileContent3 = $('#mailFileContent3').text();
let oEditors = []

/* mailWrite.jsp */
const dataTransfer = new DataTransfer();
let cnt = 1;

smartEditor = function() {
    console.log("Naver SmartEditor")
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "mInputContent",
        sSkinURI: "smarteditor/SmartEditor2Skin2_1.html",
        fCreator: "createSEditor2",
        htParams : {fOnBeforeUnload : function(){}} // 이페이지 나오기 alert 삭제
    })
}

$(document)
.ready(function(){
	if($('#mailSideTitle').text()=="받은메일함"){
		$('#mailFolder1').css({"color":"black","font-weight":"bold"});
	} else if($('#mailSideTitle').text()=="보낸메일함") {
		$('#mailFolder2').css({"color":"black","font-weight":"bold"});
	} else if($('#mailSideTitle').text()=="휴지통") {
		$('#trashcanFolder').css({"color":"black","font-weight":"bold"});
	} else if($('#mailSideTitle').text()=="중요메일함") {
		$('#mailMark').css({"color":"black","font-weight":"bold"});
	} 
	if($('#mailC1').text()==''){
		$('.mailFileContent').remove();
		$('.mailFileName1').css({"height":"40px","line-height":"40px","cursor":"default"});
		$('.mailFileName1').html("<label>첨부파일이 없습니다.</label>");
		$('.mailFileName1 label').css("color","");
	} else if ($('#mailC2').text()==''){
		$('#mailFileContent2, #mailC2').remove();
		$('#mailFileContent3, #mailC3').remove();
		$('.mailFileName1').css({"height":"40px","line-height":"40px","cursor":"pointer"});
	} else if ($('#mailC3').text()==''){
		$('#mailFileContent3, #mailC3').remove();
		$('.mailFileName1').css({"height":"80px","line-height":"80px","cursor":"pointer"});
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
	smartEditor();
	
	///* mailWrite.jsp */
	if($('#mInputEmail').val()!=""){
		let text = $('#mInputEmail').val().split(' ').join('');
		$('#mInputEmail').before("<div class='ppEmailbox'><label id='emailbox"+cnt+"' class='emailbox'>"+text+" <input type=button id=emailXBtn value=X></label></div>");
		$('#mInputEmail').val("");
		cnt++;
//		console.log($('.ppEmailbox').width());
	}
	
})
.on('click','#mdAnswer',function(){
	let rEmailid = $('#rEmailid').text();
	let name = $('#namebox1').text();
	let email = $('#emailbox1').text();
	email = email.substring(email.indexOf('＜')+1);
	email = email.split("＞");
	console.log(email[0]);
	let email2 = $('#emailbox2').text();
	let emailDate = $('#emailDate').text();
	let subject = "Re: "+$('#mdSubject').text();
	$.ajax({url:'/mdAnswer',data:{emailid:rEmailid, name:name,email:email[0],email2:email2,emailDate:emailDate,subject:subject},type:'post',dataType:'text',
		success:function(data){
			console.log("/mdAnswer 성공");	
			document.location="/mailWrite2";
		},
		error:function(data){
			alert("/mdAnswer 오류");
		}
	});
})
.on('click','#mdDelete',function(){
	console.log($('#rEmailid').text());
	$.ajax({url:'/mdDelete',data:{emailid:$('#rEmailid').text(),now:$('#mailNow').text(),now2:$('#mailNow2').text()},type:'post',dataType:'text',
		success:function(data){
			console.log("/mdDelete 성공");	
			if($('#mailNow').text()=="receive"){
				document.location="/mailFolder1";
			} else if($('#mailNow').text()=="send") {
				document.location="/mailFolder2";
			} else if($('#mailNow').text()=="mark") {
				document.location="/mailMark";
			} else if($('#mailNow').text()=="trash") {
				document.location="/trashcanFolder";
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
})
.on('click','#emailXBtn',function(){
	$(this).parent(".emailbox").remove();
})
.on('click','.mfx',function(){
	dataTransfer.items.remove($('.mfx').index(this));
    console.log("dataTransfer =>",dataTransfer.files);
    $('#mailFile')[0].files = dataTransfer.files;
    $('.mfd')[$('.mfx').index(this)].remove();
    if($('.mfn').length==0){
        $('.mailFileName2').children('label').text("파일은 3개까지 선택 가능합니다.");
    	$('.mailFileName2').children('label').css("padding","0 12px 0 12px");
    }
})
.on('change','#mInputEmail',function(){
	$('html').click(function(e){
		if(!$(e.target).hasClass("mInputEmail") && $('#mInputEmail').val()!=""){
			let text = $('#mInputEmail').val().split(' ').join('');
			$('#mInputEmail').before("<div class='ppEmailbox'><label id='emailbox"+cnt+"' class='emailbox'>"+text+" <input type=button id=emailXBtn value=X></label></div>");
			$('#mInputEmail').val("");
			cnt++;
		}
	})
})
.on('keydown','#mInputEmail',function(e){
	if($('#mInputEmail').val()!=""){
		if (e.keyCode == 13 || e.keyCode == 9) {	
			let text = $('#mInputEmail').val().split(' ').join('');
			$('#mInputEmail').before("<div class='ppEmailbox'><label id='emailbox"+cnt+"' class='emailbox'>"+text+" <input type=button id=emailXBtn value=X></label></div>");
			$('#mInputEmail').val("");
			cnt++;
			console.log($('.ppEmailbox').width());
			$('#mInputEmail').focus();
		}
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
        	$(".mailFileName2").append("<div class='mfd'><div class='mfx'>X</div><div class='mfn'>"+fileName+"</div><div>");
        }
        $('#mailFile')[0].files = dataTransfer.files;
          console.log("dataTransfer =>",dataTransfer.files);
//           console.log("input FIles =>", $('#mailFile')[0].files);
		$('.mailFileName2').children('label').text("");
		$('.mailFileName2').children('label').css("padding","0");
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
	oEditors.getById["mInputContent"].exec("UPDATE_CONTENTS_FIELD", []) //스마트에디터
	
	let formData = new FormData();
	let mailFile = $('#mailFile')[0].files;
	if(!$('label').hasClass('emailbox')){alert('받는사람이 없습니다!'); return false;}
	else{formData.append('receiverEmail', $('.emailbox').text());}
	if($('#mInputTitle').val()==''){alert('제목이 없습니다!'); return false;}
	else{formData.append('mailTitle', $('#mInputTitle').val());}
	
	formData.append('mailCC', $('#mInputCC').val());
	formData.append('mailContent', $('#mInputContent').val());
	console.log($('#mInputContent').val());
	if($('#mailFile').val()!=''){
		if(mailFile.length>3){
			alert('파일은 3개까지만 선택 가능합니다.');
			return false;
		} else {
			for(let i=0; i<mailFile.length; i++){  
				console.log(mailFile[i].size);
				if(!fileCheck(mailFile[i].size)){
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

$('.mailFileName2').on("dragenter", function(e){
    e.preventDefault(); // 놓일 장소에 있는 요소의 기본 동작을 막기
    e.stopPropagation();
}).on("dragover", function(e){
    e.preventDefault();
    e.stopPropagation();
	$(this).css("border","1px solid #6AB0AD");
}).on("dragleave", function(e){
    e.preventDefault();
    e.stopPropagation();
    $(this).css("border","1px solid lightgray");
}).on('drop', function (e) {
	e.preventDefault();
	$(this).css("border","1px solid lightgray");
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
		$(".mailFileName2").append("<div class='mfd'><div class='mfx'>X</div><div class='mfn'>"+fileName+"</div><div>");
	}
	$('#mailFile')[0].files = dataTransfer.files;
	$('.mailFileName2').children('label').text("");
	$('.mailFileName2').children('label').css("padding","0");
});

let maxSize = 5368709120; //5GB
function fileCheck(fileSize){
	if(fileSize >= maxSize){
		alert("5GB가 넘는 파일은 업로드할 수 없습니다.");
		return false;
	}  
	return true;
}