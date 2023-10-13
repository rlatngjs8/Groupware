
$(document).on('click', '#accept', function() {
	sendApprovalStatus('승인');
});

$(document).on('click', '#no', function() {
	sendApprovalStatus('보류');
});

$(document).on('click', '#never', function() {
	sendApprovalStatus('거절');
});

/* function sendApprovalStatus(status) {
	var userId = $("#userid").val();
	var approvalId = "${alShow.approvalID}";

	$.ajax({
		type: "POST",
		url: "/update_approval_status",
		data: {
			userId: userId,
			approvalId: approvalId,
			status: status
		},
		success: function(data) {
			if (response.success) {
				alert('결재 상태가 업데이트되었습니다.');
				// 여기서 추가적인 동작 수행 가능
			} else {
				alert('업데이트 실패: ' + response.errorMsg);
			}
		},
		error: function() {
			alert('서버 요청 실패');
		}
	});
} */


// 결재 등록 함수
function sendApprovalStatus(status) {
    var userid = $("#userid").val();
    var useruserid = $("#user_id").val();
    var approvalID = $("#approvalID").val();

    console.log("userid:", userid);
    console.log("useruserid:", useruserid);
    console.log("approvalID:", approvalID);

    if (useruserid != $("#receiverName").val()) {
        console.log("권한이 없습니다.");
        Swal.fire({
            icon: 'warning',
            title: '경고',
            text: '권한이 없습니다.'
        });
    } else {
        const approvalData = {
            userid: userid,
            approvalID: approvalID,
            status: status
        };

        $.ajax({
            url: "/update_approval_status",
            type: 'POST',
            data: approvalData,
            success: function (data) {
                console.log('인서트 성공', data);
                Swal.fire({
                    icon: 'success',
                    title: '성공',
                    text: '결재가 완료되었습니다.',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        console.log("페이지 리로드");
                        // 확인 버튼을 누르면 페이지 리로드
                        window.location = "/approval";
                    }
                });
            },
            error: function (error) {
                console.error('인서트 실패:', error);
                Swal.fire({
                    icon: 'warning',
                    title: '실패',
                    text: '결재 등록에 실패하였습니다.',
                    confirmButtonText: '확인'
                });
            }
        });
    }
}

