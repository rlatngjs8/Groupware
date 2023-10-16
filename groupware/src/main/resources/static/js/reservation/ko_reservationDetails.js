$(document)
.on('click','#c_title', function(){		//캘린더 title을 클릭했을 때
	document.location="/reservationList";
})
.on('click','#btnReservation',function(){	//회의실 예약버튼을 클릭했을 때
	document.location="/ko_reservation"
})
.on('click','#btnCancel',function(){		// 취소 눌렀을 때
	document.location="/reservationList"
})
$('#meetingrooms').on('change', function(){				//회의실 변경
	$('#roomIdHidden').val($("#meetingrooms option:selected").val());
	$('#roomNameHidden').val($("#meetingrooms option:selected").text());
	$('#startHour option').prop('disabled', false); // 모든 옵션을 활성화합니다.
	$('#endHour option').prop('disabled', false); // 모든 옵션을 활성화합니다.
	$.post('/getTimeDetails',{roomId:$('#roomIdHidden').val(), date:$('#startDate').val(), connectionID:"${getDetailsR.connectionID}"},
			function(data){
				if(data.length==0){
					return false;
				}else{
					$('#startHour option').prop('disabled', false); // 모든 옵션을 활성화합니다.
					$('#endHour option').prop('disabled', false); // 모든 옵션을 활성화합니다.
					for(let i=0; i<data.length; i++){
					    $('#startHour option').filter(function() {
					        return parseInt(this.value) >= parseInt(data[i].starttime) && parseInt(this.value) < parseInt(data[i].endtime);
					    }).prop('disabled', true); // 예약되어 있는 시간은 선택 불가 (시작시간)
					    $('#endHour option').filter(function() {
					        return parseInt(this.value) > parseInt(data[i].starttime) && parseInt(this.value) <= parseInt(data[i].endtime);
					    }).prop('disabled', true); // 예약되어 있는 시간은 선택 불가 (끝 시간)
					    if(parseInt($('#startHour option:selected').val())<parseInt(data[i].endtime)){
						    $('#endHour option').filter(function() {
							    	return parseInt(data[i].endtime) < parseInt(this.value);
							    }).prop('disabled', true);
					    }
					}
				}
	},'json');
})
$('#startDate').on('change', function() {		// 시작 날짜 변경했을 때
    var startDate = $(this).val();
    $('#startHidden').val(startDate+$("#startHour option:selected").text());
    $('#endHidden').val(startDate+$("#endHour option:selected").text());
	$('#startHour option').prop('disabled', false); // 모든 옵션을 활성화합니다.
	$('#endHour option').prop('disabled', false); // 모든 옵션을 활성화합니다.
	$.post('/getTimeDetails',{roomId:$('#roomIdHidden').val(), date:$('#startDate').val(), connectionID:"${getDetailsR.connectionID}"},
			function(data){
				if(data.length==0){
					return false;
				}else{
					$('#startHour option').prop('disabled', false); // 모든 옵션을 활성화합니다.
					$('#endHour option').prop('disabled', false); // 모든 옵션을 활성화합니다.
					for(let i=0; i<data.length; i++){
					    $('#startHour option').filter(function() {
					        return parseInt(this.value) >= parseInt(data[i].starttime) && parseInt(this.value) < parseInt(data[i].endtime);
					    }).prop('disabled', true); // 예약되어 있는 시간은 선택 불가 (시작시간)
					    $('#endHour option').filter(function() {
					        return parseInt(this.value) > parseInt(data[i].starttime) && parseInt(this.value) <= parseInt(data[i].endtime);
					    }).prop('disabled', true); // 예약되어 있는 시간은 선택 불가 (끝 시간)
					    if(parseInt($('#startHour option:selected').val())<parseInt(data[i].endtime)){
						    $('#endHour option').filter(function() {
							    	return parseInt(data[i].endtime) < parseInt(this.value);
							    }).prop('disabled', true);
					    }
					}
				}
	},'json');
})
$('#startHour').on('change', function(){		// 시작 시간 변경했을 때
	$('#startHidden').val($('#startDate').val()+$("#startHour option:selected").text());
	$('#endHour option').prop('disabled', false); // 모든 옵션을 활성화합니다.
	var startHour = parseInt($('#startHour').val());	// 선택된 시작 시간을 가져옴
    $('#endHour option').filter(function() {
        return parseInt(this.value) <= startHour;
    }).prop('disabled', true); // 시작 시간보다 작거나 같은 옵션을 비활성화합니다.
    $("#endHour").val(startHour+1);
	$('#endHidden').val($('#startDate').val()+$("#endHour option:selected").text());
	$('#sHourHidden').val($('#startHour option:selected').val());
	$('#eHourHidden').val($('#endHour option:selected').val());
	$.post('/getTimeDetails',{roomId:$('#roomIdHidden').val(), date:$('#startDate').val(), connectionID:"${getDetailsR.connectionID}"},
			function(data){
				if(data.length==0){
					return false;
				}else{
					for(let i=0; i<data.length; i++){
					    $('#startHour option').filter(function() {
					        return parseInt(this.value) >= parseInt(data[i].starttime) && parseInt(this.value) < parseInt(data[i].endtime);
					    }).prop('disabled', true); // 예약되어 있는 시간은 선택 불가 (시작시간)
					    $('#endHour option').filter(function() {
					        return parseInt(this.value) > parseInt(data[i].starttime) && parseInt(this.value) <= parseInt(data[i].endtime);
					    }).prop('disabled', true); // 예약되어 있는 시간은 선택 불가 (끝 시간)
					    if(parseInt($('#startHour option:selected').val())<parseInt(data[i].endtime)){
						    $('#endHour option').filter(function() {
							    	return parseInt(data[i].endtime) < parseInt(this.value);
							    }).prop('disabled', true);
					    }
					}
				}
	},'json');
})
$('#endHour').on('change', function(){		// 끝 시간 변경했을 때
	$('#endHidden').val($('#startDate').val()+$("#endHour option:selected").text());
	$('#eHourHidden').val($('#endHour option:selected').val());
})