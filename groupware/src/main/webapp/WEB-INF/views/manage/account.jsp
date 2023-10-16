<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 상세 정보</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/manage/account.js"></script>
<link href="/css/manage/account.css" rel="stylesheet">
</head>
<body>
<%@ include file="manage_header.jsp" %> 
<h3>직원통합관리 > 직원상세</h3>
<div id="container">
<%--     <c:forEach items="${Elist}" var="emp"> --%>
        <div id="image">
        <input type="hidden" id="userid" value="${emp.userid}">
            <label>
            <p style="font-weight:bold;">프로필이미지</p>
<%--             	[${emp.profilePicture}] --%>
                <img src="/img/${emp.profilePicture}" id="exProfileIMG">
            </label>
            <p style="font-size:12px">⚠️ 이미지가 제대로 나오지 않는다면 새로고침(f5)를 눌러주세요.</p>
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
</html>