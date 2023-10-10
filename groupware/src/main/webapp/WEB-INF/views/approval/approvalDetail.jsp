<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재</title>
<style>
body {
    overflow-x: hidden; /* 가로 스크롤을 숨깁니다. */
}
.mainSection {
    display: flex;
    flex-direction: column; /* 요소들을 수직으로 배치합니다. */
}

.title {
    display: block;
    position: absolute;
    top: 20px;
    left: 25%;
    width: 100%;
    margin-top: 10px;
    font-size: 24px;
    font-weight: normal;
}

.writeForm {
    margin-left: 25%;
    margin-top: 2%;
    width: 45%;
    font-size: 16px;
}

/* 추가된 CSS 클래스 */
.customTable {
    border-collapse: collapse;
    width: 100%;
}

.customTable td, .customTable th {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

.customTable th {
    background-color: #f2f2f2;
}

.tool_bar {
    margin-left: 25%;
    margin-top: 30px;
}

.tool_bar a {
    margin-right: 10px;
    cursor: pointer; /* 커서를 포인터로 설정 */
}

.tool_bar_icon {
    width: 20px;
    height: 20px;
    margin-top: 5px;
    position: relative;
    top: 4px;
    right: 3px;
}

.td1 {
    font-size: 35px;
    text-align: center !important; /* 텍스트를 가운데 정렬합니다. */
}

.ApproText {
    width: 100%;
    padding-bottom: 50%;
    box-sizing: border-box;
    font-size: 19px;
    position: relative;
    bottom: 40%;
    left: 2%;
}

/* 새로운 CSS 클래스 추가 */
.bgGray {
    background-color: rgb(221, 221, 221);
    text-align: center;
}

.centerText {
    text-align: center;
}

.centerVertical {
    vertical-align: middle;
}

.textRight {
    text-align: right;
}

.textCenter {
    text-align: center;
}

.width9 {
    width: 9%;
}

.width13 {
    width: 13%;
}

.width25 {
    width: 25%;
}

.height450 {
    height: 450px;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/P_header.jsp"%>
<div class="mainSection">
    <div class="asidebar">
        <%@ include file="approvalHeader.jsp"%>
    </div>
    <h3 class="title">결재상세내용</h3>
    <form action="#" method="post">
    <div class="tool_bar">
        <button type="submit"><span><img src="/img/작성.png" class="tool_bar_icon"></span><span>결재승인</span></button>
        <a><span><img src="/img/미리보기.png" class="tool_bar_icon"></span><span>보류</span></a>
        <a><span><img src="/img/미리보기.png" class="tool_bar_icon"></span><span>거절</span></a>
        <a href="/approval"><span><img src="/img/취소.png" class="tool_bar_icon"></span><span>취소</span></a>
    </div>
    <div class="writeForm">
            <table class="customTable">
                <tr>
                    <td class="td1" colspan="5">업 무 기 안</td>
                </tr>
                <tr>
                    <td class="bgGray width9 centerText">기안자</td>
                    <td><span id="senderName">${alShow.senderName}</span></td>
                    <td rowspan="4"><input type="hidden" id="userid" value="${userid}"></td>
                    <td rowspan="3" class="bgGray width9 centerText">결재</td>
                    <td class="width13 centerText">${alShow.receiverDepart}</td>
                </tr>
                <tr>
                    <td class="bgGray centerText">부서</td>
                    <td>${alShow.sendDepart}</td>
                    <td rowspan="2" class="textCenter">
                        <span id="receiverName">${alShow.receiverName}</span>
                    </td>
                </tr>
                <tr>
                    <td class="bgGray centerText">기안일</td>
                    <td><span id="currentDate">${alShow.createdTime}</span></td>
                </tr>
                <tr>
                    <td class="bgGray centerText">문서번호</td>
                    <td class="width25">${alShow.approvalID}</td>
                    <td class="bgGray centerText">결재상태</td>
                    <td class="textCenter">${alShow.approval_status}</td>
                </tr>
            </table>
            <br><hr/><br>
            <table class="customTable" >
                <tr>
                    <td class="width20 bgGray centerText" >결재유형</td>
                    <td><span id="approvalType">${alShow.approval_type}</span></td>
                </tr>
                <tr>
                    <td class="bgGray centerText">제목</td>
                    <td><span id="approvalTitle">${alShow.approvalTitle}</span></td>
                </tr>
                <tr>
                    <td colspan="2" class="bgGray centerText">내용</td>
                </tr>
                <tr>
                    <td colspan="2" class="height450"><span id="approText" class="ApproText">${alShow.content}</span></td>
                </tr>
            </table>
    </div>
    <div class="tool_bar" style="margin-bottom:5%">
        <button type="submit"><span><img src="/img/작성.png" class="tool_bar_icon"></span><span>결재승인</span></button>
        <a><span><img src="/img/미리보기.png" class="tool_bar_icon"></span><span>보류</span></a>
        <a><span><img src="/img/미리보기.png" class="tool_bar_icon"></span><span>거절</span></a>
        <a href="/approval"><span><img src="/img/취소.png" class="tool_bar_icon"></span><span>취소</span></a>
    </div>
    </form>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
</script>
</html>
