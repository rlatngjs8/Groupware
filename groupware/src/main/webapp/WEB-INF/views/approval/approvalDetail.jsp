<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/approval/approvalDetail.js"></script>
<link href='css/approval/approvalDetail.css' rel='stylesheet' />
<meta charset="UTF-8">
<title>전자결재</title>
</head>
<body>	
<%@ include file="/WEB-INF/views/P_header.jsp"%>
<input type="hidden" id="user_id" value="${name}">
<input type="hidden" id="receiverName" value="${alShow.receiverName}">
<input type="hidden" id="approvalID" value="${alShow.approvalID}">
<div class="mainSection">
    <div class="asidebar">
        <%@ include file="approvalHeader.jsp"%>
    </div>
    <h3 class="title">결재상세내용</h3>
    <div class="tool_bar">
       	<a id="accept"><span><img src="/img/승인.png" class="tool_bar_icon1"></span><span>결재승인</span></a>
        <a id="no"><span><img src="/img/보류.png" class="tool_bar_icon2"></span><span>보류</span></a>
        <a id="never"><span><img src="/img/거절.png" class="tool_bar_icon3"></span><span>거절</span></a>
        <a href="/approval"><span><img src="/img/취소.png" class="tool_bar_icon4"></span><span>취소</span></a>
    </div>
    <div class="writeForm">
            <table class="customTable">
                <tr>
                    <td class="td1" colspan="5">업 무 기 안</td>
                </tr>
                <tr>
                    <td class="bgGray width9 centerText" style="width: 10%; border-bottom: 1px solid #bfbfbf;">기안자</td>
                    <td><span id="senderName" style="font-weight: bold;">${alShow.senderName}</span></td>
                    <td rowspan="4"><input type="hidden" id="userid" value="${userid}"></td>
                    <td rowspan="3" class="bgGray width9 centerText" style="width: 10%; border-bottom: 1px solid #bfbfbf;">결재</td>
                    <td class="width13 centerText">${alShow.receiverDepart}</td>
                </tr>
                <tr>
                    <td class="bgGray centerText" style="border-bottom: 1px solid #bfbfbf;">부서</td>
                    <td>${alShow.sendDepart}</td>
                    <td rowspan="2" class="textCenter">
                        <span id="receiverName" style="font-weight: bold;">${alShow.receiverName}</span>
                    </td>
                </tr> 
                <tr>
                    <td class="bgGray centerText" style="border-bottom: 1px solid #bfbfbf;">기안일</td>
                    <td><span id="currentDate">${alShow.createdTime}</span></td>
                </tr>
                <tr>
                    <td class="bgGray centerText" style="border-bottom: 1px solid #bfbfbf;">문서번호</td>
                    <td class="width25">${alShow.approvalID}</td>
                    <td class="bgGray centerText" style="border-bottom: 1px solid #bfbfbf;">결재상태</td>
                    <td class="textCenter">${alShow.approval_status}</td>
                </tr>
            </table>
            <br><hr/><br>
            <table class="customTable" >
                <tr>
                    <td class="width20 bgGray centerText" style="width: 20%; border-bottom: 1px solid #bfbfbf;">결재유형</td>
                    <td><span id="approvalType">${alShow.approval_type}</span></td>
                </tr>
                <tr>
                    <td class="bgGray centerText" style="border-bottom: 1px solid #bfbfbf;">제목</td>
                    <td><span id="approvalTitle">${alShow.approvalTitle}</span></td>
                </tr>
                <tr>
                    <td colspan="2" class="bgGray centerText" style="text-align:center">내 용</td>
                </tr>
                <tr>
                    <td colspan="2" class="height450"><span id="approText" class="ApproText">${alShow.content}</span></td>
                </tr>
            </table>
    </div>
    <div class="tool_bar" style="margin-bottom:5%">
       	<a id="accept" onclick="sendApprovalStatus('승인')"><span><img src="/img/승인.png" class="tool_bar_icon1"></span><span>결재승인</span></a>
        <a id="no" onclick="sendApprovalStatus('보류')"><span><img src="/img/보류.png" class="tool_bar_icon2"></span><span>보류</span></a>
        <a id="never" onclick="sendApprovalStatus('거절')"><span><img src="/img/거절.png" class="tool_bar_icon3"></span><span>거절</span></a>
        <a href="/approval"><span><img src="/img/취소.png" class="tool_bar_icon4"></span><span>취소</span></a>
    </div>
</div>
</body>
</html>
