$(document).ready(function() {
    // 각 approval 제목을 가지고 있는 요소에 대한 이벤트 핸들러를 할당
    $('tbody tr').on('click', function() {
        // 클릭된 요소의 첫 번째 td 요소 내의 내용(approvalID)을 가져옴
        var approvalID = $(this).find('td.id').text();
        console.log(approvalID); // 콘솔에 출력
        window.location = "approvalDetail?approvalID=" + approvalID;
    });
    
//     $('.status').each(function() {
//         var approvalStatus = $(this).text();
//         var stateElement = $(this).closest('tr').find('.status'); // 상태 열이 있는 행에서 .state 요소를 찾음
        
//         console.log("이거입니다",approvalStatus )

//         if (approvalStatus === '진행 중') {
//             stateElement.addClass('ongoing');
//         } else if (approvalStatus === '보류') {
//             stateElement.addClass('defer');
//         } else if (approvalStatus === '거절') {
//             stateElement.addClass('refuse');
//         } else if (approvalStatus === '승인') {
//             stateElement.addClass('approval');
//         }
//     });
    
});