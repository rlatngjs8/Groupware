let mailChklist = [];
let trashChklist = [];
let mChkStart;
$(document)
.ready(function(){
	window.location;
	$('.mFolderBtn').css("width","45px");
// 	$('#mRead').mouseover(function(){ //css
// 		$('#mRead').addClass('mFolderBtn2');
// //	 	$('#Read').css({"color":"#6AB0AD","border-color":"#6AB0AD","cursor":"pointer"});
// 	},function(){
// 		$('#mRead').removeClass('mFolderBtn2');
// 	});
	
	$('.erSendtime').addClass(function(index){
		return 'erSendtime' + index;
	});
	let erSendtime = $('.erSendtime').text();
	erSendtime = erSendtime.split("/");

 	for(let i=0;i<$('.erSendtime').length; i++){
 		$('.erSendtime'+i).html(erSendtime[i].slice(0,-3)); //초 삭제
	}
 	for(let i=0;i<$('.emailRS').length; i++){ //안 읽은 메일 굵게
 		if($('.emailRS:eq('+i+')').text()=="0"){
 			$('.emailRS:eq('+i+')').parent().siblings('#rMailName, #rMailTitle').css('font-weight','bold');
 		}
	}
 	if($('#mailPno').text()=="1"){
 		$('#mPrev').css({"color":"lightgray","border-color":"lightgray","cursor":"default"});
 	}
 	if($('#mailPno').text()==$('#mailPcnt').text()){
 		$('#mNext').css({"color":"lightgray","border-color":"lightgray","cursor":"default"});
 	}

})
.on('click','#emailMark',function(){
	let emailid = $(this).parent().siblings().children('#rEmailid').text();
	let tp = $(this).siblings('#emailRmark').text(); 
//	console.log($('.emailRmark').text());
	console.log(emailid+tp);
	
	if($(this).find('#mStar').attr("src")=="mailpageImg/star0.png"){
		$(this).find('#mStar').attr("src","mailpageImg/star1.png");
		$(this).siblings('#emailRmark').text("1");
	} else if($(this).find('#mStar').attr("src")=="mailpageImg/star1.png"){
		$(this).find('#mStar').attr("src","mailpageImg/star0.png");
		$(this).siblings('#emailRmark').text("0");
	}
	
	$.ajax({url:'/rsMark',data:{emailid:emailid,now:$('#mailNow').text(),now2:tp}, type:'post',dataType:'text',
		success:function(data){
			console.log("/rsMark 성공");
		},
		error:function(data){
			alert("/rsMark 오류");
		}
	});
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
		let nowRead = $(this).parent().siblings().children('.emailRS').text();
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
// 	console.log($(this).parent().siblings().children('.emailRS').text()); //0은 안읽음 1은 읽음 2는 삭제	
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
// 		let now = $(this).parent().siblings().children('.emailRS').text();
		console.log($(".mChk").index(this));
		let mChk1 = $(".mChk").index(this);
// 		console.log($("input[name=mChk]:checked").lastIndex());
		if(mChkStart>mChk1){
			let temp = mChk1;
			mChk1 = mChkStart;
			mChkStart = temp;
		}
		$("input[name=mChk]").each(function(i){
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
	if(chkchkL==0){
		$('#mRead').val("읽음");
		$('#mRead').css("width","45px");
	}
	$("input[name=mChk]:checked").each(function(i){
		let nowRead = $(this).parent().siblings().children('.emailRS').text();
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
.on('click','#mRead',function(){
	let checklist = [];
	let checklist2 = [];
	$("input[name=mChk]:checked").each(function(i){
		let tp = $(this).siblings('#rEmailid').text(); 
//		console.log(tp);
		if(tp!=''){	
			checklist.push(tp);
		}
		let tp2 = $(this).parent().siblings().children('#mailNow2').text(); 
		console.log(tp2);
		if(tp2!=''){	
			checklist2.push(tp2);
		}
	});
	if(checklist==''){
		return false;
	}
	mailChklist = checklist;
	trashChklist = checklist2;
	if($('#mRead').val()=="읽음"){
		$.ajax({url:'/mailRead',data:{mailChklist:JSON.stringify(mailChklist),now:$('#mailNow').text(),trashChklist:JSON.stringify(trashChklist)},type:'post',dataType:'text',
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
		$.ajax({url:'/mailNotRead',data:{mailChklist:JSON.stringify(mailChklist),now:$('#mailNow').text(),trashChklist:JSON.stringify(trashChklist)},type:'post',dataType:'text',
			success:function(data){
				console.log("/mailNotRead 성공");	
				location.reload();
			},
			error:function(data){
				alert("/mailNotRead 오류");
			}
		});
	}
})
.on('click','#mDelete',function(){
	let checklist = [];
	let checklist2 = [];
	$("input[name=mChk]:checked").each(function(i){
		let tp = $(this).siblings('#rEmailid').text(); 
		if(tp!=''){	
			checklist.push(tp);
		}
			let tp2 = $(this).parent().siblings().children('#mailNow2').text(); 
		if(tp2!=''){	
			checklist2.push(tp2);
		}
	});
	if(checklist==''){
		return false;
	}
	mailChklist = checklist;
	trashChklist = checklist2;
	$.ajax({url:'/mailDelete',data:{mailChklist:JSON.stringify(mailChklist),now:$('#mailNow').text(),trashChklist:JSON.stringify(trashChklist)},type:'post',dataType:'text',
		success:function(data){
			console.log("/mailDelete 성공");	
			location.reload();
		},
		error:function(data){
			alert("/mailDelete 오류");
		}
	});
})
.on('click','#rmailTable tr',function(e){
	if($(e.target).hasClass("mChk") || $(e.target).hasClass("rMailChk") || $(e.target).hasClass("e_erm") || $(e.target).hasClass("rMailMark")){
        return ;
    }
	let tp = $(this).find('#rEmailid').text(); 
	let now2 = $(this).find('#mailNow2').text(); 
	
	$.ajax({url:'/mailReadUpdate', data:{eid:tp,now:$('#mailNow').text(),now2:now2}, type:'post',
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