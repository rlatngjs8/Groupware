$(document).ready(function() {
    // 각 approval 제목을 가지고 있는 요소에 대한 이벤트 핸들러를 할당
    $('tbody tr').on('click', function() {
        // 클릭된 요소의 첫 번째 td 요소 내의 내용(approvalID)을 가져옴
        var approvalID = $(this).find('td.id').text();
        console.log(approvalID); // 콘솔에 출력
        window.location = "approvalDetail?approvalID=" + approvalID;
    });
});