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
<link href="/P_css/P_community_view.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="board">
	<div class="page-side">
    	<h3 class="boardTitle">커뮤니티</h3>
    	<a href='/community_write' class="big-button">글쓰기</a> <!-- 큰 버튼 스타일 적용 -->
		<div class="sideA">
        	<a href='/announcement'>공지사항</a><br>
        </div>
        <div class="sideA">
        	<a href='/community'>자유게시판</a><br>
    	</div>
	</div>
    <div class="Main_Content" style="margin-left:426px;">
    	<div style="border-bottom:1px solid lightgrey;">
    			<h3 class="boardTitle" style="padding-left:40px;">게시글 상세</h3>
    	</div>
        <div class="Post_Content">
        <input type="hidden" value="${bpost.communityID}" id="seq">
            <h3 class="boardTitle">제목: ${bpost.communityTitle}</h3>
            <span>작성자: ${bpost.name} ${bpost.position}</span>
            <span>작성시간: ${bpost.createdTime}</span> <span>${modidel}</span>
            <p>${bpost.content}</p>
			    <div class="like-container">
			        <button class="like-button" id="like-button">
			            <i class="far fa-thumbs-up thumbs-up-icon"></i>
			            <i class="fas fa-thumbs-up thumbs-up-filled-icon"></i>
			        </button>
			        <input type="hidden" value="${chklike}" id="chklike">
			        <input type="hidden" value="${user}" id="user">
			    </div>
            <span>조회수: ${bpost.views}</span><span>좋아요 :${bpost.likes}</span>
        </div>
        <div class="comment-input">
            <span>댓글 : </span><input type="text" id="comment-input" onclick="enterkey()"><input type="button" id="comment-submit" onclick="submitComment()" value="작성">          
        </div>
        <div class="comment">
        	<span style="padding-left:40px;">댓글 목록</span>
            <c:forEach items="${alComment}" var="alComment">
			    <div class="comment-box">
			        <span class="comment-comment_Userid">작성자: ${alComment.comment_Name} ${alComment.comment_Position}</span><br>
			        <span class="comment-comment_Date">${alComment.comment_Date}</span><br>
			        <span class="comment-comment">${alComment.comment}</span>
			        <input type="hidden" value="${alComment.commentID}" class="cmtID">
			        <input type="hidden" value="${alComment.cmtAuthorID}" class="cAuID">
			        <c:choose>
			            <c:when test="${userid eq alComment.cmtAuthorID or sessionScope.userid eq '관리자1'}">
			                <input type="button" class="showupdatecmt" value="수정">
			                <input type="button" class="cmtdel" value="삭제">
								<div class="updatecmtbox" style="display: none;">
								    <input type="text" class="updatecmt" value="${alComment.comment}">
								    <input type="button" class="doupdatecmt" value="확인">
								</div>
								
			            </c:when>
			        </c:choose>
			    </div>
			</c:forEach>
        </div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src='P_js/P_community_view.js'></script>
</html>
