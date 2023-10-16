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

.tool_bar_icon,.tool_bar_icon1 {
    width: 20px;
    height: 20px;
    margin-top: 5px;
    position: relative;
    top: 4px;
    right: 3px;
}
.tool_bar_icon1{
    width: 18px;
    height: 18px;
    position: relative;
    top: 2px;
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
    border:none;
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
button{
    background: #fff;
    border: none;
    font-size: 16px;
    cursor:pointer;
    }
 .receiver_id{
 	height:40px;
 	border:1px solid #bfbfbf;
 }
 #approvalType, #approvalTitle {
 	border:1px solid #bfbfbf;
 }
 
 .modal{
    position:absolute;
    display:none;
    
    justify-content: center;
    top:0;
    left:0;

    width:100%;
    height:100%;

    

    background-color: rgba(0,0,0,0.4);
}

.modal_body
{
    position:absolute;
    top:50%; 


    width:400px;  
    height:600px; 

    padding:40px;  

    text-align: center;

    background-color: rgb(255,255,255); 
    border-radius:10px; 
    box-shadow:0 2px 3px 0 rgba(34,36,38,0.15); 

    transform:translateY(-50%); 
}
</style>
</head>
<body>
<<<<<<< HEAD
<%@ include file="/WEB-INF/views/P_header.jsp"%>
<div class="mainSection">
    <div class="asidebar">
        <%@ include file="approvalHeader.jsp"%>
    </div>
    <h3 class="title">전자결재 작성</h3>
    <form action="/writeApprovalData" method="post">
    <div class="tool_bar">
        <button type="submit"><span><img src="/img/수정.png" class="tool_bar_icon1"></span><span>결재요청</span></button>
        <a><span><img src="/img/미리보기.png" class="tool_bar_icon"></span><span class="pre-view">미리보기</span></a>
        <a href="/approval"><span><img src="/img/취소.png" class="tool_bar_icon"></span><span>취소</span></a>
    </div>
    
    <div class="modal">
        <div class="modal_body">
            <h2>모달창 제목</h2>
            <p>모달창 내용 </p>
        </div>
    </div>
    
    
    
    <div class="writeForm">
            <table class="customTable">
                <tr>
                    <td class="td1" colspan="5">업 무 기 안</td>
                </tr>
                <tr>
                    <td class="bgGray width9 centerText" style="width: 10%;border-bottom: 1px solid #bfbfbf;">기안자</td>
                    <td style="font-weight: bold;">${name}<input type="hidden" name="userid" id="userid" value="${userid}"></td>
                    <td rowspan="4"></td>
                    <td rowspan="3" class="bgGray width9 centerText" style="width: 10%; border-bottom: 1px solid #bfbfbf;">결재</td>
                    <td class="width13 centerText" id="receiverDepartmentName"></td>
                </tr>
                <tr>
                    <td class="bgGray centerText" style="border-bottom: 1px solid #bfbfbf;">부서</td>
                    <td>${alEmp.departmentName}</td>
                    <td rowspan="2" class="textCenter">
                        <select name="receiver_id" id="receiver_id" class="receiver_id" >
                            <option value="" disabled selected>결재 담당자를 선택해주세요</option>
                            <c:forEach items="${allMem}" var="mem">
                                <option value="${mem.userid}">${mem.departmentName} - ${mem.name}   ${mem.position}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="bgGray centerText" style="border-bottom: 1px solid #bfbfbf;">기안일</td>
                    <td><span id="currentDate"></span></td>
                </tr>
                <tr>
                    <td class="bgGray centerText">문서번호</td>
                    <td class="width25"></td>
                    <td class="bgGray centerText">결재상태</td>
                    <td class="textCenter">미완료</td>
                </tr>
            </table>
            <br><hr/><br>
            <table class="customTable" >
                <tr>
                    <td class="width20 bgGray centerText" style="width: 20%; border-bottom: 1px solid #bfbfbf;">결재유형</td>
