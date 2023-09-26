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
    margin-right: 15%;
    padding: 10px;
    background-color: #f9f9f9;
}

.post-container:hover {
    background-color: #d4d2d2;
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
</style>
<meta charset="UTF-8">
<title>게시판</title>
<link href="/P_css/Main_Content.css" rel="stylesheet" type="text/css">
<%@ include file="P_header.jsp" %>
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
<c:forEach items="${blist}" var="blist">
	<div class="post-container">
	<a href="/community_view?seqno=${blist.CommunityID}">
            <span class="post-title">${blist.CommunityTitle}</span><br><br>
            <span class="post-content">${blist.Content}</span><br><br>
            <span class="post-info">
                <span class="post-views-likes">
                	<span class="post-author">작성자 : ${blist.Name} ${blist.Position}</span><br>
                    <span>조회수: ${blist.Views}</span><br>
                    <span><img src="/P_img/like.png" style="width:20px;height:20px"> ${blist.Likes}</span><br>
                </span>
                <span class="post-time">${blist.CreatedTime}</span>
            </span>
            </a>
        </div>
</c:forEach>
<div style="margin-left:auto;margin-right:auto;text-align:center">${pagestr}</div>
</div>
</body>
</html>