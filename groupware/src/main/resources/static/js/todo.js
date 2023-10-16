$(document)
.on('keydown','#newboardtitle',function(e){
    if(e.keyCode == 13) {
    	$("#btnAddOK").click();
    }   
})
.on('click','.boardAdd1',function(){
	$('.boardAdd').html("<div style='padding-top:10px; height:25px;'>이름</div>"
	+"<div><input id='newboardtitle' class='todobasic'></div><div style='padding-top:10px; height:25px;'>"
		+"<input type=button id='btnAddOK' class='todoBtn1 bcM cWhite' value='확인'> "
		+"<input type=button id='btnAddNO' class='todoBtn1 bcLg' value='취소'></div>");
	$('.boardAdd').removeClass("boardAdd1");
	$('.boardAdd').addClass("boardAdd2");
	$('#newboardtitle').focus();
	$('#newboardtitle').val('새 보드');
})
.on('click','#btnAddOK',function(){
	let newboardtitle = $('#newboardtitle').val()
	console.log(newboardtitle.length);
	if(newboardtitle.length>50){
		alert("제목은 50글자 이하로 작성해 주십시오.")
		return false;
	} else {
		$.ajax({url:'/newboardTitleAdd',data:{subject:newboardtitle}, type:'post',dataType:'text',
			success:function(data){
				console.log("/newboardTitleAdd 성공");
				location.reload();
			},
			error:function(data){
				alert("/newboardTitleAdd 오류");
			}
		});
	}
})
.on('click','#btnAddNO',function(){
	$('.boardAdd').html("+");
	$('.boardAdd').removeClass("boardAdd2");
	$('.boardAdd').addClass("boardAdd1");
})
.on('click','.iamboard',function(e){
	let tp =  $(this).find('.tSubject').attr('id');
	tp = tp.substring(10); // todoid
	console.log(tp);
	document.location="/todoDetail?tid="+tp; 
});