<!--                     <td><input type="text" name="approvalType" id="approvalType"></td> -->
										<td>
										<select name="approvalType" id="approvalType">
											<option value="" disabled selected>결재유형선택</option>
											<option value="업무기안">업무기안</option>
											<option value="업무협조">업무협조</option>
											<option value="일반품의서">일반품의</option>
											<option value="구매신청서">구매신청서</option>
											<option value="출장신청서">출장신청서</option>
											<option value="채용요청">채용요청</option>
											<option value="회의록">회의록</option>
											<option value="휴가신청서">휴가신청서</option>
											<option value="사유서">사유서</option>
										</select>
										</td>
                </tr>
                <tr>
                    <td class="bgGray centerText" style="border-bottom: 1px solid #bfbfbf;">제목</td>
                    <td><input type="text" name="approvalTitle" id="approvalTitle"></td>
                </tr>
                <tr>
                    <td colspan="2" class="bgGray centerText" style="text-align:center">내 용</td>
                </tr>
                <tr>
                    <td colspan="2" class="height450"><input type="text" name="approText" id="approText" class="ApproText"></td>
                </tr>
            </table>
    </div>
    <div class="tool_bar" style="margin-bottom:5%">
        <button type="submit"><span><img src="/img/수정.png" class="tool_bar_icon"></span><span>결재요청</span></button>
        <a><span><img src="/img/미리보기.png" class="tool_bar_icon"></span><span class="pre-view">미리보기</span></a>
        <a href="/approval"><span><img src="/img/취소.png" class="tool_bar_icon"></span><span>취소</span></a>
    </div>
    </form>
</div>
=======
	<%@ include file="/WEB-INF/views/P_header.jsp"%>
	<div class="mainSection">
		<div class="asidebar">
			<%@ include file="approvalHeader.jsp"%>
		</div>
		<h3 class="title">전자결재 작성</h3>
<!-- 		<form action="/writeApprovalData" method="post"> -->
			<div class="tool_bar">
				<button type="submit">
					<span><img src="/img/수정.png" class="tool_bar_icon1"></span><span>결재요청</span>
				</button>
					 <a href="/approval"><span><img src="/img/취소.png" class="tool_bar_icon"></span><span>취소</span></a>
			</div>
			<div class="modal">
				<div class="modal_body">
					<h2>모달창 제목</h2>
					<p>모달창 내용</p>
				</div>
			</div>
			
			<div class="writeForm">
				<table class="customTable">
					<tr>
						<td class="td1" colspan="5">업 무 기 안</td>
					</tr>
					<tr>
						<td class="bgGray width9 centerText"
							style="width: 10%; border-bottom: 1px solid #bfbfbf;">기안자</td>
						<td style="font-weight: bold;">${name}<input type="hidden"
							name="userid" id="userid" value="${userid}"></td>
						<td rowspan="4"></td>
						<td rowspan="3" class="bgGray width9 centerText"
							style="width: 10%; border-bottom: 1px solid #bfbfbf;">결재</td>
						<td class="width13 centerText" id="receiverDepartmentName"></td>
					</tr>
					<tr>
						<td class="bgGray centerText"
							style="border-bottom: 1px solid #bfbfbf;">부서</td>
						<td>${alEmp.departmentName}</td>
						<td rowspan="2" class="textCenter"><select name="receiver_id"
							id="receiver_id" class="receiver_id">
								<option value="" disabled selected>결재 담당자를 선택해주세요</option>
								<c:forEach items="${allMem}" var="mem">
									<option value="${mem.userid}">${mem.departmentName}-
										${mem.name} ${mem.position}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td class="bgGray centerText"
							style="border-bottom: 1px solid #bfbfbf;">기안일</td>
						<td><span id="currentDate"></span></td>
					</tr>
					<tr>
						<td class="bgGray centerText">문서번호</td>
						<td class="width25"></td>
						<td class="bgGray centerText">결재상태</td>
						<td class="textCenter">미완료</td>
					</tr>
				</table>
				<br>
				<hr />
				<br>
				<table class="customTable">
					<tr>
						<td class="width20 bgGray centerText"
							style="width: 20%; border-bottom: 1px solid #bfbfbf;">결재유형</td>
						<!--                     <td><input type="text" name="approvalType" id="approvalType"></td> -->
						<td><select name="approvalType" id="approvalType">
								<option value="" disabled selected>결재유형선택</option>
								<option value="업무기안">업무기안</option>
								<option value="업무협조">업무협조</option>
								<option value="일반품의서">일반품의</option>
								<option value="구매신청서">구매신청서</option>
								<option value="출장신청서">출장신청서</option>
								<option value="채용요청">채용요청</option>
								<option value="회의록">회의록</option>
								<option value="휴가신청서">휴가신청서</option>
								<option value="사유서">사유서</option>
						</select></td>
					</tr>
					<tr>
						<td class="bgGray centerText"
						
							style="border-bottom: 1px solid #bfbfbf;">제목</td>
						<td><input type="text" name="approvalTitle"
							id="approvalTitle"></td>
					</tr>
					<tr>
						<td colspan="2" class="bgGray centerText"
							style="text-align: center">내 용</td>
					</tr>
					<tr>
						<td colspan="2" class="height450"><input type="text"
							name="approText" id="approText" class="ApproText"></td>
					</tr>
				</table>
			</div>
			<div class="tool_bar" style="margin-bottom: 5%">
				<button id ="submit_btn"><span><img src="/img/수정.png" class="tool_bar_icon"></span><span>결재요청</span></button>
				<a href="/approval"><span><img src="/img/취소.png" class="tool_bar_icon"></span><span>취소</span></a>
