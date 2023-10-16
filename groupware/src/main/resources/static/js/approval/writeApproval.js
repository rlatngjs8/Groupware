$(document).ready(function() {

	
  // select 요소의 변경 이벤트를 감지
    $('#receiver_id').on('change', function() {
        // 선택한 옵션의 데이터 속성 'data-department' 값을 가져옴
        var selectedOption = $(this).find(':selected');
        var displayName = selectedOption.text().split(' ')[0]; // 띄어쓰기로 분리하고 앞에 것만 가져옴
        $('#receiverDepartmentName').text(displayName);
    });
});
$(document).ready(function() {
    // 현재 날짜를 가져옵니다.
    var currentDate = new Date();

    // 요일을 한글로 변환합니다.
    var daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
    var dayOfWeek = daysOfWeek[currentDate.getDay()];

    // 날짜를 yyyy-mm-dd (요일) 형식으로 표시합니다.
    var formattedDate = currentDate.getFullYear() + "-" + 
                        (currentDate.getMonth() + 1).toString().padStart(2, "0") + "-" + 
                        currentDate.getDate().toString().padStart(2, "0") + " (" + dayOfWeek + ")";

    // 결과를 화면에 표시합니다.
    $("#currentDate").text(formattedDate);
});

$(document).on("click", "#submit_btn", function() {
	console.log("버튼 클릭됨")
    if ($('#userid').val() === "" || $('#receiver_id').val() === "" || $('#approvalType').val() === null || $('#approvalTitle').val() === "" || $('#approText').val() === "") {
        alert("모든 필수 입력 필드를 작성해주세요.");
        return false;
    }
    
    // 폼 데이터를 가져옵니다.
    var formData = {
        userid: $('#userid').val(),
        receiver_id: $('#receiver_id').val(),
        approvalType: $('#approvalType').val(),
        approvalTitle: $('#approvalTitle').val(),
        approText: $('#approText').val()
    };
    
    console.log("보낸이", $('#userid').val());
    console.log("안에있는 데이터", formData);

    // Ajax를 사용하여 데이터를 서버에 전송합니다.
    $.ajax({
        type: 'POST', // 또는 'GET'에 따라 HTTP 메소드 선택
        url: '/writeApprovalData', // 요청을 보낼 URL
        data: formData, // 보낼 데이터
        success: function(response) {
            // 서버로부터의 응답을 처리합니다.
            console.log('결재요청이 성공적으로 전송되었습니다.');
            // 원하는 동작을 추가하세요.
             window.location.href = "/approval"; 
        },
        error: function(err) {
            // 오류 처리
            console.error('결재요청 전송 중 오류 발생:', err);
            alert("결재수신자를 선택해주세요");
        }
    });
});


/*$(document).ready(function() {
    // "결재요청" 버튼 클릭 이벤트 처리
    $('form').on('submit', function(e) {
        e.preventDefault(); // 기본 제출 동작 방지
        

     		// 필수 입력 필드가 비어있는지 확인
        if ($('#userid').val()=== "" || $('#receiver_id').val()=== "" || $('#approvalType').val()=== null || $('#approvalTitle').val()=== "" || $('#approText').val() === "") {
            alert("모든 필수 입력 필드를 작성해주세요.");
            return false;
        }
        
        
        // 폼 데이터를 가져옵니다.
        var formData = {
            userid: $('#userid').val(),
            receiver_id: $('#receiver_id').val(),
            approvalType: $('#approvalType').val(),
            approvalTitle: $('#approvalTitle').val(),
            approText: $('#approText').val()
        };
             		
        
        console.log("보낸이",$('#userid').val());
        console.log("안에있는 데이터", formData);

        // Ajax를 사용하여 데이터를 서버에 전송합니다.
        $.ajax({
            type: 'POST', // 또는 'GET'에 따라 HTTP 메소드 선택
            url: '/writeApprovalData', // 요청을 보낼 URL
            data: formData, // 보낼 데이터
            success: function(response) {
                // 서버로부터의 응답을 처리합니다.
                console.log('결재요청이 성공적으로 전송되었습니다.');
                // 원하는 동작을 추가하세요.
                window.location.href = "/approval";
            },
            error: function(err) {
                // 오류 처리
                console.error('결재요청 전송 중 오류 발생:', err);
                alert("결재수신자를 선택해주세요")
            }
        });
    });
});*/