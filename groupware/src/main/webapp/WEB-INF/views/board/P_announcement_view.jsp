<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/P_css/thumblike.css" rel="stylesheet" type="text/css">
<link href="/P_css/Main_Content.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>GrouNexa:게시판 ${bpost.communityTitle}</title>
<%@ include file="../P_header.jsp" %>
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
	<div>
        <a href='/announcement'>공지사항</a><br>
        <a href='/community'>자유게시판</a><br>
    </div>
</div>
    <div class="Main_Content">
        <div class="Post_Content">
        <input type="hidden" value="${bpost.communityID}" id="seq">
            <h3>제목: ${bpost.communityTitle}</h3>
            <span>작성자: ${bpost.name} ${bpost.position}</span>
            <span>작성시간: ${bpost.createdTime}</span> <span>${modidel}</span>
            <p>${bpost.content}</p>
            <span>조회수: ${bpost.views}</span>
        </div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src='P_js/P_announcement.js'></script>
</html>