<!-- 		</form> -->
	</div>
>>>>>>> refs/remotes/origin/master
</body>
<<<<<<< HEAD
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {

	
  // select 요소의 변경 이벤트를 감지
    $('#receiver_id').on('change', function() {
        // 선택한 옵션의 데이터 속성 'data-department' 값을 가져옴
        var selectedOption = $(this).find(':selected');
        var displayName = selectedOption.text().split(' ')[0]; // 띄어쓰기로 분리하고 앞에 것만 가져옴
        $('#receiverDepartmentName').text(displayName);
    });
});
$(document).ready(function() {
    // 현재 날짜를 가져옵니다.
    var currentDate = new Date();

    // 요일을 한글로 변환합니다.
    var daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
    var dayOfWeek = daysOfWeek[currentDate.getDay()];

    // 날짜를 yyyy-mm-dd (요일) 형식으로 표시합니다.
    var formattedDate = currentDate.getFullYear() + "-" + 
                        (currentDate.getMonth() + 1).toString().padStart(2, "0") + "-" + 
                        currentDate.getDate().toString().padStart(2, "0") + " (" + dayOfWeek + ")";

    // 결과를 화면에 표시합니다.
    $("#currentDate").text(formattedDate);
});
$(document).ready(function() {
    // "결재요청" 버튼 클릭 이벤트 처리
    $('form').on('submit', function(e) {
        e.preventDefault(); // 기본 제출 동작 방지
        

     		// 필수 입력 필드가 비어있는지 확인
        if ($('#userid').val()=== "" || $('#receiver_id').val()=== "" || $('#approvalType').val()=== null || $('#approvalTitle').val()=== "" || $('#approText').val() === "") {
            alert("모든 필수 입력 필드를 작성해주세요.");
            return false;
        }
        
        
        // 폼 데이터를 가져옵니다.
        var formData = {
            userid: $('#userid').val(),
            receiver_id: $('#receiver_id').val(),
            approvalType: $('#approvalType').val(),
            approvalTitle: $('#approvalTitle').val(),
            approText: $('#approText').val()
        };
             		
        
        console.log("보낸이",$('#userid').val());

        // Ajax를 사용하여 데이터를 서버에 전송합니다.
        $.ajax({
            type: 'POST', // 또는 'GET'에 따라 HTTP 메소드 선택
            url: '/writeApprovalData', // 요청을 보낼 URL
            data: formData, // 보낼 데이터
            success: function(response) {
                // 서버로부터의 응답을 처리합니다.
                console.log('결재요청이 성공적으로 전송되었습니다.');
                // 원하는 동작을 추가하세요.
                window.location.href = "/approval";
            },
            error: function(err) {
                // 오류 처리
                console.error('결재요청 전송 중 오류 발생:', err);
                alert("결재수신자를 선택해주세요")
            }
        });
    });
});
</script>
</html>
=======
</html>
>>>>>>> refs/remotes/origin/master
