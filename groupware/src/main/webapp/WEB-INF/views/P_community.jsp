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
</style>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link href="/P_css/Main_Content.css" rel="stylesheet" type="text/css">
<%@ include file="P_header.jsp" %>
</head>
<body>
<div class="Main_Content">
<c:forEach items="${blist}" var="blist">
	<div class="post-container">
            <span class="post-title">${blist.CommunityTitle}</span>
            <span class="post-author">${blist.AuthorEmployeeID}</span>
            <div class="post-content">${blist.Content}</div>
            <div class="post-info">
                <span class="post-views-likes">
                    <span>조회수: ${blist.Views}</span>
                    <span><img src="/P_img/like.png" style="width:20px;height:20px"> : ${blist.Likes}</span>
                </span>
                <span class="post-time">${blist.CreatedTime}</span>
            </div>
        </div>
</c:forEach>
<div>${pagestr}</div>
</div>
</body>
<script>
console.log(${blist});
</script>
</html>