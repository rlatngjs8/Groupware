//JavaScript와 jQuery를 사용한 AJAX 요청
$(document)
.ready(function(){
	let likeButton = $('#like-button');
    let isLiked = !$('#chklike').val();
	if (isLiked) {
        likeButton.addClass('liked');
    } else {
        likeButton.removeClass('liked');
    }
})
.on('click', '#btnUpdate', function () {
	if(!confirm('수정 하시겠습니까?')){
		return false;
	}
    document.location="/community_view_update?seq="+$('#seq').val();
    return true;
})
.on('click', '#btnDelete', function () {
	if(!confirm('삭제 하시겠습니까?')){
		return false;
	}
    document.location="deletepost?seq="+$('#seq').val();
    return true;
})


.on('click', '.showupdatecmt', function () {
    $(this).siblings('.updatecmtbox').toggle();
})
.on('click', '.doupdatecmt', function () {
    // 클릭한 버튼의 가장 가까운 .comment-box 부모 요소를 찾음
    let commentBox = $(this).closest('.comment-box');

    // .comment-box 내에서 .cmtID와 .updatecmt 클래스를 가진 요소를 찾음
    let cmtID = commentBox.find('.cmtID').val();
    let updatecmt = commentBox.find('.updatecmt').val();
    let seqno = $('#seq').val();
    //console.log(cmtID, updatecmt, seqno);

    $.ajax({
        type: "POST",
        url: "/updateComment",
        data: {
            cmtID: cmtID,
            updatecmt: updatecmt,
            seqno: seqno
        },
        beforeSend:function(){
        	if(!confirm('수정 하시겠습니까?')){
        		return false;
        	}
        	return true;
        },
        success: function(response) {
            console.log("댓글 수정 성공:", response);
            document.location = response;
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("댓글 수정 실패:", errorThrown);
        }
    });
})
.on('click', '.cmtdel', function () {
	let commentBox = $(this).closest('.comment-box');
	let cmtID = commentBox.find('.cmtID').val();
	let seqno = $('#seq').val();
	console.log(cmtID);
    $.ajax({
        type: "POST",
        url: "/deleteComment", // 여기를 댓글 삭제를 처리하는 엔드포인트 URL로 변경해야 합니다.
        data: {
            cmtID: cmtID,
            seqno: seqno
        },
        beforeSend:function(){
        	if(!confirm('삭제 하시겠습니까?')){
        		return false;
        	}
        	return true;
        },
        success: function(response) {
            console.log("댓글 삭제 성공:", response);
            document.location=response;
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("댓글 삭제 실패:", errorThrown);
        }
    });
})

// 좋아요 버튼 클릭 이벤트 처리
$('#like-button').click(function () {
    let likeButton = $('#like-button');
    let isLiked = !likeButton.hasClass('liked');
    let seqno = $('#seq').val();
    let EmpId = $('#user').val();
    // 서버로 좋아요 정보를 보내는 AJAX 요청
    $.ajax({
        type: 'POST',
        url: isLiked ? '/like' : '/undolike', // 좋아요 추가 또는 취소 요청을 서버에 맞게 변경
        data: {
        	seqno:seqno,
        	EmpId:EmpId
        },
        success: function (data) {
            //document.location = data; // 페이지 새로고침 또는 리다이렉션
        	console.log(data);
        }
    });
    // 버튼 스타일 변경
    if (isLiked) {
        likeButton.addClass('liked');
    } else {
        likeButton.removeClass('liked');
    }
})
function submitComment() {
	let comment = document.getElementById("comment-input").value; // 입력된 댓글 내용 가져오기
    let postId = document.getElementById("seq").value; // 게시물 ID, 필요한 경우 서버로부터 받아와야 함

    // AJAX를 사용하여 서버로 댓글 데이터 전송
    $.ajax({
        type: "POST", // 또는 "GET" 등 HTTP 요청 방법 설정
        url: "/addComment", // 댓글을 추가하는 서버 엔드포인트 URL
        data: {
            postId: postId, // 게시물 ID
            comment: comment // 댓글 내용
        },
        success: function(response) {
            // 댓글 등록 성공 시 페이지 업데이트 또는 다른 작업 수행
            console.log("댓글 등록 성공:", response);
            // 페이지 새로고침 또는 댓글 목록 업데이트 등을 수행할 수 있음
            document.location=response;
        },
        error: function(jqXHR, textStatus, errorThrown) {
            // 댓글 등록 실패 시 오류 처리
            console.error("댓글 등록 실패:", errorThrown);
            // 오류 처리 로직 추가
        }
    });
}