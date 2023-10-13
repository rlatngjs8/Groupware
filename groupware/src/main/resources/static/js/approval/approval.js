$(document).ready(function() {
	
	$('table tr').click(function() {
        var approvalID = $(this).find('input[type="hidden"]').val();
        window.location = "approvalDetail?approvalID=" + approvalID;
    });
	
	 $('.card_action').click(function() {
	        var approvalID = $(this).closest('.approvalCard').find('.approvalID').val();
	        console.log(approvalID); // 콘솔에 출력
	        // 여기에 추가로 할 작업을 추가할 수 있습니다.
	        window.location = "approvalDetail?approvalID=" + approvalID;
	    });
	
    $('td#c_approval_createdTime').each(function() {
        var text = $(this).text(); // 원본 createdTime 텍스트 가져오기
        if (text.length > 10) {
            var truncatedText = text.substring(0, 10);
            $(this).text(truncatedText); // 10자까지 자른 텍스트로 설정하기
        }
    });
    
    $('td#i_approval\\.createdTime').each(function() {
        var text = $(this).text(); // 원본 createdTime 텍스트 가져오기
        if (text.length > 10) {
            var truncatedText = text.substring(0, 10);
            $(this).text(truncatedText); // 10자까지 자른 텍스트로 설정하기
        }
    });
    
    $('td#co_approval\\.createdTime').each(function() {
        var text = $(this).text(); // 원본 createdTime 텍스트 가져오기
        if (text.length > 10) {
            var truncatedText = text.substring(0, 10);
            $(this).text(truncatedText); // 10자까지 자른 텍스트로 설정하기
        }
    });
    
    $('.state').each(function() {
        var approvalStatus = $(this).text();
        var stateElement = $(this).closest('tr').find('.state'); // 상태 열이 있는 행에서 .state 요소를 찾음
        
        console.log("이거입니다",approvalStatus )

        if (approvalStatus === '진행 중') {
            stateElement.addClass('ongoing');
        } else if (approvalStatus === '보류') {
            stateElement.addClass('defer');
        } else if (approvalStatus === '거절') {
            stateElement.addClass('refuse');
        } else if (approvalStatus === '승인') {
            stateElement.addClass('approval');
        }
    });
    
});