<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
/* 게시물 목록을 감싸는 컨테이너 */
.post-container {
    border: 1px solid #ccc;
    margin-bottom: 20px;
    margin-right: 40%;
    padding: 10px;
    background-color: #f9f9f9;
}

/* 제목 스타일 */
.post-title {
    font-size: 20px;
    font-weight: bold;
}

/* 작성자 스타일 */
.post-author {
    font-size: 14px;
    color: #666;
}

/* 내용 스타일 */
.post-content {
    margin-top: 10px;
    font-size: 16px;
}

/* 게시물 정보 스타일 */
.post-info {
    margin-top: 10px;
    font-size: 14px;
    color: #888;
}

/* 조회수와 좋아요 스타일 */
.post-views-likes {
    margin-top: 5px;
}

/* 시간 스타일 */
.post-time {
    font-size: 12px;
    color: #aaa;
}


.big-button {
    display: block;
    background-color: rgb(106, 176, 173); /* 버튼 배경색 설정 */
    color: #fff;
    text-align: center;
    text-decoration: none;
    padding: 10px 20px; /* 패딩 설정 */
    margin-bottom: 20px; /* 버튼 사이 간격 주기 */
    font-size: 18px;
    border-radius: 5px; /* 버튼 모서리 둥글게 만들기 */
}
.page-side {
    float: left; /* 왼쪽으로 배치 */
    width: 200px; /* 사이드바 너비 조정 */
    padding: 20px; /* 내용과의 간격을 주기 위한 패딩 추가 */
    background-color: rgb(255, 255, 255); /* 배경 색상 설정 */
    color: rgb(0, 0, 0); /* 텍스트 색상 설정 */
    margin-left: 53px;
}

.page-side h1 {
    font-size: 24px;
    margin-bottom: 20px;
}

.page-side a {
    display: block; /* 링크를 블록 레벨로 변경하여 각각을 새로운 줄에 표시 */
    padding: 10px 0; /* 링크 내부 패딩 추가 */
    text-decoration: none; /* 밑줄 제거 */
    color: rgb(0, 0, 0); /* 링크 텍스트 색상 설정 */
}

.page-side a:hover {
    background-color: #cfcfcf; /* 호버 시 배경 색상 변경 */
}
</style>
<meta charset="UTF-8">
<title>게시판</title>
<link href="/P_css/Main_Content.css" rel="stylesheet" type="text/css">
<%@ include file="P_header.jsp" %>
</head>
<body>
<div class="page-side">
    <h1>게시판</h1>
    <a href='/write' class="big-button">글쓰기</a> <!-- 큰 버튼 스타일 적용 -->
    <div>
        <a href='/write'>아이디어 공유</a><br>
        <a href='/write'>휴가</a><br>
        <a href='/write'>프로젝트</a><br>
    </div>
</div>
<div class="Main_Content">
<c:forEach items="${blist}" var="blist">
	<div class="post-container">
            <span class="post-title">${blist.CommunityTitle}</span>
            <div class="post-content">${blist.Content}</div>
            <div class="post-info">
                <span class="post-views-likes">
                	<span class="post-author">${blist.AuthorEmployeeID}</span>
                    <span>조회수: ${blist.Views}</span><br>
                    <span><img src="/P_img/like.png" style="width:20px;height:20px"> : ${blist.Likes}</span><br>
                </span>
                <span class="post-time">${blist.CreatedTime}</span>
            </div>
        </div>
</c:forEach>
<div style="margin-left:auto;margin-right:auto">${pagestr}</div>
</div>
</body>
<script>
console.log(${blist});
</script>
</html>