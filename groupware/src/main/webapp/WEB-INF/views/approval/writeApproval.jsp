<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    /* Flexbox를 사용하여 요소들을 가로 배치합니다. */
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
.td1{
	font-size: 35px;
	text-align: center !important; /* 텍스트를 가운데 정렬합니다. */
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/P_header.jsp"%>
<div class="mainSection">
    <div class="asidebar">
        <%@ include file="approvalHeader.jsp"%>
    </div>
    <h3 class="title">전자결재 작성</h3>
    <form action="/writeApprovalData" method="get">
    <div class="tool_bar">
        <a><span><img src="/img/작성.png" class="tool_bar_icon"></span><span>결재요청</span></a>
        <a><span><img src="/img/미리보기.png" class="tool_bar_icon"></span><span>미리보기</span></a>
        <a><span><img src="/img/취소.png" class="tool_bar_icon"></span><span>취소</span></a>
    </div>
    <div class="writeForm">
            <table class="customTable">
                <tr>
                    <td class="td1" colspan="5">업 무 기 안</td>
                </tr>
                <tr>
                    <td style="background-color:rgb(221, 221, 221);text-align:center;">기안자</td>
                    <td>김수헌</td>
                    <td rowspan="4" style="width:45%"></td>
                    <td rowspan="3"style="background-color:rgb(221, 221, 221);text-align:center;">결재</td>
                    <td style="width:13%;text-align:center">부장</td>
                </tr>
                <tr>
                    <td style="background-color:rgb(221, 221, 221);text-align:center;">부서</td>
                    <td>관리부</td>
                    <td rowspan="2"style="text-align:center">윤승환</td>
                </tr>
                <tr>
                    <td style="background-color:rgb(221, 221, 221);text-align:center;">기안일</td>
                    <td>2023-10-06(금)</td>
                </tr>
                <tr>
                    <td style="background-color:rgb(221, 221, 221);text-align:center;">문서번호</td>
                    <td>222-21</td>
                    <td style="background-color:rgb(221, 221, 221);text-align:center;">결재상태</td>
                    <td style="text-align:center">미완료</td>
                </tr>
            </table>
            <br><hr/><br>
            <table class="customTable" >
                <tr>
                    <td style="width:20%;background-color:rgb(221, 221, 221);text-align:center;" >결재유형</td>
                    <td>업무협조</td>
                </tr>
                <tr>
                    <td style="background-color:rgb(221, 221, 221);text-align:center;">제목</td>
                    <td>업무협조 해주세용</td>
                </tr>
                <tr>
                    <td colspan="2" style="background-color:rgb(221, 221, 221);text-align:center">내용</td>
                </tr>
                <tr>
                    <td colspan="2" style="height:450px;"><input type="text"></td>
                </tr>
            </table>
    </div>
    <div class="tool_bar" style="margin-bottom:5%">
        <a><span><img src="/img/작성.png" class="tool_bar_icon"></span><span>결재요청</span></a>
        <a><span><img src="/img/미리보기.png" class="tool_bar_icon"></span><span>미리보기</span></a>
        <a><span><img src="/img/취소.png" class="tool_bar_icon"></span><span>취소</span></a>
    </div>
    </form>
</div>
</body>
</html>
