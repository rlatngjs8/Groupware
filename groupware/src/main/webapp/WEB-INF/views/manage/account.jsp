<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }

    h3 {
        width: 20%;
    margin-left: 9%;
    text-align: left;
    background-color: #007bff;
    color: #fff;
    padding: 10px 0;
    }

    #container {
        background-color: #fff;
        border-radius: 5px;
        margin: 20px auto;
        padding: 20px;
        width: 80%;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    #image {
        text-align: left;
        margin-bottom: 20px;
    }

    #exProfileIMG {
        max-width: 200px;
        max-height: 200px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    .tdclass {
        font-weight: bold;
        width: 12%;
    }

    td {
        padding: 10px;
        text-align: left;
    }
    .modify{
    width: 13px;
    height: 13px;
    margin-left: 2%;
    cursor: pointer;
    }
</style>
</head>
<body>
<h3>직원통합관리 > 직원상세</h3>
<div id="container">
    <c:forEach items="${Elist}" var="emp">
        <div id="image">
            <label class="lblclass">
                <img src="/img/${emp.profilePicture}" id="exProfileIMG">
            </label>
        </div>
        <table>
            <tr><td class="tdclass">이름</td><td><span id="editName">${emp.name}</span><img src="/img/수정.png" id="modify" class="modify"></td></tr>
            <tr><td class="tdclass">사번</td><td>${emp.userid}</td></tr>
            <tr><td class="tdclass">부서</td><td>${emp.departmentName}</td></tr>
            <tr><td class="tdclass">직급</td><td>${emp.position}</td></tr>
            <tr><td class="tdclass">전화번호</td><td>${emp.phoneNumber}</td></tr>
            <tr><td class="tdclass">생년월일</td><td>${emp.birthdate}</td></tr>
            <tr><td class="tdclass">주소</td><td>${emp.address}</td></tr>
            <tr><td class="tdclass">이메일</td><td>${emp.email}</td></tr>
            <tr><td class="tdclass">월 급여</td><td>${emp.salary}</td></tr>
            <tr><td class="tdclass">입사일</td><td>${emp.hireDate}</td></tr>
        </table>
    </c:forEach>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 수정 모드와 읽기 모드를 전환하는 스크립트 -->
<script>
$(document).ready(function() {
    // 수정 모드 토글
    $("#modify").click(function() {
        var editNameSpan = $("#editName");
        var editNameInput = $("<input>")
            .attr("id", "editNameInput")
            .addClass("editNameInput")
            .val(editNameSpan.text());

        // span 요소를 input 요소로 대체
        editNameSpan.replaceWith(editNameInput);

        // 저장 버튼 추가
        var saveButton = $("<button>")
            .html("저장")
            .click(function() {
                var newName = editNameInput.val();
                // 서버로 업데이트된 값을 보내고 DB를 업데이트하는 AJAX 요청을 수행합니다.
                // 이 과정은 서버 백엔드에 따라 다를 수 있습니다.
                $.ajax({
                    url: "updateName.php", // 업데이트를 처리할 서버 스크립트 파일 경로
                    method: "POST",
                    data: { newName: newName }, // 업데이트할 새 이름 전송
                    success: function(response) {
                        // 성공적으로 업데이트된 경우
                        // 새로운 span 요소로 대체
                        editNameInput.replaceWith("<span id='editName'>" + newName + "</span>");
                    },
                    error: function(error) {
                        // 업데이트 중에 오류가 발생한 경우 처리
                        console.error("오류 발생: " + error);
                    }
                });
            });

        editNameInput.after(saveButton);
    });
});
</script>
</html>