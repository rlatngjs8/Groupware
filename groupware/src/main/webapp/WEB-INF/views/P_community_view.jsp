<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="/P_css/Main_Content.css" rel="stylesheet" type="text/css">
    <%@ include file="P_header.jsp" %>
    <style>
        /* 전체 페이지 스타일 */
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* 메인 컨테이너 스타일 */
        .Main_Content {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        /* 게시물 컨테이너 스타일 */
        .Post_Content {
            padding: 20px;
            border-bottom: 1px solid #ccc;
        }

        /* 게시물 제목 스타일 */
        h3 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        /* 게시물 정보 스타일 */
        .Post_Content span {
            margin-right: 10px;
            color: #888;
        }

        /* 댓글 입력 부분 스타일 */
        .comment-input {
            margin-top: 20px;
        }

        /* 댓글 스타일 */
        .comment {
            margin-top: 20px;
        }

        .comment .comment-item {
            border-bottom: 1px solid #ccc;
            padding: 10px 0;
        }

        /* 체크박스 스타일 */
        input[type="checkbox"] {
            margin-right: 5px;
        }
        .big-button {
		    display: block;
		    background-color: rgb(106, 176, 173);
		    color: #fff;
		    text-align: center;
		    text-decoration: none;
		    padding: 10px 20px;
		    margin-bottom: 20px;
		    font-size: 18px;
		    border-radius: 5px;
		}
		
		.page-side a:hover {
		    background-color: #cfcfcf;
		}
    </style>
    <title>커뮤니티</title>
</head>
<body>

<div class="page-side">
    <h1>게시판</h1>
    <a href='/community_write' class="big-button">글쓰기</a> <!-- 큰 버튼 스타일 적용 -->
<!--     <div>
        <a href='/#'>아이디어 공유</a><br>
        <a href='/#'>휴가</a><br>
        <a href='/#	'>프로젝트</a><br>
    </div> -->
</div>
    <div class="Main_Content">
        <div class="Post_Content">
            <h3>제목: ${bpost.communityTitle}</h3>
            <span>작성자: ${bpost.userid}</span>
            <span>작성시간: ${bpost.createdTime}</span>
            <p>내용: ${bpost.content}</p>
            <input type="checkbox"><img alt="" src="">
        </div>
        <div class="comment-input">
            <span>댓글 : </span><input type="text" id="comment-input"><input type="button" id="comment-submit" onclick="submitComment()" value="작성">
            <span>조회수: ${bpost.views}</span><span>좋아요 :${bpost.likes}</span>
        </div>
        <div class="comment">
            <c:forEach items="${clist}" var="comment">
                <div class="comment-item">${comment}</div>
            </c:forEach>
        </div>
        <div>${modidel}</div>
    </div>
</body>
<script>
function submitComment() {
    var comment = document.getElementById("comment-input").value; // 입력된 댓글 내용 가져오기
    var postId = ${bpost.communityID}; // 게시물 ID, 필요한 경우 서버로부터 받아와야 함

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
        },
        error: function(jqXHR, textStatus, errorThrown) {
            // 댓글 등록 실패 시 오류 처리
            console.error("댓글 등록 실패:", errorThrown);
            // 오류 처리 로직 추가
        }
    });
}
//JavaScript와 jQuery를 사용한 AJAX 요청
$(document).on('click', '#like-button', function () {
    var postId = $(this).data('post-id');
    
    $.ajax({
        type: 'POST',
        url: '/like/' + postId,
        success: function (response) {
            if (response.liked) {
                $('#like-button').text('Unlike');
            } else {
                $('#like-button').text('Like');
            }
            $('#post-' + postId + ' span').text(response.likeCount + ' likes');
        }
    });
});

</script>

</html>
