<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>상세 페이지</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<link
         href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
         rel="stylesheet"
         integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
         crossorigin="anonymous"
      />
<script src="js/contact/detail.js"></script>
<link href='css/contact/detail.css' rel='stylesheet' />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
</style>
<body>
<%@ include file="/WEB-INF/views/P_header.jsp" %>
<div class="container">
<h1>연락처 수정</h1>
<table>
    <tr>
        <td class="tdclass">이름<span class="required">*</span></td>
        <td>
            <span id="editNameSpan"></span>
            <img src="/img/수정.png" id="modifyName" class="modify">
        </td>
    </tr>
    <tr>
        <td class="tdclass">직급<span class="required">*</span></td>
        <td>
            <span id="editPositionSpan"></span>
            <img src="/img/수정.png" id="modifyPosition" class="modify">
        </td>
    </tr>
    <tr>
        <td class="tdclass">전화번호<span class="required">*</span></td>
        <td>
            <span id="editPhoneSpan"></span>
            <img src="/img/수정.png" id="modifyPhone" class="modify">
        </td>
    </tr>
    <tr>
        <td class="tdclass">이메일<span class="required">*</span></td>
        <td>
            <span id="editEmailSpan"></span>
            <img src="/img/수정.png" id="modifyEmail" class="modify">
        </td>
    </tr>
    <tr>
        <td class="tdclass">부서</td>
        <td>
            <span id="editDepartmentSpan"></span>
            <img src="/img/수정.png" id="modifyDepartment" class="modify">
        </td>
    </tr>
    <tr>
        <td class="tdclass">회사<span class="required">*</span></td>
        <td>
            <span id="editCompanySpan"></span>
            <img src="/img/수정.png" id="modifyCompany" class="modify">
        </td>
    </tr>
    <tr>
        <td class="tdclass">회사 전화</td>
        <td>
            <span id="editCompanyPhoneSpan"></span>
            <img src="/img/수정.png" id="modifyCompanyPhone" class="modify">
        </td>
    </tr>
    <tr>
        <td class="tdclass">회사 주소</td>
        <td>
            <span id="editCompanyAddressSpan"></span>
            <img src="/img/수정.png" id="modifyCompanyAddress" class="modify">
        </td>
    </tr>
    <tr>
        <td class="tdclass">메모</td>
        <td>
            <span id="editMemoSpan"></span>
            <img src="/img/수정.png" id="modifyMemo" class="modify">
        </td>
    </tr>
    <tr>
        <td class="tdclass">그룹 이름</td>
        <td>
            <span id="editGroupNameSpan"></span>
            <img src="/img/수정.png" id="modifyGroupName" class="modify">
        </td>
    </tr>
</table>
<div class="btnLine">
<button class="btn btn-success m-2" id="confirmStart">수 정 완 료</button>
<button class="btn btn-danger m-2" id="confirmDelete">삭 제</button>
</div>

</div>
</body>
</html>
