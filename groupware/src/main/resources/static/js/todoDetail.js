let checklist = [];
let ttidlist = [];
let todotitlelist = [];
$(document)
.ready(function(){
	let eids = $('.memberTodoEid').text();
	eids = eids.split("/");
	for(let i=0; i<eids.length-1; i++){
		checklist.push(eids[i]);
	}
// 	console.log(checklist);
	let titleid1 = $('.todotitleid').text();
	titleid1= titleid1.split("/");
	let todotitle1 = $('.todotitle').text();
	todotitle1 = todotitle1.split("/@#$%^@!");
	console.log(todotitle1);
	for(let x=0; x<titleid1.length-1; x++){
		ttidlist.push(titleid1[x]);
		todotitlelist.push(todotitle1[x]);
	}
// 	console.log(ttidlist);
	$.ajax({url:'/todoContent',data:{tid:$('#todoMyid').text()},type:'post',dataType:'json',
		success:function(data){
			console.log("/todoContent 성공");
			for(let i=0; i<data.length; i++){
				let obj = data[i];
				let str = "";
				let str2 = "";
				let str3 = "";
				let titleid = $('.todotitleid').text();
				titleid= titleid.split("/");
// 				console.log(titleid);
// 				let ttidlist2 = [];
// 				ttidlist2 = ttidlist;
// 				console.log(ttidlist2.length);
				
				for(let j=0; j<titleid.length-1; j++){
					if(titleid[j]==obj["ttid"]){
						str = "<div class='divHidden todoContentid'>"+obj["todocontentid"]+"</div><div class='todoBoardContent'><div class='todoct'>"+obj["todocontent"]+"</div>"
								+"<div class='nametag'>"+obj["name"]+" "+obj["position"]+"</div><div class='todoM todoMenu divHidden'><div class='todoletsmove'>이동</div><div class='todoletsdel'>삭제</div></div>";
						for(let k=0; k<ttidlist.length; k++){
							str2 = str2+"<div class='todoM todoMove0 divHidden'>"+todotitlelist[k]+"</div><div class='todoM todoMove divHidden todoMove_"+ttidlist[k]+"'>"+ttidlist[k]+"</div>";
						}	
						str3 = "</div>";
					}
				}
				$('#ttid_'+obj["ttid"]).parent('.tcidMain').append(str+str2+str3);
			}
		},
		error:function(data){
			console.log("에러");
		}
	});
	
})
// .on('keydown','#newboardContent',function(e){
//     if(e.keyCode == 13) {
//     	$("#btnAddOK").click();
//     }   
// })
.on('click','.todoBoardContent',function(){
// 	if($(this).find('.todoMove0').css("display")!='none'){ //1012 수정
// 		$(this).find('.todoMove0').hide();
// 	}
	if($(this).find('.todoMenu').css("display")=='none'){
		$(this).find('.todoMenu').show();
		$('.todoMove0').hide();
	} else {
		$(this).find('.todoMenu').hide();
	}
})
.on('click','.todoletsmove',function(){
	$('.todoMove0').hide();
	if($(this).parent().siblings('.todoMove0').css("display")=='none'){
		$(this).parent().siblings('.todoMove0').show();
	} else {
		$(this).parent().siblings('.todoMove0').hide();
	}
})
.on('click','.todoletsdel',function(){
	let todoct = $(this).parent().siblings('.todoct').text();
	console.log(todoct);
	let tcid = $(this).parents().prev('.todoContentid').text();
	console.log(tcid);
	if(confirm("\""+todoct+"\"을(를) 제외하시겠습니까?")){
// 		console.log("A");
		$.ajax({url:'/todoletsdel',data:{tcid:tcid}, type:'post',dataType:'text',
			success:function(data){
				console.log("/todoletsdel 성공");
				location.reload();
			},
			error:function(data){
				alert("/todoletsdel 오류");
			}
		});
	}
})
.on('click','.todoMove0',function(){
// 	console.log($(this).next('.todoMove').text());
	let ttid = $(this).next('.todoMove').text();
// 	console.log( $(this).parent().prev('.todoContentid').text());
	let ctid = $(this).parent().prev('.todoContentid').text();
	$.ajax({url:'/updateTodoContent',data:{ttid:ttid,ctid:ctid}, type:'post',dataType:'text',
		success:function(data){
			console.log("/updateTodoContent 성공");
			location.reload();
		},
		error:function(data){
			alert("/updateTodoContent 오류");
		}
	});
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
				if(data=="NO"){
					alert("보드장은 멤버에서 제외할 수 없습니다!");
				}else{
					location.reload();
				}
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
.on('click','.todoXbtn',function(){
	let x = $(this).parent().siblings().children('.todotitleid').text();
	x = x.split("/");
	console.log(x[0]);
	let tp = $(this).siblings('label').text();
	console.log(tp);
	if(confirm("\""+tp+"\"을(를) 삭제하시겠습니까?")){
		$.ajax({url:'/todoXbtn',data:{ttid:x[0]}, type:'post',dataType:'text',
			success:function(data){
				console.log("/todoXbtn 성공");
				location.reload();
			},
			error:function(data){
				alert("/todoXbtn 오류");
			}
		});
	}
})
.on('click','.todoBoard1',function(){
	console.log(".todoBoard1 클릭");
	$(this).parent('.todoBoard').append(
			"<div id='todonew'><input id='todonewtitle' class='todobasic'><div style='padding-top:10px; height:25px;'>"
			+"<input type=button id='btnAddTitleOK' class='todoBtn1 bcM cWhite' value='확인'> "
			+"<input type=button id='btnAddTitleNO' class='todoBtn1 bcLg' value='취소'></div></div>");
	$('.todoBoard1').remove();
	$('#newboardContent').focus();
})
.on('click','#btnAddTitleOK',function(){
	let nowTitle = $('#todonewtitle').val();
	if(nowTitle.length>50){
		alert("50글자 이하로 작성해 주십시오.");
		return false;
	} else if(nowTitle.length==0){
		return false;
	} else {
		$.ajax({url:'/btnAddTitleOK',data:{todoid:$('#todoMyid').text(),nowTitle:nowTitle}, type:'post',dataType:'text',
			success:function(data){
				console.log("/btnAddTitleOK 성공");
				location.reload();
			},
			error:function(data){
				alert("/btnAddTitleOK 오류");
			}
		});
	}
})
.on('click','#btnAddTitleNO',function(){
	$('.todoBoard1').remove();
	$(this).parents('.todoBoard').append("<div class='todoBoard1'>+</div>");
	$('#todonew').remove();
})
.on('click','.todoBoard0',function(){
	$(this).parent('.todoBoard').append("<div id='todoTextarea'><div style='margin-top:5px;'><textarea id='newboardContent' class='todobasic'></textarea></div>"
				+"<div style='padding-top:10px; height:25px; padding-bottom:10px;'>"
				+"<input type=button id='btnAddOK' class='todoBtn1 bcM cWhite' value='확인'> "
				+"<input type=button id='btnAddNO' class='todoBtn1 bcLg' value='취소'></div></div>");
	$(this).remove();
	$('#newboardContent').focus();
})
.on('click','#btnAddOK',function(){
	let newboardContent = $(this).parent().siblings().children('#newboardContent').val()
	console.log(newboardContent);
	let ttid = $(this).parents().siblings().children('.todotitleid').text();
	ttid = ttid.split("/");
// 	console.log(ttid[0]);
	if(newboardContent.length>50){
		alert("50글자 이하로 작성해 주십시오.");
		return false;
	} else if(newboardContent.length==0){
		return false;
	} else {
		$.ajax({url:'/newboardContentAdd',data:{ttid:ttid[0],content:newboardContent}, type:'post',dataType:'text',
			success:function(data){
				console.log("/newboardContentAdd 성공");
				location.reload();
			},
			error:function(data){
				alert("/newboardContentAdd 오류");
			}
		});
	}
})
.on('click','#btnAddNO',function(){
	console.log($(this).parent());
	$(this).parents('.todoBoard').append("<div class='todoBoard0'>+</div>");
	$(this).parents('#todoTextarea').remove();
})