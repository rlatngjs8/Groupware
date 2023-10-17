$(document)
.on('click','#addPlanBtn',function(){		// 일정등록 버튼 클릭했을 때
	document.location="/ko_addPlan"
})
.on('click','#btnCancel',function(){		// 취소 눌렀을 때
	document.location="/ko_calendar"
})
.on('click','#c_title', function(){		//캘린더 title을 클릭했을 때
	document.location="/ko_calendar";
})
$('#startDate').on('change', function() {		// 시작 날짜 변경했을 때
    $('#endDate').attr('min', $(this).val());
    var startDate = $(this).val();
    $('#endDate').val(startDate);
    $('#startHidden').val(startDate+$("#startHour option:selected").text());
    $('#endHidden').val(startDate+$("#endHour option:selected").text());
})
$('#startHour').on('change', function(){		// 시작 시간 변경했을 때
	$('#startHidden').val($('#startDate').val()+$("#startHour option:selected").text());
})
$('#endDate').on('change', function(){		// 끝 날자 변경했을 때
	$('#endHidden').val($(this).val()+$("#endHour option:selected").text());
})
$('#endHour').on('change', function(){		// 끝 시간 변경했을 때
	$('#endHidden').val($('#endDate').val()+$("#endHour option:selected").text());
})
$("#allDay").change(function(){
    if($("#allDay").is(":checked")){	//종일 선택했을 때
        $('#startHour').hide();
        $('#endHour').hide();
        $('#startHidden').val($('#startDate').val()+"T08:00:00");
        $('#endHidden').val($('#endDate').val()+"T22:00:00");
    }else{								//종일 해제했을 때
    	$('#startHour').show();
    	$('#endHour').show();
    	$('#startHidden').val($('#startDate').val()+$("#startHour option:selected").text());
    	$('#endHidden').val($('#endDate').val()+$("#endHour option:selected").text());
    }
});	
$(document).ready(function() {
    // 시작 시간과 끝 시간 select 요소의 변경을 감지합니다.
    $('#startHour, #endHour').on('change', function() {
        // 현재 선택된 시작 시간과 끝 시간을 가져옵니다.
        var startHour = parseInt($('#startHour').val());
        var endHour = parseInt($('#endHour').val());

        // 만약 시작 날짜와 끝 날짜가 같고, 시작 시간이 끝 시간보다 크거나 같다면
        if ($('#startDate').val() === $('#endDate').val() && startHour >= endHour) {
            // 끝 시간을 변경합니다.
            $('#endHour option').prop('disabled', false); // 모든 옵션을 활성화합니다.
            $('#endHour option').filter(function() {
                return parseInt(this.value) <= startHour;
            }).prop('disabled', true); // 시작 시간보다 작거나 같은 옵션을 비활성화합니다.
            $("#endHour").val(startHour+1);
        } else if($('#startDate').val() === $('#endDate').val()){
			$('#endHour option').prop('disabled', false); // 모든 옵션을 활성화합니다.
            $('#endHour option').filter(function() {
                return parseInt(this.value) <= startHour;
            }).prop('disabled', true); // 시작 시간보다 작거나 같은 옵션을 비활성화합니다.
        }else{
			// 날짜가 다르거나 시작 시간이 끝 시간보다 작은 경우 모든 옵션을 활성화합니다.
            $('#endHour option').prop('disabled', false);
		}
    });

    // 시작 날짜가 변경될 때 끝 날짜의 최소값을 업데이트합니다.
    $('#startDate').on('change', function() {
        $('#endDate').attr('min', $(this).val());
        var startDate = $(this).val();
        $('#endDate').val(startDate);

        // 변경된 시작 날짜에 따라 끝 시간을 업데이트합니다.
        var startHour = parseInt($('#startHour').val());
        $('#endHour option').prop('disabled', false);
        $('#endHour option').filter(function() {
            return parseInt(this.value) <= startHour;
        }).prop('disabled', true);
    });
});