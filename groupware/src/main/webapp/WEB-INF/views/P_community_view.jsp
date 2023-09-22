<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/P_css/Main_Content.css" rel="stylesheet" type="text/css">
<title>GrouNexa:게시판 ${bpost.communityTitle}</title>
<%@ include file="P_header.jsp" %>
<style>
    /* 전체 페이지 스타일 */
    body {
        background-color: #f2f2f2;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
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
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    /* 댓글 입력 부분 스타일 */
    .comment-input {
        margin-top: 20px;
    }

	/* 댓글 스타일 */
	.comment {
	    margin-top: 20px;
	}
	
	.comment .comment-box {
	    border-bottom: 1px solid #ccc;
	    padding: 10px 0;
	}
	
	.comment .comment-comment_Userid {
	    font-weight: bold;
	    margin-right: 10px;
	}
	
	.comment .comment-comment_Date {
	    color: #888;
	    margin-right: 10px;
	}
	
	.comment .comment-comment {
	    margin-top: 5px;
	}
	/* 좋아요 버튼 스타일 */
	/* 큰 버튼 스타일 */
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
	#like-button {
	    display: inline-block;
	    background-color: #4CAF50;
	    color: white;
	    border: none;
	    padding: 10px 20px;
	    text-align: center;
	    text-decoration: none;
	    font-size: 16px;
	    border-radius: 4px;
	    cursor: pointer;
	    margin-right: 10px; /* 좋아요 버튼 사이의 간격을 조절 */
	}
	
	#like-button:hover {
	    background-color: #45a049;
	}
	
	/* 댓글 입력 부분 스타일 */
	.comment-input {
	    margin-top: 20px;
	    display: flex; /* 내용을 가로로 정렬 */
	}
	
	.comment-input input[type="text"] {
	    flex-grow: 0.5; /* 입력 필드가 남은 공간을 채우도록 설정 */
	    padding: 10px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    margin-right: 10px; /* 입력 필드와 버튼 사이의 간격 조절 */
	}
	
	.comment-input input[type="button"] {
	    background-color: #4CAF50;
	    color: white;
	    border: none;
	    padding: 10px 20px;
	    text-align: center;
	    text-decoration: none;
	    font-size: 16px;
	    border-radius: 4px;
	    cursor: pointer;
	}
	
	.comment-input input[type="button"]:hover {
	    background-color: #45a049;
	}
			.page-side a:hover {
			    background-color: #cfcfcf;
			}
</style>

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
        <input type="hidden" value="${bpost.communityID}" id="seq">
            <h3>제목: ${bpost.communityTitle}</h3>
            <span>작성자: ${bpost.name} ${bpost.position}</span>
            <span>작성시간: ${bpost.createdTime}</span> <span>${modidel}</span>
            <p>${bpost.content}</p>
            <input type="checkbox"><img alt="" src="">
            <span>조회수: ${bpost.views}</span><span>좋아요 :${bpost.likes}</span>
        </div>
        <div class="comment-input">
            <span>댓글 : </span><input type="text" id="comment-input"><input type="button" id="comment-submit" onclick="submitComment()" value="작성">          
        </div>
        <div class="comment">
        	<span>댓글 목록</span>
	            <c:forEach items="${alComment}" var="alComment">
				    <div class="comment-box">
				        <span class="comment-comment_Userid">작성자: ${alComment.comment_Name} ${alComment.comment_Position}</span><br>
				        <span class="comment-comment_Date">${alComment.comment_Date}</span><br>
				        <span class="comment-comment">${alComment.comment}</span>
				        <input type="hidden" value="${alComment.commentID}" class="cmtID">
				        <input type="hidden" value="${alComment.cmtAuthorID}" class="cAuID">
				        <c:choose>
				            <c:when test="${userid eq alComment.cmtAuthorID or sessionScope.userid eq 'admin'}">
				                <input type="button" class="showupdatecmt" value="수정">
									<div class="updatecmtbox" style="display: none;">
									    <input type="text" class="updatecmt" value="${alComment.comment}">
									    <input type="button" class="doupdatecmt" value="확인">
									</div>
									<div>삭제</div>
				            </c:when>
				        </c:choose>
				    </div>
				</c:forEach>
        </div>
    </div>
</body>
<script>

function submitComment() {
	let comment = document.getElementById("comment-input").value; // 입력된 댓글 내용 가져오기
    let postId = ${bpost.communityID}; // 게시물 ID, 필요한 경우 서버로부터 받아와야 함

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
//JavaScript와 jQuery를 사용한 AJAX 요청
$(document)
.on('click', '.showupdatecmt', function () {
    $(this).siblings('.updatecmtbox').toggle();
})
.on('click', '.doupdatecmt', function () {
    let cmtID = $(this).siblings('.cmtID').val();
    let updatecmt = $(this).siblings('.updatecmt').val();
    console.log(cmtID,updatecmt)
    $.ajax({
        type: "POST",
        url: "/updateComment",
        data: {
            cmtID: cmtID,
            updatecmt: updatecmt
        },
        success: function(response) {
            console.log("댓글 수정 성공:", response);
            document.location=response;
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("댓글 수정 실패:", errorThrown);
        }
    });
})
.on('click', '.cmtdel', function () {
    let cmtID = $(this).siblings('.cmtID').val();
    let cAuID = $(this).siblings('.cAuID').val();
    $.ajax({
        type: "POST",
        url: "/deleteComment", // 여기를 댓글 삭제를 처리하는 엔드포인트 URL로 변경해야 합니다.
        data: {
            cmtID: cmtID,
        },
        success: function(response) {
            console.log("댓글 삭제 성공:", response);
            document.location=response;
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("댓글 삭제 실패:", errorThrown);
        }
    });
});

</script>
</html>
