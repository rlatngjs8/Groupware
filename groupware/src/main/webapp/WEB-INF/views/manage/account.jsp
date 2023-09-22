<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 상세 정보</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }

    h3 {
        width: 20%;
        margin-left: 14%;
        text-align: left;
        background-color: rgb(106, 176, 173);
        color: #fff;
        padding: 10px 0;
    }

    #container {
        background-color: #fff;
        border-radius: 5px;
        margin: 20px auto;
        padding: 20px;
        width: 70%;
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

</style>
</head>
<body>
<%@ include file="manage_header.jsp" %> 
<h3>직원통합관리 > 직원상세</h3>
<div id="container">
<%--     <c:forEach items="${Elist}" var="emp"> --%>
        <div id="image">
        <input type="hidden" id="userid" value="${emp.userid}">
            <label class="lblclass">
<%--             	[${emp.profilePicture}] --%>
                <img src="/img/${emp.profilePicture}" id="exProfileIMG">
            </label>
        </div>
        <table>
            <tr>
                <td class="tdclass">이름</td>
                <td>
                    <span id="name">${emp.name}</span>
                </td>
            </tr>
            <tr>
                <td class="tdclass">사번</td>
                <td>${emp.userid}</td>
            </tr>
            <tr>
                <td class="tdclass">부서</td>
                <td>
                    <span id="department">${emp.departmentName}</span>
                </td>
            </tr>
            <tr>
                <td class="tdclass">직급</td>
                <td>
                    <span id="position">${emp.position}</span>
                </td>
            </tr>
            <tr>
                <td class="tdclass">전화번호</td>
                <td>
                    <span id="phoneNumber">${emp.phoneNumber}</span>
                </td>
            </tr>
            <tr>
                <td class="tdclass">생년월일</td> 
                <td>
                    <span id="birthdate">${emp.birthdate}</span>
                </td>
            </tr>
            <tr>
                <td class="tdclass">주소</td>
                <td>
                    <span id="address">${emp.address}</span>
                </td>
            </tr>
            <tr>
                <td class="tdclass">이메일</td>
                <td>
                    <span id="email">${emp.email}</span>
                </td>
            </tr>
            <tr>
                <td class="tdclass">월 급여</td>
                <td>
                    <span id="salary">${emp.salary}</span>
                </td>
            </tr>
            <tr>
                <td class="tdclass">입사일</td>
                <td>${emp.hireDate}</td>
            </tr>
        </table>
<%--     </c:forEach> --%>
    <input type="button" class="btnEdit" id="btnEdit" value="수정메뉴">
    <input type="button" class="btnBack" id="btnBack" value="돌아가기">
</div>

</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$("#btnBack").click(function(){
	window.location.href="/manage/showEmployee";
})
$("#btnEdit").click(function(){
	var userid = $('#userid').val();
	window.location.href="/manage/editAccount?userid="+userid;
})
</script>
</html>